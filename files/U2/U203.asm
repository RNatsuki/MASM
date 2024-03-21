COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA

    num db 255
    s1  db 3 dup(' ')
    base db 100,10,1
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
        mov ax, 0 ; Clean the register
        mov al, num ;
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

         ; ============ PRINT A STRING IN COLOR ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow)
        mov cx, 3     ; the length of te string
        mov dh, 12     ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 35     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, s1     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT A STRING IN COLOR ============

    .EXIT

END
