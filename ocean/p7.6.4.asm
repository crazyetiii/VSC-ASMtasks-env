ASSUME cs:codesg,ds:datasg,ss:stacksg
;将每行字符串中的每个字符转为大写.需要byte操作
;使用栈
datasg SEGMENT
              db 'abc.............'
              db 'def.............'
              db 'ghi.............'
              db 'jkl.............'

datasg ENDS

stacksg SEGMENT
       ; 栈空间
               dw 0,0,0,0,0,0,0,0
stacksg ENDS

codesg SEGMENT
       start:
       ;栈
              mov  ax,stacksg
              mov  ss,ax
       ;指向栈底
              mov  sp,16

              mov  ax,datasg
              mov  ds,ax
       ;将第一个字符串转大写.第5位置0,and
       ;双循环.内循环为单个字符串的.外循环,行的循环
              mov  cx,4
       ;外层的偏移量
              mov  bx,0
       s2:
       ;cx值压栈
              push cx
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
       ;栈中取值给cx
              pop  cx
              loop s2
       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start