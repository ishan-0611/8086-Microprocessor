printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data segment
msg db "Enter number :$"
nln db 10,13,"$"
n1 db ?
n2 db ?
Data ends
Code segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       printstr msg
       CALL read
       MOV n1,cL
       printstr nln
       printstr msg
       CALL read
       printstr nln
       MOV n2,CL
       MOV BL,n1
 BACK: MOV DL,BL
       MOV CL,4
       SHR DL,CL
       CMP DL,0AH
       JC C
       ADD DL,07H
       C: ADD DL,30H
       MOV AH,02
       INT 21H
       MOV DL,BL
       AND DL,0FH
       CMP DL,0AH
       JC C1
       ADD DL,07H
       C1: ADD DL,30H
       MOV AH,02
       INT 21H
       CALL delay
       MOV DL,13
       MOV AH,02
       INT 21H
       CMP BL,n2
       JE EXIT1
       ADD BL,1
       DAA
       MOV DL,0FFH
       MOV AH,06
       INT 21H
       JNZ EXIT
       JMP BACK
 EXIT1: MOV AH,4CH
        INT 21H
 EXIT:  MOV AH,4CH
        INT 21H

        delay PROC
        MOV SI,300H
   UP1: MOV DI,300H
   UP:  DEC DI
        JNZ UP
        DEC SI
        JNZ UP1
        RET
        delay endp

        read PROC
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV CL,10H
        MUL CL
        MOV CL,AL
        MOV AH,01H
        INT 21H
        SUB AL,30H
        ADD CL,AL
        RET
        read endp
        Code ends
        End Start


