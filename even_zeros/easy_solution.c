/*
    DFA to accept binary string with even number of 0s
*/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

/*
    States
    -----------------------------
    0 => q0     := initial state
    1 => q1
    2 => q2     := final state
    -----------------------------

    Transition Table
    -----------------------------
        S       0           1
    -----------------------------
    =>  q0      q1          q0
        q1      q2          q1
    *   q2      q1          q2
    -----------------------------
*/

// Global state to keep track of the transitions
int state = 0;


/*
    Function to check the DFA transitions
    Params:
        - inputCharacter: Input character for the next transition
*/
void dfaTransition(char inputCharacter) {
    if (inputCharacter != '0' && inputCharacter != '1') {
        printf("\nInput character '%c' is not binary", inputCharacter);
        return exit(0);
    }
    if (state == 0 ) {
        // Not checking for '1' as 1 would transition back to the same state
        if (inputCharacter == '0') state = 1;
    } else if (state == 1) {
        // Not checking for '1' as 1 would transition back to the same state
        if (inputCharacter == '0') state = 2;
    } else {
        // Not checking for '1' as 1 would transition back to the same state
        if (inputCharacter == '0') state = 1;
    }
}

int isFinalState() {
    return state == 2;
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


