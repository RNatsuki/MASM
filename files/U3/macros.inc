

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


m_capnum  MACRO mnum, mstr, mbase, mtxt, merr
    ; mnum: la variable donde se guardará el número
    ; mstr: la cadena donde se guardará el número
    ; mbase: la base del número
    ; mtxt: el mensaje de entrada
    ; merr: el mensaje de error

    LOCAL tg_num1, tg_req1, tg_con1, tg_err1, tg_slr
    mov mnum, 0
    tg_num1:


        m_imptxt 0FH, 7, 1,1,mtxt

        ; ============ DECLARE THE COUNT ============
        mov di,0
        mov si,2
        ; ============ END DECLARE THE COUNT ============

      tg_req1:
        ; ============ READ ============
        mov ax, 0 ; set the function to read a character (00h=> read a character)
        mov ah, 7 ; the cursor will be moved to the next space after reading a character (00=> the cursor will not be moved) (01=> the cursor will be moved)
        int 21h  ; call the interruption 21h=> read a character

        cmp al, 0Dh ; compare the input with 13 (13=> enter)
        je tg_con1 ; if the input is 13, then continue

        cmp al, 48 ; compare the input with 48 (48=> 0)
        jb tg_req1 ; if the input is less than 48, then read again
        cmp al, 57 ; compare the input with 57 (57=> 9)
        ja tg_req1 ; if the input is greater than 57, then read again


         ;============= PRINT THE NUMBER ============
        mov ah,2
        mov dl, al
        int 21h
        ;============= END PRINT ====================
        mov mstr[di], al ; store the input in the string
        sub mstr[di], 48 ; convert the character to a number (48 because the ascii code of 0 is 48) when the input is 0, the output will be 0, when the input is 1, the output will be 1, ..., when the input is 9, the output will be 9
        inc di; increase the count
        cmp di, 3 ;
        je tg_con1
        jmp tg_req1 ; read again
        ; ============ END READ ============



      tg_con1:
        dec di
        mov ax,0
        mov al,mstr[di]
        mul mbase[si]
        jo tg_err1
        jc tg_err1

        add mnum, al
        jc tg_err1

        dec si
        cmp di, 0
        je tg_slr
        jmp tg_con1


      tg_err1:

        m_clear
        m_imptxt 4FH, 59, 0, 0, merr
        mov ah, 7 ; the cursor will be moved to the next space after reading a character (00=> the cursor will not be moved) (01=> the cursor will be moved)
        int 21h  ; call the interruption 21h=> read a character

        m_clear
        mov di, 0
        mov si, 2
        mov mnum, 0
        mov mstr[0], 0
        mov mstr[1], 0
        mov mstr[2], 0

        jmp tg_num1
      tg_slr:
ENDM


m_clear MACRO
        MOV ah, 00h   ; set the function to set the video mode (00h=> set the video mode)
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
        INT 10h       ; call the interruption 10h=> set the video mode to 03h
ENDM
