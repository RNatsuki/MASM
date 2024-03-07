COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA

    hline db 80 dup(196) ; the string to be printed
    vline db 24 dup(179) ; the string to be printed
    tlc db 218 ;
    trc db 191 ; the string to be printed (the top right corner)
    blc db 192 ; the string to be printed (the bottom left corner)
    brc db 217 ; the string to be printed (the bottom right corner)

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

         ; ============ PRINT TOP HLINE ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 55     ; the length of te string
        mov dh, 1    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, hline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT TOP HLINE ============


        ; ============ PRINT BOTTOM HLINE ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 55     ; the length of te string
        mov dh, 5    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, hline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT BOTTOM HLINE ============

        ; ============ PRINT TL CORNER ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 1    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, tlc     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT TL CORNER ============

        ; ============ PRINT TR CORNER ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 1    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 65     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, trc     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT TR CORNER ============

        ; ============ PRINT VLINES ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 2    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT VLINES ============

        ; ============ PRINT VLINES ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 3    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT VLINES ============

        ; ============ PRINT VLINES ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 4    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT VLINES ============


        ; ============ PRINT VLINES ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 2    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 65     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h ; call the interruption

        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 3    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 65     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h ; call the interruption

        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 4    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 65     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, vline     ; the address of the string
        int 10h ; call the interruption

        ; END RIGHT VLINES

        ; ============ PRINT BL CORNER ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 5    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 10     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, blc     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT BL CORNER ============


        ; ============ PRINT BR CORNER ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 1     ; the length of te string
        mov dh, 5    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 65     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, brc     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT BR CORNER ============

        ; END CODE
    .EXIT

END
