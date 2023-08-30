ASSUME cs:codesg,ds:data
;100001/100

data SEGMENT
            dd 100001
            dw 100
            dw 0
data ends

codesg SEGMENT
       ;
       start: mov ax,data
              mov ds,ax

              mov ax,ds:[0]
              mov dx,ds:[2]

              div word ptr ds:[4]
              mov ds:[6],ax



              mov ax,03e9H
              mov cx,100
              div cx
       ;exit
              mov ax,4c00h
              int 21H

codesg ENDS

end start