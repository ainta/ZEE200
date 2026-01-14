	.text
	.file	"fib.c"
	.globl	Fib                     ; -- Begin function Fib
	.type	Fib,@function
Fib NOP                                 ; @Fib
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP 
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 2
	NEQ	%GR6, %GR6, %GR1
	BEQZ	%GR6, .LBB0_3
	JUMP	.LBB0_2
.LBB0_2 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB0_4
.LBB0_3 NOP 
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -1
	CALL	Fib
	COPYR	%GR2, %GR0
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -2
	CALL	Fib
	COPYR	%GR6, %GR0
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB0_4
.LBB0_4 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYR	%GR0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end0 NOP 
	.size	Fib, .Lfunc_end0-Fib
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	COPYI	%GR1, 10
	CALL	Fib
	COPYR	%GR6, %GR0
	COPYR	%GR0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
