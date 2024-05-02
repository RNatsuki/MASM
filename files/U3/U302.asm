IF1
  include macros.inc
ENDIF

.MODEL small, C
.STACK
.DATA
  txt db 'Rodrigo Ibarra'
.CODE
  .STARTUP
  ; Video Mode
    MOV ah, 00h
    MOV al, 03h
    INT 10h

    ; Set Data Segment
    MOV ax, @DATA
    MOV es, ax

  m_imptxt 0fh, 14, 10, 20, txt


  .EXIT
; Procedures
;------------------------------------------


;------------------------------------------



END
