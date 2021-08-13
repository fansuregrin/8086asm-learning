assume cs:test

test segment
    mov ax,2020H
    mov bx,2021H
    add ax,bx
    add ax,ax

    mov ax,4c00H
    int 21H
test ends

end
