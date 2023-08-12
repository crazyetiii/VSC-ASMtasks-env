assume cs:codesg,ds:datasg

;1. 复制第一个字符串到第二,使用bx单字节赋值
;2. 使用si,di进行字复制
datasg segment
              db '0123456789abcdef'
              db '................'
datasg ends

codesg segment
       ;1
       ; start: mov  cx,16
       ;        mov  ax,datasg
       ;        mov  ds,ax
       ;        mov  bx,0
       ; s:     mov  al,[bx]
       ;        mov  16[bx],al
       ;        inc  bx
       ;        loop s
       ;2
       start: mov  cx,8
              mov  ax,datasg
              mov  ds,ax
              mov  si,0
              mov  di,16
       s:     mov  ax,[si]
              mov  [di],ax
              add  si,2
              add  di,2
              loop s

       ;退出
              mov  ax,4c00H
              int  21H
codesg ends



end start