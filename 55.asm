assume cs:code
code segment
mov ax,0fffh
mov ds,ax

mov dx,0

mov as,ds:[0]
mov ah,0
add dx,ax

mov as,ds:[1]
mov ah,0
add dx,ax

mov as,ds:[2]
mov ah,0
add dx,ax

mov as,ds:[3]
mov ah,0
add dx,ax

mov as,ds:[4]
mov ah,0
add dx,ax

mov as,ds:[5]
mov ah,0
add dx,ax

mov as,ds:[6]
mov ah,0
add dx,ax

mov as,ds:[7]
mov ah,0
add dx,ax

mov as,ds:[8]
mov ah,0
add dx,ax

mov as,ds:[9]
mov ah,0
add dx,ax

mov as,ds:[0ah]
mov ah,0
add dx,ax

mov as,ds:[0bh]
mov ah,0
add dx,ax

mov ax,4c00h
int 21h

code ends
end