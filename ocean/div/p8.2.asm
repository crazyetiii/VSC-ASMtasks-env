ASSUME cs:codesg
;1001/100

codesg SEGMENT
       ;03e9H,1byte,存放ax即可
       start:
              mov ax,03e9H
              mov cx,100
              div cx
       ;exit
              mov ax,4c00h
              int 21H

codesg ENDS

end start