package p2c;

import static java.lang.System.err;
import static java.lang.System.out;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import org.antlr.v4.runtime.ANTLRFileStream;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import p2c.PascalParser.SourceFileContext;

public class Convert {
	static class GrammarError extends RuntimeException {
		public int line, pos;

		public GrammarError(String type, int line, int pos, String msg) {
			super(type + " error at line " + line + ":" + pos + ": " + msg);
			this.line = line;
			this.pos = pos;
		}
	}

	public static void main(String[] args) throws Exception {
		for (String filename : args) {
			List<String> lines = Files.readAllLines(Path.of(filename));
			CommonTokenStream tokens = runLexer(lines, filename);
			if (tokens == null) {
				err.println("LEX: " + filename);
				err.println();
				continue;
			}
			SourceFileContext source = parsePascalFile(lines, tokens);
			if (source == null) {
				err.println("SYN: " + filename);
				err.println();
				continue;
			}
			Visitor v = new Visitor(tokens);
			String cpp = v.convert(source);
			out.println("-h- " + filename.replaceFirst("\\.p$", ".cc") + " " + cpp.length());
			out.print(cpp);
		}
	}

	private static CommonTokenStream runLexer(List<String> lines, String filename) throws Exception {
		ANTLRInputStream input = new ANTLRFileStream(filename);
		PascalLexer lexer = new PascalLexer(input);
		lexer.removeErrorListeners();
		lexer.addErrorListener(new BaseErrorListener() {
			@Override
			public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line,
					int charPositionInLine, String msg, RecognitionException e) {
				throw new GrammarError("Lexer", line, charPositionInLine, msg);
			}
		});

		CommonTokenStream tokens = new CommonTokenStream(lexer);
		try {
			tokens.fill();
			return tokens;
		} catch (GrammarError e) {
			err.println(lines.get(e.line - 1).replace('\t', ' '));
			err.printf("%s^\n%s\n", " ".repeat(e.pos), e.getMessage());
			err.flush();
			return null;
		}

	}

	private static SourceFileContext parsePascalFile(List<String> lines, CommonTokenStream tokens) throws Exception {
		PascalParser parser = new PascalParser(tokens);
		parser.removeErrorListeners();
		parser.addErrorListener(new BaseErrorListener() {
			@Override
			public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line,
					int charPositionInLine, String msg, RecognitionException e) {
				throw new GrammarError("Syntax", line, charPositionInLine, msg);
			}
		});
		try {
			SourceFileContext source = parser.sourceFile();
			// out.println(source.toStringTree(parser));
			return source;
		} catch (GrammarError e) {
			for (int i = (e.line > 3 ? e.line - 3 : 0); i < e.line; ++i)
				err.println(lines.get(i).replace('\t', ' '));

			err.printf("%s^\n%s\n\n", " ".repeat(e.pos), e.getMessage());

			for (int i = e.line; i < lines.size() && i < e.line + 3; ++i)
				err.println(lines.get(i));
			for (StackTraceElement ele : e.getStackTrace()) {
				err.println("\tat " + ele);
				if (ele.getMethodName().equals("p2c.PascalConvert.parseFile"))
					break;
			}
		}
		return null;
	}

}
