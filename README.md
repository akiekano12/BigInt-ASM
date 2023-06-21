# BigInt-ASM
a little bigInt library
This project implements big integer addition in x86 assembly language. It provides a demonstration of using registers and performing arithmetic operations on large numbers. The program takes two input numbers, adds them together, and prints the result.

Features:

Implements big integer addition using x86 assembly language.
Demonstrates the usage of registers for arithmetic operations.
Supports input of large numbers and produces the correct sum.
To run the program:

Clone the repository from GitHub: git clone https://github.com/akiekano12/BigInt-ASM.git
Navigate to the project directory: cd BigInt-ASM
Assemble the source code using NASM: nasm -f elf64 main.asm -o main.o
Link the object file and create the executable: ld -o BigInt main.o -lc
Run the program: ./BigInt
Demonstration of Assembly Registers:
Running on Ubuntu_linux x86_64 (nasm)

The program utilizes several x86 assembly registers for various purposes:
rsi: Used to hold the source address for reading input numbers.
rdx: Holds the size of the input numbers.
rcx: Serves as a loop counter for iterating through the input numbers.
rax: Serves as an accumulator register for storing intermediate results during addition.
rbx: Used as a carry register for addition with carry.
The program demonstrates the usage of these registers to read input numbers, perform arithmetic operations, and print the result.

