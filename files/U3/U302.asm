IF1
  include macros.inc
ENDIF

.MODEL small, C
.STACK
.DATA
  txt db 'Hello World!'
.CODE
  .STARTUP

    m_ini ; Initialize the video mode
    m_imptxt 0fh, 12, 10, 20, txt ; Print the text


  .EXIT
END
