assume cs:codesg,ds:datasg

;实验9.

datasg segment
              db 'welcome to masm!'
              ;颜色.
              db 02h,24h,71h
datasg ends

codesg segment
       ;获取程序区开始位置
       start: mov  ax,datasg
              mov  ds,ax
       ;目标位置
              ; mov  ax,0B860h
              ; mov  ax,0B880h
              ; mov  ax,0B840h
              ;!!! 00,20, 不显示.30/40/60/80都显示,位置有所差异.
              mov  ax,0B830h
              mov  es,ax
              mov  cx,3
              mov  bp,0
       s:                            ;一个s循环显示一串字符，三行同一位置依次显示
              mov  si,0
              mov  di,0
              ;!!! 没有声明哪部分内存地址作为栈,直接在使用
              push cx
              ;这里需要从20h开始取颜色信息,即字符串
              mov  ah,[20h+bp]
              ;!!! bp默认的段地址是ss,但是现在显示指定为ds.实测下来还是会将ss作为段地址
              ; mov  ah,ds:[bp+10h]
              inc  bp
              mov  cx,16
       s1:                           ;一个s1循环显示一个字符
              mov  al,ds:[si]
              inc  si
              ;ax,(颜色+字符)赋值给es
              mov  es:[di],ax
              add  di,2
              loop s1

              pop  cx
              loop s
              mov  ax,4c00h
              int  21h
codesg ends
end start