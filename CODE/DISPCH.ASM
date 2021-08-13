assume cs:code

code segment
start:          mov ax,cs
                mov ds,ax
                mov si,offset display
                mov ax,0
                mov es,ax
                mov di,200h
                mov cx,offset displayend - offset display
                cld
                rep movsb
                mov word ptr es:[7ch*4],200h
                mov word ptr es:[7ch*4+2],0
                mov ax,4c00h
                int 21h

display:        push bx
                push ax
begin:          cmp byte ptr [si],0
                je ok
                mov ah,2
                mov bh,0
                int 10h
                mov ah,9
                mov al,[si]
                mov bl,cl
                mov bh,0
                push cx
                mov cx,1
                int 10h
                pop cx
                inc si
                inc dl
                cmp dl,79
                jna s0
                inc dh
                mov dl,0
s0:             jmp short begin
ok:             pop ax
                pop bx
                iret 
displayend:     nop
code ends
end start
