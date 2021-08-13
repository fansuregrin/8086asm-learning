assume cs:code

stack segment
    db 128 dup (0)
stack ends

data segment
    dw 0,0
data ends

code segment
start:              mov ax,stack
                    mov ss,ax
                    mov sp,128

                    mov ax,data
                    mov ds,ax

                    mov ax,0
                    mov es,ax

                    push es:[9*4]           ;save the original interrupt vector
                    pop ds:[0]
                    push es:[9*4+2]
                    pop ds:[2]

                    cli
                    mov word ptr es:[9*4],offset int9 ;set new int vector
                    mov es:[9*4+2],cs
                    sti

                    mov ax,0b800h          ;dispaly 'a' to 'z'continously
                    mov es,ax
                    mov ah,'a'
s:                  mov es:[160*12+40*2],ah
                    ;call delay
                    inc ah
                    cmp ah,'z'
                    jna s

                    mov ax,0            
                    mov es,ax

                    push ds:[0]         ;restore original int vector
                    pop es:[9*4]
                    push ds:[2]
                    pop es:[9*4+2]

                    mov ax,4c00h
                    int 21h

delay:              push ax         ;excute a period of empty loop
                    push dx
                    mov dx,0ffffh
                    mov ax,0ffffh
s1:                 sub ax,1
                    sbb dx,0
                    cmp ax,0
                    jne s1
                    cmp dx,0
                    jne s1
                    pop dx
                    pop ax
                    ret

int9:               push ax
                    push es
                    push bx
                    in al,60h

                    pushf                   ;push flag reg into stack
                    pushf                   ;set IF=0, TF=0
                    pop bx
                    and bh,11111100b        ;the 8th and 9th bit stand for TF and IF
                    push bx
                    popf
                    call dword ptr ds:[0]   ;set (ip)=ds:[0], (cs)=ds:[2]

                    cmp al,1                ;catch keyboard input 'ESC'
                    jne int9ret

                    mov ax,0b800h           ;change color properties
                    mov es,ax
                    inc byte ptr es:[160*12+40*2+1]  

int9ret:            pop bx
                    pop es
                    pop ax
                    iret 

code ends
end start