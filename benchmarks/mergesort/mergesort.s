	.text
	.file	"ld-temp.o"
	.type	merge_sort,@function    ; -- Begin function merge_sort
merge_sort NOP                          ; @merge_sort
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR1, 40(%FP)
	STORE	%GR2, 36(%FP)
	STORE	%GR3, 32(%FP)
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 36(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP 
	JUMP	.LBB0_21
.LBB0_2 NOP 
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 32(%FP)
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 1
	STORE	%GR6, 28(%FP)
	LOAD	%GR1, 40(%FP)
	LOAD	%GR2, 36(%FP)
	LOAD	%GR3, 28(%FP)
	CALL	merge_sort
	LOAD	%GR1, 40(%FP)
	LOAD	%GR6, 28(%FP)
	ADDI	%GR2, %GR6, 1
	LOAD	%GR3, 32(%FP)
	CALL	merge_sort
	LOAD	%GR6, 36(%FP)
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 28(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 36(%FP)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB0_3
.LBB0_3 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 28(%FP)
	LT	%GR1, %GR1, %GR6
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB0_5
	JUMP	.LBB0_4
.LBB0_4 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 32(%FP)
	LTE	%GR6, %GR6, %GR1
	JUMP	.LBB0_5
.LBB0_5 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_10
	JUMP	.LBB0_6
.LBB0_6 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 24(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR1, %GR6, %GR1
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 20(%FP)
	SHLI	%GR2, %GR2, 2
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR6, 0(%GR6)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_8
	JUMP	.LBB0_7
.LBB0_7 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 24(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	SHLI	%GR1, %GR1, 2
	COPYG	%GR2, b
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB0_9
.LBB0_8 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 20(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	SHLI	%GR1, %GR1, 2
	COPYG	%GR2, b
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB0_9
.LBB0_9 NOP                             ;   in Loop: Header=BB0_3 Depth=1
	JUMP	.LBB0_3
.LBB0_10 NOP 
	JUMP	.LBB0_11
.LBB0_11 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 28(%FP)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB0_13
	JUMP	.LBB0_12
.LBB0_12 NOP                            ;   in Loop: Header=BB0_11 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 24(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	SHLI	%GR1, %GR1, 2
	COPYG	%GR2, b
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB0_11
.LBB0_13 NOP 
	JUMP	.LBB0_14
.LBB0_14 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 32(%FP)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB0_16
	JUMP	.LBB0_15
.LBB0_15 NOP                            ;   in Loop: Header=BB0_14 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 20(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	SHLI	%GR1, %GR1, 2
	COPYG	%GR2, b
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB0_14
.LBB0_16 NOP 
	LOAD	%GR6, 36(%FP)
	STORE	%GR6, 12(%FP)
	JUMP	.LBB0_17
.LBB0_17 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 32(%FP)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB0_20
	JUMP	.LBB0_18
.LBB0_18 NOP                            ;   in Loop: Header=BB0_17 Depth=1
	LOAD	%GR6, 12(%FP)
	SHLI	%GR6, %GR6, 2
	COPYG	%GR1, b
	ADD	%GR1, %GR6, %GR1
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 40(%FP)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_19
.LBB0_19 NOP                            ;   in Loop: Header=BB0_17 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB0_17
.LBB0_20 NOP 
	JUMP	.LBB0_21
.LBB0_21 NOP 
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end0 NOP 
	.size	merge_sort, .Lfunc_end0-merge_sort
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	;APP
	VMCALL	5
	;NO_APP
	;APP
	INPUT	%GR6
	
	;NO_APP
	STORE	%GR6, 8(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 4(%FP)
	JUMP	.LBB1_1
.LBB1_1 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB1_4
	JUMP	.LBB1_2
.LBB1_2 NOP                             ;   in Loop: Header=BB1_1 Depth=1
	;APP
	VMCALL	5
	;NO_APP
	LOAD	%GR6, 4(%FP)
	SHLI	%GR6, %GR6, 2
	COPYG	%GR1, a
	ADD	%GR6, %GR6, %GR1
	;APP
	INPUT	%GR1
	
	;NO_APP
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB1_3
.LBB1_3 NOP                             ;   in Loop: Header=BB1_1 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 4(%FP)
	JUMP	.LBB1_1
.LBB1_4 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR3, %GR6, -1
	COPYG	%GR1, a
	COPYI	%GR2, 0
	CALL	merge_sort
	STORE	%GR2, 0(%FP)
	JUMP	.LBB1_5
.LBB1_5 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 8(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB1_10
	JUMP	.LBB1_6
.LBB1_6 NOP                             ;   in Loop: Header=BB1_5 Depth=1
	LOAD	%GR6, 0(%FP)
	SHLI	%GR1, %GR6, 2
	COPYG	%GR2, a
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB1_8
	JUMP	.LBB1_7
.LBB1_7 NOP                             ;   in Loop: Header=BB1_5 Depth=1
	;APP
	CALL Cheat
	;NO_APP
	JUMP	.LBB1_8
.LBB1_8 NOP                             ;   in Loop: Header=BB1_5 Depth=1
	JUMP	.LBB1_9
.LBB1_9 NOP                             ;   in Loop: Header=BB1_5 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%FP)
	JUMP	.LBB1_5
.LBB1_10 NOP 
	;APP
	CALL Proof
	;NO_APP
	COPYI	%GR6, 0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.globl	SFUDIV                  ; -- Begin function SFUDIV
	.type	SFUDIV,@function
SFUDIV NOP                              ; @SFUDIV
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB2_2
	JUMP	.LBB2_1
.LBB2_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB2_2 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB2_4
	JUMP	.LBB2_3
.LBB2_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	JUMP	.LBB2_8
.LBB2_4 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 8(%FP)
	JUMP	.LBB2_5
.LBB2_5 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB2_7
	JUMP	.LBB2_6
.LBB2_6 NOP                             ;   in Loop: Header=BB2_5 Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 16(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	JUMP	.LBB2_5
.LBB2_7 NOP 
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB2_8
.LBB2_8 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end2 NOP 
	.size	SFUDIV, .Lfunc_end2-SFUDIV
                                        ; -- End function
	.globl	SFUREM                  ; -- Begin function SFUREM
	.type	SFUREM,@function
SFUREM NOP                              ; @SFUREM
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_2
	JUMP	.LBB3_1
.LBB3_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB3_2 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_4
	JUMP	.LBB3_3
.LBB3_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	JUMP	.LBB3_8
.LBB3_4 NOP 
	JUMP	.LBB3_5
.LBB3_5 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_7
	JUMP	.LBB3_6
.LBB3_6 NOP                             ;   in Loop: Header=BB3_5 Depth=1
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 16(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	JUMP	.LBB3_5
.LBB3_7 NOP 
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB3_8
.LBB3_8 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end3 NOP 
	.size	SFUREM, .Lfunc_end3-SFUREM
                                        ; -- End function
	.globl	SFSDIV                  ; -- Begin function SFSDIV
	.type	SFSDIV,@function
SFSDIV NOP                              ; @SFSDIV
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_2
	JUMP	.LBB4_1
.LBB4_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB4_2 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_4
	JUMP	.LBB4_3
.LBB4_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	JUMP	.LBB4_22
.LBB4_4 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_6
	JUMP	.LBB4_5
.LBB4_5 NOP 
	LOAD	%GR6, 16(%FP)
	JUMP	.LBB4_7
.LBB4_6 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	JUMP	.LBB4_7
.LBB4_7 NOP 
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_9
	JUMP	.LBB4_8
.LBB4_8 NOP 
	LOAD	%GR6, 12(%FP)
	JUMP	.LBB4_10
.LBB4_9 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	JUMP	.LBB4_10
.LBB4_10 NOP 
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	UDIV	%GR6, %GR6, %GR1
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_13
	JUMP	.LBB4_11
.LBB4_11 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_13
	JUMP	.LBB4_12
.LBB4_12 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB4_22
.LBB4_13 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_16
	JUMP	.LBB4_14
.LBB4_14 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB4_16
	JUMP	.LBB4_15
.LBB4_15 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB4_22
.LBB4_16 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB4_19
	JUMP	.LBB4_17
.LBB4_17 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_19
	JUMP	.LBB4_18
.LBB4_18 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB4_22
.LBB4_19 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB4_22
	JUMP	.LBB4_20
.LBB4_20 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB4_22
	JUMP	.LBB4_21
.LBB4_21 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB4_22
.LBB4_22 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end4 NOP 
	.size	SFSDIV, .Lfunc_end4-SFSDIV
                                        ; -- End function
	.globl	SFSREM                  ; -- Begin function SFSREM
	.type	SFSREM,@function
SFSREM NOP                              ; @SFSREM
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_2
	JUMP	.LBB5_1
.LBB5_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB5_2 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_4
	JUMP	.LBB5_3
.LBB5_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	JUMP	.LBB5_22
.LBB5_4 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_6
	JUMP	.LBB5_5
.LBB5_5 NOP 
	LOAD	%GR6, 16(%FP)
	JUMP	.LBB5_7
.LBB5_6 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	JUMP	.LBB5_7
.LBB5_7 NOP 
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_9
	JUMP	.LBB5_8
.LBB5_8 NOP 
	LOAD	%GR6, 12(%FP)
	JUMP	.LBB5_10
.LBB5_9 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	JUMP	.LBB5_10
.LBB5_10 NOP 
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	UREM	%GR6, %GR6, %GR1
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_13
	JUMP	.LBB5_11
.LBB5_11 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_13
	JUMP	.LBB5_12
.LBB5_12 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB5_22
.LBB5_13 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_16
	JUMP	.LBB5_14
.LBB5_14 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB5_16
	JUMP	.LBB5_15
.LBB5_15 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB5_22
.LBB5_16 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB5_19
	JUMP	.LBB5_17
.LBB5_17 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_19
	JUMP	.LBB5_18
.LBB5_18 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB5_22
.LBB5_19 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB5_22
	JUMP	.LBB5_20
.LBB5_20 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB5_22
	JUMP	.LBB5_21
.LBB5_21 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB5_22
.LBB5_22 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end5 NOP 
	.size	SFSREM, .Lfunc_end5-SFSREM
                                        ; -- End function
	.globl	SF64UDIV                ; -- Begin function SF64UDIV
	.type	SF64UDIV,@function
SF64UDIV NOP                            ; @SF64UDIV
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%GR1, 72(%FP)
	STORE	%GR2, 68(%FP)
	STORE	%GR3, 64(%FP)
	STORE	%GR4, 60(%FP)
	STORE	%GR5, 56(%FP)
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 40(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_2
	JUMP	.LBB6_1
.LBB6_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB6_2 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_4
	JUMP	.LBB6_3
.LBB6_3 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB6_16
.LBB6_4 NOP 
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 24(%FP)
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB6_5
.LBB6_5 NOP                             ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	ADDI	%GR2, %FP, 40
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 40(%FP)
	ULTE	%GR1, %GR1, %GR3
	ULTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB6_7
	JUMP	.LBB6_6
.LBB6_6 NOP 
	JUMP	.LBB6_10
.LBB6_7 NOP                             ;   in Loop: Header=BB6_5 Depth=1
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %FP, 32
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 32(%FP)
	ULT	%GR5, %GR1, %GR4
	SUB	%GR6, %GR6, %GR3
	SUB	%GR6, %GR6, %GR5
	SUB	%GR1, %GR1, %GR4
	ADDI	%GR3, %FP, 8
	ORI	%GR3, %GR3, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 32(%FP)
	LOAD	%GR2, 0(%GR3)
	LOAD	%GR3, 8(%FP)
	ULTE	%GR4, %GR6, %GR2
	ULTE	%GR1, %GR1, %GR3
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB6_9
	JUMP	.LBB6_8
.LBB6_8 NOP 
	JUMP	.LBB6_10
.LBB6_9 NOP                             ;   in Loop: Header=BB6_5 Depth=1
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%FP)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 32(%FP)
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%FP)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 16(%FP)
	JUMP	.LBB6_5
.LBB6_10 NOP 
	JUMP	.LBB6_11
.LBB6_11 NOP                            ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_15
	JUMP	.LBB6_12
.LBB6_12 NOP                            ;   in Loop: Header=BB6_11 Depth=1
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %FP, 32
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 32(%FP)
	ULT	%GR1, %GR1, %GR3
	ULT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB6_14
	JUMP	.LBB6_13
.LBB6_13 NOP                            ;   in Loop: Header=BB6_11 Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %FP, 24
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 24(%FP)
	ADD	%GR1, %GR4, %GR1
	ULT	%GR4, %GR1, %GR4
	ADD	%GR6, %GR3, %GR6
	ADD	%GR6, %GR6, %GR4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 24(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	ADDI	%GR2, %FP, 40
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 40(%FP)
	ULT	%GR5, %GR4, %GR1
	SUB	%GR6, %GR3, %GR6
	SUB	%GR6, %GR6, %GR5
	SUB	%GR1, %GR4, %GR1
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 40(%FP)
	JUMP	.LBB6_14
.LBB6_14 NOP                            ;   in Loop: Header=BB6_11 Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%FP)
	SRLI	%GR2, %GR2, 1
	SHLI	%GR3, %GR1, 31
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 16(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%FP)
	SHLI	%GR3, %GR1, 31
	SRLI	%GR2, %GR2, 1
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 32(%FP)
	JUMP	.LBB6_11
.LBB6_15 NOP 
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %FP, 48
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB6_16
.LBB6_16 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%FP)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR5, 56(%FP)
	LOAD	%GR4, 60(%FP)
	LOAD	%GR3, 64(%FP)
	LOAD	%GR2, 68(%FP)
	LOAD	%GR1, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end6 NOP 
	.size	SF64UDIV, .Lfunc_end6-SF64UDIV
                                        ; -- End function
	.globl	SF64UREM                ; -- Begin function SF64UREM
	.type	SF64UREM,@function
SF64UREM NOP                            ; @SF64UREM
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%GR1, 56(%FP)
	STORE	%GR2, 52(%FP)
	STORE	%GR3, 48(%FP)
	STORE	%GR4, 44(%FP)
	STORE	%GR5, 40(%FP)
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 24(%FP)
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 16(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_2
	JUMP	.LBB7_1
.LBB7_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB7_2 NOP 
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_4
	JUMP	.LBB7_3
.LBB7_3 NOP 
	ADDI	%GR6, %FP, 32
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 32(%FP)
	JUMP	.LBB7_16
.LBB7_4 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	STORE	%GR6, 8(%FP)
	JUMP	.LBB7_5
.LBB7_5 NOP                             ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %FP, 24
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 24(%FP)
	ULTE	%GR1, %GR1, %GR3
	ULTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB7_7
	JUMP	.LBB7_6
.LBB7_6 NOP 
	JUMP	.LBB7_10
.LBB7_7 NOP                             ;   in Loop: Header=BB7_5 Depth=1
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %FP, 16
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 16(%FP)
	ULT	%GR5, %GR1, %GR4
	SUB	%GR6, %GR6, %GR3
	SUB	%GR6, %GR6, %GR5
	SUB	%GR1, %GR1, %GR4
	ADDI	%GR3, %FP, 0
	ORI	%GR3, %GR3, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 0(%GR3)
	LOAD	%GR3, 0(%FP)
	ULTE	%GR4, %GR6, %GR2
	ULTE	%GR1, %GR1, %GR3
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB7_9
	JUMP	.LBB7_8
.LBB7_8 NOP 
	JUMP	.LBB7_10
.LBB7_9 NOP                             ;   in Loop: Header=BB7_5 Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%FP)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 16(%FP)
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 8(%FP)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 8(%FP)
	JUMP	.LBB7_5
.LBB7_10 NOP 
	JUMP	.LBB7_11
.LBB7_11 NOP                            ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_15
	JUMP	.LBB7_12
.LBB7_12 NOP                            ;   in Loop: Header=BB7_11 Depth=1
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %FP, 16
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 16(%FP)
	ULT	%GR1, %GR1, %GR3
	ULT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB7_14
	JUMP	.LBB7_13
.LBB7_13 NOP                            ;   in Loop: Header=BB7_11 Depth=1
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %FP, 24
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 24(%FP)
	ULT	%GR5, %GR4, %GR1
	SUB	%GR6, %GR3, %GR6
	SUB	%GR6, %GR6, %GR5
	SUB	%GR1, %GR4, %GR1
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 24(%FP)
	JUMP	.LBB7_14
.LBB7_14 NOP                            ;   in Loop: Header=BB7_11 Depth=1
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 8(%FP)
	SRLI	%GR2, %GR2, 1
	SHLI	%GR3, %GR1, 31
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 8(%FP)
	ADDI	%GR6, %FP, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%FP)
	SHLI	%GR3, %GR1, 31
	SRLI	%GR2, %GR2, 1
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 16(%FP)
	JUMP	.LBB7_11
.LBB7_15 NOP 
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	ADDI	%GR2, %FP, 32
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 32(%FP)
	JUMP	.LBB7_16
.LBB7_16 NOP 
	ADDI	%GR6, %FP, 32
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR5, 40(%FP)
	LOAD	%GR4, 44(%FP)
	LOAD	%GR3, 48(%FP)
	LOAD	%GR2, 52(%FP)
	LOAD	%GR1, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end7 NOP 
	.size	SF64UREM, .Lfunc_end7-SF64UREM
                                        ; -- End function
	.globl	SF64SDIV                ; -- Begin function SF64SDIV
	.type	SF64SDIV,@function
SF64SDIV NOP                            ; @SF64SDIV
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR4, 56(%FP)
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 40(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_2
	JUMP	.LBB8_1
.LBB8_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB8_2 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_4
	JUMP	.LBB8_3
.LBB8_3 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB8_22
.LBB8_4 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_6
	JUMP	.LBB8_5
.LBB8_5 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	JUMP	.LBB8_7
.LBB8_6 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%FP)
	COPYI	%GR3, 0
	SUB	%GR6, %GR3, %GR2
	NEQ	%GR2, %GR2, %GR3
	ADD	%GR1, %GR1, %GR2
	SUB	%GR1, %GR3, %GR1
	JUMP	.LBB8_7
.LBB8_7 NOP 
	ADDI	%GR2, %FP, 24
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_9
	JUMP	.LBB8_8
.LBB8_8 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%FP)
	JUMP	.LBB8_10
.LBB8_9 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%FP)
	COPYI	%GR3, 0
	SUB	%GR6, %GR3, %GR2
	NEQ	%GR2, %GR2, %GR3
	ADD	%GR1, %GR1, %GR2
	SUB	%GR1, %GR3, %GR1
	JUMP	.LBB8_10
.LBB8_10 NOP 
	ADDI	%GR2, %FP, 16
	ORI	%GR3, %GR2, 4
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 16(%FP)
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	LOAD	%GR4, 0(%GR3)
	LOAD	%GR3, 16(%FP)
	CALL	SF64UDIV
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %FP, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%FP)
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_13
	JUMP	.LBB8_11
.LBB8_11 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_13
	JUMP	.LBB8_12
.LBB8_12 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR2, %FP, 48
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB8_22
.LBB8_13 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_16
	JUMP	.LBB8_14
.LBB8_14 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB8_16
	JUMP	.LBB8_15
.LBB8_15 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 0
	SUB	%GR3, %GR2, %GR1
	NEQ	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	SUB	%GR6, %GR2, %GR6
	ADDI	%GR1, %FP, 48
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 48(%FP)
	JUMP	.LBB8_22
.LBB8_16 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB8_19
	JUMP	.LBB8_17
.LBB8_17 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB8_19
	JUMP	.LBB8_18
.LBB8_18 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 0
	SUB	%GR3, %GR2, %GR1
	NEQ	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	SUB	%GR6, %GR2, %GR6
	ADDI	%GR1, %FP, 48
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 48(%FP)
	JUMP	.LBB8_22
.LBB8_19 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB8_22
	JUMP	.LBB8_20
.LBB8_20 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB8_22
	JUMP	.LBB8_21
.LBB8_21 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR2, %FP, 48
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB8_22
.LBB8_22 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%FP)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 56(%FP)
	LOAD	%GR3, 60(%FP)
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end8 NOP 
	.size	SF64SDIV, .Lfunc_end8-SF64SDIV
                                        ; -- End function
	.globl	SF64SREM                ; -- Begin function SF64SREM
	.type	SF64SREM,@function
SF64SREM NOP                            ; @SF64SREM
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR4, 56(%FP)
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 40(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB9_2
	JUMP	.LBB9_1
.LBB9_1 NOP 
	COPYI	%GR1, -1
	CALL	exit
.LBB9_2 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB9_4
	JUMP	.LBB9_3
.LBB9_3 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB9_22
.LBB9_4 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_6
	JUMP	.LBB9_5
.LBB9_5 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	JUMP	.LBB9_7
.LBB9_6 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%FP)
	COPYI	%GR3, 0
	SUB	%GR6, %GR3, %GR2
	NEQ	%GR2, %GR2, %GR3
	ADD	%GR1, %GR1, %GR2
	SUB	%GR1, %GR3, %GR1
	JUMP	.LBB9_7
.LBB9_7 NOP 
	ADDI	%GR2, %FP, 24
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%FP)
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_9
	JUMP	.LBB9_8
.LBB9_8 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%FP)
	JUMP	.LBB9_10
.LBB9_9 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%FP)
	COPYI	%GR3, 0
	SUB	%GR6, %GR3, %GR2
	NEQ	%GR2, %GR2, %GR3
	ADD	%GR1, %GR1, %GR2
	SUB	%GR1, %GR3, %GR1
	JUMP	.LBB9_10
