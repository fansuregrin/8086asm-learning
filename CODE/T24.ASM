assume cs:code,ss:stack

data segment
    db "Beginner's All-purpose Symbolic Instruction Code.",0
data ends

stack segment
    db 32 dup (0)
stack ends

code segment
start:  mov ax,stack
        mov ss,ax
        mov sp,32
        mov ax,data
        mov ds,ax
        mov si,0
        call letterc
        mov ax,4c00h
        int 21h
letterc:push cx
        mov ch,0
s0:     mov cl,[si]
        jcxz s3
        cmp cl,97
        jb s2
        cmp cl,122
        ja s2
        and cl,11011111B
        mov [si],cl
s2:     inc si
        jmp short s0
s3:     pop cx
        ret
code ends

end start 
