assume cs:codesg
data segment
	db 8,11,8,1,8,5,63,38
data ends

codesg segment
	start:
	mov ax,data
	mov ds,ax
	mov bx,0
	mov ax,0
	mov cx,8
	s:
		cmp byte ptr [bx],8
		jne next
		inc ax
	next:
		inc bx
	loop s
	
codesg ends

end start