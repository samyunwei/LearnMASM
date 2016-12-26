assume cs:codesg

codesg segment

start:
		mov ax,4c00h
		int 21h

	add128:
		push ax
		push cx
		push si
		push di
		
		sub ax,ax
		
		mov cx,8
		
		s:
			mov ax,[si]
			adc ax,[di]
			mov [si],ax
			inc si
			inc si
			inc di
			inc di
			loop s
			
			pop di
			pop si
			pop cx
			pop ax
			ret
			

codesg ends


end start