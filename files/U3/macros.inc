m_imptxt MACRO color,len,row,col,msg
  ;color: the color of the string
  ;len: the length of the string
  ;row: the row number
  ;col: the column number
  ;msg: the string


  ; BEGIN CODE
           mov ah, 13h    ; the function number (13h=> print a string in color)
           mov al, 01     ; the cursor will be moved to the next space after printing the string (00=> the cursor will not be moved) (01=> the cursor will be moved)
           mov bh, 00     ; the page number (00=> the first page)
           mov bl, color  ; the color of the string (4E=> yellow)
           mov cx, len    ; the length of te string
           mov dh, row    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
           mov dl, col    ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
           lea bp, msg    ; the address of the string
           int 10h        ; call the interruption 10h=> print a string in color
  ; END CODE
ENDM
