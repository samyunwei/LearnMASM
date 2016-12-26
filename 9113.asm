assume cs:code

code segment
	start:	mov ax,2000H
			mov es,ax
			jmp dword ptr es:[1000H]
code ends

end start