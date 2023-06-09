printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data Segment
msg1 db "Enter the password :$"
msg2 db "valid $"
msg3 db "invalid $"
spas db "Manipal$"
apas db 10 dup(?)
msg4 db "* $"
Data ends
Code Segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       MOV ES,AX
       LEA SI,apas
       LEA DI,apas
       printstr msg1
       MOV CX,7
 BACK: MOV AH,08
       INT 21H
       MOV [SI],AL
       INC SI
       LOOP BACK

       MOV CX,7
       LEA SI,spas
       LEA DI,apas
       REPZ CMPSB
       JNZ DOWN
       printstr msg2
       JMP EXIT

 DOWN: printstr msg3
 EXIT: MOV AH,4CH
       INT 21H

       Code ends
       End Start
