assume cs:codesg,ds:datasg

;每个单词大写。bit5置0，and 0
datasg segment
              db 'ibm.............'
              db 'dec.............'
              db 'dos.............'
              db 'vax.............'
datasg ends

codesg segment
       start: mov  ax,datasg
              mov  ds,ax
              mov  bx,0

              mov  cx,4
       ;内循环
       s0:    mov  si,0
              mov  cx,3

              mov  di,0

       s:     mov  al,[bx+si]
              and  al,11011111b
              mov  [bx+si],al
              inc  si
              loop s                  ;循环每个单词
              add  bx,16
              loop s0                 ;循环每行
       ;退出
              mov  ax,4c00H
              int  21H
codesg ends

end start