	.text
	.file	"segtree.c"
	.globl	Init                    ; -- Begin function Init
	.type	Init,@function
Init NOP                                ; @Init
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	COPYI	%GR2, t
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP 
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, t
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_3
.LBB0_2 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 1
	STORE	%GR6, 4(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 4(%GR7)
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR3, %GR6, 1
	CALL	Init
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR1, %GR6, 1
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR6, %GR6, 1
	ORI	%GR3, %GR6, 1
	CALL	Init
	LOAD	%GR6, 8(%GR7)
	MULI	%GR1, %GR6, 24
	COPYI	%GR2, t
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR1
	MULI	%GR6, %GR6, 12
	ADD	%GR6, %GR6, %GR2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_3
.LBB0_3 NOP 
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	Init, .Lfunc_end0-Init
                                        ; -- End function
	.globl	Quote                   ; -- Begin function Quote
	.type	Quote,@function
Quote NOP                               ; @Quote
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 20(%GR7)
	STORE	%GR3, 16(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 20(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_2
	JUMP	.LBB1_1
.LBB1_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB1_12
.LBB1_2 NOP 
	LOAD	%GR6, 16(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, t
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_5
	JUMP	.LBB1_3
.LBB1_3 NOP 
	LOAD	%GR6, 16(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, t
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_5
	JUMP	.LBB1_4
.LBB1_4 NOP 
	LOAD	%GR6, 16(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, t
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB1_12
.LBB1_5 NOP 
	LOAD	%GR6, 16(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, t
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR6, %GR6
	SRAI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR2, 12(%GR7)
	GTE	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB1_7
	JUMP	.LBB1_6
.LBB1_6 NOP 
	LOAD	%GR2, 20(%GR7)
	JUMP	.LBB1_8
.LBB1_7 NOP 
	LOAD	%GR2, 12(%GR7)
	JUMP	.LBB1_8
.LBB1_8 NOP 
	LOAD	%GR6, 16(%GR7)
	SHLI	%GR3, %GR6, 1
	CALL	Quote
	COPYR	%GR4, %GR0
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	LOAD	%GR1, 24(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_10
	JUMP	.LBB1_9
.LBB1_9 NOP 
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR1, %GR6, 1
	JUMP	.LBB1_11
.LBB1_10 NOP 
	LOAD	%GR1, 24(%GR7)
	JUMP	.LBB1_11
.LBB1_11 NOP 
	LOAD	%GR2, 20(%GR7)
	LOAD	%GR6, 16(%GR7)
	SHLI	%GR6, %GR6, 1
	ORI	%GR3, %GR6, 1
	CALL	Quote
	COPYR	%GR6, %GR0
	ADD	%GR6, %GR4, %GR6
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB1_12
.LBB1_12 NOP 
	LOAD	%GR6, 28(%GR7)
	COPYR	%GR0, %GR6
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end1 NOP 
	.size	Quote, .Lfunc_end1-Quote
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 16(%GR7)
	COPYI	%GR2, 100
	COPYI	%GR3, 1
	COPYR	%GR1, %GR3
	CALL	Init
	COPYI	%GR1, 20
	COPYI	%GR2, 40
	CALL	Quote
	COPYR	%GR6, %GR0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYR	%GR0, %GR6
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end2 NOP 
	.size	main, .Lfunc_end2-main
                                        ; -- End function
	.type	N,@object               ; @N
	.rodata
	.globl	N
	.p2align	2
N NOP 
	.long	100000                  ; 0x186a0
	.size	N, 4

	.type	t,@object               ; @t
	.comm	t,1200000,16
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
