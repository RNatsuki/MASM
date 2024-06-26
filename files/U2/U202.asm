COMMENT /*
  this program is request a number and print it
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
        ; ==============================================================================
        ; VALIDATE THE INPUT (IF IT IS A NUMBER)
        ; ==============================================================================
        cmp al, 48 ; compare the input with 48 (48=> 0)
        jb tg_req1 ; if the input is less than 48, then read again
        cmp al, 57 ; compare the input with 57 (57=> 9)
        ja tg_req1 ; if the input is greater than 57, then read again
        ; ==============================================================================

         ;============= PRINT THE NUMBER ============
        mov ah,2
        mov dl, al
        int 21h
        ;============= END PRINT ====================
        mov str[di], al ; store the input in the string
        sub str[di], 48 ; convert the character to a number (48 because the ascii code of 0 is 48) when the input is 0, the output will be 0, when the input is 1, the output will be 1, ..., when the input is 9, the output will be 9
        inc di; increase the count
        cmp di, 3 ;
        je tg_con1
        jmp tg_req1 ; read again
        ; ============ END READ ============



      tg_con1:
        ; ============ CONVERT THE STRING TO NUMBER AND PRINT ============
        dec di
        mov ax,0
        mov al,str[di]
        mul base[si]
        jo tg_err1
        jc tg_err1

        add num, al
        jc tg_err1

        dec si
        cmp di, 0
        je tg_slr
        jmp tg_con1


      tg_err1:
        ; SET THE VIDEO MODE FOR CLEARING THE SCREEN
        ;============================================================================
        MOV ah, 00h   ; set the function to set the video mode (00h=> set the video mode)
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
        INT 10h       ; call the interruption 10h=> set the video mode to 03h
        ;============================================================================

        ; ============ PRINT ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01h     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 4Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 59     ; the length of te string
        mov dh, 0      ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 0     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, err  ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT  ====================
        ; ============ READ ============
        mov ah, 7 ; the cursor will be moved to the next space after reading a character (00=> the cursor will not be moved) (01=> the cursor will be moved)
        int 21h  ; call the interruption 21h=> read a character
        ; ============ END READ ============
         ; SET THE VIDEO MODE FOR CLEARING THE SCREEN
        ;============================================================================
        MOV ah, 00h   ; set the function to set the video mode (00h=> set the video mode)
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
        INT 10h       ; call the interruption 10h=> set the video mode to 03h
        ;============================================================================
        mov di, 0
        mov si, 2
        mov num, 0
        mov str[0], 0
        mov str[1], 0
        mov str[2], 0

        jmp tg_num1
      tg_slr:



        ; END CODE
    .EXIT

END
