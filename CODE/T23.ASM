assume cs:code
code segment
start: mov dx,34h
       mov ax,1
       mov bx,10000
       div bx
       mov ax,4c00h
       int 21h
code ends

end start
