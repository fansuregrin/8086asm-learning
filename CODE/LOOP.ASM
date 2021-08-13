assume cs:code

code segment
start:      mov ax,cs
            mov ds,ax
            mov si,offset myloop
            mov ax,0
            mov es,ax
            mov di,200h
            mov cx,offset myloopend - offset myloop
            cld
            rep movsb
            mov word ptr es:[7ch*4],200h
            mov word ptr es:[7ch*4+2],0
            mov ax,4c00h
            int 21h

myloop:     push bp
            mov bp,sp
            dec cx
            cmp cx,0
            je ok
            add [bp+2],bx
ok:         pop bp
            iret
myloopend:  nop
code ends
end start
