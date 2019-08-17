        section         .text
; int array_int_mul(short *src, short *dst, int size);
        global          array_int_mul
        
array_int_mul: 
;calling convetion
; *src -> rdi
; *dst -> rsi
; size -> rdx
; stack = [ret]..
        movd            xmm0, [rdi] ; = 2 short
        ; movq            xmm0, [rdi + 8]
        movd            xmm1, [rsi] ; = 2 short
        ; movq            xmm1, [rsi + 8]
        
        movd            xmm2, xmm1
        pmullw          xmm2, xmm0
        pmulhw          xmm1, xmm0
        ; xmm2 -> low bits
        ; xmm1 -> high bits
        
        movd            xmm0, xmm2
        ; xmm0 -> lowbits
        punpcklwd       xmm0, xmm1
        punpckhwd       xmm2, xmm1
        packusdw        xmm0, xmm2
        
        movd            [rdi], xmm0
        
        emms
        
        ret
