.MODEL SMALL, C
.STACK
.DATA
    num1 db 0  ; Almacena el primer número
    num2 db 0  ; Almacena el segundo número
	  str db 6 dup(0)  ; Almacena la cadena que se imprimirá
    s1  db 3 dup(' ') ;
	  base db 100, 10, 1  ; Almacena las bases de los números

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
        mov ah, 13h
        mov al, 01h
        mov bh, 00
        mov bl, 0Fh
        mov cx, 11
        mov dh, 1
        mov dl, 1
        lea bp, txt
        int 10h

        mov di, 0
        mov si, 2

      tg_req1:
        mov ax, 0
        mov ah, 7
        int 21h

        cmp al, 0Dh
        je tg_con1

        cmp al, 48
        jb tg_req1
        cmp al, 57
        ja tg_req1

        mov ah, 2
        mov dl, al
        int 21h

        mov str[di], al
        sub str[di], 48
        inc di
        cmp di, 3
        je tg_con1
        jmp tg_req1

      tg_con1:
        dec di
        mov ax, 0
        mov al, str[di]
        mul base[si]
        jo tg_err1
        jc tg_err1

        add num1, al
        jc tg_err1

        dec si
        cmp di, 0
        je tg_num2
        jmp tg_con1

      ; Solicita y valida el segundo número
      tg_num2:
        mov ah, 13h
        mov al, 01h
        mov bh, 00
        mov bl, 0Fh
        mov cx, 11
        mov dh, 3
        mov dl, 1
        lea bp, txt2
        int 10h

        mov di, 0
        mov si, 2

      tg_req2:
        mov ax, 0
        mov ah, 7
        int 21h

        cmp al, 0Dh
        je tg_con2

        cmp al, 48
        jb tg_req2
        cmp al, 57
        ja tg_req2

        mov ah, 2
        mov dl, al
        int 21h

        mov str[di], al
        sub str[di], 48
        inc di
        cmp di, 3
        je tg_con2
        jmp tg_req2

      tg_con2:
        dec di
        mov ax, 0
        mov al, str[di]
        mul base[si]
        jo tg_err1
        jc tg_err1

        add num2, al
        jc tg_err1

        dec si
        cmp di, 0
        je tg_prnt
        jmp tg_con2

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
        .EXIT

END
