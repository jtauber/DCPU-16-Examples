; Reading characters from the keyboard
; by Markus Persson

#macro nextkey(target) {
	push(i)
	set i,[keypointer]
	add i,0x9000
	set target,[i]
	ife target,0
		jmp end
	
	set [i],0
	add [keypointer], 1
	and [keypointer], 0xf
:end
	pop(i)
}

:keypointer
dat 0
