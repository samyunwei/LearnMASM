assume cs:codesg,ds:datasg

datasg segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	
	dw 3,7,9,13,28,38,130,220,476,778,10001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
	
datasg ends

tablesg segment
	db 21 dup ('year summ ne ?? ')
tablesg ends

tempshow segment
	db 10 dup(0)
tempshow ends

titleshow segment
	db 'Power idea Company',0
titleshow ends


codesg segment
	start:
		mov ax,datasg
		mov es,ax
		mov ax,tablesg
		mov ds,ax
		
		mov cx,21
		mov bx,0
		mov si,0
		mov di,0
		s:
			mov ax,es:[si]
			mov [bx],ax
			add si,2
			mov ax,es:[si]
			mov [bx+2],ax
			add si,2
			mov byte ptr [bx+4],' '
			add bx,10H
			loop s
		
		mov cx,21
		mov bx,0
		mov si,84
		mov di,5
		s1:
			mov ax,es:[si]
			mov [bx+di],ax
			add si,2
			mov ax,es:[si]
			mov [bx+di+2],ax
			add si,2
			mov	byte ptr [bx+di+4],' '
			add bx,10H
			loop s1
			
		mov cx,21
		mov bx,0
		mov si,168
		add di,5
		
		s2:
			mov ax,es:[si]
			mov [bx+di],ax
			add si,2
			mov byte ptr [bx+di+2],' '
			add bx,10H
			loop s2
			
		mov cx,21
		mov bx,0

		s3:
			mov ax,[bx+5]
			mov dx,[bx+7]
			div word ptr [bx+10]
			mov [bx+13],ax
			mov byte ptr [bx+15],' '
			add bx,10H
			loop s3
	
	
	mov ax,titleshow
	mov ds,ax
	mov dl,10;从列
	mov dh,2;行
	mov cl,2
	mov si,0
	call show_str
	
	
	mov ax,tablesg
	mov es,ax
	mov ax,tempshow
	mov ds,ax
	
	
	mov bx,0
	mov si,0
	mov cx,21
	mov dl,8;从列
	mov dh,3;行
	printyear:
		push dx
		push cx
		mov dx,5
		mov si,0
		mov cx,5
		call cleardata
		pop cx
		pop dx
		
		
		push dx
		mov dx,5
		call copydata
		pop dx
		
		push cx
		push si
		mov cl,2
		mov si,0
		call show_str
		pop si
		pop cx
		inc dh
		add bx,10H
		loop printyear
		
	mov bx,0
	mov si,5
	mov cx,21
	mov dl,13;从列
	mov dh,3;行	
	printprofit:
		push dx
		push cx
		mov dx,5
		mov si,5
		mov cx,5
		call cleardata
		pop cx
		pop dx
			
		push dx
		mov ax,es:[bx+si]
		add si,2
		mov dx,es:[bx+si]
		call dtoc
		pop dx
		
		push cx
		push si
		mov cl,2
		mov si,0
		call show_str
		pop si
		pop cx
		inc dh
		add bx,10H
		loop printprofit
		
	mov bx,0
	mov si,10
	mov cx,21
	mov dl,21;从列
	mov dh,3;行	
	printemployee:
		push dx
		push cx
		mov dx,5
		mov cx,5
		call cleardata
		pop cx
		pop dx
		
		mov si,10
		push dx
		mov ax,es:[bx+si]
		mov dx,0
		call dtoc
		pop dx
		
		push cx
		push si
		mov cl,2
		mov si,0
		call show_str
		pop si
		pop cx
		inc dh
		add bx,10H
		loop printemployee
	
	mov bx,0
	mov si,13
	mov cx,21
	mov dl,27;从列
	mov dh,3;行	
	printperperson:
		push dx
		push cx
		mov dx,5
		mov cx,5
		call cleardata
		pop cx
		pop dx
		
		mov si,13
		push dx
		mov ax,es:[bx+si]
		mov dx,0
		call dtoc
		pop dx
		
		push cx
		push si
		mov cl,2
		mov si,0
		call show_str
		pop si
		pop cx
		inc dh
		add bx,10H
		loop printperperson
	
	mov ax,4c00H
	int 21H
	
	
	dtoc:
		push cx
		push si 
		push di
		mov di,0
		mov si,0
		dtoc_change:
			mov cx,ax
			or cx,dx
			jcxz dtoc_ok
			mov cx,10
			call divdw
			add cl,30H
			push cx
			inc di
			jmp short dtoc_change
		dtoc_ok:
			mov cx,di
			dtoc_reverse:
				pop ax
				mov [si],al
				inc si
				loop dtoc_reverse
			mov [si],cl
			pop di
			pop si
			pop cx
			ret
	
	
	show_str:
			push ax
			push bx
			push es
			push si
			mov ax,0
			mov si,0
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
				pop si
				pop es
				pop bx
				pop ax
				ret
		
		;参数为dx*65536+ax/cx,返回值在dx*65536+ax,cl
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
	;复制缓存 返回值为si的地址,后面添加结束符0
	copydata:
		push ax
		push cx
		push di
		mov cx,dx
		mov di,0
		copydata_change:
			mov	al,es:[bx+si]
			inc si
			mov [di],al
			inc di
			loop copydata_change
		copydata_ok:
			mov al,0
			mov [di],al
			pop di
			pop cx
			pop ax
			ret
			
	cleardata:
		push di
		push bx
		mov bx,0
		mov di,0
		cleardata_change:
				mov [di],bx
				add di,2
				loop cleardata_change
		cleardata_ok:
			pop bx
			pop di
			ret

codesg ends

end start
		