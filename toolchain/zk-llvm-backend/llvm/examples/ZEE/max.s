	.text
	.file	"max.ll"
	.globl	max                     ; -- Begin function max
	.type	max,@function
max NOP                                 ; @max
; %bb.0:
	SUBI	%GR7, %GR7, 12
	STORE	%GR2, 0(%GR7)
	STORE	%GR1, 4(%GR7)
	LTE	%GR6, %GR1, %GR2
	BEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP 
	LOAD	%GR6, 4(%GR7)
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB0_3
.LBB0_2 NOP 
	LOAD	%GR6, 0(%GR7)
	STORE	%GR6, 8(%GR7)
.LBB0_3 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYR	%GR0, %GR6
	ADDI	%GR7, %GR7, 12
	RET
.Lfunc_end0 NOP 
	.size	max, .Lfunc_end0-max
                                        ; -- End function
	.note.GNU-stack
