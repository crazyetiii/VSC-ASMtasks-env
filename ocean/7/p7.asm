ASSUME cs:code
;置bit位为1/0
;置1,or,特殊位为1
;置0,and,特视位为0
code SEGMENT
         mov al,01100011b
    ;置第6位
         and al,10111111b
    ;  and al,10111111b

code ENDS

end