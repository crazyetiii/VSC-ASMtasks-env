ASSUME cs:codesg,ds:datasg
;将每行字符串中的每个字符转为大写.需要byte操作
;先存内存,使用再取出来
datasg SEGMENT
              db 'abc.............'
              db 'def.............'
              db 'ghi.............'
              db 'jkl.............'
              ; 存储外层的cx
              dw 0
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
       ;存储外层的cx到ds:[40h]
              mov  ds:[40h],cx
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
       ;将ds:[40h]的值还给外层cx
              mov  cx,ds:[40h]
              loop s2
       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start