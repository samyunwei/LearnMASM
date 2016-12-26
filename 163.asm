assume cs:code
code segment
	start:	mov ax,190
			call showsin
			
			mov ax,4c00h
			int 21h
	
	
	showsin:	jmp short show
		table	dw ag0,ag30,ag60,ag90,ag120,ag150,ag180,agerror
		ag0		db '0',0
		ag30	db '0.5',0
		ag60	db '0.866',0
		ag90	db '1',0
		ag120  	db '0.866',0
		ag150	db '0.5',0
		ag180 	db '0',0
		agerror	db '0<arg<180!',0
	
	show:		push bx
				push es
				push si
				pushf
				mov bx,0b800h
				mov es,bx
			
				cmp al,180
				ja show_e	
				mov ah,0
				mov bl,30
				div bl
				mov bl,al
				mov bh,0
				add bx,bx
				mov bx,table[bx]
				mov si,160*12+40*2
				jmp shows
		show_e:	mov bx,table[14]
				mov si,160*12+40*2
			
	shows:	
			mov ah,cs:[bx]
			cmp ah,0
			je showret
			mov es:[si],ah
			inc bx
			add si,2
			jmp short shows
	
	showret:popf
			pop si
			pop es
			pop bx
			ret
			
code ends

end start