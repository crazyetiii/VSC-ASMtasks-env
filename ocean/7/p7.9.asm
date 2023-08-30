ASSUME cs:codesg,ds:datasg
;每个单词前4个字母,改为大写
datasg SEGMENT
              db '1. display......'
              db '2. brows........'
              db '3. replace......'
              db '4. modify.......'
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
              mov  cx,4
       ;内层的偏移量
              mov  di,0
       s3:    ;从3开始转大写
              mov  al,[bx+di+3]
              and  al,11011111b
              mov  [bx+di+3],al
              inc  di
              loop s3
              add  bx,16
              loop s2


       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start