#!/bin/sh

# yasm -f elf32 -o arctan.o arctan.asm
yasm -f elf32 -o arctan_scalar.o arctan_scalar.asm

# gcc -m32 arctan.o main.c -o arctan
gcc -m32 arctan_scalar.o main.c -o arctan_scalar

# ./arctan
./arctan_scalar
