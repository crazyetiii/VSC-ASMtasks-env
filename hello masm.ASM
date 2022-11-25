
DATAS SEGMENT
    Score      DW		86,81,77,62,32,89,85,74,34,92,100,63,45,59,76,83,88,95,92,86
    Number     DW		1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    Count      EQU		20  ;数组中元素的个数(字节)
DATAS ENDS
 
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS





output proc;输出函数
    mov bl,0
    ; mov ax,NUM[si]
L3: div cl
    push CX;入栈
    add bl,1;计数器加一
    mov ah,0
    cmp CX,0;当被除数为0时结束循环
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

START:

    MOV AX,2000H
    MOV DS,AX
    MOV DS:[0],12
    MOV AX,DS:[0]
    call output
	MOV  AH, 4CH
	INT    21H
CODES ENDS
    END START