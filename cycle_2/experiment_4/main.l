/* Lex program to accept a text file & display
    1. Number of even integers
    2. Number of odd integers
    3. Number of floating point numbers
    4. Number of negative numbers
    5. Total number of integers
*/

digits [0-9]

/* Every initialisation and package import happens here*/
%{
    #include<stdio.h>
    #include<string.h>

    int negative = 0,
        even = 0,
        odd = 0,
        floating = 0,
        integers = 0;
%}

/* All the regex rules will be written below */ 
%%

"-"*({digits})*"."?({digits})* {
    /* 
        - strstr is a function from string.h package
        - What it does is it basically checks if the second argument to
          the function is present in the first argument, i.e, checks if
          the second argument is a substring of the first argument
        - In the code below
            strstr(yytext, "-")
          it checks if "-" is not present, then it would return NULL
          else if present, it would return the pointer to first character
          of matched string
    */
    
    // The != NULL means "-" is present in the text
    if (strstr(yytext, "-") != NULL) negative++;
    // The != NULL means "." is present in the text
    if (strstr(yytext, ".") != NULL) {
        floating++;
    } else {
        integers++;
        // atoi funciton returns the integer value of the string
        int number = atoi(yytext);
        if (number > 0) {
            if (number % 2 == 0) even++;
            else if (number % 2 == 1) odd++; 
        }
    }
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

    printf("\n1. Total number of even numbers: %d", even);
    printf("\n2. Total number of odd numbers: %d", odd);
    printf("\n3. Total number of floating point numbers: %d", floating);
    printf("\n4. Total number of integers: %d", integers);
    printf("\n5. Total number of negative numbers: %d\n", negative);


    return 0;
}

/*
O/P:
    1. Total number of even numbers: 1
    2. Total number of odd numbers: 1
    3. Total number of floating point numbers: 2
    4. Total number of integers: 4
    5. Total number of negative numbers: 3
*/