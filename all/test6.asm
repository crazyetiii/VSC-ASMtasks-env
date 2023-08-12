assume cs:code

;实验五 练习6
;push指令将a段前8个值赋值到b段

a segment
      ;16byte*2=32byte
        dw 1,2,3,4,5,6,7,8,9,0ah,0bh,0ch,0dh,0eh,0fh,0ffh
a ends

b segment
        dw 0,0,0,0,0,0,0,0
b ends

code segment
      ;使用b段当栈
      start:mov  ax,b          ;直接获取段的地址
            mov  ss,ax
            mov  sp,16         ;栈底。栈大小的字节数

      ;循环
            mov  cx,8
            mov  bx,0

            mov  ax,a
            mov  ds,ax
      s:    push ds:[bx]
      ;这里+2byte
            add  bx,2
            loop s

      ;退出
            mov  ax,4c00H
            int  21H
code ends


;end 指定程序入口
end start