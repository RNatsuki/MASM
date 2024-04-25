COMMENT /*
  this program is for printing a string on the screen
  using colors
        */

.MODEL SMALL, C
.STACK
.DATA

    char1 db 220
    char2 db 176
    char3 db 219
    rr db 0
    cc db 0

  .CODE
    .STARTUP
main proc
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

        ; ================================== Top Line ========================================
        mov rr, 3 ; value from row begins
        mov cc,10 ; value from colum begins
      e_lsup:

        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 77h    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char1     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add cc, 1
        cmp cc, 70
        JNE e_lsup

        ; ================================== Top Line ========================================


        mov rr, 22 ; value from row begins
        mov cc,10 ; value from colum begins
      e_linf:

        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 77h    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char1     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add cc, 1
        cmp cc, 70
        JNE e_linf

        mov rr, 23 ; value from row begins
        mov cc,12 ; value from colum begins

      e_linfs:
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char2     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add cc, 1
        cmp cc, 71
        JNE e_linfs

        mov rr, 4 ; value from row begins
        mov cc,10 ; value from colum begins
      e_lizq:
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 77h    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char3     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add rr, 1
        cmp rr, 23
        JNE e_lizq


        mov rr, 4 ; value from row begins
        mov cc,69 ; value from colum begins
      e_lder:
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 77h    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char3     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add rr, 1
        cmp rr, 23
        JNE e_lder


        mov rr, 4; value from row begins
        mov cc,70 ; value from colum begins

      e_lders:
        mov ah, 13h    ; set the function to print a string (13h=> print a string in color)
        mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
        mov bh, 00     ; the page number (00=> the first page)
        mov bl, 0Fh    ; the color of the string (4E=> yellow)
        mov cx, 1     ; the length of te string
        mov dh, rr    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
        mov dl, cc     ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
        lea bp, char2     ; the address of the string
        int 10h        ; call the interruption 10h=> print a string in color
        ; END CODE

        add rr, 1
        cmp rr, 24
        JNE e_lders

main endp
    .EXIT

END
