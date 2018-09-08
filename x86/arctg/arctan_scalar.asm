        global          arctan_scalar ; cdecl

        section         .rdata
align 32
zero:   dd 0.0
align 32
one:    dd 1.0
align 32
two:    dd 2.0
        section         .bss
align 32
buf:     resb 4

        section         .text
arctan_scalar:
        mov             eax, [esp + 8] ; k

        movss           xmm0, [zero]       ; xmm0 -> 0 (sum)
        movss           xmm1, [one]        ; xmm1 -> 1 (div)
        movss           xmm2, [two]        ; xmm2 -> 2 (div's step)
        movss           xmm3, [esp + 4]    ; xmm3 -> x (pow)
        movss           xmm5, xmm3         ; xmm4 -> -x^2 (pow's step)
        mulss           xmm5, xmm5
        movss           xmm4, xmm0
        subss           xmm4, xmm5

        cmp             eax, 0
        jz              L2
L1:
        movss           xmm5, xmm3 ; xmm0 += xmm3 / xmm1
        divss           xmm5, xmm1
        addss           xmm0, xmm5

        addss           xmm1, xmm2
        mulss           xmm3, xmm4

        dec             eax
        cmp             eax, 0
        jnz             L1
L2:
        movss           [buf], xmm0
        emms
        fld      dword  [buf]
        ret
