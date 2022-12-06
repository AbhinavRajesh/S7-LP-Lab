/* Lex program to accept a text file & display
    1. Number of lines
    2. Number of words
    3. Number of lowercase letters
    4. Number of uppercase letters
    5. Number of digits
    6. Number of special characters
    7. Total number of characters
*/

/* Every initialisation and package import happens here*/
%{
    #include<stdio.h>
    #include<string.h>

    int lines = 0,
        words = 0,
        lowercase_letters = 0,
        uppercase_letters = 0,
        digits = 0,
        special_characters = 0,
        total_characters = 0;
%}

/* All the regex rules will be written below */ 
%%

\n                      { lines++; words++; }
[a-z]                   { lowercase_letters++; total_characters++; }
[A-Z]                   { uppercase_letters++; total_characters++; }
[0-9]                   { digits++; total_characters++; }
[ \t\n]+                { words++; }
[^(a-zA-Z0-9 \t\n)]     { special_characters++; total_characters++; }

%%

/* All the subroutines(functions) go here */
int yywrap(void) {}

int main(void) {
    // To take the input from the file
    extern FILE *yyin;
    
    yyin = fopen("input.txt", "r");
    // Run the lex
    yylex();

    printf("\n1. Number of lines: %d", lines);
    printf("\n2. Number of words: %d", words);
    printf("\n3. Number of lowercase letters: %d", lowercase_letters);
    printf("\n4. Number of uppercase letters: %d", uppercase_letters);
    printf("\n5. Number of digits: %d", digits);
    printf("\n6. Number of special characters: %d", special_characters);
    printf("\n7. Total number of characters: %d", total_characters);

    return 0;
}

/*
O/P:
    1. Number of lines: 9
    2. Number of words: 14
    3. Number of lowercase letters: 19
    4. Number of uppercase letters: 5
    5. Number of digits: 5
    6. Number of special characters: 7
    7. Total number of characters: 36
*/