data segment
dir db 'c:\rushabh'
e db 'error$'
data ends
code segment
start:assume cs:code,ds:data
	  mov ax,data
	  mov ds,ax
	  mov ah,39h
	  lea si,dir
	  int 21h
	  quit:mov ah,4ch
	  	   int 21h
code ends
end start