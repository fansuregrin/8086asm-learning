assume cs:code

datetime segment
    db "**/**/** **:**:**",'$'
datetime ends

code segment
start:          mov ax,datetime
                mov ds,ax
                mov di,0
                mov cx,3
                mov al,9
s0:             mov ah,0
                push ax
                call get
                mov [di],ah
                mov [di+1],al
                add di,3
                pop ax
                dec al
                loop s0
                mov cx,3
                mov al,4
s1:             mov ah,0                
                push ax
                call get
                mov [di],ah
                mov [di+1],al
                add di,3
                pop ax
                sub al,2
                loop s1

                mov ah,2
                mov bh,0
                mov dh,5
                mov dl,12
                int 10h
                mov ah,9
                mov dx,0
                int 21h
                jmp start
                mov ax,4c00h
                int 21h
                
get:            push cx
                out 70h,al
                in al,71h
                mov ah,al
                mov cl,4
                shr ah,cl
                and al,00001111b
                add al,30h
                add ah,30h
                pop cx
                ret 
code ends

end start
