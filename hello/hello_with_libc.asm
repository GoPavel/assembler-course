        extern          printf
        section         .text
        global          main
main:
        push            string
        push            format
        call            printf
        add             esp, 8
        ret
        section         .rdata
format: db "%s", 0xA, 0
string: db "Hello, World!", 0
