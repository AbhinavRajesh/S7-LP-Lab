/* Lex program to accept a C file & display
    1. Number of keywords
    2. Number of identifiers
    3. Number of arithmetic operators
    4. Number of relatinal operators
    5. Number of loops
*/

digits [0-9]
alphabets [a-zA-Z]
keyword int|main|include|return|printf|scanf|<stdio.h>
arithmetic "++"|"--"|[+|-|*|/|%]
loop for|while|do
relational ==|>=|<=|>|<

/* Every initialisation and package import happens here*/
%{
    #include<stdio.h>
    #include<string.h>

    int keywords = 0,
        identifiers = 0,
        arithmetic_operators = 0,
        relational_operators = 0,
        loops = 0;
%}

/* All the regex rules will be written below */ 
%%

["](.)*["]                              {}

{keyword}                               { keywords++;}
{loop}                                  { loops++; keywords++; }
{arithmetic}                            { arithmetic_operators++; }
{relational}                            { relational_operators++; }
{alphabets}({alphabets}|{digits}|_)*    { identifiers++; }

.                                       {}
%%

/* All the subroutines(functions) go here */
int yywrap(void) {}

int main(void) {
    // To take the input from the file
    extern FILE *yyin;
    
    yyin = fopen("main.c", "r");
    // Run the lex
    yylex();

    printf("\n1. Total number of keywords: %d", keywords);
    printf("\n2. Total number of loops: %d", loops);
    printf("\n3. Total number of arithmetic operators: %d", arithmetic_operators);
    printf("\n4. Total number of relational operators: %d", relational_operators);
    printf("\n5. Total number of identifiers: %d\n", identifiers);


    return 0;
}

/*
O/P:
    1. Total number of three digit numbers: 2
    2. Total numbers in the file: 4
    3. Total numbers identifiers starting with 'a': 1
    4. Total numbers identifiers ending with 'b': 1
    5. Total numbers of identifiers: 3
*/