ASSUME cs:codesg,ds:datasg
;datasg第一个转大写,第二个小写
datasg SEGMENT
           db 'BaSiC'
           db 'iNfOrMaTiOn'
datasg ENDS

codesg SEGMENT
    start: mov  ax,datasg
           mov  ds,ax
    ;将第一个字符串转大写.第5位置0,and
           mov  cx,5
           mov  bx,0
    s:     mov  al,[bx]
           and  al,11011111b
           mov  [bx],al
           inc  bx
           loop s
    ;将第2个字符串转小写.第5位置1,or
           mov  cx,11
           mov  bx,5
    s1:    mov  al,[bx]
           or   al,00100000b
           mov  [bx],al
           inc  bx
           loop s1
    ;exit
           mov  ax,4c00h
           int  21H

codesg ENDS

end start