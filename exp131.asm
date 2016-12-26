assume cs:code

code segment
	start:	mov ax,cs
			mov ds,ax
			mov si,offset show_str
			mov ax,0
			mov es,ax
			mov di,200h
			mov cx,offset show_strend - offset show_str
			cld
			rep movsb
			
			mov ax,0
			mov es,ax
			mov word ptr es:[7ch*4],200h
			mov word ptr es:[7ch*4+2],0
			
			mov ax,4c00h
			int 21h
	
	show_str:
			push ax
			push bx
			push si
			push cx
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
					pop cx
					pop si
					pop bx
					pop ax
					iret
	show_strend:nop
	
code ends

end start