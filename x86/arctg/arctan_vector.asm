        global          arctan_vector ; cdecl

        section         .rdata
one:       dd 1.0
two:       dd 2.0
align 32
zeros:     dd 0.0, 0.0, 0.0, 0.0
align 32
coef:      dd 1.0, -3.0, 5.0, -7.0
align 32
step_down: dd 8.0, -8.0, 8.0, -8.0
        section         .bss
align 32
buf16:   resb 16
align 32
first:   resb 16
align 32
step_up: resb 16
        section         .text
arctan_vector:
;       zeros     [0, 0, 0, 0]
;       first     [x, x^3, x^5, x^7]
;       coef      [1, -3, 5, -7]
;       step_up   [x^8, x^8, x^8, x^8]
        mov             eax, [esp + 8] ; k
        movss           xmm0, [esp + 4] ; xmm = x

        movss           xmm1, xmm0      ; xmm = x, x
        mulss           xmm1, xmm0      ; xmm = x, x**2
        movss           xmm2, xmm1      ; xmm = x, x**2, x**2
        mulss           xmm2, xmm1      ; xmm = x, x**2, x**4
        movss           xmm3, xmm2      ; xmm = x, x**2, x**4, x**4
        mulss           xmm3, xmm1      ; xmm = x, x**2, x**4, x**6
        movss           xmm4, xmm3
        mulss           xmm4, xmm1      ; x, x**2, x**4, x**6, x**8

        mulss           xmm1, xmm0
        mulss           xmm2, xmm0
        mulss           xmm3, xmm0      ; x, x**3, x**5, x**7, x**8

        ; load to memory first condition
        movss           [first], xmm0
        movss           [first + 4], xmm1
        movss           [first + 8], xmm2
        movss           [first + 12], xmm3

        ; load to memory step_up
        movss           [step_up], xmm4
        movss           [step_up + 4], xmm4
        movss           [step_up + 8], xmm4
        movss           [step_up + 12], xmm4

        movaps          xmm0, [zeros]
        movaps          xmm1, [first]
        movaps          xmm2, [coef]
        movaps          xmm3, [step_up]
        movaps          xmm4, [step_down]
        ; xmm = [zeros], [first], [coef], [step_up]

        cmp             eax, 0
        jz              L2
L1:
        movaps          xmm5, xmm1
        divps           xmm5, xmm2
        addps           xmm0, xmm5

        addps           xmm2, xmm4
        mulps           xmm1, xmm3

        sub             eax, 4
        cmp             eax, 0
        jnz             L1
L2:
        movaps          [buf16], xmm0
        movss           xmm0, [buf16]
        movss           xmm1, [buf16 + 4]
        movss           xmm2, [buf16 + 8]
        movss           xmm3, [buf16 + 12]

        addss           xmm0, xmm1
        addss           xmm0, xmm2
        addss           xmm0, xmm3

        movss           [buf16], xmm0
        emms
        fld     dword   [buf16]
        ret
