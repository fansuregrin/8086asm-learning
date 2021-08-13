assume cs:code,ss:stack
stack segment
    db 16 dup (0)
stack ends

code segment
start:  mov ax,stack
        mov ss,ax
        add sp,16
        mov ax,0eh
        call ax
        inc ax
        mov bp,sp
        add ax,[bp]

        mov ax,4c00h
        int 21h
code ends
end start
