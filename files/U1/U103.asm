

.MODEL SMALL,C
.STACK
.DATA

  .CODE

    .STARTUP
        ; YOUR CODE HERE
        ; SET THE VIDEO MODE
        ;============================================================================
        MOV ah, 00h   ; set the function to set the video mode (00h=> set the video mode)
        MOV al, 03h   ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
        INT 10h       ; call the interruption 10h=> set the video mode to 03h
        ;============================================================================


        MOV ah, 01h   ; set the function to set the cursor (01h => set the curso6)
        MOV ch, 26h   ; set the row to 06h    ; 26h = 38 (in decimal) this hides the cursor
        MOV cl, 07h   ; set the column to 07h ; 07h = 7 (in decimal) this hides the cursor
        INT 10h       ; call the interruption 10h => set the cursor to the row 06h and column 07h


        ; END CODE
    .EXIT

END
