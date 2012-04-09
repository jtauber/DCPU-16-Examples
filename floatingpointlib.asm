;An alternative floating point implementation
;This one follows the IEEE 754 standard by having the format:
; Sign|Exponent|Significand
;    1          5              10

SET PC, test

:makefloat
	SET PUSH, I
	SET PUSH, J
	SET PUSH, Z
	
	;body
	;sign bit first
	SHL A, 1
	SET Z, O
	SHR A, 1
	ADD A, 0x8000 ;to replace the sign bit lost in the shift
	IFE Z, 1
		JSR negate
	
	SET I, 0
	:loop
		ADD I, 1
		SHL A, 1
		IFN O, 1
			SET PC, loop
	
	;final assembly of the bits
	SET J, 31
	SUB J, I
	SHL J, 10
	SHL Z, 15
	SHR A, 6
	ADD A, J
	ADD A, Z
	
	;end
	SET Z, POP
	SET J, POP
	SET I, POP
	SET PC, POP

:negate
;negate A in two's complement
	XOR A, 0xffff
	ADD A, 0x1
	SET PC, POP
	
;test code
:test
SET A, 0xFFD7
JSR makefloat