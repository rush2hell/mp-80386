data segment
fname db 'c:\logg',0
error db 'error$'
data ends
code segment
start:assume cs:code,ds:data
	  mov ax,data
	  mov ds,ax
	  mov ah,3bh
	  mov dx,offset_fname
	  int 21h
	  jnc quit
	  mov ah,09h
	  mov dx,offset_error
	  int 21h
	  mov ah,01h
	  int 21h
	  quit:mov ah,4ch
	  	   int 21h
code ends
end start