assume cs:codesg,ds:datasg


datasg segment
           db 'BaSiC'
           db 'MinIX'
datasg ends

codesg segment
    ;第一个大写转小写.5bit置1.or 1
    ;第二个小写转大写.5bit置0,and 0
    start: mov  ax,datasg
           mov  ds,ax
           mov  bx,0
           mov  cx,5
    s:     mov  al,0[bx]
           or   al,00100000b
           mov  0[bx],al
    ;第二个字符串
           mov  al,5[bx]
           and  al,11011111b
           mov  5[bx],al
           inc  bx
           loop s


    ;退出
           mov  ax,4c00H
           int  21H
codesg ends



end start