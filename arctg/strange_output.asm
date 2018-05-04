;
; arctg = x - x^3 / 3 + x ^ 5 / 5 + (-1)^n-1 * x ^ 2n -1 / 2n -1
        extern          printf, scanf
        global          main

        section         .rdata
format_scanf:           db "%f", 0
format_printf_float:    db "%f", 0xA, 0
f:                      dd 1.5
        section         .bss
buf:                    resb 4
x:                      resb 4 ; argument of function
        section         .text

main:
; read float value

        mov             eax, [f]
        push            eax
        push            format_printf_float
        call            printf
        add             esp, 8 ; cкинуть формат + число = 4 + 4 = 12
        ret

; Как объявить себе float constant:
;          f1:  db 1.5
; TODO: Why 's' has word's size ?
; TODO What difference with fcom and fucom?
