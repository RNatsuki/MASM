include macros.inc
.MODEL SMALL, C
.STACK
.DATA

  txt db 10 dup(' ')

  .CODE
    .STARTUP
      m_ini
      m_cadena txt
      m_imptxt 0FH, 10, 15, 30, txt
    .EXIT

END
