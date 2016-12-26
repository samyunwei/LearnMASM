assume cs:code

code segment
start:
		mov ax,0ea10H
		mov dx,0389H
		mov cx,0AH
		call divdw
		mov ax,4c00h
		int 21h
	divdw:
		push bx
		divdw_change:
			push ax
			mov ax,dx
			mov dx,0
			div cx
			mov bx,ax
			pop ax
			div cx
			mov cx,dx
			mov	dx,bx
		divdw_ok:
			pop bx
			ret
		
code ends


end start