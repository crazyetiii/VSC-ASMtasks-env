; ; .586

; ; DATA SEGMENT; use16
        
; ; ;在这里写入你要使用的数据
; ; ;***********************自己的数据写在下面*******************
; ;     MESG DB 'hello masm','$'

; ; ;***********************自己的数据写在上面*******************
; ; DATA ENDS

; DATA SEGMENT
;     A	       DW		0,15,70,30,32,89,12,12,34,4,38,23,45,13,43,24,54,24,54,1
;     Count      EQU		($-A)/2  ;数组中元素的个数(字节)
; DATA ENDS

; CODE SEGMENT; USE16
;     ASSUME CS:CODE
;     ASSUME DS:DATA
; ; START:	MOV  AX, DATA
; ; 	MOV  DS, AX
; START:    MOV AX,DATA
;         MOV DS, AX
; MOV CX,Count-1      ;外层循环执行n-1次
; I10:
; 	XOR SI,SI           ;异或清零
; 	XOR DI,DI        
	
; I20:
; 	MOV AX,A[SI]
; 	MOV BX,A[SI+2]
; 	CMP AX,BX
	
; 	;比较AX和BX大小:AX<BX(小于转移)跳转I30,否则交换两数
; 	JL  I30
; 	MOV A[SI],BX
; 	MOV A[SI+2],AX     ;交换位置
	
; I30:
; 	ADD SI,2           ;SI加2:移动一个数字位置
; 	INC DI             ;DI加1
; 	CMP DI,CX           
	
; 	;比较CX和DI大小:DI<CX转移,CX为外层循环总数n-1
; 	JB  I20
; 	Loop I10           ;循环调至I10,Loop循环CX执行一次减1	
; ;-------------------------------------------------------------------------	


; LAST:   MOV AH,9
;         MOV DX, OFFSET MESG
;         INT 21H
;         MOV AH,4CH
;         INT 21H;BACK TO DOS
        
; CODE ENDS
; END  START





; ;-------------------------------------------------------------------------
; ;冒泡排序核心算法 A排序   
    


DATAS SEGMENT
    Score      DW		86,81,77,62,32,89,85,74,34,92,100,63,45,59,76,83,88,95,92,86
    Number     DW		1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
    Count      EQU		20  ;数组中元素的个数(字节)
DATAS ENDS
 
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS


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
    MOV AX,DATAS
    MOV DS,AX
    mov cl,10
    mov bx,0

    mov CX, Score[2]
    call output
    ; mov si,0
;-------------------------------------------------------------------------
;冒泡排序核心算法 A排序   
    MOV CX,Count-1      ;外层循环执行n-1次，CX是循环次数的寄存器
I10:
	XOR SI,SI     ;数组下标 
	XOR DI,DI     ;当前的循环次数
	
I20:
	MOV AX,Score[SI]
	MOV BX,Score[SI+2]
	CMP AX,BX
	
	;比较AX和BX大小:AX<BX，小于转移，跳转I30，不交换
        ;比较AX和BX大小:AX>BX，大于，不跳转I30，交换
        否则交换两数
	JL  I30
	MOV Score[SI],BX
	MOV Score[SI+2],AX     ;交换位置
	
I30:
	ADD SI,2           ;SI加2:移动一个数字位置
	INC DI             ;DI加1，当前循环次数
	CMP DI,CX           ;比较，判断是否可以退出
	
	;比较CX和DI大小:DI<CX转移,CX为外层循环总数n-1
	JB  I20             ;不能退出，继续比较
	Loop I10           ;循环调至I10,Loop循环CX执行一次减1	
print:
    ; MOV CX,Count-1      ;外层循环执行n-1次，CX是循环次数的寄存器
; I19:
	; XOR SI,SI     ;数组下标 
	XOR DI,DI     ;当前的循环次数
    MOV DS,AX
    mov cl,10
    mov bx,0
    mov si,0
; I21:
    ; mov ax, Score[2]
    ; call output
    ; mov ax, Number[2]
    ; call output
    ; INC DI             ;DI加1，当前循环次数
    ; CMP DI,CX           ;比较，判断是否可以退出
    ; JB  I21             ;不能退出，继续比较
    ; Loop I22           ;循环调至I10,Loop循环CX执行一次减1	
; I22:

; ;-------------------------------------------------------------------------	
    mov ax, 4c00h
    int 21h
CODES ENDS
    END START