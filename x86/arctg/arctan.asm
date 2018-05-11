        global          arctan ; cdecl

        section         .bss
buf:    resb 4

        section         .text
arctan:
        mov             eax, [esp + 8]      ; k

        finit
        fldz                            ; + 0
        fld1                            ; + 1
        fld     dword   [esp + 4]       ; + x
        fmul            st0, st0        ; -> x^2
        fchs                            ; -> -x^2
        fld     dword   [esp + 4]       ; + x

        cmp             eax, 0
        jz              L2
L1:
        fld             st0
        fdiv            st0, st3
        faddp           st4, st0
        fmul            st0, st1
        fld1
        fld1
        faddp           st1
        faddp           st3, st0
        dec             eax
        cmp             eax, 0
        jnz             L1
L2:
        fld             st3
        ret
