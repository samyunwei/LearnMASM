assume cs:codesg,ds:datasg

datasg segment
	dd 100001
	dw 100
	dd 0
datasg ends

codesg segment
	start:
		mov ax,datasg
		mov ds,ax
		mov ax,ds:[0]
		mov dx,ds:[2]
		div word ptr ds:[4]
		mov ds:[6],ax
codesg ends

end start