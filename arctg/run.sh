#!/bin/sh

yasm -f elf32 -o arctan.o arctan.asm

gcc -m32 arctan.o main.c -o arctan

./arctan
