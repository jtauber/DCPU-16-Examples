;Floating point operations
;Make a floating point number
SET PC, test

:makefloat	
;(signed integer A)
	
	;body
	SHL A, 0x1
	SET Z, O
	IFN Z, 0x1
		set PC, continue
	SHR A, 0x1
	JSR negate
	SHL A, 0x1
	
	:continue
	SHL Z, 0xf ;put the bit in the first position
	
	
	SET I, 0x1;
	:loop
	ADD I, 0x1
	SHL A, 0x1
	IFN 0x1, O
		SET PC, loop
	SHR A, I
	
	;Now check for a too-large integer
	IFG I, 0x5
		SET PC, smallenough
	SET B, 0x6
	SUB B, I
	SHR A, B
	
	:smallenough
	SHL A, 0x5
	SET J, 0x10
	SUB J, I
	ADD J, 0xf
	ADD A, J
	ADD A, Z
	
	;end

	SET PC, POP

:negate 
;negate A in two's complement
	XOR A, 0xffff
	ADD A, 0x1
	SET PC, POP
	
	
;Test code
:test
	SET A, 0xFFe0
	JSR makefloat