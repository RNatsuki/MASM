.MODEL SMALL, C
.STACK
.DATA
  ; Variables
  num1 db 0;
  num2 db 0;
  sum db 0;
  res db 0;

  opt db 0;


  ; Menu Options
  op1 db '1. Capturar numeros'
  op2 db '2. Sumar'
  op3 db '3. Restar'
  op4 db '4. Salir'

  ; Messages
  msg1 db 'Opcion: '
  capmsg db "Capturando numeros"
  summsg db "Sumando numeros"
  resmsg db "Restando numeros"
  exitmsg db "Saliendo..."
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
    MOV cx, 8  ; Longitud del mensaje
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
    MOV cx, 9  ; Longitud del mensaje
    MOV dh, 5   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op3 ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video

    ; Print option -> 4. Salir
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 8  ; Longitud del mensaje
    MOV dh, 6   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, op4 ; Dirección del mensaje
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

  tg_m_read:
    MOV ax, 0
    MOV ah, 7
    INT 21h
    CMP al, 0Dh
    JE tg_m_read

    CMP al, 49
    jb tg_m_read
    CMP al, 52
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
    JE tg_sum
    CMP opt, 51
    JE tg_res
    CMP opt, 52
    JE tg_exit
    JMP tg_menu


  tg_cap:
   ; Print message -> Capturando numeros
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 18  ; Longitud del mensaje
    MOV dh, 15   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, capmsg ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video
    JMP tg_exit
  tg_sum:
  ; Print message -> Sumando numeros
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 15  ; Longitud del mensaje
    MOV dh, 15   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, summsg ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video
    JMP tg_exit
  tg_res:
  ; Print message -> Restando numeros
    MOV cx, 0
    MOV ah, 13h ; Función para imprimir un mensaje
    MOV al, 01h ; Número de líneas a imprimir
    MOV bh, 00  ; Página de video
    MOV bl, 0Fh ; Atributo de texto
    MOV cx, 17  ; Longitud del mensaje
    MOV dh, 15   ; Fila
    MOV dl, 29   ; Columna
    LEA bp, resmsg ; Dirección del mensaje
    INT 10h     ; Llamada a la interrupción de video
    JMP tg_exit

  tg_exit:
    MOV ah, 4Ch
    INT 21h

  .EXIT

END
