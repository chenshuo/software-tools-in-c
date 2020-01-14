package p2c;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;

import p2c.PascalParser.ArrayTypeContext;
import p2c.PascalParser.AssignmentStatementContext;
import p2c.PascalParser.BlockContext;
import p2c.PascalParser.CompoundStatementContext;
import p2c.PascalParser.ConstantContext;
import p2c.PascalParser.ConstantDefinitionContext;
import p2c.PascalParser.ExpressionContext;
import p2c.PascalParser.ForStatementContext;
import p2c.PascalParser.FormalParameterListContext;
import p2c.PascalParser.FormalParameterSectionContext;
import p2c.PascalParser.FunctionDeclarationContext;
import p2c.PascalParser.IfStatementContext;
import p2c.PascalParser.ParameterGroupContext;
import p2c.PascalParser.ProcedureDeclarationContext;
import p2c.PascalParser.ProcedureStatementContext;
import p2c.PascalParser.RepeatStatementContext;
import p2c.PascalParser.SourceFileContext;
import p2c.PascalParser.StatementContext;
import p2c.PascalParser.SubrangeTypeContext;
import p2c.PascalParser.TypeContext;
import p2c.PascalParser.TypeDefinitionContext;
import p2c.PascalParser.UnpackedStructuredTypeContext;
import p2c.PascalParser.VariableDeclarationContext;
import p2c.PascalParser.WhileStatementContext;

class Visitor extends PascalBaseVisitor<Void> {
	private CommonTokenStream tokens;

	private ByteArrayOutputStream os = new ByteArrayOutputStream();
	private PrintWriter out = new PrintWriter(os);

	private Pattern commentPattern = Pattern.compile("^\\{ *(.*) *\\}$");
	private List<Token> comments = new ArrayList<>();
	private Set<Integer> headComments = new HashSet<>();
	private int nextComment = 0;

	private Pattern stringPattern = Pattern.compile("^'(.*)'$");
	private Map<String, String> operatorMap = new HashMap<>();
	private String function = null;

	public Visitor(CommonTokenStream tokens) {
		this.tokens = tokens;
		fillComments();

		operatorMap.put("=", "==");
		operatorMap.put("<>", "!=");
		operatorMap.put("mod", "%");
		operatorMap.put("div", "/");
	}

	private void fillComments() {
		boolean head = true;
		for (Token t : tokens.getTokens()) {
			if (t.getType() == PascalLexer.COMMENT) {
				comments.add(t);
				if (head)
					headComments.add(t.getTokenIndex());
			}
			if (t.getType() == PascalLexer.NL) {
				head = true;
			} else if (t.getType() != PascalLexer.WS) {
				head = false;
			}
		}
	}

	public String convert(String filename, SourceFileContext tree) {
		out.println("#include \"../p2c.h\"");
		out.printf("#include \"%s.h\"\n\n", Path.of(filename).getParent().getFileName());
		visit(tree);
		out.flush();
		return os.toString().replace("\n@//", "  //");
	}

	@Override
	public Void visitProcedureDeclaration(ProcedureDeclarationContext ctx) {
		convertFunction("void", ctx.ID().getText(), ctx.formalParameterList(), ctx.block());
		return null;
	}

	@Override
	public Void visitFunctionDeclaration(FunctionDeclarationContext ctx) {
		function = ctx.ID().getText();
		convertFunction(ctx.typeIdentifier().getText(), function, ctx.formalParameterList(), ctx.block());
		function = null;
		return null;
	}

	private void convertFunction(String type, String funcName, FormalParameterListContext formalParameterList,
			BlockContext block) {
		flushComment(block);
		out.print(type + " " + funcName + "(");
		visitFormalParameterList(formalParameterList);
		out.println(")");
		visitBlock(block);
	}

