ASSUME cs:codesg,ds:data
;计算平均收入

;多个数组
data SEGMENT
       ;年份
            db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
            db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
            db '1993','1994','1995'
       ;总收入
            dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
            dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
       ;人数
            dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
            dw 11542,14430,15257,17800
data ends

;结构型数据的数组
table SEGMENT
             db 21 dup ('year summe ne ??')
table ends

codesg SEGMENT
       ;
       start: mov  ax,data
              mov  ds,ax
              mov  bx,0

              mov  ax,table
              mov  ss,ax
       ;循环次数
              mov  cx,21
       s0:
       ;[bx].idata[si]
       ;bx定位每个结构体数据,si定位每项中的值
              mov  cx,4
              mov  si,0
       ;循环4次获取年份写入
       s1:
              mov  al,[bx].0[si]
       ;待写入的位置
              mov  ss:[bx].0[si],al
              inc  si
              loop s1
       ;取2byte收入,然后赋值
              mov  si,0
       ;收入在偏移21byte开始
              mov  ax,[bx].84[si]
       ;高双字节
              mov  ss:[bx].5[si],ax
       ;低双字节
              add  si,2
              mov  ax,[bx].84[si]
              mov  ss:[bx].5[si],ax

       ;人员在偏移105byte的位置,开始
              mov  si,0
              mov  ax,[bx].168[si]
              mov  ss:[bx].10[si],ax

       ;收入,填写在d开头的两字节
       ;被除数,收入4字节,需要分开存储
       ; mov ax,
              mov  si,0
              mov  dx,ss:[bx].7[si]
              mov  ax,ss:[bx].5[si]
              mov  cx,ss:[bx].10[si]
              div  cx
              mov  ss:[bx].0dh[si],ax
       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start