.LBB9_10 NOP 
	ADDI	%GR2, %FP, 16
	ORI	%GR3, %GR2, 4
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 16(%FP)
	ADDI	%GR6, %FP, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	LOAD	%GR4, 0(%GR3)
	LOAD	%GR3, 16(%FP)
	CALL	SF64UREM
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %FP, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%FP)
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_13
	JUMP	.LBB9_11
.LBB9_11 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_13
	JUMP	.LBB9_12
.LBB9_12 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR2, %FP, 48
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB9_22
.LBB9_13 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_16
	JUMP	.LBB9_14
.LBB9_14 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB9_16
	JUMP	.LBB9_15
.LBB9_15 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR2, %FP, 48
	ADDI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%FP)
	JUMP	.LBB9_22
.LBB9_16 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB9_19
	JUMP	.LBB9_17
.LBB9_17 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	LT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB9_19
	JUMP	.LBB9_18
.LBB9_18 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 0
	SUB	%GR3, %GR2, %GR1
	NEQ	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	SUB	%GR6, %GR2, %GR6
	ADDI	%GR1, %FP, 48
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 48(%FP)
	JUMP	.LBB9_22
.LBB9_19 NOP 
	ADDI	%GR6, %FP, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB9_22
	JUMP	.LBB9_20
.LBB9_20 NOP 
	ADDI	%GR6, %FP, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB9_22
	JUMP	.LBB9_21
