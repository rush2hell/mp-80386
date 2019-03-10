data segment
d db 'c:vishal'
data ends
code segment
start:assume cs:code,ds:data
 	  mov ax,data
 	  mov ds,ax
 	  mov ah,3ah
 	  lea si,d
 	  int 21h
 	  quit:mov ah,4ch
 	  	   int 21h
code ends
end start