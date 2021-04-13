grammar TL;

parse
 : block EOF
 ;

block
 : ( statement | functionDecl )* ( Return expression  )?
 ;

statement
 : assignment
 | functionCall
 | ifStatement
 | forStatement
 | whileStatement
 |repeatStatement
 |speakStatement
 ;



assignment
 : Identifier indexes? '=' expression (As Type)?
 ;

functionCall
 :Call Identifier (ARGS '=' exprList)?  #identifierFunctionCall
 | Println  expression?   #printlnFunctionCall
 | Print  expression     #printFunctionCall
 | Assert '(' expression ')'    #assertFunctionCall
 | Size '(' expression ')'      #sizeFunctionCall
 ;

speakStatement: Speak expression;

ifStatement
 : ifStat elseIfStat* elseStat? EndIf
 ;

ifStat
 : If expression  block
 ;

elseIfStat
 : ElseIf expression  block
 ;

elseStat
 : Else  block
 ;

functionDecl
 : Def Identifier (PARAMS '=' idList)?  block EndMethod

 ;

forStatement
 : For Identifier '=' expression To expression  block EndFor
 ;

whileStatement
 : While expression  block EndWhile
 ;

 repeatStatement
 :Repeat Number Times   block EndRepeat
 ;

idList
 : Identifier ( '&' Identifier )*
 ;

exprList
 : expression ( '&' expression )*
 ;

expression
 : '-' expression                                       #unaryMinusExpression
 | '!' expression                                       #notExpression
 | <assoc=right> expression '^' expression              #powerExpression
 | expression op=( '*' | '/' | '%' ) expression         #multExpression
 | expression op=( '+' | '-' ) expression               #addExpression
 | expression op=( '>=' | '<=' | '>' | '<' ) expression #compExpression
 | expression op=( '==' | '!=' |EqualsString) expression             #eqExpression
 | expression '&&' expression                           #andExpression
 | expression '||' expression                           #orExpression
 | expression '?' expression ':' expression             #ternaryExpression
 | expression In expression                             #inExpression
 | functionCall indexes?                                #functionCallExpression
 | Number                                               #numberExpression
 | Bool                                                 #boolExpression
 | Null                                                 #nullExpression
 | list indexes?                                        #listExpression
 | Identifier indexes?                                  #identifierExpression
 |ErrorString                                           #errorExpression
 | String indexes?                                      #stringExpression
 | '(' expression ')' indexes?                          #expressionExpression
 |  (Input|Call Input)  String?                         #inputExpression

 ;

list
 : '[' exprList? ']'
 ;

indexes
 : ( '[' expression ']' )+
 ;

Println  : P R I N T L I N E;
PrintString : P R I N T S T R I N G;
Print    : P R I N T;
Input    :  I N P U T;
Assert   : A S S E R T;
Size     : S I Z E;
Def      : M E T H O D;
If       : I F ;
Else     : E L S E;
ElseIf:E L S E I F;
Return   : R E T U R N;
For      : F O R;
While    : W H I L E;
Repeat   : R E P E A T;
Times    : T I M E S;
To       : T O;
Do       : D O;
End      : E N D;
In       : I N;
Null     : N U L L;
PARAMS    : P A R A M S;
ARGS      : A R G S;
Speak : S P E A K;
Call : C A L L;
As: A S;
EndIf : E N D I F ;
EndLoop : E N D L O O P;
EndRepeat: E N D R E P E A T;
EndMethod : E N D M E T H O D;
EndFor : E N D F O R;
EndWhile : E N D W H I L E;
EqualsString : E Q U A L S ;

Or       : '||';
And      : '&&';
Equals   : '==';
NEquals  : '!=';
GTEquals : '>=';
LTEquals : '<=';
Pow      : '^';
Excl     : '!';
GT       : '>';
LT       : '<';
Add      : '+';
Subtract : '-';
Multiply : '*';
Divide   : '/';
Modulus  : '%';
OBrace   : '{';
CBrace   : '}';
OBracket : '[';
CBracket : ']';
OParen   : '(';
CParen   : ')';
SColon   : ';';
Assign   : '=';
Comma    : ',';
QMark    : '?';
Colon    : ':';

Bool
 :  T R U E
 | F A L S E
 ;

Number
 : Int ( '.' Digit* )?
 ;
Type:
I N T |  S T R I N G | B O O L E A N|D O U B L E
;

Identifier
 : [a-zA-Z_] [a-zA-Z_0-9]*
 ;

String
 : ["] ( ~["\r\n\\] | '\\' ~[\r\n] )* ["]
 | ['] ( ~['\r\n\\] | '\\' ~[\r\n] )* [']
 ;

ErrorString
:["] ( ~["\r\n\\] | '\\' ~[\r\n] )*
| ['] ( ~['\r\n\\] | '\\' ~[\r\n] )*
;


Comment
 : ( '//' ~[\r\n]* | '/*' .*? '*/' ) -> skip
 ;

Space
 : [ \t\r\n\u000C] -> skip
 ;

fragment Int
 : [1-9] Digit*
 | '0'
 ;
  
fragment Digit 
 : [0-9]
 ;

 fragment A : [aA];
 fragment B : [bB];
 fragment C : [cC];
 fragment D : [dD];
 fragment E : [eE];
 fragment F : [fF];
 fragment G : [gG];
 fragment H : [hH];
 fragment I : [iI];
 fragment J : [jJ];
 fragment K : [kK];
 fragment L : [lL];
 fragment M : [mM];
 fragment N : [nN];
 fragment O : [oO];
 fragment P : [pP];
 fragment Q : [qQ];
 fragment R : [rR];
 fragment S : [sS];
 fragment T : [tT];
 fragment U : [uU];
 fragment V : [vV];
 fragment W : [wW];
 fragment X : [xX];
 fragment Y : [yY];
 fragment Z : [zZ];




