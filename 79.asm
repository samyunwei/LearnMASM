assume cs:codesg,ss:stacksg,ds:datasg
stacksg segment
	dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
	db '1. file         '
	db '2. edit         '
	db '3. search       '
	db '4. view         '
	db '5. options      '
	db '6. help         '
datasg ends

codesg segment
	start:
		mov ax,stacksg
		mov ss,ax
		mov cx,16
		mov ax,datasg
		mov ds,ax
		
		mov cx,6
		mov bx,0
		s:
			push cx
			mov si,0
			mov cx,4
			s0:
				mov al,[bx+3+si]
				and al,11011111b
				mov [bx+si],al
				inc si
				loop s0
			pop cx
			add bx,16
			loop s
		mov ax,4c00h
		int 21h
codesg ends

end start