ASSUME cs:codesg
;将s处的一条指令复制到s0处

codesg SEGMENT
       s:     mov ax,bx
              mov si,offset s
              mov di,offset s0
              mov ax,cs:[si]
              ;复制两个字节
              mov cs:[di],ax

       s0:
              nop
              nop
       ;exit
              mov ax,4c00h
              int 21H

codesg ENDS

end