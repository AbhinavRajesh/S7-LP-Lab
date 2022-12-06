#include<stdio.h>

int factorial(int a) {
    int fact = 1;
    for ( int i = a; i > 1; i--) fact = fact * i;
    return fact;
}

int main() {
    int a = 2;
    int fact = factorial(a);
    printf("\nFactorial of %d: %d", a, fact);
    return 0;
}