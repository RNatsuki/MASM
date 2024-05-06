

m_ini MACRO
  ; SET THE VIDEO MODE
  ;============================================================================
  MOV ah, 00h    ; set the function to set the video mode (00h=> set the video mode)
  MOV al, 03h    ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
  INT 10h        ; call the INTerruption 10h=> set the video mode to 03h
  ;============================================================================
  ; Set Data Segment
  MOV ax, @DATA
  MOV es, ax
ENDM




m_imptxt MACRO color,len,row,col,msg
  ;color: the color of the string
  ;len: the length of the string
  ;row: the row number
  ;col: the column number
  ;msg: the string

  ;Calc the length of the string




  ; BEGIN CODE
  MOV ah, 13h    ; the function number (13h=> prINT a string in color)
  MOV al, 01     ; the cursor will be MOVed to the next space after prINTing the string (00=> the cursor will not be MOVed) (01=> the cursor will be MOVed)
  MOV bh, 00     ; the page number (00=> the first page)
  MOV bl, color  ; the color of the string (4E=> yellow)
  MOV cx, len    ; the length of te string
  MOV dh, row    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
  MOV dl, col    ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
  LEA bp, msg    ; the address of the string
  INT 10h        ; call the INTerruption 10h=> prINT a string in color
  ; END CODE
ENDM


m_impnum  MACRO num, ms1, mbse, cnum, row, col
    ; num: el número a imprimir
    ; ms1: la cadena donde se guardará el número
    ; mbse: la base del número
    ; cnum: El color del número
    ; row: la fila donde se imprimirá
    ; col: la columna donde se imprimirá

    mov ax, 0
    mov al, num
    div mbse[0]
    mov ms1[0], al
    mov bh, ah
    mov ax, 0
    mov al, bh
    div mbse[1]
    mov ms1[1], al
    mov ms1[2], ah
    add ms1[0], 48
    add ms1[1], 48
    add ms1[2], 48

    ; Imprime la mediana
    mov ah, 13h
    mov al, 00
    mov bh, 00
    mov bl, cnum
    mov cx, 3
    mov dh, row
    mov dl, col
    lea bp, ms1
    int 10h
ENDM
