# Language Processor Lab - S7

This repo contains all the solution to the problems given during the language processor lab of S7

## How to run?

1. **Cycle 1**

   ```sh
      # Compile the C program
      gcc <filename>.c

      # Run the program
      ./a.out     # For Linux
      # OR
      a.exe       # For Windows
   ```

2. **Cycle 2**

   ```sh
      # Compile the lex program
      lex <filename>.l

      # Compile the generated C file
      gcc lex.yy.c

      # Run the program
      ./a.out     # For Linux
      # OR
      a.exe       # For Windows
   ```

3. **Cycle 3**

   ```sh
      # Compile the yacc program
      yacc <filename>.y -d # -d flag to generate the header file "y.tab.h"

      # Compile the lex program
      lex <filename>.l

      # Compile the generated C file
      gcc lex.yy.c y.tab.c -w

      # Run the program
      ./a.out     # For Linux
      # OR
      a.exe       # For Windows
   ```

| Program                                                                                                                  | Files                                                                                                                                                             | Documented? |
| ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <h3>**Cycle 1**</h3>                                                                                                     |
| [DFA to accept binary string with atleast two consecutive 0s](./cycle_1/consecutive_zeros/)                              | <ul><li>[`easy_solution.c`](./cycle_1/consecutive_zeros/easy_solution.c)</li><li>[`modular_solution.c`](./cycle_1/consecutive_zeros/modular_solution.c)</li></ul> | Yes         |
| [DFA to accept binary string with even number of 0s](./cycle_1/even_zeros/)                                              | <ul><li>[`easy_solution.c`](./cycle_1/even_zeros/easy_solution.c)</li><li>[`modular_solution.c`](./cycle_1/even_zeros/modular_solution.c)</li></ul>               | Yes         |
| [DFA for regular expression ((ab)\*bb)+](./cycle_1/regex_ab/)                                                            | <ul><li>[`main.c`](./cycle_1/regex_ab/main.c)</li></ul>                                                                                                           | Yes         |
| [DFA to accept string {a,b} where every "a" is followed by one "b" or "ab" using transition table](./cycle_1/ab_or_aab/) | <ul><li>[`main.c`](./cycle_1/ab_or_aab/main.c)</li></ul>                                                                                                          | Yes         |
| <h3>**Cycle 2**</h3>                                                                                                     |
| [Digits, number, special characters, lines and words](./cycle_2/experiment_1/)                                           | <ul><li>[`main.l`](./cycle_2/experiment_1/main.l)</li></ul>                                                                                                       | Yes         |
| [Three digits, numbers, identifiers(starting with "a" or ending with "b")](./cycle_2/experiment_2/)                      | <ul><li>[`main.l`](./cycle_2/experiment_2/main.l)</li></ul>                                                                                                       | Yes         |
| [Keywords, identifiers, loops, arithmetic and relatinal operators](./cycle_2/experiment_3/)                              | <ul><li>[`main.l`](./cycle_2/experiment_3/main.l)</li></ul>                                                                                                       | Yes         |
| [Even, Odd, floating, negative and integers](./cycle_2/experiment_4/)                                                    | <ul><li>[`main.l`](./cycle_2/experiment_4/main.l)</li></ul>                                                                                                       | Yes         |
| <h3>**Cycle 3**</h3>                                                                                                     |
| [YACC program to accept L = a^nb^n](./cycle_3/experiment_1/)                                                             | <ul><li>[`main.l`](./cycle_3/experiment_1/main.l)</li><li>[`main.y`](./cycle_3/experiment_1/main.y)</li></ul>                                                     | Not really  |
| [YACC program to implement IF-THEN-ELSE](./cycle_3/experiment_2/)                                                        | <ul><li>[`main.l`](./cycle_3/experiment_2/main.l)</li><li>[`main.y`](./cycle_3/experiment_2/main.y)</li></ul>                                                     | Not really  |
| [YACC program to validate an arithmetic expression](./cycle_3/experiment_3/)                                             | <ul><li>[`main.l`](./cycle_3/experiment_3/main.l)</li><li>[`main.y`](./cycle_3/experiment_3/main.y)</li></ul>                                                     | Not really  |

## Internal questions

1. Implement a DFA which accepts binary strings starting with 10 and ending with 01
2. Implement a DFA which accepts the binary string either starting and ending with '0' or starting and ending with '1'.
3. Implement a DFA which accepts binary strings containing '101' or '010' as a substring.
4. DFA to accept 1\*0 + 0\*1
5. DFA to accept ab\* + a\*b + c

## External questions

1. Lex program to read a text file and display counts of
   - Words containing exactly one 'a'
   - Words without a's and whose length is equal to 5
   - Numbers with 4 digits
   - Strings containing 'bbb' as a substring
