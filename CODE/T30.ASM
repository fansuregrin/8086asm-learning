assume cs:code
code segment
start:      mov ah,2          ;set cursor
            mov bh,0          ;the fisrt page
            mov dh,5          ;the 5th row
            mov dl,12         ;the 12th column
            int 10h

            mov ah,9          ;display character at the cursor's position
            mov al,'a'        ;set character
            mov bl,00000111B  ;set color properties
            mov bh,0          ;the fisrt page
            mov cx,3          ;repeat count of character
            int 10h

            mov ax,4c00h
            int 21h
code ends
end start
