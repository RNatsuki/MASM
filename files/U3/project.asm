include macros.inc

.MODEL SMALL, C
.STACK

.DATA
  ; Definición de mensajes y variables
  op1 db '1. Capturar numeros'
  op2 db '2. Ver Numeros Capturados'
  op3 db '3. Numero Mayor'
  op4 db '4. Numero Menor'
  op5 db '5. Mediana de los numeros'
  op6 db '6. Salir'
  opmsg db 'Opcion: '

  s1 db 3 dup(' ')  ; Buffer para la captura de números
  base db 100, 10, 1  ; Base para la conversión de números

  txt1 db "Numero 1: "
  txt2 db "Numero 2: "
  txt3 db "Numero 3: "
  err db "Numero invalido. Presiona cualquier tecla para continuar..."

  opt db 0  ; La opción del menú seleccionada

  txt0 db 6 dup(0)  ; Buffer para texto

  num1 db 0  ; Primer número capturado
  num2 db 0  ; Segundo número capturado
  num3 db 0  ; Tercer número capturado

  nummay db 0  ; Número mayor
  nummen db 0  ; Número menor
  nummed db 0  ; Número mediano

.CODE
  .STARTUP
    m_ini  ; Inicializa la pantalla

    ; Bucle principal del menú
    e_menu:
      m_clear  ; Limpia la pantalla
      m_imptxt 0FH, 19, 2, 30, op1  ; Imprime las opciones del menú
      m_imptxt 0FH, 25, 3, 30, op2
      m_imptxt 0FH, 15, 4, 30, op3
      m_imptxt 0FH, 15, 5, 30, op4
      m_imptxt 0FH, 25, 6, 30, op5
      m_imptxt 0FH, 8, 7, 30, op6

      ; Captura la opción del menú seleccionada por el usuario
      m_capnum opt, s1, base, opmsg, 8, err, 9, 35

      ; Compara la opción seleccionada y salta a la etiqueta correspondiente
      cmp opt, 1
      je captura
      cmp opt, 2
      je ver
      cmp opt, 3
      je mayor
      cmp opt, 4
      je menor
      cmp opt, 5
      je mediana
      cmp opt, 6
      je salir

      ; Si no se selecciona una opción válida, vuelve al menú
      jmp e_menu

    ; Captura los tres números del usuario
    captura:
      m_clear
      m_capnum num1, s1, base, txt1, 10,  err, 3, 35
      m_clear
      m_capnum num2, s1, base, txt2, 10,  err, 3, 35
      m_clear
      m_capnum num3, s1, base, txt3, 10, err, 3, 35
      jmp e_menu

    ; Muestra los números capturados
    ver:
      m_clear
      m_impnum num1, s1, base, 0Fh, 15, 30
      m_impnum num2, s1, base, 0Fh, 16, 30
      m_impnum num3, s1, base, 0Fh, 17, 30
      m_waitkey  ; Espera una tecla para continuar
      jmp e_menu

    ; Determina y muestra el número mayor
    mayor:
      m_clear
      mov al, num1
      mov nummay, al

      mov al, num2
      cmp al, nummay
      jle tg_check3
      mov nummay, al

    tg_check3:
      mov al, num3
      cmp al, nummay
      jle tg_display_may
      mov nummay, al

    tg_display_may:
      m_impnum nummay, s1, base, 0Fh, 15, 30
      m_waitkey
      jmp e_menu

    ; Determina y muestra el número menor
    menor:
      m_clear
      mov al, num1
      mov nummen, al

      mov al, num2
      cmp al, nummen
      jge tg_check4
      mov nummen, al

    tg_check4:
      mov al, num3
      cmp al, nummen
      jge tg_display

      mov nummen, al

    tg_display:
      m_impnum nummen, s1, base, 0Fh, 15, 30
      m_waitkey
      jmp e_menu

    ; Determina y muestra la mediana de los tres números
    mediana:
      m_clear

      ; Si num1 no es ni el mayor ni el menor, entonces es la mediana
      mov al, num1
      cmp al, nummay
      je tg_find_med_num2
      cmp al, nummen
      je tg_find_med_num2
      mov nummed, al
      jmp tg_show_mediana

    tg_find_med_num2:
      ; Si num2 no es ni el mayor ni el menor, entonces es la mediana
      mov al, num2
      cmp al, nummay
      je tg_find_med_num3
      cmp al, nummen
      je tg_find_med_num3
      mov nummed, al
      jmp tg_show_mediana

    tg_find_med_num3:
      ; Si num3 no es ni el mayor ni el menor, entonces es la mediana
      mov al, num3
      mov nummed, al

    tg_show_mediana:
      m_impnum nummed, s1, base, 0Fh, 15, 30
      m_waitkey
      jmp e_menu

    salir:
      ; Sale del programa
      

.EXIT

END
