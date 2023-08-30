assume cs:codesg,ds:data
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
              mov  es,ax

              mov  ax,table
              mov  ds,ax

              mov  bp,0                          ;源偏移量
              mov  bx,0                          ;目标偏移量

       ;循环次数
              mov  cx,21
       s0:    
       ;[bx].idata[si]
       ;bx定位每个结构体数据,si定位每项中的值
              mov  cx,4
              mov  si,0
       ; ;循环4次获取【年份】写入
       s1:    
              mov  al,es:[bp+si]
       ;待写入的位置
              mov  [bx][si],al
              inc  si
              loop s1

              add  bx,16
              add  bp,4                          ;目标偏移量
              loop s0

       ;【收入】
              mov  cx,21
              mov  bp,0                          ;源偏移量
              mov  bx,0
       ;取2byte收入,然后赋值
              mov  si,0
       ;收入在偏移21byte开始
       s2:    mov  ax,es:84[bp][si]
       ;高双字节
              mov  [bx].5[si],ax
       ;低双字节
              add  si,2
              mov  ax,es:84[bp][si]
              mov  [bx].5[si],ax

              add  bx,16
              add  bp,4                          ;目标偏移量
              mov  si,0                          ;不重置导致位置错误
              loop s2
       ;【人员】
              mov  cx,21
              mov  bp,0                          ;源偏移量
              mov  bx,0

       ;人员在偏移168byte的位置,开始
       s3:    mov  si,0
              mov  ax,es:168[bp][si]
              mov  [bx].10[si],ax
              add  bx,16
              add  bp,2                          ;目标偏移量
              loop s3

       ;【人均收入】
       ;收入,填写在d开头的两字节
       ;被除数,收入4字节,需要分开存储
              mov  cx,21
              mov  bp,0                          ;源偏移量
              mov  bx,0
       ; mov ax,
       s4:    mov  si,0
              mov  ax,es:84[bp][si]              ;高字节收入
              add  si,2
              mov  DX,es:84[bp][si]              ;低字节收入

              mov  si,0
       ; mov  bx,         ;人员
       ; div  bx
              div  word ptr es:168[bp][si]
              mov  [bx].0dh[si],ax

              add  bx,16
              add  bp,4                          ;目标偏移量
              loop s4


       ;exit
              mov  ax,4c00h
              int  21H

codesg ENDS

end start
