ASSUME cs:codesg,ds:datasg
;将每行字符串中的每个字符转为大写.需要byte操作
;使用同一个cx,来指示内外循环的次数
datasg SEGMENT
              db 'abc.............'
              db 'def.............'
              db 'ghi.............'
              db 'jkl.............'
datasg ENDS

codesg SEGMENT
       start: mov  ax,datasg
              mov  ds,ax
       ;将第一个字符串转大写.第5位置0,and
       ;双循环.内循环为单个字符串的.外循环,行的循环
              mov  cx,4
              ;外层的偏移量
              mov  bx,0
       s2:
       ;次数.即每个字符串的字符数量
              mov  cx,3
       ;内层的偏移量
              mov  di,0
       s3:    mov  al,[bx+di]
              and  al,11011111b
              mov  [bx+di],al
              inc  di
              loop s3
              add  bx,16
              loop s2
       ;  ;次数.即每个字符串的字符数量
       ;        mov  cx,3
       ;        ;偏移量
       ;        mov di,0
       ; s3:    mov al,[bx+di]
       ;        and al,11011111b
       ;        mov [bx+di],al
       ;        inc bx
       ;        loop s3

       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start