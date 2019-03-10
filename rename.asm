data segment
fn db 'c\abc.txt'
error db 'file not found$'
data ends

extra segment
fnew db 'c:\xyz.txt'
extra ends

code segment
start:assume cs:code,ds:data,es:extra
	mov ax,data
	mov ds,ax
	mov ax,extra
	mov es,ax
	mov ah,56h
	lea si,fn
	lea di,fnew
	int 21h
	jnc quit
	lea si,error
	int 21h
	quit:mov ah,4ch
		 int 21h
code ends 
end start