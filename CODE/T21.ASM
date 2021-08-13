assume cs:code,ss:stack

stack segment
    db 16 dup (0)
stack ends

code segment
start:  mov ax,stack
        mov ss,ax
        mov sp,16
        mov dx,0fffh
        mov ax,0ffffh
        mov cx,2
        call divdw
        mov ax,4c00h
        int 21h
divdw:  push dx
        push ax
        mov ax,dx
        mov dx,0
        div cx
        mov ds:[2],ax
        pop ax
        div cx
        mov ds:[0],ax
        pop dx
        ret
code ends

end start
