include macros.inc

.MODEL SMALL, C
.STACK
.DATA
  op1 db '1. Capturar numeros'
  op2 db '2. Ver Numeros Capturados'
  op3 db '3. Numero Mayor'
  op4 db '4. Numero Menor'
  op5 db '5. Mediana de los numeros'
  op6 db '6. Salir'
  opmsg db 'Opcion: '

  s1 db 3 dup(' ')
  base db 100, 10, 1

  txt1 db "Numero 1: "
  txt2 db "Numero 2: "
  txt3 db "Numero 3: "
  err db "Numero invalido. Presiona cualquier tecla para continuar..."


  opt db 0 ; La opcion del menu seleccionada

  txt0 db 6 dup(0)

  .CODE
    .STARTUP
      m_ini

      ; MENU

      e_menu:
        m_clear
        m_imptxt 0FH, 19, 2, 30, op1
        m_imptxt 0FH, 25, 3, 30, op2
        m_imptxt 0FH, 15, 4, 30, op3
        m_imptxt 0FH, 15, 5, 30, op4
        m_imptxt 0FH, 25, 6, 30, op5
        m_imptxt 0FH, 8, 7, 30, op6

        m_capnum opt, s1, base, opmsg, err, 9, 35

    .EXIT

END
