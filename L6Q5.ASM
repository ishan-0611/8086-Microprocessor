Data segment
num db 04H
res dw ?
Data ends
Code Segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       MOV AL,num
       MOV AH,00
       CALL fact
       CALL disp
       MOV AH,4CH
       INT 21H

       fact PROC
       CMP AX,00H
       JE EXIT
       PUSH AX
       DEC AX
       CALL fact
       POP AX
       MUL res
       MOV res,AX
       RET
 EXIT: MOV res,01H
       RET
       fact endp

       disp PROC
       MOV DL,res
       MOV CL,4
       SHR DL,CL
       ADD DL,30H
       MOV AH,02
       INT 21H
       MOV DL,res
       AND DL,0FH
       ADD DL,30H
       MOV AH,02
       INT 21H
       RET
       disp endp

       Code ends
       End Start
