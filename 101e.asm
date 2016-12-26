assume cs:codesg,ss:stacksg

stacksg segment
	db 16 dup(0)
stacksg ends

codesg segment
	start:
		mov ax,stacksg
		mov ss,ax
		mov sp,16
		mov ax,1000
		push ax
		mov ax,0
		push ax
		retf
codesg ends

end start
	