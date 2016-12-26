assume cs:code
code segment
	mov ax,0002
	mov ds,ax
	mov bl,0
	mov cx,64
s:	mov ds:[bl],bl
	inc bl
	loop s
	
	mov 4c00h
	int 21h
	
code ends
end
	
