IF1
  include macros.inc
ENDIF

.MODEL small, C
.STACK
.DATA
  s1 db 3 dup(' ')
  base db 100, 10, 1
  num db 0
  msg db "Numero:"
  merro db "Numero invalido. Presiona cualquier tecla para continuar..."
.CODE
  .STARTUP

    m_ini ; Initialize the video mode

    m_capnum num, s1, base, msg, merro
    m_capnum num, s1, base, msg, merro

    m_impnum num, s1, base, 0FH, 3, 20

  .EXIT
END
