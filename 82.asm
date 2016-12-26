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
	
	mov ax,4c00H
	int 21H

codesg ends

end start
		
			
			