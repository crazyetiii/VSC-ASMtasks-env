assume cs:codesg,ds:datasg

;每行第一个字母大写。bit5置0，and 0
datasg segment
              db '1. file.........'
              db '2. edit.........'
              db '3. search.......'
datasg ends

codesg segment
              mov  cx,3
       start: 
              mov  ax,datasg
              mov  ds,ax
              mov  di,0

       s:     mov  al,[bx+3+di]
              and  al,11011111b
              mov  [bx+3+di],al
              add  di,16
              loop s
       ;退出
              mov  ax,4c00H
              int  21H
codesg ends



end start