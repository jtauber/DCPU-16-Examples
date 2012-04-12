; Reading characters from the keyboard
; by Markus Persson

#macro push(what) {
    set push, what
}

#macro pop(what) {
    set pop, what
}

#macro nextkey(target) {
	push(i)
	set i,[keypointer]
	add i,0x9000
	set target,[i]
	ife target,0
		set pc, end
	
	set [i],0
	add [keypointer], 1
	and [keypointer], 0xf
:end
	pop(i)
}

nextkey(a)
nextkey(b)

:keypointer
dat 0
