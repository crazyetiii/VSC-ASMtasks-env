ASSUME cs:codesg
;jmp far ptr

codesg SEGMENT
       start:
              mov ax,0
              mov bx,0
              jmp far ptr s
              db  256 dup (0)
       s:     add ax,1
              inc ax
       ;exit
              mov ax,4c00h
              int 21H


codesg ENDS

end start
