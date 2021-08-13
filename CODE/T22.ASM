assume cs:code,ss:stack

stack segment
  db 32 dup (0)
stack ends

text segment
  db 32 dup (0)
text ends

data segment
  db 10 dup (0)
data ends

code segment
start:  mov ax,data
        mov ds,ax
        mov ax,stack
        mov ss,ax
        mov sp,32
        mov word ptr ds:[0],2157
        mov ax,ds:[0]
        call dtoc
        mov ax,text
        mov ds,ax
        mov dh,8
        mov dl,3
        mov cl,2
        mov si,0
        call show_str
        mov ax,4c00h
        int 21h
dtoc:   push es
        push dx
        push bx
        push cx
        push di
        mov dx,text
        mov es,dx
        mov di,0
work:   mov dx,0
        mov bx,10
        div bx
        add dx,48
        push dx
        inc di
        mov cx,ax
        jcxz dtoc_ok
        jmp short work
dtoc_ok:  mov bx,0
          mov cx,di
write:    pop ax
          mov es:[bx],al
          inc bx
          loop write
          mov byte ptr es:[bx],0
          pop di
          pop cx
          pop bx
          pop dx
          pop es
          ret

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
            jcxz show_str_ret
            mov ch,dl
            mov es:[bx],cx
            inc si
            add bx,2
            jmp short print
show_str_ret: pop bx
              pop ax
              pop es
              ret
code ends

end start
