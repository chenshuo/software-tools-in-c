package p2c;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;

import p2c.PascalParser.AssignmentStatementContext;
import p2c.PascalParser.BlockContext;
import p2c.PascalParser.CompoundStatementContext;
import p2c.PascalParser.ConstantDefinitionPartContext;
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
import p2c.PascalParser.TypeDefinitionPartContext;
import p2c.PascalParser.VariableDeclarationContext;
import p2c.PascalParser.VariableDeclarationPartContext;
import p2c.PascalParser.WhileStatementContext;

class Visitor extends PascalBaseVisitor<Void> {
	private CommonTokenStream tokens;
	private ByteArrayOutputStream os = new ByteArrayOutputStream();
	private PrintWriter out = new PrintWriter(os);
	Map<String, String> operatorMap = new HashMap<>();

	public Visitor(CommonTokenStream tokens) {
		this.tokens = tokens;

		operatorMap.put("=", "==");
		operatorMap.put("<>", "!=");
		operatorMap.put("mod", "%");
		operatorMap.put("div", "/");
	}

	public String convert(SourceFileContext tree) {
		out.println("#include \"../p2c.h\"\n");
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
		convertFunction(ctx.typeIdentifier().getText(), ctx.ID().getText(), ctx.formalParameterList(), ctx.block());
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
		visitConstantDefinitionPart(ctx.constantDefinitionPart());
		visitTypeDefinitionPart(ctx.typeDefinitionPart());
		visitVariableDeclarationPart(ctx.variableDeclarationPart());
		visitStatements(ctx.compoundStatement().statements());
		out.println("}");
		return null;
	}

	@Override
	public Void visitConstantDefinitionPart(ConstantDefinitionPartContext ctx) {
		if (ctx == null)
			return null;
		// FIXME: implement this
		return null;
	}

	@Override
	public Void visitTypeDefinitionPart(TypeDefinitionPartContext ctx) {
		if (ctx == null)
			return null;
		// FIXME: implement this
		return null;
	}

	@Override
	public Void visitVariableDeclarationPart(VariableDeclarationPartContext ctx) {
		if (ctx == null)
			return null;
		for (VariableDeclarationContext decl : ctx.variableDeclaration()) {
			String type = format(decl.type());
			out.print(type + " ");
			boolean first = true;

			for (TerminalNode id : decl.identifierList().ID()) {
				if (!first)
					out.print(", ");
				first = false;
				out.print(id.getText());
			}
			out.println(";");
		}
		out.println();
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
		appendVerbatim(ctx.variable());
		out.print(" = ");
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

	private String format(TypeContext type) {
		StringBuilder sb = new StringBuilder();
		if (type.subrangeType() != null) {
			return formatSubtange(type.subrangeType());
		} else if (type.typeIdentifier() != null) {
			return type.getText();
		} else {
			assert type.structuredType().unpackedStructuredType() != null;
			/*
			UnpackedStructuredTypeContext structType = type.structuredType().unpackedStructuredType();
			if (structType.arrayType() != null) {
				ArrayTypeContext arrayType = structType.arrayType();
				String index = arrayType.typeIdentifier() != null ? arrayType.typeIdentifier().getText()
						: formatSubtange(arrayType.subrangeType());
				return sprintf("Array<%s, %s>", format(arrayType.type()), index);
			} else if (structType.recordType() != null) {
				RecordTypeContext recordType = structType.recordType();
				assert recordType.fieldList().variantPart() != null;
			} else {
				assert structType.fileType() != null;
				FileTypeContext fileType = structType.fileType();
			}
			*/
		}
		sb.append("/* XXX */ ");
		for (int i = type.start.getTokenIndex(); i <= type.stop.getTokenIndex(); ++i)
			sb.append(tokens.get(i).getText());
		return sb.toString();
	}

	static private String formatSubtange(SubrangeTypeContext subrange) {
		return sprintf("Range<%s, %s>", subrange.constant(0).getText(), subrange.constant(1).getText());
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
