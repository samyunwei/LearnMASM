assume cs:code

data segment
	db 'Welcome to masm!',0
data ends

code segment
start:
;		mov dh,8
;		mov dl,3
;		mov cl,2
;		mov ax,data
;		mov ds,ax
;		mov si,0
		call show_str
		
		mov ax,4c00h
		int 21h
		
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