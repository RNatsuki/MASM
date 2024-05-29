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

  opt1 db '1. Crear archivo.', 0
  opt2 db '2. Capturar texto.', 0
  opt3 db '3. Escribir texto capturado en el archivo', 0
  opt4 db '4. Salir.', 0
  seltxt db 'Seleccione una opcion: ', 0
  opt db 0

   s1 db 3 dup(' ')  ; Buffer para la captura de números
   base db 100, 10, 1  ; Base para la conversión de números
  err db "Numero invalido. Presiona cualquier tecla para continuar..."
  .CODE
    .STARTUP
      m_ini

      e_menu:
        m_clear
        m_imptxt 0FH,17, 5, 20, opt1
        m_imptxt 0FH,18, 6, 20, opt2
        m_imptxt 0FH,41, 7, 20, opt3
        m_imptxt 0FH,9, 8, 20, opt4
        m_capnum opt, s1, base, seltxt, 23, err, 10, 20

        cmp opt, 1
        je e_crear
        cmp opt, 2
        je e_capturar
        cmp opt, 3
        je e_escribir
        cmp opt, 4
        je e_salir
        jmp e_menu

      e_crear:
        m_cfile filename, tsucc, terr
        m_waitkey
        jmp e_menu

      e_capturar:
        m_clear
        m_cadena txt
        jmp e_menu

      e_escribir:
         m_clear
         m_efile filename, txt, wrsucc, wrerr
        jmp e_menu

      e_salir:

    .EXIT

END
