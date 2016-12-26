assume cs:code
data segment
	db	10 dup(0)
data ends


code segment
	start:
		mov ax,12666
		mov bx,data
		mov ds,bx
		mov si,0
		call dtoc
		mov dh,8
		mov dl,3
		mov cl,2
		call show_str 
		mov ax,4c00h
		int 21h
	dtoc:
		push cx
		push bx
		push dx
		push si
		mov bx,10
		mov si,0
		dtoc_change:
			mov cx,ax
			mov dx,0
			jcxz dtoc_ok
			div bx
			add dl,30H
			mov byte ptr [si],dl
			inc si
			jmp short dtoc_change
		dtoc_ok:
			mov [si],cl
			pop si
			pop dx
			pop bx
			pop cx
			ret
	
	
	show_str:
			push ax
			push bx
			mov al,160
			mul dh
			mov bx,ax
			mov al,2
			mul dl
			add bx,ax
			mov ax,0B800H
			mov es,ax
			mov al,cl
			show_str_change:	
				mov cl,[si]
				inc si
				mov ch,0
				jcxz show_str_ok
				mov es:[bx],cl
				inc bx
				mov es:[bx],al
				inc bx
				jmp short show_str_change
			show_str_ok:
				pop bx
				pop ax
				ret
				
	
code ends
end start