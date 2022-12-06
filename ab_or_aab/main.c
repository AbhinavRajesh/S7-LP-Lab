/*
    DFA to accept string {a,b} where every "a" is followed by one "b" or "ab"
    using transition table
*/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

/*
    States
    -----------------------------
    0 => q0     := initial state & final state
    1 => q1
    2 => q2     
    3 => q3     := final state
    -----------------------------

    Transition Table
    -----------------------------
        S       a           b
    -----------------------------
    =>  q0      q1          q0
        q1      q2          q3
        q2      Φ           q3
      * q3      q1          q3
    -----------------------------
*/

int transition_table[4][2] = {
    {1, 0},
    {2, 3},
    {-1, 3},
    {1, 3}
};

// Global state to keep track of the transitions
int state = 0;

int isFinalState() {
    return state == 0 || state == 3;
}


int main() {
    char inputString[100];

    printf("\nEnter the input string: ");
    scanf("%s", inputString);

    int inputStringLength = strlen(inputString);

    for ( int i = 0; i < inputStringLength; i++) {
        if (inputString[i] == 'a') state = transition_table[state][0];
        else if (inputString[i] == 'b') state = transition_table[state][1];
        // For input character which isn't 'a' or 'b'
        else state = -1;
        if (state == -1) break;
    }

    if (isFinalState()) {
        printf("\n Valid input!");
    } else {
        printf("\n Invalid input!");
    }
}


