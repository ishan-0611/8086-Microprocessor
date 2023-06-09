printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data segment
buffer db 20
len db ?
str db 20 dup(?)
vow db "aeoiuAEIOU"
count db ?
msg db "Enter string :$"
nln db 10,13,"$"
Data ends
Code segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       MOV ES,AX
       printstr msg
       LEA DX,buffer
       MOV AH,0AH
       INT 21H
       printstr nln
       MOV CL,len
       MOV CH,0
       LEA SI,str
 BACK: PUSH CX
       LODSB
       LEA DI,vow
       MOV CX,10
       REPNZ SCASB
       JNZ DOWN
       INC count
 DOWN: POP CX
       LOOP BACK
       MOV DL,count
       MOV CL,4
       SHR DL,CL
       ADD DL,30H
       MOV AH,02
       INT 21H
       MOV DL,count
       AND DL,0FH
       ADD DL,30H
       MOV AH,02
       INT 21H
       MOV AH,4CH
       INT 21H
       Code ends
       End Start
