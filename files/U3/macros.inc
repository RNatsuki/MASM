

m_ini MACRO
  ; SET THE VIDEO MODE
  ;============================================================================
  MOV ah, 00h    ; set the function to set the video mode (00h=> set the video mode)
  MOV al, 03h    ; set the video mode to 03h=> 80x25 monochrome : 16 colors (4 bits)
  INT 10h        ; call the INTerruption 10h=> set the video mode to 03h
  ;============================================================================
  ; Set Data Segment
  MOV ax, @DATA
  MOV es, ax
ENDM




m_imptxt MACRO color,len,row,col,msg
  ;color: the color of the string
  ;len: the length of the string
  ;row: the row number
  ;col: the column number
  ;msg: the string

  ;Calc the length of the string




  ; BEGIN CODE
  MOV ah, 13h    ; the function number (13h=> prINT a string in color)
  MOV al, 01     ; the cursor will be MOVed to the next space after prINTing the string (00=> the cursor will not be MOVed) (01=> the cursor will be MOVed)
  MOV bh, 00     ; the page number (00=> the first page)
  MOV bl, color  ; the color of the string (4E=> yellow)
  MOV cx, len    ; the length of te string
  MOV dh, row    ; the row number (10=> the 17th row) (0-24) (0=> the first row) (24=> the last row)
  MOV dl, col    ; the column number (20=> the 33rd column) (0-79) (0=> the first column) (79=> the last column)
  LEA bp, msg    ; the address of the string
  INT 10h        ; call the INTerruption 10h=> prINT a string in color
  ; END CODE
ENDM



