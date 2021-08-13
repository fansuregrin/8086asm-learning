assume cs:code,ds:data,ss:stack

stack segment
    db 32 dup (0)
stack ends

data segment
    db 'Welcome to masm!',0
data ends

code segment
start:  mov ax,stack
        mov ss,ax
        mov sp,32
        mov ax,data
        mov ds,ax
        mov dh,8
        mov dl,3
        mov cl,2
        mov si,0
        call show_str
        mov ax,4c00h
        int 21h
show_str:   push es
            push ax
            push bx
            mov ax,0b800h
            mov es,ax
            add dl,dl
            mov al,0a0h
            mul dh
            mov dh,0
            add ax,dx
            mov bx,ax
            mov dl,cl
   print:   mov cl,[si]
            mov ch,0
            jcxz ok
            mov ch,dl
            mov es:[bx],cx
            inc si
            add bx,2
            jmp short print
      ok:   pop bx
            pop ax
            pop es
            ret
code ends

end start
