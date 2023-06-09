data segment
msg1 db "enter the string $"
nl db 10,13,"$"
two db 8h
ans db ?
buffer db 100
len db ?
str db 100 dup(?)
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
lea dx,msg1
mov ah,09h
int 21h
lea dx,nl
mov ah,09h
int 21h
lea dx,buffer
mov ah,0ah
int 21h
lea dx,nl
mov ah,09h
int 21h
mov cx,00
mov cl,len
lea si,str
back:
mov dl,[si]

mul ans,tw
int 21h
inc si
loop back
mov ah,4ch
int 21h
code ends
end start
