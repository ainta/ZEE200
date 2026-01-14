	.text
	.file	"cmp.ll"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 20
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 4(%GR7)
	GT	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	COPYI	%GR2, -1
	STORE	%GR1, 8(%GR7)
	CMOV	%GR1, %GR6, %GR2
	COPYR	%GR0, %GR1
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR7, %GR7, 20
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.note.GNU-stack
