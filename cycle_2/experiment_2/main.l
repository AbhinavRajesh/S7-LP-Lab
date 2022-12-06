/* Lex program to accept a text file & display
    1. Number of three digit numbers
    2. Total numbers in the file
    3. Identifiers starting with "a"
    4. Identifiers ending with "b"
    5. Total number of identifiers

    ONLY USING 2 REGEX

*/

digits [0-9]
alphabets [a-zA-Z]

/* Every initialisation and package import happens here*/
%{
    #include<stdio.h>
    #include<string.h>

    int three_digit = 0,
        numbers = 0,
        starting_a = 0,
        ending_b = 0,
        identifiers = 0;
%}

/* All the regex rules will be written below */ 
%%

({digits})+ {
    numbers++;
    // yyleng is the total length of the matched string
    if (yyleng == 3) three_digit++;
}

{alphabets}({alphabets}|{digits}|_)* {
    // yytext is the text that is being matched
    // Eg. from file the first line "abhi" would be in yytext and on next match it would be "123" and so on
    if (yytext[0] == 'a') starting_a++;
    if (yytext[yyleng-1] == 'b') ending_b++;
    identifiers++;
}

%%

/* All the subroutines(functions) go here */
int yywrap(void) {}

int main(void) {
    // To take the input from the file
    extern FILE *yyin;
    
    yyin = fopen("input.txt", "r");
    // Run the lex
    yylex();

    printf("\n1. Total number of three digit numbers: %d", three_digit);
    printf("\n2. Total numbers in the file: %d", numbers);
    printf("\n3. Total numbers identifiers starting with 'a': %d", starting_a);
    printf("\n4. Total numbers identifiers ending with 'b': %d", ending_b);
    printf("\n5. Total numbers of identifiers: %d", identifiers);


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