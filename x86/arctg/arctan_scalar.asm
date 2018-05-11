        global          arctan_scalar ; cdecl

        section         .rdata
zero:   dd 0.0
one:    dd 1.0
two:    dd 2.0
        section         .bss
buf:     resb 4

        section         .text
arctan_scalar:
        mov             eax, [esp + 8] ; k
        movss           xmm2, [esp + 4] ; arg

        movss           xmm0, [zero]       ; xmm0 -> 0
        movss           xmm1, [one]        ; xmm1 -> 1
        movss           xmm3, xmm2        ; xmm3 -> x

        mulss           xmm2, xmm2        ; xmm2 -> -x^2
        movss           xmm4, [zero]
        subss           xmm4, xmm2
        movss           xmm2, xmm4

        cmp             eax, 0
        jz              L2
L1:
        movss           xmm4, xmm3 ; xmm0 += xmm3 / xmm1
        divss           xmm4, xmm1
        addss           xmm0, xmm4

        movss           xmm4, [two]
        addss           xmm1, xmm4
        mulss           xmm3, xmm2

        dec             eax
        cmp             eax, 0
        jnz             L1
L2:
        movss           [buf], xmm0
        emms
        fld      dword  [buf]
        ret
