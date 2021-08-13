assume cs:code
code segment
start:      mov ah,2    ;set cursor
            mov bh,0    ;the first page
            mov dh,5    ;the 5th row
            mov dl,12   ;the 12th column
            int 10h
            mov ax,4c00h
            int 21h
code ends
end start
