IF1
  include macros.inc
ENDIF

.MODEL small, C
.STACK
.DATA
  s1 db 3 dup(' ')
  base db 100, 10, 1
  num db 100
.CODE
  .STARTUP

    m_ini ; Initialize the video mode

    m_impnum num, s1, base, 0fh, 20, 25


  .EXIT
END
