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

	txt db "Numero:"
	err db "Numero invalido. Presiona cualquier tecla para continuar..."

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

        ; YOUR CODE HERE
        ; ==============================================================================
        


        ; ==============================================================================

        ; END CODE
    .EXIT

END
