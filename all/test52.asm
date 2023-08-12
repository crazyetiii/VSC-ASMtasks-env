assume cs:code

;实验五 练习5  一次循环
;没有那么多变量,就使用一个。运算一次，重新赋值
;db define byte
a segment
        db 1,2,3,4,5,6,7,8
a ends

b segment
        db 8,7,6,5,4,3,2,1
b ends

c segment
        db 0,0,0,0,0,0,0,0
c ends

code segment
      start:mov  cx,8
            mov  bx,0
      ;获取a的值
      s:    mov  ax,a
            mov  ds,ax
      ;临时变量dx
            mov  dl,ds:[bx]
      ;获取b的值
            mov  ax,b
            mov  ds,ax
            add  dl,ds:[bx]
      ;给c赋值
            mov  ax,c
            mov  ds,ax
            mov  ds:[bx],dl
            inc  bx
            loop s

      ;退出
            mov  ax,4c00H
            int  21H
code ends


;end 指定程序入口
end start