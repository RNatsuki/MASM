

.MODEL small, C
.STACK
.DATA
    t1 db 'Hola soy un procedimiento', '$'
    t db 0
.CODE
  .STARTUP
    call p_imp
    call p_pausa
  .EXIT
; Procedures
;------------------------------------------
p_imp PROC
    lea dx, t1
    mov ah, 09h
    int 21h
ret
p_imp ENDP

;------------------------------------------

p_pausa PROC
    mov ah,7
    int 21h
ret
p_pausa ENDP

END
