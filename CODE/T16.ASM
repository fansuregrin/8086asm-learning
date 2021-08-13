assume cs:code
code segment
    start:  mov ax,0b800h
            mov ds,ax
            ;mov word ptr ds:[0],0741h
            ;mov word ptr ds:[2],0742h
            ;mov byte ptr ds:[4],11000010B
            ;mov byte ptr ds:[5],43h
            mov cx,6
            mov di,0
            mov dl,41h
        s:  mov [di],dl
            mov byte ptr [di+1],0cah
            inc dl
            add di,2
            loop s

            mov ax,4c00h
            int 21h
code ends
end start
