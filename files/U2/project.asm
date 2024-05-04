.MODEL SMALL, C
.STACK
.DATA
  ; Variables
  num1 db 0;
  num2 db 0;
  num3 db 0;
  sum db 0;
  res db 0;
  mult db 0;
  opt db 0;


  ; Menu Options
  op1 db '1. Capturar numeros'
  op2 db '2. Ver Numeros Capturados'
  op3 db '3. Numero Mayor'
  op4 db '4. Numero Menor'
  op5 db '5. Mediana de los numeros'
  op6 db '6. Salir'

  ; Messages
  msg1 db 'Opcion: '
  capmsg db "Capturando numeros"
  exitmsg db "Saliendo..."


  myname db "Luis Rodrigo Ibarra"

  ; Error message
  txt0 db 6 dup(0)  ; Almacena la cadena que se imprimirá
    s1  db 3 dup(' ') ;
	  base db 100, 10, 1  ; Almacena las bases de los números

  txt db "Numero 1:  " ; Mensaje para el primer número
	txt2 db "Numero 2:  " ; Mensaje para el segundo número
  txt3 db "Numero 3:  " ; Mensaje para el tercer número
	err db "Numero invalido. Presiona cualquier tecla para continuar..." ; Mensaje de error

  ;

.CODE
  .STARTUP
    ; Video Mode
    MOV ah, 00h
    MOV al, 03h
    INT 10h

    ; Set Data Segment
    MOV ax, @DATA
    MOV es, ax

  tg_menu:
    ; Limpiar pantalla
    MOV ah, 00h
    MOV al, 03h
    INT 10h



    ; Print option -> 1. Capturar numeros
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 19  ; Longitud del mensaje
    MOV dh, 3   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op1 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print option -> 2. Sumar
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 25  ; Longitud del mensaje
    MOV dh, 4   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op2 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print option -> 3. Restar
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 15  ; Longitud del mensaje
    MOV dh, 5   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op3 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print option -> 4. Multiplicar
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 15  ; Longitud del mensaje
    MOV dh, 6   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op4 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print option -> 4. Salir
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 25  ; Longitud del mensaje
    MOV dh, 7   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op5 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video


    ; Print message -> Opcion:
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 8  ; Longitud del mensaje
    MOV dh, 8   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, msg1 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print message -> Luis Rodrigo Ibarra:
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 19  ; Longitud del mensaje
    MOV dh, 24   ; Fila
    MOV dl, 60   ; Columna
    LEA bp, myname ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video


  tg_m_read:
    MOV ax, 0
    MOV ah, 7
    INT 21h
    CMP al, 0Dh
    JE tg_m_read

    CMP al, 49
    jb tg_m_read
    CMP al, 53
    ja tg_m_read

    mov ah, 2   ; Función para imprimir un carácter
    mov dl, al  ; Carácter a imprimir
    int 21h   ; Llamada a la interrupción de teclado
    MOV opt, al
    ; espera un enter
    MOV ah, 7
    INT 21h
    CMP al, 0Dh
    JNE tg_m_read

    CMP opt, 49
    JE tg_cap
    CMP opt, 50
    JE tg_show
  tg_cap:

  mov num1, 0 ; Inicializa el primer número
  mov num2, 0 ; Inicializa el segundo número
  mov num3, 0 ; Inicializa el tercer número
   ; Print message -> Capturando numeros

    ;
    ;=======Clear Screen============
    MOV ah, 00h
    MOV al, 03h
    INT 10h
    ; ========================
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 18  ; Longitud del mensaje
    MOV dh, 3   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, capmsg ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video
    ; ----------------------------
    tg_num1:
        mov ah, 13h ; Función para imprimir un mensaje
        mov al, 01h ; Número de líneas a imprimir
        mov bh, 00  ; Página de video
        mov bl, 0Fh ; Atributo de texto
        mov cx, 11  ; Longitud del mensaje
        mov dh, 1   ; Fila
        mov dl, 1   ; Columna
        lea bp, txt ; Dirección del mensaje
        int 10h     ; Llamada a la interrupción de video

        mov di, 0   ; Índice de la cadena
        mov si, 2   ; Índice de la base

      tg_req1:
        mov ax, 0 ; Limpia el regitxt0o ax
        mov ah, 7 ; Función para leer un carácter
        int 21h   ; Llamada a la interrupción de teclado

        cmp al, 0Dh ; Comprueba si se presionó Enter
        je tg_con1  ; Salta a la conversión si se presionó Enter

        cmp al, 48  ; Comprueba si el carácter es menor a 0
        jb tg_req1  ; Salta a la solicitud si el carácter es menor a 0
        cmp al, 57  ; Comprueba si el carácter es mayor a 9
        ja tg_req1  ; Salta a la solicitud si el carácter es mayor a 9

        mov ah, 2   ; Función para imprimir un carácter
        mov dl, al  ; Carácter a imprimir
        int 21h   ; Llamada a la interrupción de teclado

        mov txt0[di], al ; Almacena el carácter en la cadena
        sub txt0[di], 48 ; Convierte el carácter a número
        inc di          ; Incrementa el índice de la cadena
        cmp di, 3       ; Comprueba si la cadena tiene 3 caracteres
        je tg_con1      ; Salta a la conversión si la cadena tiene 3 caracteres
        jmp tg_req1     ; Vuelve a solicitar un carácter

      tg_con1:
        dec di        ; Decrementa el índice de la cadena
        mov ax, 0    ; Limpia el regitxt0o ax
        mov al, txt0[di] ; Convierte el carácter a número
        mul base[si]  ; Multiplica el número por la base correspondiente
        jo tg_err1    ; Salta a la rutina de error si hay un desbordamiento
        jc tg_err1    ; Salta a la rutina de error si hay un acarreo

        add num1, al  ; Suma el número al total
        jc tg_err1    ; Salta a la rutina de error si hay un acarreo

        dec si        ; Decrementa el índice de la base
        cmp di, 0     ; Comprueba si se ha convertido el último carácter
        je tg_num2    ; Salta a solicitar el segundo número si se ha convertido el último carácter
        jmp tg_con1   ; Vuelve a convertir el siguiente carácter

      ; Solicita y valida el segundo número
      tg_num2:
        mov ah, 13h   ; Función para imprimir un mensaje
        mov al, 01h   ; Número de líneas a imprimir
        mov bh, 00    ; Página de video
        mov bl, 0Fh   ; Atributo de texto
        mov cx, 11    ; Longitud del mensaje
        mov dh, 3     ; Fila
        mov dl, 1     ; Columna
        lea bp, txt2  ; Dirección del mensaje
        int 10h       ; Llamada a la interrupción de video

        mov di, 0     ; Índice de la cadena
        mov si, 2     ; Índice de la base

      tg_req2:
        mov ax, 0     ; Limpia el regitxt0o ax
        mov ah, 7     ; Función para leer un carácter
        int 21h       ; Llamada a la interrupción de teclado

        cmp al, 0Dh   ; Comprueba si se presionó Enter
        je tg_con2    ; Salta a la conversión si se presionó Enter

        cmp al, 48    ; Comprueba si el carácter es menor a 0
        jb tg_req2    ; Salta a la solicitud si el carácter es menor a 0
        cmp al, 57    ; Comprueba si el carácter es mayor a 9
        ja tg_req2    ; Salta a la solicitud si el carácter es mayor a 9

        mov ah, 2     ; Función para imprimir un carácter
        mov dl, al    ; Carácter a imprimir
        int 21h       ; Llamada a la interrupción de teclado

        mov txt0[di], al ; Almacena el carácter en la cadena
        sub txt0[di], 48 ; Convierte el carácter a número
        inc di          ; Incrementa el índice de la cadena
        cmp di, 3       ; Comprueba si la cadena tiene 3 caracteres
        je tg_con2      ; Salta a la conversión si la cadena tiene 3 caracteres
        jmp tg_req2     ; Vuelve a solicitar un carácter

      tg_con2:
        dec di          ; Decrementa el índice de la cadena
        mov ax, 0       ; Limpia el regitxt0o ax
        mov al, txt0[di] ; Convierte el carácter a número
        mul base[si]    ; Multiplica el número por la base correspondiente
        jo tg_err1      ; Salta a la rutina de error si hay un desbordamiento
        jc tg_err1      ; Salta a la rutina de error si hay un acarreo

        add num2, al    ; Suma el número al total
        jc tg_err1      ; Salta a la rutina de error si hay un acarreo

        dec si          ; Decrementa el índice de la base
        cmp di, 0       ; Comprueba si se ha convertido el último carácter
        je tg_num3      ; Salta a imprimir los números si se ha convertido el último carácter
        jmp tg_con2     ; Vuelve a convertir el siguiente carácter

      tg_err1:
        ; Establece el modo de video para limpiar la pantalla
        MOV ah, 00h
        MOV al, 03h
        INT 10h

        ; Imprime el mensaje de error
        mov ah, 13h
        mov al, 01h
        mov bh, 00
        mov bl, 4Fh
        mov cx, 59
        mov dh, 0
        mov dl, 0
        lea bp, err
        int 10h

        ; Lee un carácter para esperar la entrada del usuario
        mov ah, 7
        int 21h

        ; Establece el modo de video para limpiar la pantalla
        MOV ah, 00h
        MOV al, 03h
        INT 10h

        ; Reinicia las variables y vuelve a solicitar el primer número
        mov di, 0
        mov si, 2
        mov num1, 0
        mov txt0[0], 0
        mov txt0[1], 0
        mov txt0[2], 0

        jmp tg_num1




      tg_num3:
        mov ah, 13h
        mov al, 01h
        mov bh, 00
        mov bl, 0Fh
        mov cx, 11
        mov dh, 5
        mov dl, 1
        lea bp, txt3
        int 10h

        mov di, 0
        mov si, 2


      tg_req3:
        mov ax, 0
        mov ah, 7
        int 21h

        cmp al, 0Dh
        je tg_con3

        cmp al, 48
        jb tg_req3
        cmp al, 57
        ja tg_req3

        mov ah, 2
        mov dl, al
        int 21h

        mov txt0[di], al
        sub txt0[di], 48
        inc di
        cmp di, 3
        je tg_con3
        jmp tg_req3


      tg_con3:
        dec di
        mov ax, 0
        mov al, txt0[di]
        mul base[si]
        jo tg_err1
        jc tg_err1

        add num3, al
        jc tg_err1

        dec si
        cmp di, 0
        je tg_menu
        jmp tg_con3




