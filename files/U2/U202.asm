COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA

    num db  0 ; Here store th final number
	  str db 3 dup(0) ; Here store the string that will be printed
	  base db 100,10,1 ; Here store the base of the numbers
	; 100=> 2 digits, 10=> 1 digit, 1=> 1 digit

	txt db "Numero:" ; Message
	err db "Numero invalido. Presiona cualquier tecla para continuar..." ; 2nd Message

  .CODE
    .STARTUP

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
        ; YOUR CODE HERE
        ; ==============================================================================

      tg_num1:
        ; ============ PRINT ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01h     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 7     ; the length of te string
        mov dh, 1      ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 1     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, txt  ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT  ============
        mov di,0
        mov si,2

      tg_req1:
        ; ============ READ ============
        mov ax, 0 ; set the function to read a character (00h=> read a character)
        mov ah, 7 ; the cursor will be moved to the next space after reading a character (00=> the cursor will not be moved) (01=> the cursor will be moved)
        int 21h  ; call the interruption 21h=> read a character
        ; ==============================================================================
        ; VALIDATE THE INPUT (IF IT IS A NUMBER)
        ; ==============================================================================
        cmp al,48 ; compare the input with 48 (48=> 0)
        jb tg_req1 ; if the input is less than 48, then read again
        cmp al,57 ; compare the input with 57 (57=> 9)
        ja tg_req1 ; if the input is greater than 57, then read again
        ; ==============================================================================

        cmp al, 0Dh ; compare the input with 0Dh (0Dh=> enter)
        je tg_con1 ; if the input is 0Dh, then go to tg_con1

        

      tg_con1:

        ; END CODE
    .EXIT

END
