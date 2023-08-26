ASSUME cs:codesg
;实验8

codesg SEGMENT
              mov ax,4c00h
              int 21H
       start: mov ax,0
       s:     nop
              nop
              ;获取s的位置存放在di中
              mov di,offset s
              ;获取s2的位置存放在si中
              mov si,offset s2
              ;获取cs:[si]的2byte到ax
              mov ax,cs:[si]
              ;将ax的指令放置到cs:[di]即s处
              mov cs:[di],ax

       s0:    jmp short s

       s1:    mov ax,0
              int 21H
              mov ax,0

       s2:    jmp short s1
              nop


codesg ENDS

end start
