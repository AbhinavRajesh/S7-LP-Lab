#include<stdio.h>
#include<stdbool.h>
#include<string.h>

bool q0(char inputString[], int position, int inputLength);
bool q1(char inputString[], int position, int inputLength);
bool q2(char inputString[], int position, int inputLength);

// Represents the q0 state
// Returns
// 	q0() when input is 1
// 	q1() when input is 0
// 	false when input string is over and q0 is not the final state 
bool q0(char inputString[100], int position, int inputLength) {
	if (position+1 > inputLength) { 
		return false;
	} else if ( inputString[position] != '1' && inputString[position] != '0' ) {
		return false;
	} else if ( inputString[position] == '1' ) {
		return q0(inputString, position+1, inputLength);
	} else {
		return q1(inputString, position+1, inputLength);	
	}
}

// Represents the q1 state
// Returns
// 	q1() when input is 1
// 	q2() when input is 0
// 	false when input string is over and q0q1q2 is final state 
bool q1(char inputString[100], int position, int inputLength) {
	if (position+1 > inputLength) { 
		return false;
	} else if ( inputString[position] != '1' && inputString[position] != '0' ) {
		return false;
	} else if ( inputString[position] == '1' ) {
		return q1(inputString, position+1, inputLength);
	} else {
		return q2(inputString, position+1, inputLength);	
	}
}

// Represents the q2 state
// Returns
// 	q2() when input is 1
// 	q1() when input is 0
// 	true when input string is over and q0q1q2 is final state 
bool q2(char inputString[100], int position, int inputLength) {
	if (position+1 > inputLength) { 
		return true;
	} else if ( inputString[position] != '1' && inputString[position] != '0' ) {
		
		return false;
	} else if ( inputString[position] == '1' ) {
		return q2(inputString, position+1, inputLength);
	} else {
		return q1(inputString, position+1, inputLength);	
	}
}


int main() {
	char inputString[100]; // Input string to check if it is valid or not
	int position = 0; // Position of the current input character
	int inputLength = 0; // Size of the input string

	printf("Enter the input string: ");
	scanf("%s", inputString);
	inputLength = strlen(inputString);


	bool isValid = q0(inputString, position, inputLength); // Input string is valid or not

	if ( isValid ) {
		printf("Input string is valid\n");
	} else {
		printf("Input string is invalid\n");
	}
	return 0;
}
