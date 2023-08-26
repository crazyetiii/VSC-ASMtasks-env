ASSUME cs:codesg
;jcxz start 需要配合cx.cx=0跳转,!=0,则不跳转,继续向下执行

codesg SEGMENT
       start:
              mov  ax,2000h
              mov  ds,ax
              mov  bx,0
       ;找到2000h段的第一个值为0的字节,存储偏移地址(即bx的值)在dx中
       s:
       ;获取低字节的值
              mov  cl,[bx]
       ;高字节指定为0
              mov  ch, 0
       ;cx=0时,会跳转至ok
              jcxz ok
              inc  bx
              jmp  short s

       ok:    mov  dx,bx


       ;exit
              mov  ax,4c00h
              int  21H


codesg ENDS

end start
