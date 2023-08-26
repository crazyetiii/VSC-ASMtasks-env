assume cs:codesg,ds:datasg

;实验9.
;将datasg的数据
;bp配合ss


datasg segment
              db 'welcome to masm!'
       ;颜色.
              db 02h,24h,71h
datasg ends

codesg segment

       ; mov  ax,0B830h
       start:
       ;字符串的位置.
              mov  ax,datasg
              mov  ds,ax

       ;目标位置
              mov  ax,0B830h
              mov  es,ax
       ;使用dx存储外部的cx值
              mov  dx,4
              mov  bp,0
       ;单次显示
       ;获取颜色
       s0:
              mov  ah,ds:[bp+10h]

              mov  si,0
              mov  bx,0

       ;存外层cx
              push cx
              mov  cx,16
       ;获取单个字符
       s:     mov  al,ds:[si]
       ;把拼好的值写到目标位置
              mov  es:[bx],ax
              add  bx,2
              inc  si
              loop s
              dec  dx
              mov  cx,dx
              inc  bp
              loop s0



       ;退出
              mov  ax,4c00h
              int  21h
codesg ends
end start