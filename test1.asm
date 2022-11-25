DATAS SEGMENT
    Score      DW		86,81,77,62,32,89,85,74,34,92,100,63,45,59,76,83,88,95,92,86
    Number     DW		1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    Count      EQU		20  ;数组中元素的个数(字节)
DATAS ENDS


CODE SEGMENT
	ASSUME CS: CODE, DS: DATA
;代码段
cseg segment 
;把dl中的数字以十进制的形式打印在屏幕上
; print_num_of_dl proc near
;     push dx 
;     xor  ah, ah 
;     mov  al, dl 
;     mov  dh, 10
;     div  dh 
;     ;除以10后商是否为0
;     test al, 0ffh
;     ;若为0，则代表原数为一位数
;     jz   single
;     ;商不为0，至少为两位数
;     push ax 
;     xor  ah, ah 
;     div  dh 
;     test al, 0ffh
;     ;同理，若商为0，代表为两位数
;     jz   two
;     ;商为0时，余数不可能也为0，这样是个位数
;     push ax 
;     mov  dl, al 
;     add  dl, '0'
;     mov  ah, 02h 
;     int  21h
;     pop  ax 
; two:
;     mov  dl, ah 
;     add  dl, '0'
;     mov  ah, 02h
;     int  21h
;     pop  ax 
; single:
;     mov  dl, ah 
;     add  dl, '0'
;     mov  ah, 02h
;     int  21h
;     pop  dx
;     ret
; print_num_of_dl endp


output proc;输出函数
    mov bl,0
    ; mov ax,NUM[si]
L3: div cl
    push ax;入栈
    add bl,1;计数器加一
    mov ah,0
    cmp ax,0;当被除数为0时结束循环
    jne L3
L4: pop dx;出栈
    sub bl,1;计数器减一
    mov dl,dh
    add dl,48
    mov ah,2
    int 21h
    cmp bl,0;当计数器清零时结束循环
    jne L4
ret
output endp 

start:    
    ;测试子程序功能
    ; MOV AX,DATAS
    
    MOV DS,AX
    mov cl,10
    mov bx,0
    mov si,0
    mov ax, Score[1]
    
    call output  
exit:    
    mov ax, 4c00h
    int 21h
CODE ends
end start 