.MODEL SMALL, C
.STACK
.DATA
    num1 db 0  ; Almacena el primer número
    num2 db 0  ; Almacena el segundo número
	  str db 6 dup(0)  ; Almacena la cadena que se imprimirá
    s1  db 3 dup(' ') ;
	  base db 100, 10, 1  ; Almacena las bases de los números
    sum db 0  ; Almacena la suma de los números

	txt db "Numero 1:  " ; Mensaje para el primer número
	txt2 db "Numero 2:  " ; Mensaje para el segundo número
	err db "Numero invalido. Presiona cualquier tecla para continuar..." ; Mensaje de error

  .CODE
    .STARTUP
        ; Establece el modo de video
        MOV ah, 00h
        MOV al, 03h
        INT 10h

        ; Establece el segmento extra al segmento de datos
        MOV ax, @DATA
        MOV es, ax

        ; Solicita y valida el primer número
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
        mov ax, 0 ; Limpia el registro ax
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

        mov str[di], al ; Almacena el carácter en la cadena
        sub str[di], 48 ; Convierte el carácter a número
        inc di          ; Incrementa el índice de la cadena
        cmp di, 3       ; Comprueba si la cadena tiene 3 caracteres
        je tg_con1      ; Salta a la conversión si la cadena tiene 3 caracteres
        jmp tg_req1     ; Vuelve a solicitar un carácter

      tg_con1:
        dec di        ; Decrementa el índice de la cadena
        mov ax, 0    ; Limpia el registro ax
        mov al, str[di] ; Convierte el carácter a número
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
        mov ax, 0     ; Limpia el registro ax
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

        mov str[di], al ; Almacena el carácter en la cadena
        sub str[di], 48 ; Convierte el carácter a número
        inc di          ; Incrementa el índice de la cadena
        cmp di, 3       ; Comprueba si la cadena tiene 3 caracteres
        je tg_con2      ; Salta a la conversión si la cadena tiene 3 caracteres
        jmp tg_req2     ; Vuelve a solicitar un carácter

      tg_con2:
        dec di          ; Decrementa el índice de la cadena
        mov ax, 0       ; Limpia el registro ax
        mov al, str[di] ; Convierte el carácter a número
        mul base[si]    ; Multiplica el número por la base correspondiente
        jo tg_err1      ; Salta a la rutina de error si hay un desbordamiento
        jc tg_err1      ; Salta a la rutina de error si hay un acarreo

        add num2, al    ; Suma el número al total
        jc tg_err1      ; Salta a la rutina de error si hay un acarreo

        dec si          ; Decrementa el índice de la base
        cmp di, 0       ; Comprueba si se ha convertido el último carácter
        je tg_prnt      ; Salta a imprimir los números si se ha convertido el último carácter
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
        mov str[0], 0
        mov str[1], 0
        mov str[2], 0

        jmp tg_num1

      tg_prnt:
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
        mov str[0], 0
        mov str[1], 0
        mov str[2], 0

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

        ; Finaliza el programa
      tg_sum:
      mov ax, 0
      mov al, num1
      add al, num2
      mov sum, al

      ; Convierte los números en cadenas y realiza cualquier operación necesaria
        mov ax, 0
        mov al, sum
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

        ; Imprime el primer númeronum1
        mov ah, 13h
        mov al, 00
        mov bh, 00
        mov bl, 0Fh
        mov cx, 3
        mov dh, 20
        mov dl, 35
        lea bp, s1
        int 10h

        .EXIT

END
