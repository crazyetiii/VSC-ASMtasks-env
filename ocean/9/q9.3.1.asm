ASSUME cs:codesg
;loop指令找到2000h段第一个为0的字节

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
       ;cx+1.因为loop时会对cx-1
              inc  cx
              inc  bx
       ;cx-- cx!=0 跳到s;cx==0,跳出循环
              loop s

       ok:    dec  bx
              mov  dx,bx
       ;exit
              mov  ax,4c00h
              int  21H


codesg ENDS

end start
