ASSUME cs:codesg
;100001/100

codesg SEGMENT
       ;186a1H,32bit,需要分别存dx-ax中
       start:
              mov dx,1
              mov ax,86a1H
              mov cx,100
              div cx
       ;exit
              mov ax,4c00h
              int 21H

codesg ENDS

end start