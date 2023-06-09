printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data segment
num db ?
msg db "Enter character :$"
nln db 10,13,"$"
Data ends
Code segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       printstr msg
       printstr nln
       MOV AH,01
       INT 21H
       printstr nln
       MOV DL,AL
       MOV AH,02
       INT 21H
       MOV AH,4CH
       INT 21H
       Code ends
       End Start
