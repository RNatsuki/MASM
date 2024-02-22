.MODEL SMALL,C
.STACK
.DATA
    ;name type  value
      n1  db    'Hello World!$'
  .CODE

    .STARTUP ; YOUR CODE HERE

        ; ===============================================================
        ; SET THE VIDEO MODE
        MOV ah, 00h   ; set the function to set the video mode
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome
        INT 10h       ; call the interruption 10h=> set the video mode
        ; ===============================================================

        LEA dx, n1    ; load the address of the string into dx
        MOV Ah,9      ; set the function to print a string
        INT 21h       ; call the interruption 21h=> print the string


    .EXIT ; END CODE

END
