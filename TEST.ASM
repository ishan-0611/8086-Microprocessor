printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data segment
msg1 db "Hello$"
Data ends
Code Segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       printstr msg1
       MOV AH,4CH
       INT 21H
       Code ends
       End start
