ASSUME cs:codesg
;相对地址溢出

codesg SEGMENT
       start:
              jmp short s
              db 128 dup (0)
              s:mov ax,0ffffh
       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start
