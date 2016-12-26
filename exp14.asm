assume cs:code


data segment
	db 20 dup('$')
data ends

code segment
	start:
			mov ax,data
			mov ds,ax
			mov si,0
			mov cl,9
	setbegin:
			mov al,cl
			out 70h,al
			in al,71h
			
			cmp cl,7
			ja sep1
			je sep2
			jb sep3
		sep1:	mov bl,'/'
				jmp callset
		sep2:	mov bl,' '
				jmp callset
		sep3:	
				cmp cl,0
				je last
				mov bl,':'
				jmp callset
			last:mov bl,'$'
				jmp callset
			
		callset:call setdata
			
			add si,3
			
			cmp cl,7
			ja dec1
			je dec2
			jb dec3
		dec1:	dec cl
				jmp setend
				
		dec2:	sub cl,3
				jmp setend
		dec3:
				sub cl,2
				jmp setend
		
		setend:	cmp cl,-2
				jg setbegin
			
			
			
			
				
			mov bh,0
			mov dh,5
			mov dl,10
			mov ah,2
			int 10h
			
			mov dx,0
			mov ah,9
			int 21h
			
			
			mov ax,4c00h
			int 21h
			
	setdata:
			push ax
			push cx
			push si
			push bx
			
			mov ah,al
			mov cl,4
			shr ah,cl
			and al,00001111b
			
			add ah,30h
			add al,30h
			
			mov [si],ah
			inc si
			mov [si],al
			inc si
			mov [si],bl
			inc si
			
			pop bx
			pop si
			pop cx
			pop ax
			ret
			
code ends

end start