.LBB9_21 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 0
	SUB	%GR3, %GR2, %GR1
	NEQ	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	SUB	%GR6, %GR2, %GR6
	ADDI	%GR1, %FP, 48
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 48(%FP)
	JUMP	.LBB9_22
.LBB9_22 NOP 
	ADDI	%GR6, %FP, 48
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%FP)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 56(%FP)
	LOAD	%GR3, 60(%FP)
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end9 NOP 
	.size	SF64SREM, .Lfunc_end9-SF64SREM
                                        ; -- End function
	.globl	start                   ; -- Begin function start
	.type	start,@function
start NOP                               ; @start
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 448
	COPYR	%FP, %SP
	STORE	%RA, 440(%FP)
	STORE	%GR1, 436(%FP)
	STORE	%GR2, 432(%FP)
	STORE	%GR3, 428(%FP)
	COPYI	%GR6, 20
	STORE	%GR6, 424(%FP)
	LOAD	%GR1, 424(%FP)
	COPYI	%GR2, 4
	CALL	calloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 420(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB10_1
.LBB10_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 424(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB10_4
	JUMP	.LBB10_2
.LBB10_2 NOP                            ;   in Loop: Header=BB10_1 Depth=1
	LOAD	%GR6, 16(%FP)
	MULI	%GR6, %GR6, 20
	ADDI	%GR1, %FP, 20
	ADD	%GR1, %GR1, %GR6
	COPYG	%GR2, .L.str
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB10_3
.LBB10_3 NOP                            ;   in Loop: Header=BB10_1 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB10_1
.LBB10_4 NOP 
	;APP
		VMCALL	4
	;NO_APP
	COPYI	%GR6, 0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB10_5
.LBB10_5 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_7 Depth 2
                                        ;     Child Loop BB10_11 Depth 2
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 424(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB10_20
	JUMP	.LBB10_6
.LBB10_6 NOP                            ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_7
.LBB10_7 NOP                            ;   Parent Loop BB10_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	;APP
	INPUT	%GR6
	;NO_APP
	STOREB	%GR6, 8(%FP)
	LOADB	%GR6, 8(%FP)
	COPYI	%GR1, 32
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_9
	JUMP	.LBB10_8
.LBB10_8 NOP                            ;   in Loop: Header=BB10_7 Depth=2
	JUMP	.LBB10_7
.LBB10_9 NOP                            ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_10
.LBB10_10 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_11
.LBB10_11 NOP                           ;   Parent Loop BB10_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 12(%FP)
	MULI	%GR6, %GR6, 20
	ADDI	%GR1, %FP, 20
	ADD	%GR1, %GR1, %GR6
	ADDI	%GR2, %FP, 8
	COPYI	%GR3, 1
	CALL	strncat
                                        ; kill: def $gr6 killed $rt0
	;APP
	INPUT	%GR6
	;NO_APP
	STOREB	%GR6, 8(%FP)
	LOADB	%GR6, 8(%FP)
	COPYI	%GR1, 32
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_13
	JUMP	.LBB10_12
.LBB10_12 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_16
.LBB10_13 NOP                           ;   in Loop: Header=BB10_11 Depth=2
	LOADB	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_15
	JUMP	.LBB10_14
.LBB10_14 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_16
.LBB10_15 NOP                           ;   in Loop: Header=BB10_11 Depth=2
	JUMP	.LBB10_11
.LBB10_16 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	LOADB	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_18
	JUMP	.LBB10_17
.LBB10_17 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB10_21
.LBB10_18 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	JUMP	.LBB10_19
.LBB10_19 NOP                           ;   in Loop: Header=BB10_5 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB10_5
.LBB10_20 NOP                           ; %.loopexit
	JUMP	.LBB10_21
.LBB10_21 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 4(%FP)
	JUMP	.LBB10_22
.LBB10_22 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 12(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB10_25
	JUMP	.LBB10_23
.LBB10_23 NOP                           ;   in Loop: Header=BB10_22 Depth=1
	LOAD	%GR6, 4(%FP)
	MULI	%GR1, %GR6, 20
	ADDI	%GR2, %FP, 20
	ADD	%GR1, %GR2, %GR1
	LOAD	%GR2, 420(%FP)
	SHLI	%GR6, %GR6, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_24
.LBB10_24 NOP                           ;   in Loop: Header=BB10_22 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 4(%FP)
	JUMP	.LBB10_22
.LBB10_25 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 420(%FP)
	CALL	main
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%FP)
	LOAD	%GR1, 0(%FP)
	CALL	exit
.Lfunc_end10 NOP 
	.size	start, .Lfunc_end10-start
                                        ; -- End function
	.globl	calloc                  ; -- Begin function calloc
	.type	calloc,@function
calloc NOP                              ; @calloc
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	CALL	__getreent
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 8(%FP)
	CALL	_calloc_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end11 NOP 
	.size	calloc, .Lfunc_end11-calloc
                                        ; -- End function
	.type	_calloc_r,@function     ; -- Begin function _calloc_r
_calloc_r NOP                           ; @_calloc_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	COPYG	%GR6, impure_data
	STORE	%GR6, 36(%FP)
	STORE	%GR1, 32(%FP)
	STORE	%GR2, 28(%FP)
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 28(%FP)
	MUL	%GR6, %GR6, %GR1
	STORE	%GR6, 16(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%GR2, 16(%FP)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_2
	JUMP	.LBB12_1
.LBB12_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 40(%FP)
	JUMP	.LBB12_14
.LBB12_2 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 20(%FP)
	JUMP	.LBB12_3
.LBB12_3 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB12_11
	JUMP	.LBB12_4
.LBB12_4 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 20
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_10
	JUMP	.LBB12_5
.LBB12_5 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 4(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR2, %GR6, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 28
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_9
	JUMP	.LBB12_6
.LBB12_6 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 4(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR2, %GR6, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_8
	JUMP	.LBB12_7
.LBB12_7 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 4(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR2, %GR6, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB12_8
.LBB12_8 NOP 
	JUMP	.LBB12_9
.LBB12_9 NOP 
	JUMP	.LBB12_10
.LBB12_10 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 4(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR2, %GR6, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB12_12
.LBB12_11 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR3, 8(%FP)
	COPYI	%GR2, 0
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB12_12
.LBB12_12 NOP 
	JUMP	.LBB12_13
.LBB12_13 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 40(%FP)
	JUMP	.LBB12_14
.LBB12_14 NOP 
	LOAD	%GR6, 40(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end12 NOP 
	.size	_calloc_r, .Lfunc_end12-_calloc_r
                                        ; -- End function
	.globl	exit                    ; -- Begin function exit
	.type	exit,@function
exit NOP                                ; @exit
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	STORE	%GR1, 4(%FP)
	STORE	%GR1, 0(%FP)
	LOAD	%GR1, 0(%FP)
	CALL	__call_exitprocs
	COPYG	%GR6, impure_data+60
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_2
	JUMP	.LBB13_1
.LBB13_1 NOP 
	COPYG	%GR6, impure_data+60
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, impure_data
	CALLR	%GR6
	JUMP	.LBB13_2
.LBB13_2 NOP 
	LOAD	%GR1, 0(%FP)
	CALL	_exit
.Lfunc_end13 NOP 
	.size	exit, .Lfunc_end13-exit
                                        ; -- End function
	.type	__getreent,@function    ; -- Begin function __getreent
__getreent NOP                          ; @__getreent
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end14 NOP 
	.size	__getreent, .Lfunc_end14-__getreent
                                        ; -- End function
	.type	_malloc_r,@function     ; -- Begin function _malloc_r
_malloc_r NOP                           ; @_malloc_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR1, 56(%FP)
	STORE	%GR2, 52(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 11
	COPYI	%GR1, 22
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_2
	JUMP	.LBB15_1
.LBB15_1 NOP 
	COPYI	%GR6, 16
	JUMP	.LBB15_3
.LBB15_2 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 11
	ANDI	%GR6, %GR6, -8
	JUMP	.LBB15_3
.LBB15_3 NOP 
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_5
	JUMP	.LBB15_4
.LBB15_4 NOP 
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 52(%FP)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_6
	JUMP	.LBB15_5
.LBB15_5 NOP 
	LOAD	%GR6, 56(%FP)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_6 NOP 
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_lock
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 503
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_12
	JUMP	.LBB15_7
.LBB15_7 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 3
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 40(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 4(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_9
	JUMP	.LBB15_8
.LBB15_8 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB15_9
.LBB15_9 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 4(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_11
	JUMP	.LBB15_10
.LBB15_10 NOP 
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_11 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 40(%FP)
	JUMP	.LBB15_41
.LBB15_12 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_14
	JUMP	.LBB15_13
.LBB15_13 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 3
	JUMP	.LBB15_30
.LBB15_14 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 4
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_16
	JUMP	.LBB15_15
.LBB15_15 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB15_29
.LBB15_16 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 20
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_18
	JUMP	.LBB15_17
.LBB15_17 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB15_28
.LBB15_18 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 84
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_20
	JUMP	.LBB15_19
.LBB15_19 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 12
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB15_27
.LBB15_20 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 340
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_22
	JUMP	.LBB15_21
.LBB15_21 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 15
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB15_26
.LBB15_22 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 1364
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_24
	JUMP	.LBB15_23
.LBB15_23 NOP 
	LOAD	%GR6, 0(%FP)
	SRLI	%GR6, %GR6, 18
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB15_25
.LBB15_24 NOP 
	COPYI	%GR6, 126
	JUMP	.LBB15_25
.LBB15_25 NOP 
	JUMP	.LBB15_26
.LBB15_26 NOP 
	JUMP	.LBB15_27
.LBB15_27 NOP 
	JUMP	.LBB15_28
.LBB15_28 NOP 
	JUMP	.LBB15_29
.LBB15_29 NOP 
	JUMP	.LBB15_30
.LBB15_30 NOP 
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 40(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB15_31
.LBB15_31 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 36(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_39
	JUMP	.LBB15_32
.LBB15_32 NOP                           ;   in Loop: Header=BB15_31 Depth=1
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 0(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_34
	JUMP	.LBB15_33
.LBB15_33 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 40(%FP)
	JUMP	.LBB15_40
.LBB15_34 NOP                           ;   in Loop: Header=BB15_31 Depth=1
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_36
	JUMP	.LBB15_35
.LBB15_35 NOP 
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_36 NOP                           ;   in Loop: Header=BB15_31 Depth=1
	JUMP	.LBB15_37
.LBB15_37 NOP                           ;   in Loop: Header=BB15_31 Depth=1
	JUMP	.LBB15_38
.LBB15_38 NOP                           ;   in Loop: Header=BB15_31 Depth=1
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB15_31
.LBB15_39 NOP                           ; %.loopexit1
	JUMP	.LBB15_40
.LBB15_40 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 40(%FP)
	JUMP	.LBB15_41
.LBB15_41 NOP 
	COPYG	%GR6, __malloc_av_+16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	COPYG	%GR1, __malloc_av_+8
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_76
	JUMP	.LBB15_42
.LBB15_42 NOP 
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 0(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_44
	JUMP	.LBB15_43
.LBB15_43 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 0(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 0(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	COPYG	%GR1, __malloc_av_+20
	STORE	%GR6, 0(%GR1)
	COPYG	%GR1, __malloc_av_+16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 12
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 32(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 32(%FP)
	ADD	%GR1, %GR1, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_44 NOP 
	COPYG	%GR6, __malloc_av_+20
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR1, 0(%GR6)
	COPYG	%GR6, __malloc_av_+16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_46
	JUMP	.LBB15_45
.LBB15_45 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_46 NOP 
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 511
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_48
	JUMP	.LBB15_47
.LBB15_47 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 3
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 2
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 24(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB15_75
.LBB15_48 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_50
	JUMP	.LBB15_49
.LBB15_49 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 3
	JUMP	.LBB15_66
.LBB15_50 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 4
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_52
	JUMP	.LBB15_51
.LBB15_51 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB15_65
.LBB15_52 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 20
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_54
	JUMP	.LBB15_53
.LBB15_53 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB15_64
.LBB15_54 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 84
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_56
	JUMP	.LBB15_55
.LBB15_55 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 12
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB15_63
.LBB15_56 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 340
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_58
	JUMP	.LBB15_57
.LBB15_57 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 15
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB15_62
.LBB15_58 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 1364
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_60
	JUMP	.LBB15_59
.LBB15_59 NOP 
	LOAD	%GR6, 44(%FP)
	SRLI	%GR6, %GR6, 18
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB15_61
.LBB15_60 NOP 
	COPYI	%GR6, 126
	JUMP	.LBB15_61
.LBB15_61 NOP 
	JUMP	.LBB15_62
.LBB15_62 NOP 
	JUMP	.LBB15_63
.LBB15_63 NOP 
	JUMP	.LBB15_64
.LBB15_64 NOP 
	JUMP	.LBB15_65
.LBB15_65 NOP 
	JUMP	.LBB15_66
.LBB15_66 NOP 
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_68
	JUMP	.LBB15_67
.LBB15_67 NOP 
	LOAD	%GR6, 24(%FP)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 2
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB15_74
.LBB15_68 NOP 
	JUMP	.LBB15_69
.LBB15_69 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB15_71
	JUMP	.LBB15_70
.LBB15_70 NOP                           ;   in Loop: Header=BB15_69 Depth=1
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ULT	%GR6, %GR6, %GR1
	JUMP	.LBB15_71
.LBB15_71 NOP                           ;   in Loop: Header=BB15_69 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_73
	JUMP	.LBB15_72
.LBB15_72 NOP                           ;   in Loop: Header=BB15_69 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	JUMP	.LBB15_69
.LBB15_73 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB15_74
.LBB15_74 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB15_75
.LBB15_75 NOP 
	JUMP	.LBB15_76
.LBB15_76 NOP 
	LOAD	%GR6, 40(%FP)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 2
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR1, 0(%GR1)
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_110
	JUMP	.LBB15_77
.LBB15_77 NOP 
	LOAD	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR1, 0(%GR1)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_82
	JUMP	.LBB15_78
.LBB15_78 NOP 
	LOAD	%GR6, 40(%FP)
	ANDI	%GR6, %GR6, -4
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 20(%FP)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB15_79
.LBB15_79 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR1, 0(%GR1)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_81
	JUMP	.LBB15_80
.LBB15_80 NOP                           ;   in Loop: Header=BB15_79 Depth=1
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 20(%FP)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB15_79
.LBB15_81 NOP 
	JUMP	.LBB15_82
.LBB15_82 NOP 
	JUMP	.LBB15_83
.LBB15_83 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_84 Depth 2
                                        ;       Child Loop BB15_85 Depth 3
                                        ;     Child Loop BB15_96 Depth 2
                                        ;     Child Loop BB15_104 Depth 2
	LOAD	%GR6, 40(%FP)
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 40(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 36(%FP)
	STORE	%GR6, 4(%FP)
	JUMP	.LBB15_84
.LBB15_84 NOP                           ;   Parent Loop BB15_83 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB15_85 Depth 3
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB15_85
.LBB15_85 NOP                           ;   Parent Loop BB15_83 Depth=1
                                        ;     Parent Loop BB15_84 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 36(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_93
	JUMP	.LBB15_86
.LBB15_86 NOP                           ;   in Loop: Header=BB15_85 Depth=3
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 0(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_88
	JUMP	.LBB15_87
.LBB15_87 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 0(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 0(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 48(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	COPYG	%GR1, __malloc_av_+20
	STORE	%GR6, 0(%GR1)
	COPYG	%GR1, __malloc_av_+16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 12
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 32(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 32(%FP)
	ADD	%GR1, %GR1, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_88 NOP                           ;   in Loop: Header=BB15_85 Depth=3
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_90
	JUMP	.LBB15_89
.LBB15_89 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_90 NOP                           ;   in Loop: Header=BB15_85 Depth=3
	JUMP	.LBB15_91
.LBB15_91 NOP                           ;   in Loop: Header=BB15_85 Depth=3
	JUMP	.LBB15_92
.LBB15_92 NOP                           ;   in Loop: Header=BB15_85 Depth=3
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB15_85
.LBB15_93 NOP                           ;   in Loop: Header=BB15_84 Depth=2
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 36(%FP)
	JUMP	.LBB15_94
.LBB15_94 NOP                           ;   in Loop: Header=BB15_84 Depth=2
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 40(%FP)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_84
	JUMP	.LBB15_95
.LBB15_95 NOP                           ;   in Loop: Header=BB15_83 Depth=1
	JUMP	.LBB15_96
.LBB15_96 NOP                           ;   Parent Loop BB15_83 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 16(%FP)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_98
	JUMP	.LBB15_97
.LBB15_97 NOP                           ;   in Loop: Header=BB15_83 Depth=1
	LOAD	%GR6, 20(%FP)
	XORI	%GR6, %GR6, -1
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR2, 0(%GR1)
	AND	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB15_101
.LBB15_98 NOP                           ;   in Loop: Header=BB15_96 Depth=2
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 4(%FP)
	JUMP	.LBB15_99
.LBB15_99 NOP                           ;   in Loop: Header=BB15_96 Depth=2
	LOAD	%GR6, 4(%FP)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_96
	JUMP	.LBB15_100
.LBB15_100 NOP                          ; %.loopexit
                                        ;   in Loop: Header=BB15_83 Depth=1
	JUMP	.LBB15_101
.LBB15_101 NOP                          ;   in Loop: Header=BB15_83 Depth=1
	LOAD	%GR6, 20(%FP)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR1, 0(%GR1)
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_107
	JUMP	.LBB15_102
.LBB15_102 NOP                          ;   in Loop: Header=BB15_83 Depth=1
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_107
	JUMP	.LBB15_103
.LBB15_103 NOP                          ;   in Loop: Header=BB15_83 Depth=1
	JUMP	.LBB15_104
.LBB15_104 NOP                          ;   Parent Loop BB15_83 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR1, 0(%GR1)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_106
	JUMP	.LBB15_105
.LBB15_105 NOP                          ;   in Loop: Header=BB15_104 Depth=2
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 20(%FP)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB15_104
.LBB15_106 NOP                          ;   in Loop: Header=BB15_83 Depth=1
	JUMP	.LBB15_108
.LBB15_107 NOP 
	JUMP	.LBB15_109
.LBB15_108 NOP                          ;   in Loop: Header=BB15_83 Depth=1
	JUMP	.LBB15_83
.LBB15_109 NOP 
	JUMP	.LBB15_110
.LBB15_110 NOP 
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	LOAD	%GR2, 0(%FP)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 28(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	LOAD	%GR1, 0(%FP)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_112
	JUMP	.LBB15_111
.LBB15_111 NOP 
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 15
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_116
	JUMP	.LBB15_112
.LBB15_112 NOP 
	LOAD	%GR1, 56(%FP)
	LOAD	%GR2, 0(%FP)
	CALL	malloc_extend_top
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	LOAD	%GR2, 0(%FP)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 28(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	LOAD	%GR1, 0(%FP)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_114
	JUMP	.LBB15_113
.LBB15_113 NOP 
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 15
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB15_115
	JUMP	.LBB15_114
.LBB15_114 NOP 
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_115 NOP 
	JUMP	.LBB15_116
.LBB15_116 NOP 
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 48(%FP)
	LOAD	%GR1, 0(%FP)
	ORI	%GR1, %GR1, 1
	LOAD	%GR2, 48(%FP)
	ADDI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 48(%FP)
	LOAD	%GR2, 0(%FP)
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ORI	%GR1, %GR1, 1
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 56(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 60(%FP)
	JUMP	.LBB15_117
.LBB15_117 NOP 
	LOAD	%GR6, 60(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end15 NOP 
	.size	_malloc_r, .Lfunc_end15-_malloc_r
                                        ; -- End function
	.type	malloc_extend_top,@function ; -- Begin function malloc_extend_top
malloc_extend_top NOP                   ; @malloc_extend_top
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR1, 56(%FP)
	STORE	%GR2, 52(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 36(%FP)
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 20(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 12(%FP)
	COPYI	%GR6, 4096
	STORE	%GR6, 8(%FP)
	COPYG	%GR6, __malloc_sbrk_base
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_2
	JUMP	.LBB16_1
.LBB16_1 NOP 
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -1
	COPYI	%GR2, 0
	SUB	%GR1, %GR2, %GR1
	AND	%GR6, %GR6, %GR1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB16_2
.LBB16_2 NOP 
	LOAD	%GR1, 56(%FP)
	LOAD	%GR2, 12(%FP)
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 48(%FP)
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_5
	JUMP	.LBB16_3
.LBB16_3 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 16(%FP)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB16_6
	JUMP	.LBB16_4
.LBB16_4 NOP 
	LOAD	%GR6, 24(%FP)
	COPYG	%GR1, __malloc_av_
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_6
	JUMP	.LBB16_5
.LBB16_5 NOP 
	JUMP	.LBB16_30
.LBB16_6 NOP 
	LOAD	%GR6, 12(%FP)
	COPYG	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 16(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_9
	JUMP	.LBB16_7
.LBB16_7 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, -1
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_9
	JUMP	.LBB16_8
.LBB16_8 NOP 
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 20(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 28(%FP)
	ORI	%GR6, %GR6, 1
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_26
.LBB16_9 NOP 
	COPYG	%GR6, __malloc_sbrk_base
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_11
	JUMP	.LBB16_10
.LBB16_10 NOP 
	LOAD	%GR6, 48(%FP)
	COPYG	%GR1, __malloc_sbrk_base
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_12
.LBB16_11 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 16(%FP)
	SUB	%GR6, %GR6, %GR1
	COPYG	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_12
.LBB16_12 NOP 
	LOAD	%GR6, 48(%FP)
	ADDI	%GR6, %GR6, 8
	ANDI	%GR6, %GR6, 7
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_14
	JUMP	.LBB16_13
.LBB16_13 NOP 
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 8
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 48(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%FP)
	JUMP	.LBB16_15
.LBB16_14 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 40(%FP)
	JUMP	.LBB16_15
.LBB16_15 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 48(%FP)
	LOAD	%GR2, 12(%FP)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR6, -1
	AND	%GR1, %GR1, %GR2
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 40(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 40(%FP)
	AND	%GR6, %GR1, %GR6
	STORE	%GR6, 40(%FP)
	LOAD	%GR1, 56(%FP)
	LOAD	%GR2, 40(%FP)
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_19
	JUMP	.LBB16_16
.LBB16_16 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 40(%FP)
	COPYI	%GR1, 1
	STORE	%GR1, 36(%FP)
	LOAD	%GR1, 48(%FP)
	LOAD	%GR2, 12(%FP)
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 32(%FP)
	LOAD	%GR1, 44(%FP)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB16_18
	JUMP	.LBB16_17
.LBB16_17 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 32(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 32(%FP)
	JUMP	.LBB16_18
.LBB16_18 NOP 
	JUMP	.LBB16_19
.LBB16_19 NOP 
	LOAD	%GR6, 40(%FP)
	COPYG	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR6, 0(%GR1)
	COPYG	%GR6, __malloc_av_
	LOAD	%GR2, 32(%FP)
	LOAD	%GR3, 48(%FP)
	SUB	%GR2, %GR2, %GR3
	LOAD	%GR3, 40(%FP)
	ADD	%GR2, %GR2, %GR3
	STORE	%GR2, 28(%FP)
	LOAD	%GR2, 28(%FP)
	ORI	%GR2, %GR2, 1
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 24(%FP)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB16_25
	JUMP	.LBB16_20
.LBB16_20 NOP 
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 15
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB16_22
	JUMP	.LBB16_21
.LBB16_21 NOP 
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB16_30
.LBB16_22 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -12
	ANDI	%GR6, %GR6, -8
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 1
	LOAD	%GR2, 20(%FP)
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 20(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 5
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 24(%FP)
	LOAD	%GR2, 20(%FP)
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_24
	JUMP	.LBB16_23
.LBB16_23 NOP 
	LOAD	%GR1, 56(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR2, %GR6, 8
	CALL	_free_r
	JUMP	.LBB16_24
.LBB16_24 NOP 
	JUMP	.LBB16_25
.LBB16_25 NOP 
	JUMP	.LBB16_26
.LBB16_26 NOP 
	COPYG	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_max_sbrked_mem
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_28
	JUMP	.LBB16_27
.LBB16_27 NOP 
	COPYG	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_max_sbrked_mem
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_28
.LBB16_28 NOP 
	COPYG	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_max_total_mem
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_30
	JUMP	.LBB16_29
.LBB16_29 NOP 
	COPYG	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_max_total_mem
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_30
.LBB16_30 NOP 
	LOAD	%GR3, 60(%FP)
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end16 NOP 
	.size	malloc_extend_top, .Lfunc_end16-malloc_extend_top
                                        ; -- End function
	.globl	memset                  ; -- Begin function memset
	.type	memset,@function
memset NOP                              ; @memset
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%GR1, 40(%FP)
	STORE	%GR2, 36(%FP)
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	STORE	%GR3, 20(%FP)
	LOAD	%GR6, 28(%FP)
	STORE	%GR6, 16(%FP)
	ULOADB	%GR6, 24(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB17_1
.LBB17_1 NOP                            ; =>This Inner Loop Header: Depth=1
	ULOADB	%GR6, 16(%FP)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_6
	JUMP	.LBB17_2
.LBB17_2 NOP                            ;   in Loop: Header=BB17_1 Depth=1
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 20(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_4
	JUMP	.LBB17_3
.LBB17_3 NOP                            ;   in Loop: Header=BB17_1 Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB17_5
.LBB17_4 NOP 
	LOAD	%GR6, 28(%FP)
	STORE	%GR6, 32(%FP)
	JUMP	.LBB17_22
.LBB17_5 NOP                            ;   in Loop: Header=BB17_1 Depth=1
	JUMP	.LBB17_1
.LBB17_6 NOP 
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 4
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_18
	JUMP	.LBB17_7
.LBB17_7 NOP 
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 0(%FP)
	SHLI	%GR1, %GR6, 8
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	SHLI	%GR1, %GR6, 16
	OR	%GR6, %GR6, %GR1
	STORE	%GR6, 8(%FP)
	COPYI	%GR6, 32
	STORE	%GR6, 12(%FP)
	JUMP	.LBB17_8
.LBB17_8 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 31
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB17_11
	JUMP	.LBB17_9
.LBB17_9 NOP                            ;   in Loop: Header=BB17_8 Depth=1
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	SHL	%GR1, %GR6, %GR1
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%FP)
	JUMP	.LBB17_10
.LBB17_10 NOP                           ;   in Loop: Header=BB17_8 Depth=1
	LOAD	%GR6, 12(%FP)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB17_8
.LBB17_11 NOP 
	JUMP	.LBB17_12
.LBB17_12 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_14
	JUMP	.LBB17_13
.LBB17_13 NOP                           ;   in Loop: Header=BB17_12 Depth=1
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 20(%FP)
	JUMP	.LBB17_12
.LBB17_14 NOP 
	JUMP	.LBB17_15
.LBB17_15 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 4
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_17
	JUMP	.LBB17_16
.LBB17_16 NOP                           ;   in Loop: Header=BB17_15 Depth=1
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 20(%FP)
	JUMP	.LBB17_15
.LBB17_17 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB17_18
.LBB17_18 NOP 
	JUMP	.LBB17_19
.LBB17_19 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 20(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB17_21
	JUMP	.LBB17_20
.LBB17_20 NOP                           ;   in Loop: Header=BB17_19 Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB17_19
.LBB17_21 NOP 
	LOAD	%GR6, 28(%FP)
	STORE	%GR6, 32(%FP)
	JUMP	.LBB17_22
.LBB17_22 NOP 
	LOAD	%GR6, 32(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 36(%FP)
	LOAD	%GR1, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end17 NOP 
	.size	memset, .Lfunc_end17-memset
                                        ; -- End function
	.type	__malloc_lock,@function ; -- Begin function __malloc_lock
__malloc_lock NOP                       ; @__malloc_lock
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 8
	COPYR	%FP, %SP
	STORE	%GR1, 0(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 8
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end18 NOP 
	.size	__malloc_lock, .Lfunc_end18-__malloc_lock
                                        ; -- End function
	.type	__malloc_unlock,@function ; -- Begin function __malloc_unlock
__malloc_unlock NOP                     ; @__malloc_unlock
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 8
	COPYR	%FP, %SP
	STORE	%GR1, 0(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 8
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end19 NOP 
	.size	__malloc_unlock, .Lfunc_end19-__malloc_unlock
                                        ; -- End function
	.type	_sbrk_r,@function       ; -- Begin function _sbrk_r
_sbrk_r NOP                             ; @_sbrk_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	COPYG	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	CALL	_sbrk
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB20_3
	JUMP	.LBB20_1
.LBB20_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB20_3
	JUMP	.LBB20_2
.LBB20_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB20_3
.LBB20_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end20 NOP 
	.size	_sbrk_r, .Lfunc_end20-_sbrk_r
                                        ; -- End function
	.globl	strcpy                  ; -- Begin function strcpy
	.type	strcpy,@function
strcpy NOP                              ; @strcpy
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 36
	COPYR	%FP, %SP
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_5
	JUMP	.LBB21_1
.LBB21_1 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB21_2
.LBB21_2 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, -16843009
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR1, %GR6
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_4
	JUMP	.LBB21_3
.LBB21_3 NOP                            ;   in Loop: Header=BB21_2 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB21_2
.LBB21_4 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB21_5
.LBB21_5 NOP 
	JUMP	.LBB21_6
.LBB21_6 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 8(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 12(%FP)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_8
	JUMP	.LBB21_7
.LBB21_7 NOP                            ;   in Loop: Header=BB21_6 Depth=1
	JUMP	.LBB21_6
.LBB21_8 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%FP)
	LOAD	%GR1, 28(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 36
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end21 NOP 
	.size	strcpy, .Lfunc_end21-strcpy
                                        ; -- End function
	.globl	strncat                 ; -- Begin function strncat
	.type	strncat,@function
strncat NOP                             ; @strncat
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 4(%FP)
	ULOADB	%GR6, 16(%FP)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_5
	JUMP	.LBB22_1
.LBB22_1 NOP 
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB22_2
.LBB22_2 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, -16843009
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR1, %GR6
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_4
	JUMP	.LBB22_3
.LBB22_3 NOP                            ;   in Loop: Header=BB22_2 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 0(%FP)
	JUMP	.LBB22_2
.LBB22_4 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB22_5
.LBB22_5 NOP 
	JUMP	.LBB22_6
.LBB22_6 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_8
	JUMP	.LBB22_7
.LBB22_7 NOP                            ;   in Loop: Header=BB22_6 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB22_6
.LBB22_8 NOP 
	JUMP	.LBB22_9
.LBB22_9 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR1, 8(%FP)
	ADDI	%GR6, %GR1, -1
	STORE	%GR6, 8(%FP)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB22_11
	JUMP	.LBB22_10
.LBB22_10 NOP                           ;   in Loop: Header=BB22_9 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%FP)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB22_11
.LBB22_11 NOP                           ;   in Loop: Header=BB22_9 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_15
	JUMP	.LBB22_12
.LBB22_12 NOP                           ;   in Loop: Header=BB22_9 Depth=1
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_14
	JUMP	.LBB22_13
.LBB22_13 NOP                           ;   in Loop: Header=BB22_9 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB22_14
.LBB22_14 NOP                           ;   in Loop: Header=BB22_9 Depth=1
	JUMP	.LBB22_9
.LBB22_15 NOP 
	LOAD	%GR6, 4(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 20(%FP)
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end22 NOP 
	.size	strncat, .Lfunc_end22-strncat
                                        ; -- End function
	.type	__call_exitprocs,@function ; -- Begin function __call_exitprocs
__call_exitprocs NOP                    ; @__call_exitprocs
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR1, 40(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 36(%FP)
	JUMP	.LBB23_1
.LBB23_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB23_4 Depth 2
	COPYG	%GR6, impure_data+328
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 32(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB23_2
.LBB23_2 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_27
	JUMP	.LBB23_3
.LBB23_3 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 136
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB23_4
.LBB23_4 NOP                            ;   Parent Loop BB23_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_26
	JUMP	.LBB23_5
.LBB23_5 NOP                            ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_9
	JUMP	.LBB23_6
.LBB23_6 NOP                            ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_8
	JUMP	.LBB23_7
.LBB23_7 NOP                            ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 128
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_9
	JUMP	.LBB23_8
.LBB23_8 NOP                            ;   in Loop: Header=BB23_4 Depth=2
	JUMP	.LBB23_25
.LBB23_9 NOP                            ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 32(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_11
	JUMP	.LBB23_10
.LBB23_10 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB23_12
.LBB23_11 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB23_12
.LBB23_12 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_14
	JUMP	.LBB23_13
.LBB23_13 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	JUMP	.LBB23_25
.LBB23_14 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_16
	JUMP	.LBB23_15
.LBB23_15 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 256
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_17
	JUMP	.LBB23_16
.LBB23_16 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 12(%FP)
	CALLR	%GR6
	JUMP	.LBB23_21
.LBB23_17 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 260
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_19
	JUMP	.LBB23_18
.LBB23_18 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 40(%FP)
	LOAD	%GR2, 24(%FP)
	LOAD	%GR3, 20(%FP)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	LOAD	%GR2, 0(%GR2)
	CALLR	%GR6
	JUMP	.LBB23_20
.LBB23_19 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 24(%FP)
	LOAD	%GR2, 20(%FP)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	CALLR	%GR6
	JUMP	.LBB23_20
.LBB23_20 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	JUMP	.LBB23_21
.LBB23_21 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 32(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_23
	JUMP	.LBB23_22
.LBB23_22 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 28(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_24
	JUMP	.LBB23_23
.LBB23_23 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_1
.LBB23_24 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	JUMP	.LBB23_25
.LBB23_25 NOP                           ;   in Loop: Header=BB23_4 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB23_4
.LBB23_26 NOP 
	JUMP	.LBB23_28
.LBB23_27 NOP                           ; %.loopexit
	JUMP	.LBB23_28
.LBB23_28 NOP 
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end23 NOP 
	.size	__call_exitprocs, .Lfunc_end23-__call_exitprocs
                                        ; -- End function
	.type	_free_r,@function       ; -- Begin function _free_r
_free_r NOP                             ; @_free_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR1, 44(%FP)
	STORE	%GR2, 40(%FP)
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_2
	JUMP	.LBB24_1
.LBB24_1 NOP 
	JUMP	.LBB24_51
.LBB24_2 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	__malloc_lock
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 32(%FP)
	ANDI	%GR6, %GR6, -2
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 20(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_8
	JUMP	.LBB24_3
.LBB24_3 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	ULOADB	%GR6, 32(%FP)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB24_5
	JUMP	.LBB24_4
.LBB24_4 NOP 
	LOAD	%GR6, 36(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 12(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_5
.LBB24_5 NOP 
	LOAD	%GR6, 28(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 131072
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_7
	JUMP	.LBB24_6
.LBB24_6 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	_malloc_trim_r
	JUMP	.LBB24_7
.LBB24_7 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	__malloc_unlock
	JUMP	.LBB24_51
.LBB24_8 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 20(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 0(%FP)
	ULOADB	%GR6, 32(%FP)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB24_13
	JUMP	.LBB24_9
.LBB24_9 NOP 
	LOAD	%GR6, 36(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 12(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_av_+8
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_11
	JUMP	.LBB24_10
.LBB24_10 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 0(%FP)
	JUMP	.LBB24_12
.LBB24_11 NOP 
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_12
.LBB24_12 NOP 
	JUMP	.LBB24_13
.LBB24_13 NOP 
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 16(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB24_19
	JUMP	.LBB24_14
.LBB24_14 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_17
	JUMP	.LBB24_15
.LBB24_15 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_av_+8
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_17
	JUMP	.LBB24_16
.LBB24_16 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 36(%FP)
	COPYG	%GR1, __malloc_av_+20
	STORE	%GR6, 0(%GR1)
	COPYG	%GR1, __malloc_av_+16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 12
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 36(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB24_18
.LBB24_17 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_18
.LBB24_18 NOP 
	JUMP	.LBB24_19
.LBB24_19 NOP 
	LOAD	%GR6, 28(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 36(%FP)
	ADD	%GR1, %GR1, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_50
	JUMP	.LBB24_20
.LBB24_20 NOP 
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 511
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_22
	JUMP	.LBB24_21
.LBB24_21 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 3
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 2
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 24(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_49
.LBB24_22 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_24
	JUMP	.LBB24_23
.LBB24_23 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 3
	JUMP	.LBB24_40
.LBB24_24 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 4
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_26
	JUMP	.LBB24_25
.LBB24_25 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB24_39
.LBB24_26 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 20
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_28
	JUMP	.LBB24_27
.LBB24_27 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB24_38
.LBB24_28 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 84
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_30
	JUMP	.LBB24_29
.LBB24_29 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 12
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB24_37
.LBB24_30 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 340
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_32
	JUMP	.LBB24_31
.LBB24_31 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 15
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB24_36
.LBB24_32 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 1364
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_34
	JUMP	.LBB24_33
.LBB24_33 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 18
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB24_35
.LBB24_34 NOP 
	COPYI	%GR6, 126
	JUMP	.LBB24_35
.LBB24_35 NOP 
	JUMP	.LBB24_36
.LBB24_36 NOP 
	JUMP	.LBB24_37
.LBB24_37 NOP 
	JUMP	.LBB24_38
.LBB24_38 NOP 
	JUMP	.LBB24_39
.LBB24_39 NOP 
	JUMP	.LBB24_40
.LBB24_40 NOP 
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	SHLI	%GR6, %GR6, 3
	COPYG	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_42
	JUMP	.LBB24_41
.LBB24_41 NOP 
	LOAD	%GR6, 24(%FP)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 2
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	COPYG	%GR1, __malloc_av_+4
	LOAD	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_48
.LBB24_42 NOP 
	JUMP	.LBB24_43
.LBB24_43 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB24_45
	JUMP	.LBB24_44
.LBB24_44 NOP                           ;   in Loop: Header=BB24_43 Depth=1
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ULT	%GR6, %GR6, %GR1
	JUMP	.LBB24_45
.LBB24_45 NOP                           ;   in Loop: Header=BB24_43 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_47
	JUMP	.LBB24_46
.LBB24_46 NOP                           ;   in Loop: Header=BB24_43 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	JUMP	.LBB24_43
.LBB24_47 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB24_48
.LBB24_48 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 36(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_49
.LBB24_49 NOP 
	JUMP	.LBB24_50
.LBB24_50 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	__malloc_unlock
	JUMP	.LBB24_51
.LBB24_51 NOP 
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end24 NOP 
	.size	_free_r, .Lfunc_end24-_free_r
                                        ; -- End function
	.type	_malloc_trim_r,@function ; -- Begin function _malloc_trim_r
_malloc_trim_r NOP                      ; @_malloc_trim_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR1, 24(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	COPYI	%GR6, 4096
	STORE	%GR6, 0(%FP)
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_lock
	COPYG	%GR6, __malloc_av_+8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 20(%FP)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%FP)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -17
	UDIV	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	MUL	%GR6, %GR6, %GR1
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 0(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_2
	JUMP	.LBB25_1
.LBB25_1 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB25_9
.LBB25_2 NOP 
	LOAD	%GR1, 24(%FP)
	COPYI	%GR2, 0
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 16(%FP)
	ADD	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_4
	JUMP	.LBB25_3
.LBB25_3 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB25_9
.LBB25_4 NOP 
	LOAD	%GR1, 24(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR2, 0
	SUB	%GR2, %GR2, %GR6
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_8
	JUMP	.LBB25_5
.LBB25_5 NOP 
	LOAD	%GR1, 24(%FP)
	COPYI	%GR2, 0
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_7
	JUMP	.LBB25_6
.LBB25_6 NOP 
	LOAD	%GR6, 8(%FP)
	COPYG	%GR1, __malloc_sbrk_base
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	COPYG	%GR1, __malloc_current_mallinfo.0
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ORI	%GR6, %GR6, 1
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_7
.LBB25_7 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB25_9
.LBB25_8 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	SUB	%GR6, %GR6, %GR1
	ORI	%GR6, %GR6, 1
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	COPYG	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB25_9
.LBB25_9 NOP 
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end25 NOP 
	.size	_malloc_trim_r, .Lfunc_end25-_malloc_trim_r
                                        ; -- End function
	.globl	_exit                   ; -- Begin function _exit
	.type	_exit,@function
_exit NOP                               ; @_exit
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	;APP
	COPYR	%RT0, %GR1
      	OUTPUT	%GR1
      	HALT	
	;NO_APP
.Lfunc_end26 NOP 
	.size	_exit, .Lfunc_end26-_exit
                                        ; -- End function
	.type	_sbrk,@function         ; -- Begin function _sbrk
_sbrk NOP                               ; @_sbrk
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	;APP
	COPYR	%RT1, %HP
          	ADD	%HP, %HP, %GR1
	;NO_APP
	;APP
	COPYR	%GR6, %RT1
	;NO_APP
	COPYR	%RT0, %GR6
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end27 NOP 
	.size	_sbrk, .Lfunc_end27-_sbrk
                                        ; -- End function
	.globl	chmod                   ; -- Begin function chmod
	.type	chmod,@function
chmod NOP                               ; @chmod
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 12
	COPYR	%FP, %SP
	STORE	%GR1, 4(%FP)
	STORE	%GR2, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	COPYR	%TMP1, %GR2
	VMCALL	13
              
	;NO_APP
	;APP
	INPUT	%GR1
	;NO_APP
	COPYI	%GR6, -1
	NEQ	%GR2, %GR1, %GR6
	COPYI	%GR1, 0
	BNEQZ	%GR2, .LBB28_2
	JUMP	.LBB28_1
.LBB28_1 NOP 
	;APP
	INPUT	%GR1
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR1, 0(%GR2)
	COPYR	%GR1, %GR6
.LBB28_2 NOP 
	COPYR	%RT0, %GR1
	LOAD	%GR2, 0(%FP)
	LOAD	%GR1, 4(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 12
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end28 NOP 
	.size	chmod, .Lfunc_end28-chmod
                                        ; -- End function
	.type	b,@object               ; @b
	.local	b
	.comm	b,40400,4
	.type	a,@object               ; @a
	.local	a
	.comm	a,40400,4
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.zero	1
	.size	.L.str, 1

	.type	impure_data,@object     ; @impure_data
	.data
	.p2align	2
impure_data NOP 
	.long	0                       ; 0x0
	.long	impure_data+748
	.long	impure_data+852
	.long	impure_data+956
	.long	0                       ; 0x0
	.zero	25
	.zero	3
	.long	0                       ; 0x0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.zero	26
	.zero	2
	.zero	36
	.long	0                       ; 0x0
	.quad	1                       ; 0x1
	.short	13070                   ; 0x330e
	.short	43981                   ; 0xabcd
	.short	4660                    ; 0x1234
	.short	58989                   ; 0xe66d
	.short	57068                   ; 0xdeec
	.short	5                       ; 0x5
	.short	11                      ; 0xb
	.zero	2
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	24
	.long	0                       ; 0x0
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.zero	8
	.long	0                       ; 0x0
	.zero	36
	.long	0
	.zero	400
	.long	0
	.zero	12
	.zero	312
	.size	impure_data, 1060

	.type	__malloc_av_,@object    ; @__malloc_av_
	.p2align	2
__malloc_av_ NOP 
	.long	0
	.long	0
	.long	__malloc_av_
	.long	__malloc_av_
	.long	__malloc_av_+8
	.long	__malloc_av_+8
	.long	__malloc_av_+16
	.long	__malloc_av_+16
	.long	__malloc_av_+24
	.long	__malloc_av_+24
	.long	__malloc_av_+32
	.long	__malloc_av_+32
	.long	__malloc_av_+40
	.long	__malloc_av_+40
	.long	__malloc_av_+48
	.long	__malloc_av_+48
	.long	__malloc_av_+56
	.long	__malloc_av_+56
	.long	__malloc_av_+64
	.long	__malloc_av_+64
	.long	__malloc_av_+72
	.long	__malloc_av_+72
	.long	__malloc_av_+80
	.long	__malloc_av_+80
	.long	__malloc_av_+88
	.long	__malloc_av_+88
	.long	__malloc_av_+96
	.long	__malloc_av_+96
	.long	__malloc_av_+104
	.long	__malloc_av_+104
	.long	__malloc_av_+112
	.long	__malloc_av_+112
	.long	__malloc_av_+120
	.long	__malloc_av_+120
	.long	__malloc_av_+128
	.long	__malloc_av_+128
	.long	__malloc_av_+136
	.long	__malloc_av_+136
	.long	__malloc_av_+144
	.long	__malloc_av_+144
	.long	__malloc_av_+152
	.long	__malloc_av_+152
	.long	__malloc_av_+160
	.long	__malloc_av_+160
	.long	__malloc_av_+168
	.long	__malloc_av_+168
	.long	__malloc_av_+176
	.long	__malloc_av_+176
	.long	__malloc_av_+184
	.long	__malloc_av_+184
	.long	__malloc_av_+192
	.long	__malloc_av_+192
	.long	__malloc_av_+200
	.long	__malloc_av_+200
	.long	__malloc_av_+208
	.long	__malloc_av_+208
	.long	__malloc_av_+216
	.long	__malloc_av_+216
	.long	__malloc_av_+224
	.long	__malloc_av_+224
	.long	__malloc_av_+232
	.long	__malloc_av_+232
	.long	__malloc_av_+240
	.long	__malloc_av_+240
	.long	__malloc_av_+248
	.long	__malloc_av_+248
	.long	__malloc_av_+256
	.long	__malloc_av_+256
	.long	__malloc_av_+264
	.long	__malloc_av_+264
	.long	__malloc_av_+272
	.long	__malloc_av_+272
	.long	__malloc_av_+280
	.long	__malloc_av_+280
	.long	__malloc_av_+288
	.long	__malloc_av_+288
	.long	__malloc_av_+296
	.long	__malloc_av_+296
	.long	__malloc_av_+304
	.long	__malloc_av_+304
	.long	__malloc_av_+312
	.long	__malloc_av_+312
	.long	__malloc_av_+320
	.long	__malloc_av_+320
	.long	__malloc_av_+328
	.long	__malloc_av_+328
	.long	__malloc_av_+336
	.long	__malloc_av_+336
	.long	__malloc_av_+344
	.long	__malloc_av_+344
	.long	__malloc_av_+352
	.long	__malloc_av_+352
	.long	__malloc_av_+360
	.long	__malloc_av_+360
	.long	__malloc_av_+368
	.long	__malloc_av_+368
	.long	__malloc_av_+376
	.long	__malloc_av_+376
	.long	__malloc_av_+384
	.long	__malloc_av_+384
	.long	__malloc_av_+392
	.long	__malloc_av_+392
	.long	__malloc_av_+400
	.long	__malloc_av_+400
	.long	__malloc_av_+408
	.long	__malloc_av_+408
	.long	__malloc_av_+416
	.long	__malloc_av_+416
	.long	__malloc_av_+424
	.long	__malloc_av_+424
	.long	__malloc_av_+432
	.long	__malloc_av_+432
	.long	__malloc_av_+440
	.long	__malloc_av_+440
	.long	__malloc_av_+448
	.long	__malloc_av_+448
	.long	__malloc_av_+456
	.long	__malloc_av_+456
	.long	__malloc_av_+464
	.long	__malloc_av_+464
	.long	__malloc_av_+472
	.long	__malloc_av_+472
	.long	__malloc_av_+480
	.long	__malloc_av_+480
	.long	__malloc_av_+488
	.long	__malloc_av_+488
	.long	__malloc_av_+496
	.long	__malloc_av_+496
	.long	__malloc_av_+504
	.long	__malloc_av_+504
	.long	__malloc_av_+512
	.long	__malloc_av_+512
	.long	__malloc_av_+520
	.long	__malloc_av_+520
	.long	__malloc_av_+528
	.long	__malloc_av_+528
	.long	__malloc_av_+536
	.long	__malloc_av_+536
	.long	__malloc_av_+544
	.long	__malloc_av_+544
	.long	__malloc_av_+552
	.long	__malloc_av_+552
	.long	__malloc_av_+560
	.long	__malloc_av_+560
	.long	__malloc_av_+568
	.long	__malloc_av_+568
	.long	__malloc_av_+576
	.long	__malloc_av_+576
	.long	__malloc_av_+584
	.long	__malloc_av_+584
	.long	__malloc_av_+592
	.long	__malloc_av_+592
	.long	__malloc_av_+600
	.long	__malloc_av_+600
	.long	__malloc_av_+608
	.long	__malloc_av_+608
	.long	__malloc_av_+616
	.long	__malloc_av_+616
	.long	__malloc_av_+624
	.long	__malloc_av_+624
	.long	__malloc_av_+632
	.long	__malloc_av_+632
	.long	__malloc_av_+640
	.long	__malloc_av_+640
	.long	__malloc_av_+648
	.long	__malloc_av_+648
	.long	__malloc_av_+656
	.long	__malloc_av_+656
	.long	__malloc_av_+664
	.long	__malloc_av_+664
	.long	__malloc_av_+672
	.long	__malloc_av_+672
	.long	__malloc_av_+680
	.long	__malloc_av_+680
	.long	__malloc_av_+688
	.long	__malloc_av_+688
	.long	__malloc_av_+696
	.long	__malloc_av_+696
	.long	__malloc_av_+704
	.long	__malloc_av_+704
	.long	__malloc_av_+712
	.long	__malloc_av_+712
	.long	__malloc_av_+720
	.long	__malloc_av_+720
	.long	__malloc_av_+728
	.long	__malloc_av_+728
	.long	__malloc_av_+736
	.long	__malloc_av_+736
	.long	__malloc_av_+744
	.long	__malloc_av_+744
	.long	__malloc_av_+752
	.long	__malloc_av_+752
	.long	__malloc_av_+760
	.long	__malloc_av_+760
	.long	__malloc_av_+768
	.long	__malloc_av_+768
	.long	__malloc_av_+776
	.long	__malloc_av_+776
	.long	__malloc_av_+784
	.long	__malloc_av_+784
	.long	__malloc_av_+792
	.long	__malloc_av_+792
	.long	__malloc_av_+800
	.long	__malloc_av_+800
	.long	__malloc_av_+808
	.long	__malloc_av_+808
	.long	__malloc_av_+816
	.long	__malloc_av_+816
	.long	__malloc_av_+824
	.long	__malloc_av_+824
	.long	__malloc_av_+832
	.long	__malloc_av_+832
	.long	__malloc_av_+840
	.long	__malloc_av_+840
	.long	__malloc_av_+848
	.long	__malloc_av_+848
	.long	__malloc_av_+856
	.long	__malloc_av_+856
	.long	__malloc_av_+864
	.long	__malloc_av_+864
	.long	__malloc_av_+872
	.long	__malloc_av_+872
	.long	__malloc_av_+880
	.long	__malloc_av_+880
	.long	__malloc_av_+888
	.long	__malloc_av_+888
	.long	__malloc_av_+896
	.long	__malloc_av_+896
	.long	__malloc_av_+904
	.long	__malloc_av_+904
	.long	__malloc_av_+912
	.long	__malloc_av_+912
	.long	__malloc_av_+920
	.long	__malloc_av_+920
	.long	__malloc_av_+928
	.long	__malloc_av_+928
	.long	__malloc_av_+936
	.long	__malloc_av_+936
	.long	__malloc_av_+944
	.long	__malloc_av_+944
	.long	__malloc_av_+952
	.long	__malloc_av_+952
	.long	__malloc_av_+960
	.long	__malloc_av_+960
	.long	__malloc_av_+968
	.long	__malloc_av_+968
	.long	__malloc_av_+976
	.long	__malloc_av_+976
	.long	__malloc_av_+984
	.long	__malloc_av_+984
	.long	__malloc_av_+992
	.long	__malloc_av_+992
	.long	__malloc_av_+1000
	.long	__malloc_av_+1000
	.long	__malloc_av_+1008
	.long	__malloc_av_+1008
	.long	__malloc_av_+1016
	.long	__malloc_av_+1016
	.size	__malloc_av_, 1032

	.type	__malloc_sbrk_base,@object ; @__malloc_sbrk_base
	.p2align	2
__malloc_sbrk_base NOP 
	.long	4294967295
	.size	__malloc_sbrk_base, 4

	.type	__malloc_max_sbrked_mem,@object ; @__malloc_max_sbrked_mem
	.local	__malloc_max_sbrked_mem
	.comm	__malloc_max_sbrked_mem,4,4
	.type	__malloc_max_total_mem,@object ; @__malloc_max_total_mem
	.local	__malloc_max_total_mem
	.comm	__malloc_max_total_mem,4,4
	.type	errno,@object           ; @errno
	.comm	errno,4,4
	.type	__malloc_current_mallinfo.0,@object ; @__malloc_current_mallinfo.0
	.local	__malloc_current_mallinfo.0
	.comm	__malloc_current_mallinfo.0,4,4
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.ident	"Ubuntu clang version 10.0.1-++20211003085942+ef32c611aa21-1~exp1~20211003090334.2"
	.note.GNU-stack