	@Override
	public Void visitFormalParameterList(FormalParameterListContext ctx) {
		if (ctx == null)
			return null;
		boolean first = true;
		for (FormalParameterSectionContext section : ctx.formalParameterSection()) {
			boolean var = section.VAR() != null;
			ParameterGroupContext group = section.parameterGroup();
			String type = group.typeIdentifier().getText();
			if (var)
				type = type + "&";
			for (TerminalNode id : group.identifierList().ID()) {
				if (!first)
					out.print(", ");
				first = false;
				out.print(type + " " + id.getText());
			}
		}
		return null;
	}

	@Override
	public Void visitBlock(BlockContext ctx) {
		out.println("{");
		if (ctx.constantDefinitionPart() != null)
			visitConstantDefinitionPart(ctx.constantDefinitionPart());
		if (ctx.typeDefinitionPart() != null)
			visitTypeDefinitionPart(ctx.typeDefinitionPart());
		if (ctx.variableDeclarationPart() != null) {
			visitVariableDeclarationPart(ctx.variableDeclarationPart());
			out.println();
		}
		visitStatements(ctx.compoundStatement().statements());
		out.println("}");
		return null;
	}

	@Override
	public Void visitConstantDefinition(ConstantDefinitionContext ctx) {
		flushComment(ctx);
		ConstantContext constant = ctx.constant();
		out.printf("const int %s = %s;\n", ctx.ID().getText(), constant.getText());
		return null;
	}

	@Override
	public Void visitTypeDefinition(TypeDefinitionContext ctx) {
		flushComment(ctx);
		String typeName = ctx.ID().getText();
		TypeContext type = ctx.type();
		out.printf("using %s = %s;\n", typeName, formatType(type));
		return null;
	}

	@Override
	public Void visitVariableDeclaration(VariableDeclarationContext ctx) {
		flushComment(ctx);
		String type = formatType(ctx.type());
		out.print(type + " ");
		boolean first = true;

		for (TerminalNode id : ctx.identifierList().ID()) {
			if (!first)
				out.print(", ");
			first = false;
			out.print(id.getText());
		}
		out.println(";");
		return null;
	}

	//
	// Statements
	//

	@Override
	public Void visitStatement(StatementContext ctx) {
		flushComment(ctx);
		return super.visitStatement(ctx);
	}

	@Override
	public Void visitCompoundStatement(CompoundStatementContext ctx) {
		out.println("{");
		visitStatements(ctx.statements());
		out.println("}");
		return null;
	}

	@Override
	public Void visitAssignmentStatement(AssignmentStatementContext ctx) {
		if (ctx.variable().getText().equals(function)) {
			// Not 100% correct if there are more statements after return;
			out.printf("return %s;\n", formatExpression(ctx.expression()));
		} else {
			out.printf("%s = %s;\n", getText(ctx.variable()), formatExpression(ctx.expression()));
		}
		return null;
	}

	@Override
	public Void visitProcedureStatement(ProcedureStatementContext ctx) {
		if (ctx.functionDesignator() == null) {
			out.println(formatExpression(ctx) + "();");
		} else {
			out.println(formatExpression(ctx) + ";");
		}
		return null;
	}

	@Override
	public Void visitIfStatement(IfStatementContext ctx) {
		out.print("if ");
		appendCondition(ctx.expression());
		out.println();
		visitStatement(ctx.statement(0));
		StatementContext elseStmt = ctx.statement(1);
		if (elseStmt != null) {
			out.println("else");
			visitStatement(elseStmt);
		}
		return null;
	}

	@Override
	public Void visitWhileStatement(WhileStatementContext ctx) {
		out.print("while ");
		appendCondition(ctx.expression());
		out.println();
		return visitStatement(ctx.statement());
	}

	@Override
	public Void visitRepeatStatement(RepeatStatementContext ctx) {
		out.println("do {");
		visitStatements(ctx.statements());
		out.print("} while (not ");
		appendCondition(ctx.expression());
		out.println(");");
		return null;
	}

