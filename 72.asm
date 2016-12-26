assume cs:codesg,ds:datasg

datasg segment
	db 'BaSiC'
	db 'iNfOrMaTiOn'
datasg ends

codesg segment
	start:  mov ax,datasg
			mov ds,ax
			
			mov bx,0
			mov cx,5
			s:	mov al,[bx]
				and al,11011111B
				mov [bx],al
				inc bx
				loop s
			s0: mov al,[bx]
				or al,00100000B
				mov [bx],al
				inc bx
				loop s0
			
			mov ax,4c00h
			int 21h

codesg ends
end start
				

