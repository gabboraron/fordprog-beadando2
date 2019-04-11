%option noyywrap c++ yylineno

%{
#include "Parserbase.h"
#include <iostream>
#include <cstdlib>
using namespace std;
%}

DIGIT   	[0-9]
WS  		[ \t\n]
CHAR  		[a-zA-Z]
UNDERSCORE	"_"

%%

"+"         return Parser::PLUS;
"-"         return Parser::MINUS;
"="         return Parser::EQUAL;
"<"         return Parser::LT;
">"         return Parser::GT;
"("         return Parser::OPEN;
")"         return Parser::CLOSE;
"do"        return Parser::DO;
"begin"     return Parser::BEGINNER;
"end" 	    return Parser::END;
";" 	    return Parser::SEMICOLON;
"skip"	    return Parser::SKIP;
"while"     return Parser::WHILE;
"read"     	return Parser::READ;
"write"    	return Parser::WRITE;
"true"    	return Parser::TRUE;
"false"    	return Parser::FALSE;
"not"    	return Parser::NOT;
"if"    	return Parser::IF;
"else"    	return Parser::ELSE;
"elseif"   	return Parser::ELSIF;
"then"    	return Parser::THEN;
"endif"    	return Parser::ENDIF;
"done"    	return Parser::DONE;
":="    	return Parser::SETTER;
"natural"  	return Parser::NATURAL;
"boolean"  	return Parser::BOOLEAN;
"and"  		return Parser::AND;
"or"  		return Parser::OR;
"div"  		return Parser::DIV;
"mod"  		return Parser::MOD;
"*"  		return Parser::STAR;


program		      {
					std::cout << "kulcsszo: program" 	<< std::endl;
					return Parser::PROGRAM;
				  }
{DIGIT}+    	  {
					std::cout << "DIGIT: "   << YYText()<< std::endl;
				    return Parser::NUMBER;
				  }
({CHAR})+({CHAR}|{DIGIT}|{UNDERSCORE})*		{ std::cout << "VARIABLENAME: "<< YYText()<< std::endl;
											  return Parser::VARIABLENAME;
											}

{WS}+       	  std::cout << "whitespace"		<< std::endl;
"#"([^#]|\n)*"#"  std::cout << "megjegyzes: "   << YYText()<< std::endl;


.           {
                std::cerr << lineno() << ": Lexikalis hiba." << std::endl;
                exit(1);
            }
%%
