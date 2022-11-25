;本程序用于实现两个16位数相加结果存放其后的功能

DATA SEGMENT
;在这里写入你要使用的数据，没有或不会用就空着
;***********************自己的数据写在下面*******************
ORG 50H
	DB 10
;***********************自己的数据写在上面*******************
DATA ENDS
CODE SEGMENT
	ASSUME CS: CODE, DS: DATA
START:	MOV  AX, DATA
	MOV  DS, AX
;上面部分不要乱动
;请在下面写你自己的代码
;*************************自己的程序请写在下面********************
	MOV  SI, 50H;偏移地址
	MOV  AX, [SI];加数1
	; ADD   SI, 2;指向下一个数
	; ADD   AX, [SI];求和
	; ADD   SI, 2;指向存和的位置
	MOV  [SI], 3;存回
    MOV  AX, [SI];加数1


	
;************************自己的程序请写在上面***************
;如果想要显示结果，请用MOV指令把要显示的数据移入AX中即可，如MOV AX, 2000H
;以下不要随意修改，你现在还不具备修改水平，乱改后果自负
	CALL  HBDISP
	MOV  AH, 4CH
	INT    21H
HBDISP PROC
;本子程序用于显示存入AX中的16位数为十进制格式，方法为长除取余法
	PUSH AX ;将所有寄存器内容送入堆栈保护
	PUSH BX
	PUSH CX
	PUSH DX
	MOV  BX, 10 ;用于存放除数10
	XOR   CX, CX ;用于存放余数的个数
AGN1:	XOR   DX, DX ;除法的高位，除完后存放的是余数，送入堆栈
	DIV    BX ;除以10，商在AX，余数在DX
	PUSH DX ;余数送堆栈
	INC    CX; 余数的个数加1
	AND  AX, AX; 判断商是否为0
	JNZ   AGN1;如果不为0，继续除
	MOV  AH, 2;调用显示余数
AGN2:	POP   DX;将送入堆栈的余数取出
	OR    DL, 30H;转换为字符
	INT   21H;显示
	LOOP AGN2;循环直至CX中计数值为0
	POP  DX;返回调用子程序前的寄存器数据
	POP  CX
	POP  BX
	POP  AX
	RET
HBDISP ENDP
CODE ENDS
	END START