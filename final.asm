    ;MOV DX,Score[BX];存入上一次的成绩
	; MOV  SI, 30H;头
	; MOV DX,Score[BX]
	; MOV  [SI], DX;存回
    ; MOV  BX, AX
	; MOV  ax, DX
	; CALL  output
	; mov dl,32
    ; int 21h;尾，以上是利用30H的存储空间，存放前数组