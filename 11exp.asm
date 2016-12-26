assume cs:codesg,ds:datasg

datasg segment
	db "Beginner's All-purpose Symbolic InStruction Code.",0
datasg ends

codesg segment
	start:
		mov ax,datasg
		mov ds,ax
		mov si,0
		
		call letterc
		
		mov ax,4c00h
		int 21h
		letterc:
			push cx
			push si
			mov cx,0
			letterc_change:
				mov cl,[si]
				cmp cl,97
				jb letterc_addseg
				cmp cl,122
				ja letterc_addseg
				and cl,11011111B
				mov [si],cl
			letterc_addseg:
				inc si
				loop letterc_change
			letterc_ok:
				pop si
				pop cx
				ret
codesg ends

end start