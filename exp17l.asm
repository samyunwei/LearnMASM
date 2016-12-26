assume cs:code

code segment
	start:	mov dx,0
			mov ax,1439
			call clac
			mov ax,4c00h
			int 21h
	;ax 放逻辑扇区号 面号:dh,磁道号:ch,扇区号:cl
	clac:	mov cx,1400
			div cx
			push dx
			mov dh,al
			pop ax
			mov ah,0
			mov cl,18
			div cl
			mov ch,al
			mov cl,ah
			inc cl
			ret
			
			

code ends

end start