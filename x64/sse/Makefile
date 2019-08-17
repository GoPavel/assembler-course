ASM=yasm
CC=gcc
ASM_SOURCE=$(wildcard asm_source/*.asm)
ASM_OBJECTS=$(ASM_SOURCE:.asm=.o)

asm_source/%.o: asm_source/%.asm
	$(ASM) -f elf64 $< -o $@
	
code: main.c $(ASM_OBJECTS)
	$(CC) -m64 $^ 
