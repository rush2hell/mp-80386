data segment
cr equ 0dh
lf equ 0dh
inson db cr,lf,'CAPS button is on$'
inoff db cr,lf,'inser button is off$'
data ends

code segment
start : assume cs:code,ds:data
        mov ax,data
        mov ds,ax
        mov ah,02h
        int 16h
        rcl al,2
        jnc insoff
        mov ah,09h
        lea dx,inson
        int 21h
        jmp loop1

insoff: mov ah,09h
        lea dx,insoff
        int 21h

loop1:  mov AH,01H
        int 21h
        code ends 
        end start

