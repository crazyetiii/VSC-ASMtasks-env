ASSUME cs:codesg
;将s处的一条指令复制到s0处

codesg SEGMENT
       start:
              mov ax,0
              mov bx,0
              jmp short s
              add ax,1
               add ax,1
       s:     inc ax
       ;exit
              mov ax,4c00h
              int 21H


codesg ENDS

end start
