	.text
	.file	"i64.c"
	.globl	foo                     ; -- Begin function foo
	.type	foo,@function
foo NOP                                 ; @foo
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	LOAD	%GR6, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR3, 0(%GR1)
	STORE	%GR2, 16(%GR7)
	STORE	%GR4, 12(%GR7)
	ADDI	%GR1, %GR7, 0
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR5, 0(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 0(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	foo, .Lfunc_end0-foo
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR5, 28(%GR7)
	COPYI	%GR3, 0
	STORE	%GR3, 24(%GR7)
	COPYI	%GR6, 5
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, 2
	COPYI	%GR2, 3
	COPYI	%GR4, 4
	COPYI	%GR5, 6
	CALL	foo
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 16
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 16(%GR7)
	COPYR	%RT0, %GR3
	LOAD	%GR5, 28(%GR7)
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
