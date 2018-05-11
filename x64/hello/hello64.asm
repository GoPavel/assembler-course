        default         rel
        extern          printf
        global          main

        section         .rdata
hello:  db "Hello, world!", 0xA, 0
format: db "%s", 0
        section         .text
main:
        mov             rax, 0
        lea             rsi, [hello]
        lea             rdi, [format]
        sub             rsp, 8
        call            printf
        add             rsp, 8
        ret

; фокус с меткой
;         lea r, [rel label]
;         или
;         default rel
;         lea r, [label]
; или qword hello, но работает это только без операций над меткой.
