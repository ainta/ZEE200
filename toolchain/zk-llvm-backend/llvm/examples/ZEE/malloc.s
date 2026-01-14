	.text
	.file	"malloc.c"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 4(%GR7)
	COPYI	%GR1, 15
	CALL	malloc
	COPYR	%GR6, %GR0
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	CALL	free
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYR	%GR0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
