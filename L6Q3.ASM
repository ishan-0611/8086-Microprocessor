Data segment
num dw 0025,0015
lcm dw 2 dup(?)
Data ends
Code segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       MOV DX,0
       MOV AX,num
       MOV BX,num+2
 BACK: PUSH AX
       PUSH DX
       DIV BX
       CMP DX,0
       JZ DOWN
       POP DX
       POP AX
       ADD AX,num
       ADC DX,0
       JMP BACK
 DOWN: POP LCM+2
       POP LCM
       CALL disp
       MOV AH,4CH
       INT 21H

       disp PROC
       MOV DX,lcm
       MOV CL,4
       SHR DL,CL
       ADD DL,30H
       MOV AH,02H
       INT 21H
       AND DL,0FH
       ADD DL,30H
       MOV AH,02H
       INT 21H
       RET
       disp endp
       Code ends
       End Start
