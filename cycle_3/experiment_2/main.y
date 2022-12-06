/* YACC program to implement IF-THEN-ELSE */


%{
#include<stdio.h>
#include<string.h>    
%}

%token IF THEN ELSE ARITHMETIC RELATIONAL NL NUMBER ID
/* Priority or something */
%right EQ

%%
STMT: S { printf("\nValid expression!"); }

S:
    IF '(' CONDITION ')' THEN EXPRESSION ';'
    |
    IF '(' CONDITION ')' THEN EXPRESSION ';' ELSE EXPRESSION ';'
    ;
CONDITION:
    VAR RELATIONAL VAR
    ;
EXPRESSION:
    S
    |
    ID EQ VAR ARITHMETIC VAR
    |
    ID EQ VAR
    ;
VAR:
    NUMBER
    |
    ID
    ;
%%

void yyerror(char *error) {
    printf("Invalid expression!");
    exit(0);
}

main() {
    printf("\nEnter the expression: ");
    yyparse();
}