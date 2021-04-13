package tl.antlr4;

import jdk.internal.org.jline.utils.Log;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.IntervalSet;
import org.antlr.v4.runtime.misc.ParseCancellationException;

import java.util.List;

public class ThrowingErrorListener extends BaseErrorListener {
    public static final ThrowingErrorListener INSTANCE = new ThrowingErrorListener();
    public int lastError = -1;
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e)
            throws ParseCancellationException {
        TLParser parser = (TLParser) recognizer;
        String name = parser.getSourceName();
        TokenStream tokens = parser.getInputStream();


        List<String> stack = parser.getRuleInvocationStack();
        Token offSymbol = (Token) offendingSymbol;
        String offSymName = TLLexer.VOCABULARY.getSymbolicName(offSymbol.getType());
        int thisError = offSymbol.getTokenIndex();
        if (offSymbol.getType() == -1 && thisError == tokens.size() - 1) {
            System.out.println( name + ": Incorrect error: " + msg);
            return;
        }

        // Collections.reverse(stack);

     //   System.out.println(this+ name);
      //  System.out.println(this.toString()+ "Rule stack: " + stack);
       // System.out.println(this+ "At line " + line + ":" + charPositionInLine + " at " + offSymName + ": " + msg);

       // System.out.println("Expected Tokens"+parser.getExpectedTokens());
        //Getting the expected token
        IntervalSet exptokenset = parser.getExpectedTokens();
        String strExpToken = exptokenset.toString();
        String expectedToken = TLLexer.VOCABULARY.getSymbolicName(Integer.parseInt(strExpToken));
        System.out.println("Mismatched keyword. Expecting: " + expectedToken + " at the line " + line);
        if (thisError > lastError + 10) {
            lastError = thisError - 10;
        }
//        if(e.getClass().equals(InputMismatchException.class)){ //not workinh
//            System.out.println("in");
//        }
        for (int idx = lastError + 1; idx <= thisError; idx++) {
            Token token = tokens.get(idx);
          //  System.out.println(token.toString() +"DFggggg" );

//            if(token.toString().contains("repeat")){
//                System.out.println("Check your repeat statement");
//            }
//            if (token.getChannel() != Token.HIDDEN_CHANNEL){
//                System.out.println(this+ token.toString());}
        }
        lastError = thisError;

       // throw new ParseCancellationException("line " + line + ":" + charPositionInLine + " " + msg);
    }
}
