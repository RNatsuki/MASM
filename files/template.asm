COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA

    t1 db 'Texto a Color'

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

        ;===COLORS===
        ; (0 => black, 1 => blue, 2 => green, 3 => cyan, 4 => red, 5 => magenta, 6 => brown, 7 => light gray, 8 => dark
        ;gray, 9 => light blue, A => light green, B => light cyan, C => light red, D => light magenta, E => yellow, F => white)
        ;===END COLORS ===


        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 4Eh    ; the color of the string (4E=> yellow)
        mov cx, 13     ; the length of te string
        mov dh, 12     ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, 35     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, t1     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE
    .EXIT

END
