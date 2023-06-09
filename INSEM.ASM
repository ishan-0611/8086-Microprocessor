data segment
hex db ?
msg1 db "Enter 8 digit binary number:$"
msg2 db 10,13,"$"
msg3 db "Hexadecimal equivalent is:$"
two db 8h
count db 0h
data ends

prints macro msg
lea dx, msg
mov ah, 09h
int 21h
endm

code segment
assume cs: code, ds:data
start:
        mov ax, data
        mov ds, ax
        mov cx, 8
        prints msg1
        mov bl, 10000000b
back:  cmp count,04h
       je dd1
      dd1:mov count,00h
         mov two,08h
        mov ah, 01
        int 21h
        cmp al, 31h
        je continue
        mov dl,02h
        div dl
        mov dx,00
continue:
        mul two
        mov hex,al
        mov al,two
        mov dl,02h
        div dl
        mov ax,00
        mov dx,00
        inc count
        loop back
        prints msg2
        prints msg3
        mov dl, hex
        mov cl, 4
        shr dl, cl
        cmp dl, 10
        jb next
        add dl, 07h
next:   add dl, 30h
        mov ah, 02h
        int 21h
        mov dl, hex
        and dl, 0FH
        cmp dl, 10
        jb next2
        add dl, 07h
next2:  add dl, 30h
        mov ah, 02h
        int 21h
mov ah, 4ch
int 21h
code ends
end start

