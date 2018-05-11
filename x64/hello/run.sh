#!/bin/sh

yasm -f elf64 hello64.asm -o hello64.o
gcc -m64 hello64.o -o hello64
./hello64
