include macros.inc
.MODEL SMALL, C
.STACK
.DATA

  filename db 'archivo.txt', 0
  tsucc db 'Archivo creado con exito.'
  terr db 'Error al crear el archivo.'

  wrerr db 'Error al escribir en el archivo.'
  wrsucc db 'Escritura exitosa.'
  txt db 50 dup(' ')

  .CODE
    .STARTUP
      m_ini
      ;m_cfile filename, tsucc, terr
      m_efile filename, txt, wrsucc, wrerr
    .EXIT

END
