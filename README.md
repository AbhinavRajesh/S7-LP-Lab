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

| Program                                                                                                                  | Files                                                                                                                                                             | Documented? |
| ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [DFA to accept binary string with atleast two consecutive 0s](./cycle_1/consecutive_zeros/)                              | <ul><li>[`easy_solution.c`](./cycle_1/consecutive_zeros/easy_solution.c)</li><li>[`modular_solution.c`](./cycle_1/consecutive_zeros/modular_solution.c)</li></ul> | Yes         |
| [DFA to accept binary string with even number of 0s](./cycle_1/even_zeros/)                                              | <ul><li>[`easy_solution.c`](./cycle_1/even_zeros/easy_solution.c)</li><li>[`modular_solution.c`](./cycle_1/even_zeros/modular_solution.c)</li></ul>               | Yes         |
| [DFA for regular expression ((ab)\*bb)+](./cycle_1/regex_ab/)                                                            | <ul><li>[`main.c`](./cycle_1/regex_ab/main.c)</li></ul>                                                                                                           | Yes         |
| [DFA to accept string {a,b} where every "a" is followed by one "b" or "ab" using transition table](./cycle_1/ab_or_aab/) | <ul><li>[`main.c`](./cycle_1/ab_or_aab/main.c)</li></ul>                                                                                                          | Yes         |
| [Lex digits, number, special characters, lines and words](./cycle_2/experiment_1/)                                       | <ul><li>[`main.c`](./cycle_2/experiment_1/main.l)</li></ul>                                                                                                       | Yes         |
