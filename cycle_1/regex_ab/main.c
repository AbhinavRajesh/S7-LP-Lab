/*
    DFA for regular expression ((ab)*bb)+
*/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

/*
    States
    -----------------------------
    0 => q0     := initial state & final state
    1 => q1
    2 => q3     
    3 => q0q2
    4 => q0q2q4 := final state
    -----------------------------

    Transition Table
    -----------------------------
        S       a           b
    -----------------------------
    =>* q0      q1          q3
        q1      Φ           q0q2
        q3      Φ           q0q2q4
        q0q2    q1          q3
      * q0q2q4  q1          q3
    -----------------------------
*/

// Global state to keep track of the transitions
int state = 0;

/*
    Function to terminate the program when something goes wrong
    For eg.
        - When invalid transition happens
        - When invalid character is encountered
*/
void terminateProgram(char error[100]) {
    printf("%s", error);
    return exit(0);
}

/*
    Function to check the DFA transitions
    Params:
        - inputCharacter: Input character for the next transition
*/
void dfaTransition(char inputCharacter) {
    if (inputCharacter != 'a' && inputCharacter != 'b') {
        terminateProgram("\nInvalid input character");
    }
    if (state == 0 ) {
        if (inputCharacter == 'a') state = 1;
        else state = 2;
    } else if (state == 1) {
        if (inputCharacter == 'a') terminateProgram("Invalid string!");
        else state = 3;
    } else if (state == 2) {
        if (inputCharacter == 'a') terminateProgram("Invalid string!");
        else state = 4;
    } else if (state == 3) {
        if (inputCharacter == 'a') state = 1;
        else state = 2;
    } else {
        if (inputCharacter == 'a') state = 1;
        else state = 2;
    }
}

int isFinalState() {
    return state == 0 || state == 4;
}


int main() {
    char inputString[100];

    printf("\nEnter the input string: ");
    scanf("%s", inputString);

    int inputStringLength = strlen(inputString);

    for ( int i = 0; i < inputStringLength; i++) {
        dfaTransition(inputString[i]);
    }

    if (isFinalState()) {
        printf("\n Valid input!");
    } else {
        printf("\n Invalid input!");
    }
}


