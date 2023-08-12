assume cs:code

;实验五 练习5  两次循环,先加再移
;db define byte
a segment
        db 1,2,3,4,5,6,7,8
a ends

b segment
        db 1,2,3,4,5,6,7,8
b ends

c segment
        db 1,2,3,4,5,6,7,8
c ends

code segment
      ;a的值
      start:mov  ax,a
            mov  ds,ax

      ;b的值
            mov  ax,b
            mov  es,ax
            mov  bx,0

      ;偏移量
            mov  ax,0
      ;循环次数
            mov  cx,8
      ;取b加到a
      s:    mov  al,es:[bx]
            add  ds:[bx],al
            inc  bx
            loop s
      ;c的值
            mov  ax,c
            mov  es,ax
            mov  bx,0

            mov  cx,8
      ;把a赋值到c
      s1:   mov  ax,ds:[bx]
            mov  es:[bx],ax
            inc  bx
            loop s1

      ;退出
            mov  ax,4c00H
            int  21H
code ends


;end 指定程序入口
end start