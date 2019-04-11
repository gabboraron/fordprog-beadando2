%baseclass-preinclude <iostream>
%lsp-needed

%token NUMBER
%token OPEN
%token CLOSE
%token BEGINNER
%token END
%token SEMICOLON
%token NATURAL
%token BOOLEAN
%token VARIABLENAME
%token SKIP
%token WHILE
%token DONE
%token DO
%token READ
%token WRITE
%token TRUE
%token FALSE
%token IF
%token ELSE
%token ELSIF
%token THEN
%token ENDIF
%token PROGRAM

%left NOT
%left STAR
%left DIV
%left MOD
%left EQUAL
%left AND
%left OR
%left GT
%left LT
%left PLUS MINUS
%left SETTER

%%

start:
    program
    {
        std::cout << "start -> program" << std::endl;
    }
;

program:
    // ures
//    {
//        std::cout << "expressions -> epszilon" << std::endl;
//    }
//    COMMENT
//    {
//        std::cout << "program -> COMMENT" << std::endl;
//    }
//|
    PROGRAM VARIABLENAME declaration BEGINNER mainpart END
    {
        std::cout << "program -> PROGRAM VARIABLENAME declaration BEGINNER mainpart END" << std::endl;
    }
;

declaration:
    // ures
    {
        std::cout << "declaration -> epsilon" << std::endl;
    }
|
    type VARIABLENAME SEMICOLON declaration
    {
        std::cout << "declaration -> type VARIABLENAME SEMICOLON declaration" << std::endl;
    }
;

type:
    NATURAL
    {
        std::cout << "type -> NATURAL" << std::endl;
    }
|
    BOOLEAN
    {
        std::cout << "type -> BOOLEAN" << std::endl;
    }
;

epsilon:
    {
        std::cout << "epsilon" << std::endl;
    }
;		


mainpart:  
    SKIP SEMICOLON epsilon
    {
        std::cout << "mainpart -> SKIP mainpart" << std::endl;
    }
|
    VARIABLENAME SETTER expression SEMICOLON mainpart
    {
        std::cout << "mainpart -> VARIABLENAME SETTER expression SEMICOLON" << std::endl;
    }
|
    VARIABLENAME SETTER expression SEMICOLON epsilon
    {
        std::cout << "mainpart -> VARIABLENAME SETTER expression SEMICOLON" << std::endl;
    }
|
    READ OPEN VARIABLENAME CLOSE SEMICOLON mainpart
    {
        std::cout << "mainpart -> READ OPEN VARIABLENAME CLOSE SEMICOLON mainpart" << std::endl;
    }
|   READ OPEN VARIABLENAME CLOSE SEMICOLON epsilon
    {
        std::cout << "mainpart -> READ OPEN VARIABLENAME CLOSE SEMICOLON epsilon" << std::endl;
    }
|
    WRITE OPEN expression CLOSE SEMICOLON mainpart
    {
        std::cout << "mainpart -> WRITE OPEN expression CLOSE SEMICOLON mainpart" << std::endl;
    }
|
    WRITE OPEN expression CLOSE SEMICOLON epsilon
    {
        std::cout << "mainpart -> WRITE OPEN expression CLOSE SEMICOLON" << std::endl;
    }
|
    WHILE expression DO mainpart DONE mainpart
    {
        std::cout << "mainpart -> WHILE expression DO mainpart DONE" << std::endl;
    }
|
    WHILE expression DO mainpart DONE epsilon
    {
        std::cout << "mainpart -> WHILE expression DO mainpart DONE" << std::endl;
    }
|
    IF expression THEN mainpart else ENDIF mainpart    
    {
        std::cout << "mainpart -> IF expression THEN mainpart else ENDIF" << std::endl;
    }
|
    IF expression THEN mainpart ENDIF mainpart    
    {
        std::cout << "mainpart -> IF expression THEN mainpart ENDIF" << std::endl;
    }   
|
    IF expression THEN mainpart else ENDIF epsilon    
    {
        std::cout << "mainpart -> IF expression THEN mainpart else ENDIF" << std::endl;
    }
|
    IF expression THEN mainpart ENDIF epsilon    
    {
        std::cout << "mainpart -> IF expression THEN mainpart ENDIF" << std::endl;
    }   
;

else: 
    ELSIF expression THEN mainpart else
    {
        std::cout << "else -> ELSIF expression THEN mainpart else" << std::endl;
    }
|
    ELSIF expression THEN mainpart
    {
        std::cout << "else -> ELSIF expression THEN mainpart" << std::endl;
    }
|
    ELSE mainpart
    {
        std::cout << "else -> ELSE mainpart" << std::endl;
    }
;

// sign: 
//    EQUAL    
//    {
//        std::cout << "sign -> EQUAL" << std::endl;
//    }
// |
//    GT    
//    {
//        std::cout << "sign -> GT" << std::endl;
//    }
// |
//    LT    
//    {
//        std::cout << "sign -> LT" << std::endl;
//    }
// |
//    STAR    
//    {
//        std::cout << "sign -> STAR " << std::endl;
//    }
// |
//    DIV 
//    {
//        std::cout << "sign -> DIV " << std::endl;
//    }
// |
//    MOD 
//    {
//        std::cout << "sign -> MOD " << std::endl;
//    }
// |
//    AND 
//    {
//        std::cout << "sign -> AND " << std::endl;
//    }
// |
//    OR 
//    {
//        std::cout << "sign -> OR " << std::endl;
//    }
// |
//    PLUS 
//    {
//        std::cout << "sign -> PLUS " << std::endl;
//    }
// |
//    MINUS 
//    {
//        std::cout << "sign -> MINUS " << std::endl;
//    }
// ;

expression:
//    expression sign expression    
//    {
//        std::cout << "expression -> expression sign expression" << std::endl;
//    }
// |
    expression EQUAL expression 
    {
        std::cout << "sign -> EQUAL" << std::endl;
    }
|
    expression GT expression 
    {
        std::cout << "sign -> GT" << std::endl;
    }
|
    expression LT expression 
    {
        std::cout << "sign -> LT" << std::endl;
    }
|
    expression STAR expression 
    {
        std::cout << "sign -> STAR " << std::endl;
    }
|
    expression DIV expression 
    {
        std::cout << "sign -> DIV " << std::endl;
    }
|
    expression MOD expression 
    {
        std::cout << "sign -> MOD " << std::endl;
    }
|
    expression AND expression
    {
        std::cout << "expression -> expression AND expression" << std::endl;
    }
|
    expression OR expression
    {
        std::cout << "expression -> expression OR expression" << std::endl;
    }
|
    OPEN expression CLOSE    
    {
        std::cout << "expression -> OPEN expression CLOSE" << std::endl;
    }
|
    expression PLUS expression    
    {
        std::cout << "expression -> expression PLUS expression" << std::endl;
    }
|
    expression MINUS expression    
    {
        std::cout << "expression -> expression MINUS expression" << std::endl;
    }
|
    TRUE    
    {
        std::cout << "expression -> TRUE" << std::endl;
    }
|
    FALSE    
    {
        std::cout << "expression -> FALSE" << std::endl;
    }
|
    VARIABLENAME    
    {
        std::cout << "expression -> VARIABLENAME" << std::endl;
    }
|
    NOT expression
    {
        std::cout << "expression -> NOT expression" << std::endl;
    }

|   NUMBER
    {
        std::cout << "expression -> NUMBER" << std::endl;
    }
;