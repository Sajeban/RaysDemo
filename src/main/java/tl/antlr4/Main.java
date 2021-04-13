package tl.antlr4;

import java.util.Collections;
import java.util.Map;
import java.util.Scanner;

import com.sun.speech.freetts.Voice;
import com.sun.speech.freetts.VoiceManager;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;


public class Main {
    public static void main(String[] args) {

        try {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Rays>");
            String path = "RaysFiles/";
            while (scanner.hasNext()) {
                String fileName = scanner.nextLine();
                //"testRepetition.ray"
                if(fileName.equals("1")){
                    fileName ="testRepetition.ray";
                }
                TLLexer lexer = new TLLexer(CharStreams.fromFileName(path + fileName));
                TLParser parser = new TLParser(new CommonTokenStream(lexer));
                parser.removeErrorListeners();
                parser.setBuildParseTree(true);

                parser.addErrorListener(ThrowingErrorListener.INSTANCE);
                ParseTree tree = parser.parse();

                Scope scope = new Scope();
                Map<String, Function> functions = Collections.emptyMap();
                EvalVisitor visitor = new EvalVisitor(scope, functions);
                visitor.visit(tree);

                System.out.println();
                System.out.print("Rays>");
            }


        } catch (Exception e) {
            if (e.getMessage() != null) {
                System.err.println(e.getMessage());
            } else {
                e.printStackTrace();
            }
        }
    }
    public void speak(String msg) {

    }
}
