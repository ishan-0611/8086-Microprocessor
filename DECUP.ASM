Code Segment
Assume CS:Code
Start: MOV BL,00
 BACK: MOV DL,BL
       MOV CL,4
       SHR DL,CL
       ADD DL,30H
       MOV AH,02
       INT 21H
       MOV DL,BL
       AND DL,0FH
       ADD DL,30H
       MOV AH,02
       INT 21H
       CALL delay
       MOV DL,13
       MOV AH,02
       INT 21H
       ADD BL,1
       DAA
       MOV DL,0FFH
       MOV AH,06
       INT 21H
       JNZ EXIT
       JMP BACK
 EXIT: MOV AH,4CH
       INT 21H

       delay PROC
       MOV SI,300H
  UP1: MOV DI,300H
   UP: DEC DI
       JNZ UP
       DEC SI
       JNZ UP1
       RET
       delay endp
       Code ends
       End Start
