package p2c;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
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
	private Map<String, String> operatorMap = new HashMap<>();
	private String function = null;

	public Visitor(CommonTokenStream tokens) {
		this.tokens = tokens;

		operatorMap.put("=", "==");
		operatorMap.put("<>", "!=");
		operatorMap.put("mod", "%");
		operatorMap.put("div", "/");
	}

	public String convert(String filename, SourceFileContext tree) {
		out.println("#include \"../p2c.h\"");
		out.printf("#include \"%s.h\"\n\n", Path.of(filename).getParent().getFileName());
		visit(tree);
		out.flush();
		return os.toString();
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
		ConstantContext constant = ctx.constant();
		out.printf("const int %s = %s;\n", ctx.ID().getText(), constant.getText());
		return null;
	}

	@Override
	public Void visitTypeDefinition(TypeDefinitionContext ctx) {
		String typeName = ctx.ID().getText();
		TypeContext type = ctx.type();
		out.printf("using %s = %s;\n", typeName, formatType(type));
		return null;
	}

	@Override
	public Void visitVariableDeclaration(VariableDeclarationContext ctx) {
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
			out.print("return ");
		} else {
			appendVerbatim(ctx.variable());
			out.print(" = ");
		}
		append(ctx.expression());
		out.println(";");
		return null;
	}

	@Override
	public Void visitProcedureStatement(ProcedureStatementContext ctx) {
		if (ctx.functionDesignator() == null) {
			appendVerbatim(ctx);
			out.println("();");
		} else {
			appendVerbatim(ctx);
			out.println(";");
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
		out.printf("for (%s = ", var);
		append(init);
		out.print("; ");
		if (dir.equals("to")) {
			out.printf("%s <= ", var);
			append(last);
			out.printf("; ++%s)\n", var);
		} else {
			assert dir.equals("downto");
			out.printf("%s >= ", var);
			append(last);
			out.printf("; --%s)\n", var);
		}

		return super.visitStatement(ctx.statement());
	}

	//
	// Type and expressions
	//

	private String formatType(TypeContext type) {
		StringBuilder sb = new StringBuilder();
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
		sb.append("/* XXX */ ");
		for (int i = type.start.getTokenIndex(); i <= type.stop.getTokenIndex(); ++i)
			sb.append(tokens.get(i).getText());
		return sb.toString();
	}

	static private String formatSubtange(SubrangeTypeContext subrange) {
		return sprintf("Range<%s, %s>", subrange.constant(0).getText(), subrange.constant(1).getText());
	}

	private String formatArray(ArrayTypeContext arrayType) {
		return sprintf("%s[%s+1]", formatType(arrayType.type()), arrayType.subrangeType().constant(1).getText());
	}

	private void appendVerbatim(ParserRuleContext ctx) {
		for (int i = ctx.start.getTokenIndex(); i <= ctx.stop.getTokenIndex(); ++i)
			out.print(tokens.get(i).getText());
	}

	private void appendCondition(ExpressionContext ctx) {
		boolean needParen = needParen(ctx);
		if (needParen)
			out.print("(");
		append(ctx);
		if (needParen)
			out.print(")");
	}

	private void append(ExpressionContext ctx) {
		for (int i = ctx.start.getTokenIndex(); i <= ctx.stop.getTokenIndex(); ++i) {
			String tok = tokens.get(i).getText();
			out.print(operatorMap.getOrDefault(tok, tok));
			// FIXME: "x" -> 'x'
			// FIXME: a_func -> a_func()
		}
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

	static String sprintf(String format, Object... args) {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		PrintWriter w = new PrintWriter(out);
		w.printf(format, args);
		w.flush();
		return out.toString();
	}
}
