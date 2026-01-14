	.text
	.file	"add.ea"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:                                ; %entry
	COPYI	%GR6, 0
	COPYR	%GR0, %GR6
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.note.GNU-stack
