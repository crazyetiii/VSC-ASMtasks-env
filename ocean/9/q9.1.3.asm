ASSUME cs:codesg
;jmp far ptr

codesg SEGMENT
       start:
              mov ax,2000h
              mov es,ax
              jmp dword ptr es:[1000h]
       ;exit
              mov ax,4c00h
              int 21H


codesg ENDS

end start
