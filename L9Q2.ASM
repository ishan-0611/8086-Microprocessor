printstr macro msg
LEA DX,msg
MOV AH,09
INT 21H
endm
Data Segment
str db 5 dup(?)
msg1 db "Enter string :$"
yes db "Palindrome$"
no db "Not Palindrome$"
nln db 10,13,"$"
Data ends
Code Segment
Assume CS:Code,DS:Data
Start: MOV AX,Data
       MOV DS,AX
       MOV ES,AX
       printstr msg1
       LEA SI,str
       MOV CX,5
 BACK: MOV AH,08H
       INT 21H
       MOV [SI],AL
       INC SI
       LOOP BACK
       printstr nln
       LEA SI,str
       LEA DI,str
       MOV AL,5
       MOV AH,0
       DEC DI
       ADD DI,AX
       MOV CX,5
BACK1: CLD
       LODSB
       STD
       SCASB
       JNZ DOWN
       LOOP BACK1
       printstr yes
       JMP DOWN1
 DOWN: printstr no

DOWN1: MOV AH,4CH
       INT 21H
       Code ends
       End Start