tg_show:
   ; Convierte los números en cadenas y realiza cualquier operación necesaria
        mov ax, 0
        mov al, num1
        div base[0]
        mov s1[0], al
        mov bh, ah
        mov ax, 0
        mov al, bh
        div base[1]
        mov s1[1], al
        mov s1[2], ah
        add s1[0], 48
        add s1[1], 48
        add s1[2], 48


        ; Imprime el primer número
        mov ah, 13h
        mov al, 00
        mov bh, 00
        mov bl, 0Fh
        mov cx, 3
        mov dh, 12
        mov dl, 35
        lea bp, s1
        int 10h

        ; Limpia la cadena para el segundo número
        mov di, 0
        mov si, 2
        mov txt0[0], 0
        mov txt0[1], 0
        mov txt0[2], 0

        ; Convierte los números en cadenas y realiza cualquier operación necesaria
        mov ax, 0
        mov al, num2
        div base[0]
        mov s1[0], al
        mov bh, ah
        mov ax, 0
        mov al, bh
        div base[1]
        mov s1[1], al
        mov s1[2], ah
        add s1[0], 48
        add s1[1], 48
        add s1[2], 48

        ; Imprime el segundo número
        mov ah, 13h
        mov al, 00
        mov bh, 00
        mov bl, 0Fh
        mov cx, 3
        mov dh, 13
        mov dl, 35
        lea bp, s1
        int 10h


        ; Limpia la cadena para el tercer número
        mov di, 0
        mov si, 2
        mov txt0[0], 0
        mov txt0[1], 0
        mov txt0[2], 0

        ; Convierte los números en cadenas y realiza cualquier operación necesaria
        mov ax, 0
        mov al, num3
        div base[0]
        mov s1[0], al
        mov bh, ah
        mov ax, 0
        mov al, bh
        div base[1]
        mov s1[1], al
        mov s1[2], ah
        add s1[0], 48
        add s1[1], 48
        add s1[2], 48

        ; Imprime el tercer número
        mov ah, 13h
        mov al, 00
        mov bh, 00
        mov bl, 0Fh
        mov cx, 3
        mov dh, 14
        mov dl, 35
        lea bp, s1
        int 10h


    ; espera un enter
    MOV ah, 7
    INT 21h
    CMP al, 0Dh
    JNE tg_menu
    JMP tg_menu


 tg_exit:


  .EXIT

END
