COMMENT /* Program for compare two number of 8 bits length (0 - 255) */

.MODEL SMALL, C
.STACK
.DATA

    n1  db 10
    n2  db 10
    te  db "N1 y N2 son Iguales"
    tn1 db "N1 es mayor"
    tn2 db "N2 es mayor"
  .CODE
    .STARTUP

        ; YOUR CODE HERE
        ; SET THE VIDEO MODE
        ;============================================================================
        MOV ah, 00h   ; set the function to set the video mode (00h=> set the video mode)
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
        INT 10h       ; call the interruption 10h=> set the video mode to 03h
        ;============================================================================

        ; ==============================================================================
        ;SET EXTRA SEGMENT TO DATA SEGMENT ALWAYS BEFORE PRINTING A STRING
        MOV ax, @DATA  ; set the data segment to ax
        MOV es, ax     ; set the extra segment to the data segment
        ; ==============================================================================

        ; ==============================================================================


  e_cmp:
    MOV ax, 0   ;
    mov al, n1  ;
    cmp al, n2  ;
    JE e_equal  ; JUMP if is equal
    cmp al, n2
    ja e_n1_m   ; JUMP if firts operand is grather than second
   ;jb e_n2_m   ; JUMP if second operand is grather than first
    jmp e_n2_m


  e_equal:
    ; ============ PRINT A STRING IN COLOR ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 9Fh    ; the color of the string (4E=> yellow)
        mov cx, 19     ; the length of te string
        mov dh, 12     ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 35     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, te     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT A STRING IN COLOR ============
    jmp e_exit
  e_n1_m:
  ; ============ PRINT A STRING IN COLOR ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 9Fh    ; the color of the string (4E=> yellow)
        mov cx, 11     ; the length of te string
        mov dh, 12     ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 35     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, tn1     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT A STRING IN COLOR ============
  jmp e_exit
  e_n2_m:
      ; ============ PRINT A STRING IN COLOR ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 9Fh    ; the color of the string (4E=> yellow)
        mov cx, 11     ; the length of te string
        mov dh, 12     ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 35     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, tn2     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT A STRING IN COLOR ============
  jmp e_exit
  e_exit:



        ; ==============================================================================


        ; END CODE
    .EXIT

END
