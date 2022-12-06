/* YACC program to validate an arithmetic expression */


%{
#include<stdio.h>
#include<string.h>    
%}

%token ARITHMETIC NUMBER ID INR_DCR NL
%right EQ

%%
STMT: S NL { printf("\nValid expression!"); }

S:
    ID EQ VAR ARITHMETIC VAR
    |
    ID INR_DCR
    |
    ID EQ VAR
    ;
VAR:
    NUMBER
    |
    ID
    |
    '(' VAR ')'
    |
    '(' VAR ARITHMETIC VAR ')'
    ;
%%

void yyerror(char *error) {
    printf("Invalid arithmetic expression!");
    exit(0);
}

main() {
    printf("\nEnter the arithmetic expression: ");
    yyparse();
}