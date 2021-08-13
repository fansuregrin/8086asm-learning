assume cs:code
code segment
start:      mov ax,cs
            mov ds,ax
            mov si,offset a2A
            mov ax,0
            mov es,ax
            mov di,200h
            mov cx,offset a2Aend - offset a2A
            cld
            rep movsb
            mov word ptr es:[7ch*4],200h
            mov word ptr es:[7ch*4+2],0
            mov ax,4c00h
            int 21h

a2A:        push cx
            push si
convert:    mov cl,[si]
            mov ch,0
            jcxz ok
            cmp cl,97
            jb s0
            cmp cl,122
            ja s0
            and cl,11011111B
            mov [si],cl
s0:         inc si
            jmp short convert
ok:         pop si
            pop cx
            iret
a2Aend:     nop
code ends
end start