	@Override
	public Void visitForStatement(ForStatementContext ctx) {
		String var = ctx.ID().getText();
		ExpressionContext init = ctx.expression(0);
		ExpressionContext last = ctx.expression(1);
		String dir = ctx.direction().getText().toLowerCase();
		out.printf("for (%s = %s; ", var, formatExpression(init));
		if (dir.equals("to")) {
			out.printf("%s <= %s; ++%s)\n", var, formatExpression(last), var);
		} else {
			assert dir.equals("downto");
			out.printf("%s >= %s; --%s)\n", var, formatExpression(last), var);
		}

		return super.visitStatement(ctx.statement());
	}

	//
	// Type and expressions
	//

	private String formatType(TypeContext type) {
		if (type.subrangeType() != null) {
			return formatSubtange(type.subrangeType());
		} else if (type.typeIdentifier() != null) {
			return type.getText();
		} else {
			assert type.structuredType().unpackedStructuredType() != null;
			UnpackedStructuredTypeContext structType = type.structuredType().unpackedStructuredType();
			ArrayTypeContext arrayType = structType.arrayType();
			if (arrayType != null) {
				return formatArray(arrayType);
			}
			// FIXME: record type
		}

		// Don't know how to format this.
		return getText(type);
	}

	static private String formatSubtange(SubrangeTypeContext subrange) {
		return sprintf("int /* %s .. %s */", subrange.constant(0).getText(), subrange.constant(1).getText());
	}

	private String formatArray(ArrayTypeContext arrayType) {
		return sprintf("%s[%s+1]", formatType(arrayType.type()), arrayType.subrangeType().constant(1).getText());
	}

	private String getText(ParserRuleContext ctx) {
		return tokens.getText(ctx.start, ctx.stop);
	}

	private void appendCondition(ExpressionContext ctx) {
		if (needParen(ctx))
			out.printf("(%s)", formatExpression(ctx));
		else
			out.print(formatExpression(ctx));
	}

	private String formatExpression(ParserRuleContext ctx) {
		StringBuilder sb = new StringBuilder();
		for (int i = ctx.start.getTokenIndex(); i <= ctx.stop.getTokenIndex(); ++i) {
			Token t = tokens.get(i);
			String text = t.getText();
			if (t.getType() == PascalLexer.STRING)
				sb.append(formatString(text));
			else
				sb.append(operatorMap.getOrDefault(text, text));
			// FIXME: a_func -> a_func()
		}
		return sb.toString();
	}

	private String formatString(String text) {
		Matcher m = stringPattern.matcher(text);
		if (m.find()) {
			String str = m.group(1);
			if (str.length() == 1)
				return text;
			str = str.replace("''", "'").replace("\"", "\\\"");
			return "\"" + str + "\"";
		} else
			assert false;
		return null;
	}

	private boolean needParen(ExpressionContext ctx) {
		if (ctx.simpleExpression().size() > 1)
			return true;
		if (ctx.simpleExpression(0).term().size() > 1)
			return true;
		if (ctx.simpleExpression(0).term(0).signedFactor().size() > 1)
			return true;
		return false;
	}

	private void flushComment(ParserRuleContext ctx) {
		while (nextComment < comments.size() && comments.get(nextComment).getTokenIndex() < ctx.start.getTokenIndex()) {
			out.println(formatComment(comments.get(nextComment)));
			++nextComment;
		}
	}

	private String formatComment(Token token) {
		assert token.getType() == PascalLexer.COMMENT;
		String comment = token.getText();
		Matcher matcher = commentPattern.matcher(comment);
		boolean found = matcher.find();
		assert found;
		return sprintf("%s// %s", headComments.contains(token.getTokenIndex()) ? "" : "@", matcher.group(1));
	}

	static String sprintf(String format, Object... args) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		PrintWriter w = new PrintWriter(out);
		w.printf(format, args);
		w.flush();
		return out.toString();
	}
}
