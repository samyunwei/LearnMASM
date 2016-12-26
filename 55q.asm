assume cs:code
code segment
mov ax,0fffh
mov ds,ax

mov dx,0

mov cx,0b
s:mov as,ds:[cx]
mov ah,0
add dx,ax
loop s

mov ax,4c00h
int 21h

code ends
end

