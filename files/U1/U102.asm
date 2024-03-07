.MODEL SMALL,C
.STACK
.DATA
    ;name type  value
      n1  db    'Hello World!$'
  .CODE

    .STARTUP ; YOUR CODE HERE

        LEA DX, n1    ; load the address of the string into dx
        MOV AH,9      ; set the function to print a string
        INT 21H       ; call the interruption 21h=> print the string


    .EXIT ; END CODE

END
