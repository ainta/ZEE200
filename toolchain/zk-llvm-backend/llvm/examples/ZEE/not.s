	.text
	.file	"not.ll"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 8
	COPYI	%GR6, -2
	STORE	%GR6, 0(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 4(%GR7)
	COPYR	%GR0, %GR6
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.note.GNU-stack
