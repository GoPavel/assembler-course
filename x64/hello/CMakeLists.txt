cmake_minimum_required(VERSION 2.8)

project(arctg)

# add support sourse extensions
set(CMAKE_ASM_SOURCE_FILE_EXTENSIONS "asm")

# add support asm
enable_language(ASM)

# set variable witch define the commands for compiling and linking file.
# set assembler compiler
set(CMAKE_ASM_COMPILE_OBJECT "/usr/bin/yasm -f elf32 -g dwarf2 -o <OBJECT> <SOURCE>")
# set C compiler
set(CMAKE_ASM_LINK_EXECUTABLE "/usr/bin/gcc -m32 <OBJECTS> -o <TARGET>")

add_executable(${PROJECT_NAME} arctg.asm main.c)
