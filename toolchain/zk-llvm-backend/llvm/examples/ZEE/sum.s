	.text
	.file	"sum.c"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	COPYI	%GR1, 1
	STORE	%GR1, 36(%GR7)
	STORE	%GR6, 32(%GR7)
	ADDI	%GR1, %GR7, 20
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 16
	COPYI	%GR1, 5
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 12
	COPYI	%GR1, 4
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 8
	COPYI	%GR1, 3
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 4
	COPYI	%GR1, 2
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 36
	STORE	%GR6, 0(%GR7)
	CALL	va_sum
	COPYR	%GR6, %GR0
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	COPYR	%GR0, %GR6
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.globl	va_sum                  ; -- Begin function va_sum
	.type	va_sum,@function
va_sum NOP                              ; @va_sum
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	STORE	%GR6, 4(%GR7)
	ADDI	%GR6, %GR7, 20
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB1_1
.LBB1_1 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_3
	JUMP	.LBB1_2
.LBB1_2 NOP                             ;   in Loop: Header=BB1_1 Depth=1
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB1_1
.LBB1_3 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYR	%GR0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end1 NOP 
	.size	va_sum, .Lfunc_end1-va_sum
                                        ; -- End function
	.ident	"clang version 9.0.1 "
	.note.GNU-stack
