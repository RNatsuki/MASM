COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA
    ; STRINGs
    instName db 'Instituto Tecnologico Superior de Coalcoman'
    carName db 'Ingenieria en Sistemas Computacionales'
    matName db 'Lenguajes de Interfaz'
    pracName db 'Practica: Desplegar mensajes en pantalla'
    myName db 'Luis Rodrigo Ibarra Ibarra'
    ;Square for lines
    hline db 79 dup(223)

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

         ;======= HIDE THE CURSOR =======================================================
        MOV ah, 01h   ; set the function to set the cursor (01h => set the curso6)
        MOV ch, 26h   ; set the row to 06h    ; 26h = 38 (in decimal) this hides the cursor
        MOV cl, 07h   ; set the column to 07h ; 07h = 7 (in decimal) this hides the cursor
        INT 10h       ; call the interruption 10h => set the cursor to the row 06h and column 07h
        ;================================================================================

        ;===COLORS===
        ; (0 => black, 1 => blue, 2 => green, 3 => cyan, 4 => red, 5 => magenta, 6 => brown, 7 => light gray, 8 => dark
        ;gray, 9 => light blue, A => light green, B => light cyan, C => light red, D => light magenta, E => yellow, F => white)
        ;===END COLORS ===

        ; =========== PRINT BLUE LINES TOP AND BOTTOM ===========

       ; ============ PRINT TOP HLINE ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 11h    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 79     ; the length of te string
        mov dh, 1    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 0     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, hline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT TOP HLINE ============


        ; ============ PRINT BOTTOM HLINE ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 11h    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx, 79     ; the length of te string
        mov dh, 23    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 0     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, hline     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT BOTTOM HLINE ============
        ; =========== END PRINT BLUE LINES TOP AND BOTTOM ===========


        ; =========== PRINT STRINGS ===========
        ; ============ PRINT INSTITUTO TECNOLOGICO SUPERIOR DE COALCOMAN ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 2Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx,43      ; the length of te string
        mov dh, 4    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 18     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, instName     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT INSTITUTO TECNOLOGICO SUPERIOR DE COALCOMAN ============
        ; ============ PRINT INGENIERIA EN SISTEMAS COMPUTACIONALES ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 1Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx,38      ; the length of te string
        mov dh, 5    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 20     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, carName     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT INGENIERIA EN SISTEMAS COMPUTACIONALES ============
        ; ============ PRINT LENGUAJES DE INTERFAZ ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 3Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx,21      ; the length of te string
        mov dh, 6    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 29     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, matName     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT LENGUAJES DE INTERFAZ ============
        ; ============ PRINT PRACTICA: DESPLEGAR MENSAJES EN PANTALLA ============
         mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 9Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx,40      ; the length of te string
        mov dh, 12    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 20     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, pracName     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT PRACTICA: DESPLEGAR MENSAJES EN PANTALLA ============
        ; ============ PRINT LUIS RODRIGO IBARRA IBARRA ============
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 00     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow) 4=> the background color, E=> the foreground color
        mov cx,26      ; the length of te string
        mov dh, 22    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 50     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, myName     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; ============ END PRINT LUIS RODRIGO IBARRA IBARRA ============
        ; =========== END PRINT STRINGS ===========


        ; ==============================================================================
        ; WAIT FOR A KEY TO BE PRESSED
        MOV AH, 7    ; set the function to wait for a key to be pressed (00h=> wait for a key to be pressed)
        INT 21h        ; call the interruption 16h=> wait for a key to be pressed
        ; ==============================================================================

      ; END CODE
    .EXIT

END
