	org	07c00h			; 告诉编译器程序加载到 0x7c00 处
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	call	DispStr			; 调用显示字符串例程
	jmp	$
DispStr:
	mov	ax, BootMessage
	mov	bp, ax			; ES:BP = 串地址
	mov	cx, msgLen		; CX = 串长度
	mov	ax, 01301h		; AH = 13, AL = 01h
	mov	bx, 000ch		; 页号为 0 (BH = 0) 黑底红字 (BL = 0Ch, 高亮)
	mov	dh, 10h			; 通过 DH 指定行号
	mov	dl, 0			; 将 DL 中的 ASCII 码显示到屏幕，将'\0'送到 DL 中，并显示
	int	10h			; 10h 号中断
	ret				; 返回到调用处
BootMessage:
        db      "Hello From BochsDemo! Origin from RobotCodec.Club!"
msgLen:	equ	$ - BootMessage
	times	510-($-$$)  db  0	; 填充剩下的空间，使生成的二进制代码恰好为512字节
	dw	0xaa55			; 结束标志

