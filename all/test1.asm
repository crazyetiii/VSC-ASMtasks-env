assume cs:code,ds:data,ss:stack

;实验五 练习1
data segment
           dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends
stack segment
      ;被当做栈使用
            dw 0,0,0,0,0,0,0,0
stack ends

code segment
      ;内存单元位置
      start:mov  ax,stack
            mov  ss,ax
            mov  sp,16
      ;设置data的开始位置
            mov  ax,data
            mov  ds,ax

            push ds:[0]
            push ds:[2]
            pop  ds:[2]
            pop  ds:[0]



      ;退出
            mov  ax,4c00H
            int  21H
code ends

;end 指定程序入口
end start