;实现50-AX，结果存在AX的功能
DATA SEGMENT

    Score      DW		49,59,34,79,78,26,27,87,1,79,77,45,43,77,49,19,56,75,32,16,76,42,1,32,92,19,3,36,65,48,42,32,82,69,45,26,39,49,66,26,77,92,60,65,63,34,95,37,35,71,8,55,61,69,41,2,71,94,90,40,65,44,37,32,93,66,88,68,72,58,77,93,4,73,1,61,47,73,91,79,0,14,90,43,35,53,83,93,13,3,43,64,96,38,32,62,86,32,8,45
    Number     DW		1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
    Count      EQU		100  ;数组中元素的个数(字节)，原先20
ORG 500H
    DB 0
;***********************自己的数据写在下面*******************

;***********************自己的数据写在上面*******************
DATA ENDS
code segment
	assume cs: code, ds: data

output proc
	push bx
	push si
	push dx
	mov bx,0DH ;一个判断是否还要继续输出的标志，除了0~9都可以
	push bx
again:
	xor dx,dx
	mov si,10
	div si ;余数放dx，商放ax
	cmp dx,0
	jne next ;余数不等于0，直接转到余数入栈操作
	cmp ax,0  ;余数等于0，看看商等不等于0
	je print ;商也等于0,开始打印输出
next:
	or dl,30h
	push dx ;变成0~9对应的ASCII入栈
	jmp again
print:
	pop dx
	cmp dx,0Dh ;如果是放入的标志，停止输出
	je over
	mov ah,2 ;不是的话就输出
	int 21h
	jmp print
over: 
	pop dx
	pop si
	pop bx
	ret
output endp


START:	MOV  AX, DATA
	MOV  DS, AX
	MOV  AX, 5
	; NEG  AX;变成-AX
	; ADD AX, 50;（-AX）+50，即50-AX
    MOV  AX, Score[0];需要为双数
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
	JL  I30
	MOV Score[SI],BX
	MOV Score[SI+2],AX     ;交换位置

    MOV AX,Number[SI]
	MOV BX,Number[SI+2]
    MOV Number[SI],BX
	MOV Number[SI+2],AX     ;交换位置
	
I30:
	ADD SI,2           ;SI加2:移动一个数字位置
    ; MOV AX,Score[0]     ;交换位置
    ; CALL  output
	INC DI             ;DI加1，当前循环次数
	CMP DI,CX           ;比较，判断是否可以退出
	
	;比较CX和DI大小:DI<CX转移,CX为外层循环总数n-1
	JB  I20             ;不能退出，继续比较
	Loop I10           ;循环调至I10,Loop循环CX执行一次减1
MOV CX,99;原先19
mov BX,0
XOR DX,DX
print1:
    MOV  AX, CX
	NEG  AX;变成-AX
	ADD AX, 100;原先20
    ADD AX, AX
    ;MOV DX,Score[BX];存入上一次的成绩
	MOV  SI, 30H
	MOV DX,Score[BX]
	MOV  [SI], DX;存回
    MOV  BX, AX
	MOV  ax, DX
    MOV  AX, Number[BX];输出编号
    CALL  output
    mov dl,32
    int 21h;第一个空格
    MOV  AX, Score[BX];输出成绩，存入这一次的成绩
	cmp [SI],AX
	JZ do_nothing
	CALL  output
    mov dl,32
    int 21h;第二个空格
    MOV  SI, 500H
	MOV  AX, [SI]
    add ax,1
	MOV  [SI], ax;存回
	CALL  output
	jmp tiaozhuan
do_nothing:
    CALL  output
	mov dl,32
    int 21h
    MOV  SI, 500H
	MOV  AX, [SI]
    CALL  output
tiaozhuan:
    MOV DL,0AH
    MOV AH,02H
    INT 21H;回车
    Loop print1
    mov ax,4c00h
    INT    21H
CODE ENDS
    END START