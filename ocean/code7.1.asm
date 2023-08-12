assume cs:code

code segment


    start:

          mov ax,2000H
          mov ds,ax
          mov bx,1000H
          mov ax,[bx]
          mov cx,[bx+1]
          add cx,[bx+2]

    ;退出
          mov ax,4c00H
          int 21H
code ends
end start