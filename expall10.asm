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
		push dx
		push si
		mov si,0
		mov dx,0
		dtoc_change:
			mov cx,ax
			or cx,dx
			jcxz dtoc_ok
			mov cx,10
			call divdw
			add cl,30H
			mov byte ptr [si],cl
			inc si
			jmp short dtoc_change
		dtoc_ok:
			mov [si],cl
			pop si
			pop dx
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