assume cs:codesg,ds:datasg,ss:stacksg


datasg segment
	db 'welcome to masm!'
	db 82h,27h,71h
datasg ends

stacksg segment
	db 100 dup(0)
stacksg ends

codesg segment
start:
		mov ax,datasg
		mov ds,ax
		mov ax,0b87Ch
		mov es,ax
		
		mov cx,3
		mov bx,0
		mov di,16
		s:
			push cx
			mov cx,16
			mov si,0
			s1:
				mov al,[si]
				mov es:[bx],al
				inc si
				inc bx
				mov al,[di]
				mov es:[bx],al
				inc bx
				loop s1
			pop cx
			inc di
			add bx,128
			loop s	
		s2:
			loop s2
codesg ends

end start