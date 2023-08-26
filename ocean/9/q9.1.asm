ASSUME cs:codesg,ds:data
;jmp far ptr


data SEGMENT
            db 2 dup (0)
data ENDS

codesg SEGMENT
       start:
              mov ax,data
              mov ds,ax
              mov bx,0
              jmp word ptr [bx+1]
       ;exit
              mov ax,4c00h
              int 21H


codesg ENDS

end start
