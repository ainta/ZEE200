	.text
	.file	"ld-temp.o"
	.type	fib,@function           ; -- Begin function fib
fib NOP                                 ; @fib
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP 
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_3
	JUMP	.LBB0_2
.LBB0_2 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB0_4
.LBB0_3 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, -1
	CALL	fib
	COPYR	%GR2, %RT0
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, -2
	CALL	fib
	COPYR	%GR6, %RT0
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 12(%FP)
	JUMP	.LBB0_4
.LBB0_4 NOP 
	LOAD	%GR6, 12(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end0 NOP 
	.size	fib, .Lfunc_end0-fib
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
	ADDI	%GR6, %SP, 4
	ADDI	%GR1, %FP, 12
	STORE	%GR1, 0(%GR6)
	COPYG	%GR6, .L.str
	STORE	%GR6, 0(%SP)
	CALL	scanf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR1, 12(%FP)
	CALL	fib
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 6765
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_2
	JUMP	.LBB1_1
.LBB1_1 NOP 
	;APP
	CALL Proof
	;NO_APP
	JUMP	.LBB1_3
.LBB1_2 NOP 
	;APP
	CALL Cheat
	;NO_APP
	JUMP	.LBB1_3
.LBB1_3 NOP 
	LOAD	%GR6, 16(%FP)
	COPYR	%RT0, %GR6
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
	COPYG	%GR2, .L.str.59
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
                                        ; kill: def $gr6 killed $rt0
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
	COPYG	%GR6, impure_data
	COPYR	%RT0, %GR6
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
	.globl	scanf                   ; -- Begin function scanf
	.type	scanf,@function
scanf NOP                               ; @scanf
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	LOAD	%GR6, 48(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	COPYG	%GR6, impure_data
	STORE	%GR6, 12(%FP)
	ADDI	%GR6, %FP, 52
	STORE	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR6, %GR1, 4
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 48(%FP)
	LOAD	%GR4, 16(%FP)
	CALL	_vfscanf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end21 NOP 
	.size	scanf, .Lfunc_end21-scanf
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
	BNEQZ	%GR6, .LBB22_5
	JUMP	.LBB22_1
.LBB22_1 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
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
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB22_2
.LBB22_4 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB22_5
.LBB22_5 NOP 
	JUMP	.LBB22_6
.LBB22_6 NOP                            ; =>This Inner Loop Header: Depth=1
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
	BNEQZ	%GR6, .LBB22_8
	JUMP	.LBB22_7
.LBB22_7 NOP                            ;   in Loop: Header=BB22_6 Depth=1
	JUMP	.LBB22_6
.LBB22_8 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%FP)
	LOAD	%GR1, 28(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 36
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end22 NOP 
	.size	strcpy, .Lfunc_end22-strcpy
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
	BNEQZ	%GR6, .LBB23_5
	JUMP	.LBB23_1
.LBB23_1 NOP 
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB23_2
.LBB23_2 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, -16843009
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR1, %GR6
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_4
	JUMP	.LBB23_3
.LBB23_3 NOP                            ;   in Loop: Header=BB23_2 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 0(%FP)
	JUMP	.LBB23_2
.LBB23_4 NOP 
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB23_5
.LBB23_5 NOP 
	JUMP	.LBB23_6
.LBB23_6 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_8
	JUMP	.LBB23_7
.LBB23_7 NOP                            ;   in Loop: Header=BB23_6 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB23_6
.LBB23_8 NOP 
	JUMP	.LBB23_9
.LBB23_9 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR1, 8(%FP)
	ADDI	%GR6, %GR1, -1
	STORE	%GR6, 8(%FP)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB23_11
	JUMP	.LBB23_10
.LBB23_10 NOP                           ;   in Loop: Header=BB23_9 Depth=1
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
	JUMP	.LBB23_11
.LBB23_11 NOP                           ;   in Loop: Header=BB23_9 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_15
	JUMP	.LBB23_12
.LBB23_12 NOP                           ;   in Loop: Header=BB23_9 Depth=1
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_14
	JUMP	.LBB23_13
.LBB23_13 NOP                           ;   in Loop: Header=BB23_9 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB23_14
.LBB23_14 NOP                           ;   in Loop: Header=BB23_9 Depth=1
	JUMP	.LBB23_9
.LBB23_15 NOP 
	LOAD	%GR6, 4(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 20(%FP)
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end23 NOP 
	.size	strncat, .Lfunc_end23-strncat
                                        ; -- End function
	.globl	vfscanf                 ; -- Begin function vfscanf
	.type	vfscanf,@function
vfscanf NOP                             ; @vfscanf
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	COPYG	%GR6, impure_data
	STORE	%GR6, 8(%FP)
	JUMP	.LBB24_1
.LBB24_1 NOP 
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_4
	JUMP	.LBB24_2
.LBB24_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_4
	JUMP	.LBB24_3
.LBB24_3 NOP 
	LOAD	%GR1, 4(%FP)
	CALL	__sinit
	JUMP	.LBB24_4
.LBB24_4 NOP 
	JUMP	.LBB24_5
.LBB24_5 NOP 
	LOAD	%GR1, 8(%FP)
	LOAD	%GR2, 20(%FP)
	LOAD	%GR3, 16(%FP)
	LOAD	%GR4, 12(%FP)
	CALL	__svfscanf_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end24 NOP 
	.size	vfscanf, .Lfunc_end24-vfscanf
                                        ; -- End function
	.type	__svfscanf_r,@function  ; -- Begin function __svfscanf_r
__svfscanf_r NOP                        ; @__svfscanf_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 480
	COPYR	%FP, %SP
	STORE	%RA, 472(%FP)
	STORE	%GR1, 468(%FP)
	STORE	%GR2, 464(%FP)
	STORE	%GR3, 460(%FP)
	STORE	%GR4, 456(%FP)
	STORE	%GR5, 452(%FP)
	STORE	%GR1, 448(%FP)
	STORE	%GR2, 444(%FP)
	STORE	%GR3, 440(%FP)
	STORE	%GR4, 436(%FP)
	LOAD	%GR6, 440(%FP)
	STORE	%GR6, 432(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 396(%FP)
	COPYI	%GR1, 1
	STORE	%GR1, 392(%FP)
	STORE	%GR6, 380(%FP)
	STORE	%GR6, 376(%FP)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB25_5
	JUMP	.LBB25_1
.LBB25_1 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_3
	JUMP	.LBB25_2
.LBB25_2 NOP 
	JUMP	.LBB25_4
.LBB25_3 NOP 
	JUMP	.LBB25_4
.LBB25_4 NOP 
	JUMP	.LBB25_5
.LBB25_5 NOP 
	JUMP	.LBB25_6
.LBB25_6 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_8
	JUMP	.LBB25_7
.LBB25_7 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 100
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_8
.LBB25_8 NOP 
	JUMP	.LBB25_9
.LBB25_9 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 404(%FP)
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_10
.LBB25_10 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB25_25 Depth 2
                                        ;     Child Loop BB25_100 Depth 2
                                        ;     Child Loop BB25_300 Depth 2
                                        ;     Child Loop BB25_286 Depth 2
                                        ;     Child Loop BB25_276 Depth 2
                                        ;     Child Loop BB25_240 Depth 2
                                        ;     Child Loop BB25_255 Depth 2
                                        ;     Child Loop BB25_218 Depth 2
                                        ;     Child Loop BB25_204 Depth 2
                                        ;     Child Loop BB25_170 Depth 2
                                        ;     Child Loop BB25_183 Depth 2
                                        ;     Child Loop BB25_149 Depth 2
                                        ;     Child Loop BB25_119 Depth 2
                                        ;     Child Loop BB25_46 Depth 2
                                        ;     Child Loop BB25_15 Depth 2
	LOAD	%GR6, 432(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 388(%FP)
	LOAD	%GR6, 392(%FP)
	LOAD	%GR1, 432(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 432(%FP)
	LOAD	%GR6, 388(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_12
	JUMP	.LBB25_11
.LBB25_11 NOP 
	JUMP	.LBB25_368
.LBB25_12 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 392(%FP)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_22
	JUMP	.LBB25_13
.LBB25_13 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 388(%FP)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_22
	JUMP	.LBB25_14
.LBB25_14 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_15
.LBB25_15 NOP                           ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_17
	JUMP	.LBB25_16
.LBB25_16 NOP                           ;   in Loop: Header=BB25_15 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_18
	JUMP	.LBB25_17
.LBB25_17 NOP                           ;   in Loop: Header=BB25_15 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_19
	JUMP	.LBB25_18
.LBB25_18 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_20
.LBB25_19 NOP                           ;   in Loop: Header=BB25_15 Depth=2
	LOAD	%GR6, 400(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_15
.LBB25_20 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_21 NOP                           ; %.backedge11
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_10
.LBB25_22 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 388(%FP)
	COPYI	%GR1, 37
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_24
	JUMP	.LBB25_23
.LBB25_23 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_45
.LBB25_24 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 424(%FP)
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_25
.LBB25_25 NOP                           ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 432(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 432(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 428(%FP)
	LOAD	%GR6, 428(%FP)
	COPYI	%GR1, 37
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_44
	JUMP	.LBB25_26
.LBB25_26 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 42
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_55
	JUMP	.LBB25_27
.LBB25_27 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ADDI	%GR1, %GR6, -48
	COPYI	%GR2, 10
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB25_69
	JUMP	.LBB25_28
.LBB25_28 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 68
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_72
	JUMP	.LBB25_29
.LBB25_29 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 76
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_63
	JUMP	.LBB25_30
.LBB25_30 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 79
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_76
	JUMP	.LBB25_31
.LBB25_31 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 88
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_80
	JUMP	.LBB25_32
.LBB25_32 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 91
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_82
	JUMP	.LBB25_33
.LBB25_33 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 99
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_83
	JUMP	.LBB25_34
.LBB25_34 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 100
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_73
	JUMP	.LBB25_35
.LBB25_35 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 104
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_66
	JUMP	.LBB25_36
.LBB25_36 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 105
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_75
	JUMP	.LBB25_37
.LBB25_37 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	COPYI	%GR1, 108
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_60
	JUMP	.LBB25_38
.LBB25_38 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 110
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_85
	JUMP	.LBB25_39
.LBB25_39 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 111
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_77
	JUMP	.LBB25_40
.LBB25_40 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 112
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_84
	JUMP	.LBB25_41
.LBB25_41 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 115
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_81
	JUMP	.LBB25_42
.LBB25_42 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 117
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_79
	JUMP	.LBB25_43
.LBB25_43 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 120
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_80
	JUMP	.LBB25_94
.LBB25_44 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_45
.LBB25_45 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 432(%FP)
	LOAD	%GR1, 392(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 76(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_46
.LBB25_46 NOP                           ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 392(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_54
	JUMP	.LBB25_47
.LBB25_47 NOP                           ;   in Loop: Header=BB25_46 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_50
	JUMP	.LBB25_48
.LBB25_48 NOP                           ;   in Loop: Header=BB25_46 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_50
	JUMP	.LBB25_49
.LBB25_49 NOP 
	JUMP	.LBB25_362
.LBB25_50 NOP                           ;   in Loop: Header=BB25_46 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 76(%FP)
	ULOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_52
	JUMP	.LBB25_51
.LBB25_51 NOP 
	JUMP	.LBB25_367
.LBB25_52 NOP                           ;   in Loop: Header=BB25_46 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 400(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 76(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 76(%FP)
	JUMP	.LBB25_53
.LBB25_53 NOP                           ;   in Loop: Header=BB25_46 Depth=2
	LOAD	%GR6, 416(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_46
.LBB25_54 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_55 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 159
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_57
	JUMP	.LBB25_56
.LBB25_56 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_58
	JUMP	.LBB25_57
.LBB25_57 NOP 
	JUMP	.LBB25_367
.LBB25_58 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_59
.LBB25_59 NOP                           ; %.backedge
                                        ;   in Loop: Header=BB25_25 Depth=2
	JUMP	.LBB25_25
.LBB25_60 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 15
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_62
	JUMP	.LBB25_61
.LBB25_61 NOP 
	JUMP	.LBB25_367
.LBB25_62 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 1
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_59
.LBB25_63 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 15
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_65
	JUMP	.LBB25_64
.LBB25_64 NOP 
	JUMP	.LBB25_367
.LBB25_65 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 2
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_59
.LBB25_66 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 15
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_68
	JUMP	.LBB25_67
.LBB25_67 NOP 
	JUMP	.LBB25_367
.LBB25_68 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_59
.LBB25_69 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 143
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_71
	JUMP	.LBB25_70
.LBB25_70 NOP 
	JUMP	.LBB25_367
.LBB25_71 NOP                           ;   in Loop: Header=BB25_25 Depth=2
	LOAD	%GR6, 424(%FP)
	MULI	%GR6, %GR6, 10
	LOAD	%GR1, 428(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_59
.LBB25_72 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 1
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_74
.LBB25_73 NOP                           ; %.loopexit9
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_74
.LBB25_74 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtol_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 10
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_75 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtol_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_76 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 1
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_78
.LBB25_77 NOP                           ; %.loopexit10
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_78
.LBB25_78 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtoul_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 8
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_79 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtoul_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 10
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_80 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 512
	STORE	%GR6, 412(%FP)
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtoul_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 16
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_81 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 2
	STORE	%GR6, 428(%FP)
	JUMP	.LBB25_95
.LBB25_82 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR2, 432(%FP)
	ADDI	%GR1, %FP, 120
	CALL	__sccl
	COPYR	%GR6, %RT0
	STORE	%GR6, 432(%FP)
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 64
	STORE	%GR6, 412(%FP)
	COPYI	%GR6, 1
	STORE	%GR6, 428(%FP)
	JUMP	.LBB25_95
.LBB25_83 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 64
	STORE	%GR6, 412(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 428(%FP)
	JUMP	.LBB25_95
.LBB25_84 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 544
	STORE	%GR6, 412(%FP)
	COPYI	%GR6, 3
	STORE	%GR6, 428(%FP)
	COPYG	%GR6, _strtoul_r
	STORE	%GR6, 376(%FP)
	COPYI	%GR6, 16
	STORE	%GR6, 396(%FP)
	JUMP	.LBB25_95
.LBB25_85 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_87
	JUMP	.LBB25_86
.LBB25_86 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_87 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_89
	JUMP	.LBB25_88
.LBB25_88 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 68(%FP)
	LOAD	%GR6, 400(%FP)
	LOAD	%GR1, 68(%FP)
	STOREH	%GR6, 0(%GR1)
	JUMP	.LBB25_93
.LBB25_89 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_91
	JUMP	.LBB25_90
.LBB25_90 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 60(%FP)
	LOAD	%GR6, 400(%FP)
	LOAD	%GR1, 60(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_92
.LBB25_91 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 64(%FP)
	LOAD	%GR6, 400(%FP)
	LOAD	%GR1, 64(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_92
.LBB25_92 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_93
.LBB25_93 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_94 NOP 
	JUMP	.LBB25_367
.LBB25_95 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_98
	JUMP	.LBB25_96
.LBB25_96 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_98
	JUMP	.LBB25_97
.LBB25_97 NOP 
	JUMP	.LBB25_362
.LBB25_98 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_108
	JUMP	.LBB25_99
.LBB25_99 NOP                           ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_100
.LBB25_100 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_107
	JUMP	.LBB25_101
.LBB25_101 NOP                          ;   in Loop: Header=BB25_100 Depth=2
	LOAD	%GR6, 400(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_103
	JUMP	.LBB25_102
.LBB25_102 NOP                          ;   in Loop: Header=BB25_100 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_106
.LBB25_103 NOP                          ;   in Loop: Header=BB25_100 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_105
	JUMP	.LBB25_104
.LBB25_104 NOP 
	JUMP	.LBB25_362
.LBB25_105 NOP                          ;   in Loop: Header=BB25_100 Depth=2
	JUMP	.LBB25_106
.LBB25_106 NOP                          ;   in Loop: Header=BB25_100 Depth=2
	JUMP	.LBB25_100
.LBB25_107 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_108
.LBB25_108 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 428(%FP)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_112
	JUMP	.LBB25_109
.LBB25_109 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_163
	JUMP	.LBB25_110
.LBB25_110 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 2
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_233
	JUMP	.LBB25_111
.LBB25_111 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR1, 3
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_297
	JUMP	.LBB25_361
.LBB25_112 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_114
	JUMP	.LBB25_113
.LBB25_113 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_114
.LBB25_114 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_147
	JUMP	.LBB25_115
.LBB25_115 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_117
	JUMP	.LBB25_116
.LBB25_116 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_118
.LBB25_117 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_118
.LBB25_118 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_119
.LBB25_119 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_143
	JUMP	.LBB25_120
.LBB25_120 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR1, 416(%FP)
	CALL	__locale_mb_cur_max
	COPYR	%GR6, %RT0
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_122
	JUMP	.LBB25_121
.LBB25_121 NOP 
	JUMP	.LBB25_362
.LBB25_122 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 416(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 416(%FP)
	ADDI	%GR2, %FP, 80
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_124
	JUMP	.LBB25_123
.LBB25_123 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_125
	JUMP	.LBB25_124
.LBB25_124 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	ADDI	%GR1, %FP, 48
	COPYI	%GR2, 0
	COPYI	%GR3, 8
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_125
.LBB25_125 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 384(%FP)
	LOAD	%GR4, 416(%FP)
	ADDI	%GR3, %FP, 80
	ADDI	%GR5, %FP, 48
	CALL	_mbrtowc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 380(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_127
	JUMP	.LBB25_126
.LBB25_126 NOP 
	JUMP	.LBB25_362
.LBB25_127 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_130
	JUMP	.LBB25_128
.LBB25_128 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_130
	JUMP	.LBB25_129
.LBB25_129 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 384(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_130
.LBB25_130 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, -2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_137
	JUMP	.LBB25_131
.LBB25_131 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_133
	JUMP	.LBB25_132
.LBB25_132 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_134
	JUMP	.LBB25_133
.LBB25_133 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_134
.LBB25_134 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_136
	JUMP	.LBB25_135
.LBB25_135 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 384(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_136
.LBB25_136 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_137
.LBB25_137 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_142
	JUMP	.LBB25_138
.LBB25_138 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_142
	JUMP	.LBB25_139
.LBB25_139 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_141
	JUMP	.LBB25_140
.LBB25_140 NOP 
	JUMP	.LBB25_362
.LBB25_141 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_144
.LBB25_142 NOP                          ;   in Loop: Header=BB25_119 Depth=2
	JUMP	.LBB25_119
.LBB25_143 NOP                          ; %.loopexit
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_144
.LBB25_144 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_146
	JUMP	.LBB25_145
.LBB25_145 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_146
.LBB25_146 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_162
.LBB25_147 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_158
	JUMP	.LBB25_148
.LBB25_148 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 44(%FP)
	JUMP	.LBB25_149
.LBB25_149 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 416(%FP)
	LOAD	%GR1, 424(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_155
	JUMP	.LBB25_150
.LBB25_150 NOP                          ;   in Loop: Header=BB25_149 Depth=2
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 424(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 424(%FP)
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 444(%FP)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_154
	JUMP	.LBB25_151
.LBB25_151 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_153
	JUMP	.LBB25_152
.LBB25_152 NOP 
	JUMP	.LBB25_362
.LBB25_153 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_157
.LBB25_154 NOP                          ;   in Loop: Header=BB25_149 Depth=2
	JUMP	.LBB25_156
.LBB25_155 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 424(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 424(%FP)
	LOAD	%GR1, 444(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 424(%FP)
	LOAD	%GR1, 444(%FP)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_157
.LBB25_156 NOP                          ;   in Loop: Header=BB25_149 Depth=2
	JUMP	.LBB25_149
.LBB25_157 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_161
.LBB25_158 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 420(%FP)
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 420(%FP)
	LOAD	%GR4, 424(%FP)
	LOAD	%GR5, 444(%FP)
	COPYI	%GR3, 1
	CALL	_fread_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_160
	JUMP	.LBB25_159
.LBB25_159 NOP 
	JUMP	.LBB25_362
.LBB25_160 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_161
.LBB25_161 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_162
.LBB25_162 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_361
.LBB25_163 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_165
	JUMP	.LBB25_164
.LBB25_164 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_165
.LBB25_165 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_202
	JUMP	.LBB25_166
.LBB25_166 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_168
	JUMP	.LBB25_167
.LBB25_167 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ADDI	%GR6, %FP, 388
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_169
.LBB25_168 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_169
.LBB25_169 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_170
.LBB25_170 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_198
	JUMP	.LBB25_171
.LBB25_171 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR1, 416(%FP)
	CALL	__locale_mb_cur_max
	COPYR	%GR6, %RT0
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_173
	JUMP	.LBB25_172
.LBB25_172 NOP 
	JUMP	.LBB25_362
.LBB25_173 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 416(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 416(%FP)
	ADDI	%GR2, %FP, 80
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_175
	JUMP	.LBB25_174
.LBB25_174 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_176
	JUMP	.LBB25_175
.LBB25_175 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	ADDI	%GR1, %FP, 32
	COPYI	%GR2, 0
	COPYI	%GR3, 8
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_176
.LBB25_176 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 384(%FP)
	LOAD	%GR4, 416(%FP)
	ADDI	%GR3, %FP, 80
	ADDI	%GR5, %FP, 32
	CALL	_mbrtowc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 380(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_178
	JUMP	.LBB25_177
.LBB25_177 NOP 
	JUMP	.LBB25_362
.LBB25_178 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_180
	JUMP	.LBB25_179
.LBB25_179 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 384(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_180
.LBB25_180 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, -2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_192
	JUMP	.LBB25_181
.LBB25_181 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR6, 384(%FP)
	LOAD	%GR2, 0(%GR6)
	CALL	__wctob
	COPYR	%GR6, %RT0
	ADDI	%GR1, %FP, 120
	ADD	%GR6, %GR1, %GR6
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_186
	JUMP	.LBB25_182
.LBB25_182 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_183
.LBB25_183 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_185
	JUMP	.LBB25_184
.LBB25_184 NOP                          ;   in Loop: Header=BB25_183 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR6, 416(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 416(%FP)
	ADDI	%GR2, %FP, 80
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	LOAD	%GR3, 444(%FP)
	CALL	_ungetc_r
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_183
.LBB25_185 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_199
.LBB25_186 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_188
	JUMP	.LBB25_187
.LBB25_187 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_189
	JUMP	.LBB25_188
.LBB25_188 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_189
.LBB25_189 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_191
	JUMP	.LBB25_190
.LBB25_190 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 384(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_191
.LBB25_191 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_192
.LBB25_192 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_197
	JUMP	.LBB25_193
.LBB25_193 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_197
	JUMP	.LBB25_194
.LBB25_194 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_196
	JUMP	.LBB25_195
.LBB25_195 NOP 
	JUMP	.LBB25_362
.LBB25_196 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_199
.LBB25_197 NOP                          ;   in Loop: Header=BB25_170 Depth=2
	JUMP	.LBB25_170
.LBB25_198 NOP                          ; %.loopexit1
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_199
.LBB25_199 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_201
	JUMP	.LBB25_200
.LBB25_200 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 384(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_201
.LBB25_201 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_232
.LBB25_202 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_217
	JUMP	.LBB25_203
.LBB25_203 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_204
.LBB25_204 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	ADDI	%GR1, %FP, 120
	ADD	%GR6, %GR1, %GR6
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_213
	JUMP	.LBB25_205
.LBB25_205 NOP                          ;   in Loop: Header=BB25_204 Depth=2
	LOAD	%GR6, 416(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 416(%FP)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_207
	JUMP	.LBB25_206
.LBB25_206 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_214
.LBB25_207 NOP                          ;   in Loop: Header=BB25_204 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_212
	JUMP	.LBB25_208
.LBB25_208 NOP                          ;   in Loop: Header=BB25_204 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_212
	JUMP	.LBB25_209
.LBB25_209 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_211
	JUMP	.LBB25_210
.LBB25_210 NOP 
	JUMP	.LBB25_362
.LBB25_211 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_214
.LBB25_212 NOP                          ;   in Loop: Header=BB25_204 Depth=2
	JUMP	.LBB25_204
.LBB25_213 NOP                          ; %.loopexit2
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_214
.LBB25_214 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_216
	JUMP	.LBB25_215
.LBB25_215 NOP 
	JUMP	.LBB25_367
.LBB25_216 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_231
.LBB25_217 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 420(%FP)
	STORE	%GR6, 408(%FP)
	JUMP	.LBB25_218
.LBB25_218 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	ADDI	%GR1, %FP, 120
	ADD	%GR6, %GR1, %GR6
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_227
	JUMP	.LBB25_219
.LBB25_219 NOP                          ;   in Loop: Header=BB25_218 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 0(%GR6)
	ULOADB	%GR6, 0(%GR1)
	LOAD	%GR1, 420(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 420(%FP)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_221
	JUMP	.LBB25_220
.LBB25_220 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_228
.LBB25_221 NOP                          ;   in Loop: Header=BB25_218 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_226
	JUMP	.LBB25_222
.LBB25_222 NOP                          ;   in Loop: Header=BB25_218 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_226
	JUMP	.LBB25_223
.LBB25_223 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	LOAD	%GR1, 408(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_225
	JUMP	.LBB25_224
.LBB25_224 NOP 
	JUMP	.LBB25_362
.LBB25_225 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_228
.LBB25_226 NOP                          ;   in Loop: Header=BB25_218 Depth=2
	JUMP	.LBB25_218
.LBB25_227 NOP                          ; %.loopexit3
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_228
.LBB25_228 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	LOAD	%GR1, 408(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 416(%FP)
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_230
	JUMP	.LBB25_229
.LBB25_229 NOP 
	JUMP	.LBB25_367
.LBB25_230 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_231
.LBB25_231 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_232
.LBB25_232 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_361
.LBB25_233 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_235
	JUMP	.LBB25_234
.LBB25_234 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_235
.LBB25_235 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_274
	JUMP	.LBB25_236
.LBB25_236 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_238
	JUMP	.LBB25_237
.LBB25_237 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ADDI	%GR6, %FP, 388
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_239
.LBB25_238 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_239
.LBB25_239 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_240
.LBB25_240 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR1, %GR6, 8
	COPYI	%GR6, 0
	NEQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB25_242
	JUMP	.LBB25_241
.LBB25_241 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB25_242
.LBB25_242 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_270
	JUMP	.LBB25_243
.LBB25_243 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR1, 416(%FP)
	CALL	__locale_mb_cur_max
	COPYR	%GR6, %RT0
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_245
	JUMP	.LBB25_244
.LBB25_244 NOP 
	JUMP	.LBB25_362
.LBB25_245 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 416(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 416(%FP)
	ADDI	%GR2, %FP, 80
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_247
	JUMP	.LBB25_246
.LBB25_246 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_248
	JUMP	.LBB25_247
.LBB25_247 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	ADDI	%GR1, %FP, 24
	COPYI	%GR2, 0
	COPYI	%GR3, 8
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_248
.LBB25_248 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 384(%FP)
	LOAD	%GR4, 416(%FP)
	ADDI	%GR3, %FP, 80
	ADDI	%GR5, %FP, 24
	CALL	_mbrtowc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 380(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_250
	JUMP	.LBB25_249
.LBB25_249 NOP 
	JUMP	.LBB25_362
.LBB25_250 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_252
	JUMP	.LBB25_251
.LBB25_251 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 384(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_252
.LBB25_252 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, -2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_264
	JUMP	.LBB25_253
.LBB25_253 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 384(%FP)
	LOAD	%GR1, 0(%GR6)
	CALL	iswspace
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_258
	JUMP	.LBB25_254
.LBB25_254 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_255
.LBB25_255 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_257
	JUMP	.LBB25_256
.LBB25_256 NOP                          ;   in Loop: Header=BB25_255 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR6, 416(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 416(%FP)
	ADDI	%GR2, %FP, 80
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	LOAD	%GR3, 444(%FP)
	CALL	_ungetc_r
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_255
.LBB25_257 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_271
.LBB25_258 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 380(%FP)
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_260
	JUMP	.LBB25_259
.LBB25_259 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_261
	JUMP	.LBB25_260
.LBB25_260 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_261
.LBB25_261 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_263
	JUMP	.LBB25_262
.LBB25_262 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 384(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 384(%FP)
	JUMP	.LBB25_263
.LBB25_263 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_264
.LBB25_264 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_269
	JUMP	.LBB25_265
.LBB25_265 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_269
	JUMP	.LBB25_266
.LBB25_266 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_268
	JUMP	.LBB25_267
.LBB25_267 NOP 
	JUMP	.LBB25_362
.LBB25_268 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_271
.LBB25_269 NOP                          ;   in Loop: Header=BB25_240 Depth=2
	JUMP	.LBB25_240
.LBB25_270 NOP                          ; %.loopexit4
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_271
.LBB25_271 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_273
	JUMP	.LBB25_272
.LBB25_272 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 384(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_273
.LBB25_273 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_296
.LBB25_274 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_285
	JUMP	.LBB25_275
.LBB25_275 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 416(%FP)
	JUMP	.LBB25_276
.LBB25_276 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_283
	JUMP	.LBB25_277
.LBB25_277 NOP                          ;   in Loop: Header=BB25_276 Depth=2
	LOAD	%GR6, 416(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 416(%FP)
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_279
	JUMP	.LBB25_278
.LBB25_278 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_284
.LBB25_279 NOP                          ;   in Loop: Header=BB25_276 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_282
	JUMP	.LBB25_280
.LBB25_280 NOP                          ;   in Loop: Header=BB25_276 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_282
	JUMP	.LBB25_281
.LBB25_281 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_284
.LBB25_282 NOP                          ;   in Loop: Header=BB25_276 Depth=2
	JUMP	.LBB25_276
.LBB25_283 NOP                          ; %.loopexit5
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_284
.LBB25_284 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 416(%FP)
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_295
.LBB25_285 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 408(%FP)
	LOAD	%GR6, 408(%FP)
	STORE	%GR6, 420(%FP)
	JUMP	.LBB25_286
.LBB25_286 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_293
	JUMP	.LBB25_287
.LBB25_287 NOP                          ;   in Loop: Header=BB25_286 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 0(%GR6)
	ULOADB	%GR6, 0(%GR1)
	LOAD	%GR1, 420(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 420(%FP)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_289
	JUMP	.LBB25_288
.LBB25_288 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_294
.LBB25_289 NOP                          ;   in Loop: Header=BB25_286 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_292
	JUMP	.LBB25_290
.LBB25_290 NOP                          ;   in Loop: Header=BB25_286 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_292
	JUMP	.LBB25_291
.LBB25_291 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_294
.LBB25_292 NOP                          ;   in Loop: Header=BB25_286 Depth=2
	JUMP	.LBB25_286
.LBB25_293 NOP                          ; %.loopexit6
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_294
.LBB25_294 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 420(%FP)
	LOAD	%GR1, 408(%FP)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_295
.LBB25_295 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_296
.LBB25_296 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_297 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	COPYI	%GR1, 39
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_299
	JUMP	.LBB25_298
.LBB25_298 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -39
	STORE	%GR6, 20(%FP)
	COPYI	%GR6, 39
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_299
.LBB25_299 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 3456
	STORE	%GR6, 412(%FP)
	ADDI	%GR6, %FP, 80
	STORE	%GR6, 420(%FP)
	JUMP	.LBB25_300
.LBB25_300 NOP                          ;   Parent Loop BB25_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 424(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_342
	JUMP	.LBB25_301
.LBB25_301 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 428(%FP)
	LOAD	%GR6, 428(%FP)
	COPYI	%GR1, 43
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_326
	JUMP	.LBB25_302
.LBB25_302 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR1, 45
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_326
	JUMP	.LBB25_303
.LBB25_303 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR1, 48
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_310
	JUMP	.LBB25_304
.LBB25_304 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR1, %GR6, -49
	COPYI	%GR2, 7
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB25_319
	JUMP	.LBB25_305
.LBB25_305 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR1, %GR6, -56
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB25_320
	JUMP	.LBB25_306
.LBB25_306 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR1, %GR6, -65
	COPYI	%GR2, 6
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB25_323
	JUMP	.LBB25_307
.LBB25_307 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR1, 88
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB25_329
	JUMP	.LBB25_308
.LBB25_308 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR1, %GR6, -97
	COPYI	%GR2, 6
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB25_323
	JUMP	.LBB25_309
.LBB25_309 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR1, 120
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_329
	JUMP	.LBB25_332
.LBB25_310 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR6, %FP, 412
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_312
	JUMP	.LBB25_311
.LBB25_311 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	JUMP	.LBB25_334
.LBB25_312 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 396(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_314
	JUMP	.LBB25_313
.LBB25_313 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR6, 8
	STORE	%GR6, 396(%FP)
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 512
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_314
.LBB25_314 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ADDI	%GR6, %FP, 412
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_316
	JUMP	.LBB25_315
.LBB25_315 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -1409
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_316 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -897
	STORE	%GR6, 412(%FP)
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_318
	JUMP	.LBB25_317
.LBB25_317 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_318
.LBB25_318 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB25_335
.LBB25_319 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 396(%FP)
	SHLI	%GR6, %GR6, 1
	COPYG	%GR1, __svfscanf_r.basefix
	ADD	%GR6, %GR6, %GR1
	LOADH	%GR6, 0(%GR6)
	STORE	%GR6, 396(%FP)
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -2945
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_320 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 396(%FP)
	SHLI	%GR6, %GR6, 1
	COPYG	%GR1, __svfscanf_r.basefix
	ADD	%GR6, %GR6, %GR1
	LOADH	%GR6, 0(%GR6)
	STORE	%GR6, 396(%FP)
	LOAD	%GR6, 396(%FP)
	COPYI	%GR1, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_322
	JUMP	.LBB25_321
.LBB25_321 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_333
.LBB25_322 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -2945
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_323 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 396(%FP)
	COPYI	%GR1, 10
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_325
	JUMP	.LBB25_324
.LBB25_324 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_333
.LBB25_325 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -2945
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_326 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_328
	JUMP	.LBB25_327
.LBB25_327 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -129
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_328 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_333
.LBB25_329 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1536
	COPYI	%GR1, 512
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_331
	JUMP	.LBB25_330
.LBB25_330 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	COPYI	%GR6, 16
	STORE	%GR6, 396(%FP)
	LOAD	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, -513
	STORE	%GR6, 412(%FP)
	LOAD	%GR6, 412(%FP)
	ORI	%GR6, %GR6, 1280
	STORE	%GR6, 412(%FP)
	JUMP	.LBB25_334
.LBB25_331 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_333
.LBB25_332 NOP                          ; %.loopexit8
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_333
.LBB25_333 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_343
.LBB25_334 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 428(%FP)
	LOAD	%GR1, 420(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 420(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB25_335
.LBB25_335 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_337
	JUMP	.LBB25_336
.LBB25_336 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 444(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB25_340
.LBB25_337 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR1, 448(%FP)
	LOAD	%GR2, 444(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_339
	JUMP	.LBB25_338
.LBB25_338 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_343
.LBB25_339 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	JUMP	.LBB25_340
.LBB25_340 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	JUMP	.LBB25_341
.LBB25_341 NOP                          ;   in Loop: Header=BB25_300 Depth=2
	LOAD	%GR6, 424(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 424(%FP)
	JUMP	.LBB25_300
.LBB25_342 NOP                          ; %.loopexit7
                                        ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_343
.LBB25_343 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ADDI	%GR6, %FP, 412
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_349
	JUMP	.LBB25_344
.LBB25_344 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	ADDI	%GR1, %FP, 80
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_346
	JUMP	.LBB25_345
.LBB25_345 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR1, 448(%FP)
	LOAD	%GR6, 420(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 420(%FP)
	LOADB	%GR2, 0(%GR6)
	LOAD	%GR3, 444(%FP)
	CALL	_ungetc_r
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB25_346
.LBB25_346 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	ADDI	%GR1, %FP, 80
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_348
	JUMP	.LBB25_347
.LBB25_347 NOP 
	JUMP	.LBB25_367
.LBB25_348 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_349
.LBB25_349 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_360
	JUMP	.LBB25_350
.LBB25_350 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	COPYI	%GR3, 0
	STOREB	%GR3, 0(%GR6)
	LOAD	%GR6, 376(%FP)
	LOAD	%GR1, 448(%FP)
	LOAD	%GR4, 396(%FP)
	ADDI	%GR2, %FP, 80
	CALLR	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 32
	EQ	%GR6, %GR6, %GR3
	BNEQZ	%GR6, .LBB25_352
	JUMP	.LBB25_351
.LBB25_351 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_359
.LBB25_352 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_354
	JUMP	.LBB25_353
.LBB25_353 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 68(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 68(%FP)
	STOREH	%GR6, 0(%GR1)
	JUMP	.LBB25_358
.LBB25_354 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	ULOADB	%GR6, 412(%FP)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_356
	JUMP	.LBB25_355
.LBB25_355 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 60(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 60(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_357
.LBB25_356 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 436(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 436(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 64(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 64(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_357
.LBB25_357 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_358
.LBB25_358 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_359
.LBB25_359 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 404(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_360
.LBB25_360 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	LOAD	%GR6, 420(%FP)
	ADDI	%GR1, %FP, 80
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 16(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 400(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 400(%FP)
	JUMP	.LBB25_361
.LBB25_361 NOP                          ;   in Loop: Header=BB25_10 Depth=1
	JUMP	.LBB25_21
.LBB25_362 NOP 
	LOAD	%GR6, 404(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_365
	JUMP	.LBB25_363
.LBB25_363 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_365
	JUMP	.LBB25_364
.LBB25_364 NOP 
	LOAD	%GR6, 404(%FP)
	JUMP	.LBB25_366
.LBB25_365 NOP 
	COPYI	%GR6, -1
	JUMP	.LBB25_366
.LBB25_366 NOP 
	STORE	%GR6, 404(%FP)
	JUMP	.LBB25_367
.LBB25_367 NOP 
	JUMP	.LBB25_368
.LBB25_368 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB25_373
	JUMP	.LBB25_369
.LBB25_369 NOP 
	LOAD	%GR6, 444(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_371
	JUMP	.LBB25_370
.LBB25_370 NOP 
	JUMP	.LBB25_372
.LBB25_371 NOP 
	JUMP	.LBB25_372
.LBB25_372 NOP 
	JUMP	.LBB25_373
.LBB25_373 NOP 
	LOAD	%GR6, 404(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 452(%FP)
	LOAD	%GR4, 456(%FP)
	LOAD	%GR3, 460(%FP)
	LOAD	%GR2, 464(%FP)
	LOAD	%GR1, 468(%FP)
	LOAD	%RA, 472(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 480
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end25 NOP 
	.size	__svfscanf_r, .Lfunc_end25-__svfscanf_r
                                        ; -- End function
	.type	__wctob,@function       ; -- Begin function __wctob
__wctob NOP                             ; @__wctob
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR4, 40(%FP)
	STORE	%GR1, 32(%FP)
	STORE	%GR2, 28(%FP)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_2
	JUMP	.LBB26_1
.LBB26_1 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 36(%FP)
	JUMP	.LBB26_6
.LBB26_2 NOP 
	ADDI	%GR4, %FP, 16
	COPYI	%GR2, 0
	COPYI	%GR3, 8
	COPYR	%GR1, %GR4
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	CALL	__get_current_locale
	COPYG	%GR6, __global_locale+224
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	LOAD	%GR3, 28(%FP)
	ADDI	%GR2, %FP, 12
	CALLR	%GR6
	COPYR	%GR6, %RT0
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_4
	JUMP	.LBB26_3
.LBB26_3 NOP 
	ULOADB	%GR6, 12(%FP)
	JUMP	.LBB26_5
.LBB26_4 NOP 
	COPYI	%GR6, 0
	JUMP	.LBB26_5
.LBB26_5 NOP 
	STORE	%GR6, 36(%FP)
	JUMP	.LBB26_6
.LBB26_6 NOP 
	LOAD	%GR6, 36(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 40(%FP)
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end26 NOP 
	.size	__wctob, .Lfunc_end26-__wctob
                                        ; -- End function
	.type	__get_current_locale,@function ; -- Begin function __get_current_locale
__get_current_locale NOP                ; @__get_current_locale
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_global_locale
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end27 NOP 
	.size	__get_current_locale, .Lfunc_end27-__get_current_locale
                                        ; -- End function
	.type	__get_global_locale,@function ; -- Begin function __get_global_locale
__get_global_locale NOP                 ; @__get_global_locale
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end28 NOP 
	.size	__get_global_locale, .Lfunc_end28-__get_global_locale
                                        ; -- End function
	.type	_vfscanf_r,@function    ; -- Begin function _vfscanf_r
_vfscanf_r NOP                          ; @_vfscanf_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR4, 8(%FP)
	JUMP	.LBB29_1
.LBB29_1 NOP 
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB29_4
	JUMP	.LBB29_2
.LBB29_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB29_4
	JUMP	.LBB29_3
.LBB29_3 NOP 
	LOAD	%GR1, 4(%FP)
	CALL	__sinit
	JUMP	.LBB29_4
.LBB29_4 NOP 
	JUMP	.LBB29_5
.LBB29_5 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	__svfscanf_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end29 NOP 
	.size	_vfscanf_r, .Lfunc_end29-_vfscanf_r
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
	JUMP	.LBB30_1
.LBB30_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB30_4 Depth 2
	COPYG	%GR6, impure_data+328
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 32(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB30_2
.LBB30_2 NOP                            ;   in Loop: Header=BB30_1 Depth=1
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_27
	JUMP	.LBB30_3
.LBB30_3 NOP                            ;   in Loop: Header=BB30_1 Depth=1
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 136
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB30_4
.LBB30_4 NOP                            ;   Parent Loop BB30_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_26
	JUMP	.LBB30_5
.LBB30_5 NOP                            ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_9
	JUMP	.LBB30_6
.LBB30_6 NOP                            ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_8
	JUMP	.LBB30_7
.LBB30_7 NOP                            ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 128
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_9
	JUMP	.LBB30_8
.LBB30_8 NOP                            ;   in Loop: Header=BB30_4 Depth=2
	JUMP	.LBB30_25
.LBB30_9 NOP                            ;   in Loop: Header=BB30_4 Depth=2
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
	BNEQZ	%GR6, .LBB30_11
	JUMP	.LBB30_10
.LBB30_10 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB30_12
.LBB30_11 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 20(%FP)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB30_12
.LBB30_12 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_14
	JUMP	.LBB30_13
.LBB30_13 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	JUMP	.LBB30_25
.LBB30_14 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_16
	JUMP	.LBB30_15
.LBB30_15 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 256
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_17
	JUMP	.LBB30_16
.LBB30_16 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 12(%FP)
	CALLR	%GR6
	JUMP	.LBB30_21
.LBB30_17 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 260
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_19
	JUMP	.LBB30_18
.LBB30_18 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 40(%FP)
	LOAD	%GR2, 24(%FP)
	LOAD	%GR3, 20(%FP)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	LOAD	%GR2, 0(%GR2)
	CALLR	%GR6
	JUMP	.LBB30_20
.LBB30_19 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 24(%FP)
	LOAD	%GR2, 20(%FP)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	CALLR	%GR6
	JUMP	.LBB30_20
.LBB30_20 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	JUMP	.LBB30_21
.LBB30_21 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 32(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_23
	JUMP	.LBB30_22
.LBB30_22 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 28(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%FP)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_24
	JUMP	.LBB30_23
.LBB30_23 NOP                           ;   in Loop: Header=BB30_1 Depth=1
	JUMP	.LBB30_1
.LBB30_24 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	JUMP	.LBB30_25
.LBB30_25 NOP                           ;   in Loop: Header=BB30_4 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB30_4
.LBB30_26 NOP 
	JUMP	.LBB30_28
.LBB30_27 NOP                           ; %.loopexit
	JUMP	.LBB30_28
.LBB30_28 NOP 
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end30 NOP 
	.size	__call_exitprocs, .Lfunc_end30-__call_exitprocs
                                        ; -- End function
	.type	__sfp_lock_acquire,@function ; -- Begin function __sfp_lock_acquire
__sfp_lock_acquire NOP                  ; @__sfp_lock_acquire
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end31 NOP 
	.size	__sfp_lock_acquire, .Lfunc_end31-__sfp_lock_acquire
                                        ; -- End function
	.type	__sinit,@function       ; -- Begin function __sinit
__sinit NOP                             ; @__sinit
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	STORE	%GR1, 4(%FP)
	STORE	%GR1, 0(%FP)
	CALL	__sinit_lock_acquire
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB32_2
	JUMP	.LBB32_1
.LBB32_1 NOP 
	CALL	__sinit_lock_release
	JUMP	.LBB32_3
.LBB32_2 NOP 
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 60
	COPYG	%GR1, _cleanup_r
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 736
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 740
	COPYI	%GR1, 3
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 748
	ADDI	%GR6, %GR6, 744
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	CALL	stdin_init
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	CALL	stdout_init
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR1, 0(%GR6)
	CALL	stderr_init
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 56
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	CALL	__sinit_lock_release
	JUMP	.LBB32_3
.LBB32_3 NOP 
	LOAD	%GR1, 4(%FP)
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end32 NOP 
	.size	__sinit, .Lfunc_end32-__sinit
                                        ; -- End function
	.type	__sinit_lock_acquire,@function ; -- Begin function __sinit_lock_acquire
__sinit_lock_acquire NOP                ; @__sinit_lock_acquire
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end33 NOP 
	.size	__sinit_lock_acquire, .Lfunc_end33-__sinit_lock_acquire
                                        ; -- End function
	.type	__sinit_lock_release,@function ; -- Begin function __sinit_lock_release
__sinit_lock_release NOP                ; @__sinit_lock_release
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end34 NOP 
	.size	__sinit_lock_release, .Lfunc_end34-__sinit_lock_release
                                        ; -- End function
	.type	_cleanup_r,@function    ; -- Begin function _cleanup_r
_cleanup_r NOP                          ; @_cleanup_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	COPYG	%GR6, _fclose_r
	STORE	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 8(%FP)
	CALL	_fwalk_reent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end35 NOP 
	.size	_cleanup_r, .Lfunc_end35-_cleanup_r
                                        ; -- End function
	.type	stdin_init,@function    ; -- Begin function stdin_init
stdin_init NOP                          ; @stdin_init
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 4
	COPYI	%GR3, 0
	CALL	std
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end36 NOP 
	.size	stdin_init, .Lfunc_end36-stdin_init
                                        ; -- End function
	.type	stdout_init,@function   ; -- Begin function stdout_init
stdout_init NOP                         ; @stdout_init
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 9
	COPYI	%GR3, 1
	CALL	std
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end37 NOP 
	.size	stdout_init, .Lfunc_end37-stdout_init
                                        ; -- End function
	.type	stderr_init,@function   ; -- Begin function stderr_init
stderr_init NOP                         ; @stderr_init
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	LOAD	%GR1, 8(%FP)
	COPYI	%GR2, 18
	COPYI	%GR3, 2
	CALL	std
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end38 NOP 
	.size	stderr_init, .Lfunc_end38-stderr_init
                                        ; -- End function
	.type	std,@function           ; -- Begin function std
std NOP                                 ; @std
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	STORE	%GR3, 0(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 12
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 100
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 14
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 16
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 20
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 24
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 92
	COPYI	%GR3, 8
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 28
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 32
	COPYG	%GR1, __sread
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 36
	COPYG	%GR1, __swrite
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 40
	COPYG	%GR1, __sseek
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 44
	COPYG	%GR1, __sclose
	STORE	%GR1, 0(%GR6)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end39 NOP 
	.size	std, .Lfunc_end39-std
                                        ; -- End function
	.type	__sfp_lock_release,@function ; -- Begin function __sfp_lock_release
__sfp_lock_release NOP                  ; @__sfp_lock_release
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end40 NOP 
	.size	__sfp_lock_release, .Lfunc_end40-__sfp_lock_release
                                        ; -- End function
	.type	_fread_r,@function      ; -- Begin function _fread_r
_fread_r NOP                            ; @_fread_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 96
	COPYR	%FP, %SP
	STORE	%RA, 88(%FP)
	STORE	%GR1, 84(%FP)
	STORE	%GR2, 80(%FP)
	STORE	%GR3, 76(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR4, 56(%FP)
	STORE	%GR5, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 60(%FP)
	MUL	%GR6, %GR6, %GR1
	STORE	%GR6, 48(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_2
	JUMP	.LBB41_1
.LBB41_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 72(%FP)
	JUMP	.LBB41_55
.LBB41_2 NOP 
	JUMP	.LBB41_3
.LBB41_3 NOP 
	LOAD	%GR6, 68(%FP)
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_6
	JUMP	.LBB41_4
.LBB41_4 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_6
	JUMP	.LBB41_5
.LBB41_5 NOP 
	LOAD	%GR1, 32(%FP)
	CALL	__sinit
	JUMP	.LBB41_6
.LBB41_6 NOP 
	JUMP	.LBB41_7
.LBB41_7 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB41_12
	JUMP	.LBB41_8
.LBB41_8 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_10
	JUMP	.LBB41_9
.LBB41_9 NOP 
	JUMP	.LBB41_11
.LBB41_10 NOP 
	JUMP	.LBB41_11
.LBB41_11 NOP 
	JUMP	.LBB41_12
.LBB41_12 NOP 
	JUMP	.LBB41_13
.LBB41_13 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_15
	JUMP	.LBB41_14
.LBB41_14 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 100
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB41_15
.LBB41_15 NOP 
	JUMP	.LBB41_16
.LBB41_16 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB41_18
	JUMP	.LBB41_17
.LBB41_17 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB41_18
.LBB41_18 NOP 
	LOAD	%GR6, 48(%FP)
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 64(%FP)
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_38
	JUMP	.LBB41_19
.LBB41_19 NOP 
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_21
	JUMP	.LBB41_20
.LBB41_20 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB41_22
.LBB41_21 NOP 
	LOAD	%GR6, 48(%FP)
	JUMP	.LBB41_22
.LBB41_22 NOP 
	STORE	%GR6, 28(%FP)
	LOAD	%GR1, 44(%FP)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 28(%FP)
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 48(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_27
	JUMP	.LBB41_23
.LBB41_23 NOP 
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_27
	JUMP	.LBB41_24
.LBB41_24 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB41_26
	JUMP	.LBB41_25
.LBB41_25 NOP 
	LOAD	%GR1, 68(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB41_26
.LBB41_26 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB41_27
.LBB41_27 NOP 
	JUMP	.LBB41_28
.LBB41_28 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_37
	JUMP	.LBB41_29
.LBB41_29 NOP                           ;   in Loop: Header=BB41_28 Depth=1
	COPYI	%GR3, 0
	STORE	%GR3, 24(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR1, 52(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 68(%FP)
	LOAD	%GR2, 52(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 52(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR3, 0(%GR6)
	LOAD	%GR6, 24(%FP)
	EQ	%GR6, %GR6, %GR3
	BNEQZ	%GR6, .LBB41_36
	JUMP	.LBB41_30
.LBB41_30 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB41_35
	JUMP	.LBB41_31
.LBB41_31 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_33
	JUMP	.LBB41_32
.LBB41_32 NOP 
	JUMP	.LBB41_34
.LBB41_33 NOP 
	JUMP	.LBB41_34
.LBB41_34 NOP 
	JUMP	.LBB41_35
.LBB41_35 NOP 
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 48(%FP)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 60(%FP)
	UDIV	%GR6, %GR6, %GR1
	STORE	%GR6, 72(%FP)
	JUMP	.LBB41_55
.LBB41_36 NOP                           ;   in Loop: Header=BB41_28 Depth=1
	JUMP	.LBB41_28
.LBB41_37 NOP 
	JUMP	.LBB41_49
.LBB41_38 NOP 
	JUMP	.LBB41_39
.LBB41_39 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 40(%FP)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_48
	JUMP	.LBB41_40
.LBB41_40 NOP                           ;   in Loop: Header=BB41_39 Depth=1
	LOAD	%GR1, 44(%FP)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 40(%FP)
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 44(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 48(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%GR2, 52(%FP)
	CALL	__srefill_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_47
	JUMP	.LBB41_41
.LBB41_41 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB41_46
	JUMP	.LBB41_42
.LBB41_42 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_44
	JUMP	.LBB41_43
.LBB41_43 NOP 
	JUMP	.LBB41_45
.LBB41_44 NOP 
	JUMP	.LBB41_45
.LBB41_45 NOP 
	JUMP	.LBB41_46
.LBB41_46 NOP 
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 48(%FP)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 60(%FP)
	UDIV	%GR6, %GR6, %GR1
	STORE	%GR6, 72(%FP)
	JUMP	.LBB41_55
.LBB41_47 NOP                           ;   in Loop: Header=BB41_39 Depth=1
	JUMP	.LBB41_39
.LBB41_48 NOP 
	LOAD	%GR1, 44(%FP)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 48(%FP)
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB41_49
.LBB41_49 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB41_54
	JUMP	.LBB41_50
.LBB41_50 NOP 
	LOAD	%GR6, 52(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_52
	JUMP	.LBB41_51
.LBB41_51 NOP 
	JUMP	.LBB41_53
.LBB41_52 NOP 
	JUMP	.LBB41_53
.LBB41_53 NOP 
	JUMP	.LBB41_54
.LBB41_54 NOP 
	LOAD	%GR6, 56(%FP)
	STORE	%GR6, 72(%FP)
	JUMP	.LBB41_55
.LBB41_55 NOP 
	LOAD	%GR6, 72(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 76(%FP)
	LOAD	%GR2, 80(%FP)
	LOAD	%GR1, 84(%FP)
	LOAD	%RA, 88(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 96
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end41 NOP 
	.size	_fread_r, .Lfunc_end41-_fread_r
                                        ; -- End function
	.globl	fread                   ; -- Begin function fread
	.type	fread,@function
fread NOP                               ; @fread
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	LOAD	%GR5, 4(%FP)
	COPYG	%GR1, impure_data
	CALL	_fread_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end42 NOP 
	.size	fread, .Lfunc_end42-fread
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
	BNEQZ	%GR6, .LBB43_2
	JUMP	.LBB43_1
.LBB43_1 NOP 
	JUMP	.LBB43_51
.LBB43_2 NOP 
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
	BNEQZ	%GR6, .LBB43_8
	JUMP	.LBB43_3
.LBB43_3 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	ULOADB	%GR6, 32(%FP)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_5
	JUMP	.LBB43_4
.LBB43_4 NOP 
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
	JUMP	.LBB43_5
.LBB43_5 NOP 
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
	BNEQZ	%GR6, .LBB43_7
	JUMP	.LBB43_6
.LBB43_6 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	_malloc_trim_r
	JUMP	.LBB43_7
.LBB43_7 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	__malloc_unlock
	JUMP	.LBB43_51
.LBB43_8 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 20(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 0(%FP)
	ULOADB	%GR6, 32(%FP)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_13
	JUMP	.LBB43_9
.LBB43_9 NOP 
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
	BNEQZ	%GR6, .LBB43_11
	JUMP	.LBB43_10
.LBB43_10 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 0(%FP)
	JUMP	.LBB43_12
.LBB43_11 NOP 
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
	JUMP	.LBB43_12
.LBB43_12 NOP 
	JUMP	.LBB43_13
.LBB43_13 NOP 
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 16(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_19
	JUMP	.LBB43_14
.LBB43_14 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_17
	JUMP	.LBB43_15
.LBB43_15 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYG	%GR1, __malloc_av_+8
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_17
	JUMP	.LBB43_16
.LBB43_16 NOP 
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
	JUMP	.LBB43_18
.LBB43_17 NOP 
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
	JUMP	.LBB43_18
.LBB43_18 NOP 
	JUMP	.LBB43_19
.LBB43_19 NOP 
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
	BNEQZ	%GR6, .LBB43_50
	JUMP	.LBB43_20
.LBB43_20 NOP 
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 511
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_22
	JUMP	.LBB43_21
.LBB43_21 NOP 
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
	JUMP	.LBB43_49
.LBB43_22 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_24
	JUMP	.LBB43_23
.LBB43_23 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 3
	JUMP	.LBB43_40
.LBB43_24 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 4
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_26
	JUMP	.LBB43_25
.LBB43_25 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB43_39
.LBB43_26 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 20
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_28
	JUMP	.LBB43_27
.LBB43_27 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB43_38
.LBB43_28 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 84
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_30
	JUMP	.LBB43_29
.LBB43_29 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 12
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB43_37
.LBB43_30 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 340
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_32
	JUMP	.LBB43_31
.LBB43_31 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 15
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB43_36
.LBB43_32 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 9
	COPYI	%GR1, 1364
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB43_34
	JUMP	.LBB43_33
.LBB43_33 NOP 
	LOAD	%GR6, 28(%FP)
	SRLI	%GR6, %GR6, 18
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB43_35
.LBB43_34 NOP 
	COPYI	%GR6, 126
	JUMP	.LBB43_35
.LBB43_35 NOP 
	JUMP	.LBB43_36
.LBB43_36 NOP 
	JUMP	.LBB43_37
.LBB43_37 NOP 
	JUMP	.LBB43_38
.LBB43_38 NOP 
	JUMP	.LBB43_39
.LBB43_39 NOP 
	JUMP	.LBB43_40
.LBB43_40 NOP 
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
	BNEQZ	%GR6, .LBB43_42
	JUMP	.LBB43_41
.LBB43_41 NOP 
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
	JUMP	.LBB43_48
.LBB43_42 NOP 
	JUMP	.LBB43_43
.LBB43_43 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB43_45
	JUMP	.LBB43_44
.LBB43_44 NOP                           ;   in Loop: Header=BB43_43 Depth=1
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ULT	%GR6, %GR6, %GR1
	JUMP	.LBB43_45
.LBB43_45 NOP                           ;   in Loop: Header=BB43_43 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_47
	JUMP	.LBB43_46
.LBB43_46 NOP                           ;   in Loop: Header=BB43_43 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	JUMP	.LBB43_43
.LBB43_47 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB43_48
.LBB43_48 NOP 
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
	JUMP	.LBB43_49
.LBB43_49 NOP 
	JUMP	.LBB43_50
.LBB43_50 NOP 
	LOAD	%GR1, 44(%FP)
	CALL	__malloc_unlock
	JUMP	.LBB43_51
.LBB43_51 NOP 
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end43 NOP 
	.size	_free_r, .Lfunc_end43-_free_r
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
	BNEQZ	%GR6, .LBB44_2
	JUMP	.LBB44_1
.LBB44_1 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB44_9
.LBB44_2 NOP 
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
	BNEQZ	%GR6, .LBB44_4
	JUMP	.LBB44_3
.LBB44_3 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB44_9
.LBB44_4 NOP 
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
	BNEQZ	%GR6, .LBB44_8
	JUMP	.LBB44_5
.LBB44_5 NOP 
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
	BNEQZ	%GR6, .LBB44_7
	JUMP	.LBB44_6
.LBB44_6 NOP 
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
	JUMP	.LBB44_7
.LBB44_7 NOP 
	LOAD	%GR1, 24(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB44_9
.LBB44_8 NOP 
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
	JUMP	.LBB44_9
.LBB44_9 NOP 
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end44 NOP 
	.size	_malloc_trim_r, .Lfunc_end44-_malloc_trim_r
                                        ; -- End function
	.type	_fwalk,@function        ; -- Begin function _fwalk
_fwalk NOP                              ; @_fwalk
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	COPYG	%GR6, impure_data
	STORE	%GR6, 32(%FP)
	COPYG	%GR6, lflush
	STORE	%GR6, 28(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 736
	STORE	%GR6, 12(%FP)
	JUMP	.LBB45_1
.LBB45_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB45_3 Depth 2
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_12
	JUMP	.LBB45_2
.LBB45_2 NOP                            ;   in Loop: Header=BB45_1 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB45_3
.LBB45_3 NOP                            ;   Parent Loop BB45_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_10
	JUMP	.LBB45_4
.LBB45_4 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_8
	JUMP	.LBB45_5
.LBB45_5 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_8
	JUMP	.LBB45_6
.LBB45_6 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_8
	JUMP	.LBB45_7
.LBB45_7 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 24(%FP)
	CALLR	%GR6
	COPYR	%GR6, %RT0
	LOAD	%GR1, 16(%FP)
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	JUMP	.LBB45_8
.LBB45_8 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	JUMP	.LBB45_9
.LBB45_9 NOP                            ;   in Loop: Header=BB45_3 Depth=2
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 104
	STORE	%GR6, 24(%FP)
	JUMP	.LBB45_3
.LBB45_10 NOP                           ;   in Loop: Header=BB45_1 Depth=1
	JUMP	.LBB45_11
.LBB45_11 NOP                           ;   in Loop: Header=BB45_1 Depth=1
	LOAD	%GR6, 12(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	JUMP	.LBB45_1
.LBB45_12 NOP 
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end45 NOP 
	.size	_fwalk, .Lfunc_end45-_fwalk
                                        ; -- End function
	.type	_fwalk_reent,@function  ; -- Begin function _fwalk_reent
_fwalk_reent NOP                        ; @_fwalk_reent
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 28(%FP)
	ADDI	%GR6, %GR6, 736
	STORE	%GR6, 8(%FP)
	JUMP	.LBB46_1
.LBB46_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB46_3 Depth 2
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_12
	JUMP	.LBB46_2
.LBB46_2 NOP                            ;   in Loop: Header=BB46_1 Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB46_3
.LBB46_3 NOP                            ;   Parent Loop BB46_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 16(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_10
	JUMP	.LBB46_4
.LBB46_4 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_8
	JUMP	.LBB46_5
.LBB46_5 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_8
	JUMP	.LBB46_6
.LBB46_6 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_8
	JUMP	.LBB46_7
.LBB46_7 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 28(%FP)
	LOAD	%GR2, 20(%FP)
	CALLR	%GR6
	COPYR	%GR6, %RT0
	LOAD	%GR1, 12(%FP)
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%FP)
	JUMP	.LBB46_8
.LBB46_8 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	JUMP	.LBB46_9
.LBB46_9 NOP                            ;   in Loop: Header=BB46_3 Depth=2
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 104
	STORE	%GR6, 20(%FP)
	JUMP	.LBB46_3
.LBB46_10 NOP                           ;   in Loop: Header=BB46_1 Depth=1
	JUMP	.LBB46_11
.LBB46_11 NOP                           ;   in Loop: Header=BB46_1 Depth=1
	LOAD	%GR6, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB46_1
.LBB46_12 NOP 
	LOAD	%GR6, 12(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end46 NOP 
	.size	_fwalk_reent, .Lfunc_end46-_fwalk_reent
                                        ; -- End function
	.globl	iswspace                ; -- Begin function iswspace
	.type	iswspace,@function
iswspace NOP                            ; @iswspace
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	LOAD	%GR1, 12(%FP)
	COPYI	%GR2, 0
	CALL	iswspace_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end47 NOP 
	.size	iswspace, .Lfunc_end47-iswspace
                                        ; -- End function
	.globl	iswspace_l              ; -- Begin function iswspace_l
	.type	iswspace_l,@function
iswspace_l NOP                          ; @iswspace_l
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%GR1, 8(%FP)
	STORE	%GR1, 4(%FP)
	STORE	%GR2, 0(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 255
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB48_2
	JUMP	.LBB48_1
.LBB48_1 NOP 
	LOAD	%GR6, 4(%FP)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	JUMP	.LBB48_3
.LBB48_2 NOP 
	COPYI	%GR6, 0
	JUMP	.LBB48_3
.LBB48_3 NOP 
	COPYR	%RT0, %GR6
	LOAD	%GR1, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end48 NOP 
	.size	iswspace_l, .Lfunc_end48-iswspace_l
                                        ; -- End function
	.type	_setlocale_r,@function  ; -- Begin function _setlocale_r
_setlocale_r NOP                        ; @_setlocale_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	STORE	%GR3, 0(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_6
	JUMP	.LBB49_1
.LBB49_1 NOP 
	LOAD	%GR1, 0(%FP)
	COPYG	%GR2, .L.str.2
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_5
	JUMP	.LBB49_2
.LBB49_2 NOP 
	LOAD	%GR1, 0(%FP)
	COPYG	%GR2, .L.str.3
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_5
	JUMP	.LBB49_3
.LBB49_3 NOP 
	LOAD	%GR1, 0(%FP)
	COPYG	%GR2, .L.str.59
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_5
	JUMP	.LBB49_4
.LBB49_4 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB49_7
.LBB49_5 NOP 
	JUMP	.LBB49_6
.LBB49_6 NOP 
	COPYG	%GR6, .L.str.3
	STORE	%GR6, 12(%FP)
	JUMP	.LBB49_7
.LBB49_7 NOP 
	LOAD	%GR6, 12(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end49 NOP 
	.size	_setlocale_r, .Lfunc_end49-_setlocale_r
                                        ; -- End function
	.type	__locale_mb_cur_max,@function ; -- Begin function __locale_mb_cur_max
__locale_mb_cur_max NOP                 ; @__locale_mb_cur_max
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_current_locale.51
	COPYG	%GR6, __global_locale+296
	LOADB	%GR6, 0(%GR6)
	COPYR	%RT0, %GR6
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end50 NOP 
	.size	__locale_mb_cur_max, .Lfunc_end50-__locale_mb_cur_max
                                        ; -- End function
	.type	__get_current_locale.51,@function ; -- Begin function __get_current_locale.51
__get_current_locale.51 NOP             ; @__get_current_locale.51
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_global_locale.52
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end51 NOP 
	.size	__get_current_locale.51, .Lfunc_end51-__get_current_locale.51
                                        ; -- End function
	.type	__get_global_locale.52,@function ; -- Begin function __get_global_locale.52
__get_global_locale.52 NOP              ; @__get_global_locale.52
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end52 NOP 
	.size	__get_global_locale.52, .Lfunc_end52-__get_global_locale.52
                                        ; -- End function
	.globl	setlocale               ; -- Begin function setlocale
	.type	setlocale,@function
setlocale NOP                           ; @setlocale
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	CALL	__getreent
	COPYR	%GR1, %RT0
	LOAD	%GR2, 8(%FP)
	LOAD	%GR3, 4(%FP)
	CALL	_setlocale_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end53 NOP 
	.size	setlocale, .Lfunc_end53-setlocale
                                        ; -- End function
	.type	_mbrtowc_r,@function    ; -- Begin function _mbrtowc_r
_mbrtowc_r NOP                          ; @_mbrtowc_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR4, 40(%FP)
	STORE	%GR5, 36(%FP)
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	STORE	%GR3, 20(%FP)
	STORE	%GR4, 16(%FP)
	STORE	%GR5, 12(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%FP)
	LOAD	%GR1, 20(%FP)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB54_2
	JUMP	.LBB54_1
.LBB54_1 NOP 
	CALL	__get_current_locale.58
	COPYG	%GR6, __global_locale+228
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	LOAD	%GR5, 12(%FP)
	COPYG	%GR3, .L.str.59
	COPYI	%GR2, 0
	COPYI	%GR4, 1
	CALLR	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	JUMP	.LBB54_3
.LBB54_2 NOP 
	CALL	__get_current_locale.58
	COPYG	%GR6, __global_locale+228
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	LOAD	%GR2, 24(%FP)
	LOAD	%GR3, 20(%FP)
	LOAD	%GR4, 16(%FP)
	LOAD	%GR5, 12(%FP)
	CALLR	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	JUMP	.LBB54_3
.LBB54_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_5
	JUMP	.LBB54_4
.LBB54_4 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 32(%FP)
	JUMP	.LBB54_6
.LBB54_5 NOP 
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 32(%FP)
	JUMP	.LBB54_6
.LBB54_6 NOP 
	LOAD	%GR6, 32(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 36(%FP)
	LOAD	%GR4, 40(%FP)
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end54 NOP 
	.size	_mbrtowc_r, .Lfunc_end54-_mbrtowc_r
                                        ; -- End function
	.type	__get_current_locale.58,@function ; -- Begin function __get_current_locale.58
__get_current_locale.58 NOP             ; @__get_current_locale.58
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_global_locale.60
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end55 NOP 
	.size	__get_current_locale.58, .Lfunc_end55-__get_current_locale.58
                                        ; -- End function
	.type	__get_global_locale.60,@function ; -- Begin function __get_global_locale.60
__get_global_locale.60 NOP              ; @__get_global_locale.60
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end56 NOP 
	.size	__get_global_locale.60, .Lfunc_end56-__get_global_locale.60
                                        ; -- End function
	.globl	mbrtowc                 ; -- Begin function mbrtowc
	.type	mbrtowc,@function
mbrtowc NOP                             ; @mbrtowc
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 64
	COPYR	%FP, %SP
	STORE	%RA, 56(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR4, 40(%FP)
	STORE	%GR5, 36(%FP)
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	STORE	%GR3, 20(%FP)
	STORE	%GR4, 16(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 12(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	COPYG	%GR6, impure_data
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 24(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_2
	JUMP	.LBB57_1
.LBB57_1 NOP 
	CALL	__get_current_locale.58
	COPYG	%GR6, __global_locale+228
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	LOAD	%GR5, 16(%FP)
	COPYG	%GR3, .L.str.59
	COPYI	%GR2, 0
	COPYI	%GR4, 1
	CALLR	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB57_3
.LBB57_2 NOP 
	CALL	__get_current_locale.58
	COPYG	%GR6, __global_locale+228
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	LOAD	%GR2, 28(%FP)
	LOAD	%GR3, 24(%FP)
	LOAD	%GR4, 20(%FP)
	LOAD	%GR5, 16(%FP)
	CALLR	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB57_3
.LBB57_3 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_5
	JUMP	.LBB57_4
.LBB57_4 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 32(%FP)
	JUMP	.LBB57_6
.LBB57_5 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 32(%FP)
	JUMP	.LBB57_6
.LBB57_6 NOP 
	LOAD	%GR6, 32(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 36(%FP)
	LOAD	%GR4, 40(%FP)
	LOAD	%GR3, 44(%FP)
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	LOAD	%RA, 56(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 64
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end57 NOP 
	.size	mbrtowc, .Lfunc_end57-mbrtowc
                                        ; -- End function
	.type	__ascii_mbtowc,@function ; -- Begin function __ascii_mbtowc
__ascii_mbtowc NOP                      ; @__ascii_mbtowc
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 40
	COPYR	%FP, %SP
	STORE	%GR1, 32(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	STORE	%GR4, 12(%FP)
	STORE	%GR5, 8(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_2
	JUMP	.LBB58_1
.LBB58_1 NOP 
	ADDI	%GR6, %FP, 4
	STORE	%GR6, 20(%FP)
	JUMP	.LBB58_2
.LBB58_2 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_4
	JUMP	.LBB58_3
.LBB58_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB58_9
.LBB58_4 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_6
	JUMP	.LBB58_5
.LBB58_5 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 28(%FP)
	JUMP	.LBB58_9
.LBB58_6 NOP 
	LOAD	%GR6, 0(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_8
	JUMP	.LBB58_7
.LBB58_7 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB58_9
.LBB58_8 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB58_9
.LBB58_9 NOP 
	LOAD	%GR6, 28(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 32(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 40
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end58 NOP 
	.size	__ascii_mbtowc, .Lfunc_end58-__ascii_mbtowc
                                        ; -- End function
	.globl	memcpy                  ; -- Begin function memcpy
	.type	memcpy,@function
memcpy NOP                              ; @memcpy
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 40
	COPYR	%FP, %SP
	STORE	%GR1, 32(%FP)
	STORE	%GR2, 28(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	LOAD	%GR6, 24(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_9
	JUMP	.LBB59_1
.LBB59_1 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_9
	JUMP	.LBB59_2
.LBB59_2 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB59_3
.LBB59_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_5
	JUMP	.LBB59_4
.LBB59_4 NOP                            ;   in Loop: Header=BB59_3 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 16(%FP)
	JUMP	.LBB59_3
.LBB59_5 NOP 
	JUMP	.LBB59_6
.LBB59_6 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 4
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_8
	JUMP	.LBB59_7
.LBB59_7 NOP                            ;   in Loop: Header=BB59_6 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 16(%FP)
	JUMP	.LBB59_6
.LBB59_8 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB59_9
.LBB59_9 NOP 
	JUMP	.LBB59_10
.LBB59_10 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 16(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_12
	JUMP	.LBB59_11
.LBB59_11 NOP                           ;   in Loop: Header=BB59_10 Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 8(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 12(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB59_10
.LBB59_12 NOP 
	LOAD	%GR6, 24(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 28(%FP)
	LOAD	%GR1, 32(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 40
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end59 NOP 
	.size	memcpy, .Lfunc_end59-memcpy
                                        ; -- End function
	.type	__srefill_r,@function   ; -- Begin function __srefill_r
__srefill_r NOP                         ; @__srefill_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	JUMP	.LBB60_1
.LBB60_1 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_4
	JUMP	.LBB60_2
.LBB60_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_4
	JUMP	.LBB60_3
.LBB60_3 NOP 
	LOAD	%GR1, 4(%FP)
	CALL	__sinit
	JUMP	.LBB60_4
.LBB60_4 NOP 
	JUMP	.LBB60_5
.LBB60_5 NOP 
	JUMP	.LBB60_6
.LBB60_6 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_8
	JUMP	.LBB60_7
.LBB60_7 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 100
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB60_8
.LBB60_8 NOP 
	JUMP	.LBB60_9
.LBB60_9 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_11
	JUMP	.LBB60_10
.LBB60_10 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_11 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_19
	JUMP	.LBB60_12
.LBB60_12 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_14
	JUMP	.LBB60_13
.LBB60_13 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 9
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_14 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_18
	JUMP	.LBB60_15
.LBB60_15 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 8(%FP)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_17
	JUMP	.LBB60_16
.LBB60_16 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_17 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65527
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 24
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB60_18
.LBB60_18 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB60_26
.LBB60_19 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_25
	JUMP	.LBB60_20
.LBB60_20 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB60_22
	JUMP	.LBB60_21
.LBB60_21 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB60_22
.LBB60_22 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR2, %GR6, 60
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	EQ	%GR6, %GR2, %GR1
	BNEQZ	%GR6, .LBB60_24
	JUMP	.LBB60_23
.LBB60_23 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 56
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_24 NOP 
	JUMP	.LBB60_25
.LBB60_25 NOP 
	JUMP	.LBB60_26
.LBB60_26 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_28
	JUMP	.LBB60_27
.LBB60_27 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 8(%FP)
	CALL	__smakebuf_r
	JUMP	.LBB60_28
.LBB60_28 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_32
	JUMP	.LBB60_29
.LBB60_29 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	STOREH	%GR6, 0(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	COPYI	%GR1, 1
	STOREH	%GR1, 0(%GR6)
	CALL	_fwalk
	ULOADH	%GR6, 0(%FP)
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 12
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 9
	COPYI	%GR1, 9
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_31
	JUMP	.LBB60_30
.LBB60_30 NOP 
	LOAD	%GR1, 12(%FP)
	LOAD	%GR2, 8(%FP)
	CALL	__sflush_r
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB60_31
.LBB60_31 NOP 
	JUMP	.LBB60_32
.LBB60_32 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 16
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 32
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR2, %GR6, 28
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR4, 0(%GR6)
	CALLR	%GR5
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB60_37
	JUMP	.LBB60_33
.LBB60_33 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_35
	JUMP	.LBB60_34
.LBB60_34 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 32
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB60_36
.LBB60_35 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB60_36
.LBB60_36 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_37 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB60_38
.LBB60_38 NOP 
	LOAD	%GR6, 16(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end60 NOP 
	.size	__srefill_r, .Lfunc_end60-__srefill_r
                                        ; -- End function
	.type	lflush,@function        ; -- Begin function lflush
lflush NOP                              ; @lflush
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR1, 12(%FP)
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 9
	COPYI	%GR1, 9
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB61_2
	JUMP	.LBB61_1
.LBB61_1 NOP 
	LOAD	%GR1, 12(%FP)
	CALL	fflush
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB61_3
.LBB61_2 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB61_3
.LBB61_3 NOP 
	LOAD	%GR6, 16(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end61 NOP 
	.size	lflush, .Lfunc_end61-lflush
                                        ; -- End function
	.type	__sccl,@function        ; -- Begin function __sccl
__sccl NOP                              ; @__sccl
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 36
	COPYR	%FP, %SP
	STORE	%GR1, 28(%FP)
	STORE	%GR2, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	LOAD	%GR6, 12(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 94
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_2
	JUMP	.LBB62_1
.LBB62_1 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 12(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB62_3
.LBB62_2 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 0(%FP)
	JUMP	.LBB62_3
.LBB62_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 4(%FP)
	JUMP	.LBB62_4
.LBB62_4 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 255
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB62_7
	JUMP	.LBB62_5
.LBB62_5 NOP                            ;   in Loop: Header=BB62_4 Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 4(%FP)
	ADD	%GR1, %GR1, %GR2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_6
.LBB62_6 NOP                            ;   in Loop: Header=BB62_4 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 4(%FP)
	JUMP	.LBB62_4
.LBB62_7 NOP 
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_9
	JUMP	.LBB62_8
.LBB62_8 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB62_25
.LBB62_9 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 1
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 0(%FP)
	JUMP	.LBB62_10
.LBB62_10 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB62_11 Depth 2
                                        ;       Child Loop BB62_19 Depth 3
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 8(%FP)
	ADD	%GR1, %GR1, %GR2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_11
.LBB62_11 NOP                           ;   Parent Loop BB62_10 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB62_19 Depth 3
	LOAD	%GR6, 12(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB62_14
	JUMP	.LBB62_12
.LBB62_12 NOP                           ;   in Loop: Header=BB62_11 Depth=2
	COPYI	%GR1, 45
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB62_15
	JUMP	.LBB62_13
.LBB62_13 NOP                           ;   in Loop: Header=BB62_10 Depth=1
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_22
	JUMP	.LBB62_23
.LBB62_14 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB62_25
.LBB62_15 NOP                           ;   in Loop: Header=BB62_11 Depth=2
	LOAD	%GR6, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_17
	JUMP	.LBB62_16
.LBB62_16 NOP                           ;   in Loop: Header=BB62_11 Depth=2
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 8(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB62_18
	JUMP	.LBB62_17
.LBB62_17 NOP                           ;   in Loop: Header=BB62_10 Depth=1
	COPYI	%GR6, 45
	STORE	%GR6, 8(%FP)
	JUMP	.LBB62_24
.LBB62_18 NOP                           ;   in Loop: Header=BB62_11 Depth=2
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB62_19
.LBB62_19 NOP                           ;   Parent Loop BB62_10 Depth=1
                                        ;     Parent Loop BB62_11 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 8(%FP)
	ADDI	%GR2, %GR2, 1
	STORE	%GR2, 8(%FP)
	ADD	%GR1, %GR1, %GR2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_20
.LBB62_20 NOP                           ;   in Loop: Header=BB62_19 Depth=3
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 4(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_19
	JUMP	.LBB62_21
.LBB62_21 NOP                           ;   in Loop: Header=BB62_11 Depth=2
	JUMP	.LBB62_11
.LBB62_22 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 20(%FP)
	JUMP	.LBB62_25
.LBB62_23 NOP                           ;   in Loop: Header=BB62_10 Depth=1
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB62_24
.LBB62_24 NOP                           ;   in Loop: Header=BB62_10 Depth=1
	JUMP	.LBB62_10
.LBB62_25 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%FP)
	LOAD	%GR1, 28(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 36
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end62 NOP 
	.size	__sccl, .Lfunc_end62-__sccl
                                        ; -- End function
	.type	__sread,@function       ; -- Begin function __sread
__sread NOP                             ; @__sread
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR4, 8(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	_read_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB63_2
	JUMP	.LBB63_1
.LBB63_1 NOP 
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 80
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB63_3
.LBB63_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB63_3
.LBB63_3 NOP 
	LOAD	%GR6, 0(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end63 NOP 
	.size	__sread, .Lfunc_end63-__sread
                                        ; -- End function
	.type	__swrite,@function      ; -- Begin function __swrite
__swrite NOP                            ; @__swrite
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR4, 8(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 256
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB64_2
	JUMP	.LBB64_1
.LBB64_1 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	COPYI	%GR3, 0
	COPYI	%GR4, 2
	CALL	_lseek_r
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB64_2
.LBB64_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	_write_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 0(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end64 NOP 
	.size	__swrite, .Lfunc_end64-__swrite
                                        ; -- End function
	.type	__sseek,@function       ; -- Begin function __sseek
__sseek NOP                             ; @__sseek
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR4, 8(%FP)
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	_lseek_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB65_2
	JUMP	.LBB65_1
.LBB65_1 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB65_3
.LBB65_2 NOP 
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4096
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR1, %GR1, 80
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB65_3
.LBB65_3 NOP 
	LOAD	%GR6, 0(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end65 NOP 
	.size	__sseek, .Lfunc_end65-__sseek
                                        ; -- End function
	.type	__sclose,@function      ; -- Begin function __sclose
__sclose NOP                            ; @__sclose
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR1, 12(%FP)
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	CALL	_close_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end66 NOP 
	.size	__sclose, .Lfunc_end66-__sclose
                                        ; -- End function
	.globl	strcmp                  ; -- Begin function strcmp
	.type	strcmp,@function
strcmp NOP                              ; @strcmp
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 28
	COPYR	%FP, %SP
	STORE	%GR1, 20(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB67_7
	JUMP	.LBB67_1
.LBB67_1 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB67_2
.LBB67_2 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%FP)
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB67_6
	JUMP	.LBB67_3
.LBB67_3 NOP                            ;   in Loop: Header=BB67_2 Depth=1
	LOAD	%GR6, 4(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, -16843009
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR1, %GR6
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB67_5
	JUMP	.LBB67_4
.LBB67_4 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	JUMP	.LBB67_13
.LBB67_5 NOP                            ;   in Loop: Header=BB67_2 Depth=1
	LOAD	%GR6, 4(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 0(%FP)
	JUMP	.LBB67_2
.LBB67_6 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB67_7
.LBB67_7 NOP 
	JUMP	.LBB67_8
.LBB67_8 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%FP)
	LOADB	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB67_10
	JUMP	.LBB67_9
.LBB67_9 NOP                            ;   in Loop: Header=BB67_8 Depth=1
	LOAD	%GR6, 12(%FP)
	LOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	LOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB67_10
.LBB67_10 NOP                           ;   in Loop: Header=BB67_8 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB67_12
	JUMP	.LBB67_11
.LBB67_11 NOP                           ;   in Loop: Header=BB67_8 Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%FP)
	JUMP	.LBB67_8
.LBB67_12 NOP 
	LOAD	%GR6, 12(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	ULOADB	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 16(%FP)
	JUMP	.LBB67_13
.LBB67_13 NOP 
	LOAD	%GR6, 16(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 28
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end67 NOP 
	.size	strcmp, .Lfunc_end67-strcmp
                                        ; -- End function
	.type	_strtol_r,@function     ; -- Begin function _strtol_r
_strtol_r NOP                           ; @_strtol_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 12(%FP)
	LOAD	%GR3, 8(%FP)
	LOAD	%GR4, 4(%FP)
	CALL	__get_current_locale.83
	COPYG	%GR5, __global_locale
	CALL	_strtol_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end68 NOP 
	.size	_strtol_r, .Lfunc_end68-_strtol_r
                                        ; -- End function
	.type	__get_current_locale.83,@function ; -- Begin function __get_current_locale.83
__get_current_locale.83 NOP             ; @__get_current_locale.83
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_global_locale.84
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end69 NOP 
	.size	__get_current_locale.83, .Lfunc_end69-__get_current_locale.83
                                        ; -- End function
	.type	_strtol_l,@function     ; -- Begin function _strtol_l
_strtol_l NOP                           ; @_strtol_l
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR3, 44(%FP)
	STORE	%GR4, 40(%FP)
	STORE	%GR5, 36(%FP)
	LOAD	%GR6, 48(%FP)
	STORE	%GR6, 32(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 16(%FP)
	LOAD	%GR1, 40(%FP)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_3
	JUMP	.LBB70_1
.LBB70_1 NOP 
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_3
	JUMP	.LBB70_2
.LBB70_2 NOP 
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 37
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_4
	JUMP	.LBB70_3
.LBB70_3 NOP 
	CALL	__errno
	COPYG	%GR6, impure_data
	COPYI	%GR1, 22
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 56(%FP)
	JUMP	.LBB70_54
.LBB70_4 NOP 
	JUMP	.LBB70_5
.LBB70_5 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_6
.LBB70_6 NOP                            ;   in Loop: Header=BB70_5 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_5
	JUMP	.LBB70_7
.LBB70_7 NOP 
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_9
	JUMP	.LBB70_8
.LBB70_8 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_12
.LBB70_9 NOP 
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 43
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_11
	JUMP	.LBB70_10
.LBB70_10 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_11
.LBB70_11 NOP 
	JUMP	.LBB70_12
.LBB70_12 NOP 
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_14
	JUMP	.LBB70_13
.LBB70_13 NOP 
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 16
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_18
	JUMP	.LBB70_14
.LBB70_14 NOP 
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 48
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_18
	JUMP	.LBB70_15
.LBB70_15 NOP 
	LOAD	%GR6, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 120
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_17
	JUMP	.LBB70_16
.LBB70_16 NOP 
	LOAD	%GR6, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 88
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_18
	JUMP	.LBB70_17
.LBB70_17 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 32(%FP)
	COPYI	%GR6, 16
	STORE	%GR6, 40(%FP)
	JUMP	.LBB70_18
.LBB70_18 NOP 
	LOAD	%GR6, 40(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_20
	JUMP	.LBB70_19
.LBB70_19 NOP 
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 48
	EQ	%GR6, %GR6, %GR1
	COPYI	%GR1, 10
	COPYI	%GR2, 8
	CMOV	%GR1, %GR6, %GR2
	STORE	%GR1, 40(%FP)
	JUMP	.LBB70_20
.LBB70_20 NOP 
	LOAD	%GR1, 16(%FP)
	COPYI	%GR6, 0
	NEQ	%GR1, %GR1, %GR6
	COPYI	%GR2, 2147483647
	COPYI	%GR3, -2147483648
	CMOV	%GR2, %GR1, %GR3
	STORE	%GR2, 20(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 40(%FP)
	UREM	%GR1, %GR1, %GR2
	STORE	%GR1, 8(%FP)
	LOAD	%GR1, 40(%FP)
	LOAD	%GR2, 20(%FP)
	UDIV	%GR1, %GR2, %GR1
	STORE	%GR1, 20(%FP)
	STORE	%GR6, 28(%FP)
	STORE	%GR6, 12(%FP)
	JUMP	.LBB70_21
.LBB70_21 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 48
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_24
	JUMP	.LBB70_22
.LBB70_22 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 57
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_24
	JUMP	.LBB70_23
.LBB70_23 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_33
.LBB70_24 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 65
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_27
	JUMP	.LBB70_25
.LBB70_25 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 90
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_27
	JUMP	.LBB70_26
.LBB70_26 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, -55
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_32
.LBB70_27 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 97
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_30
	JUMP	.LBB70_28
.LBB70_28 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 122
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_30
	JUMP	.LBB70_29
.LBB70_29 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, -87
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_31
.LBB70_30 NOP 
	JUMP	.LBB70_43
.LBB70_31 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	JUMP	.LBB70_32
.LBB70_32 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	JUMP	.LBB70_33
.LBB70_33 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 40(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_35
	JUMP	.LBB70_34
.LBB70_34 NOP 
	JUMP	.LBB70_43
.LBB70_35 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_39
	JUMP	.LBB70_36
.LBB70_36 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 20(%FP)
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_39
	JUMP	.LBB70_37
.LBB70_37 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 20(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_40
	JUMP	.LBB70_38
.LBB70_38 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 8(%FP)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_40
	JUMP	.LBB70_39
.LBB70_39 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB70_41
.LBB70_40 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	COPYI	%GR6, 1
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 40(%FP)
	LOAD	%GR1, 28(%FP)
	MUL	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 24(%FP)
	LOAD	%GR1, 28(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	JUMP	.LBB70_41
.LBB70_41 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	JUMP	.LBB70_42
.LBB70_42 NOP                           ;   in Loop: Header=BB70_21 Depth=1
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 32(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 24(%FP)
	JUMP	.LBB70_21
.LBB70_43 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB70_45
	JUMP	.LBB70_44
.LBB70_44 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	COPYI	%GR1, 2147483647
	COPYI	%GR2, -2147483648
	CMOV	%GR1, %GR6, %GR2
	STORE	%GR1, 28(%FP)
	LOAD	%GR6, 52(%FP)
	COPYI	%GR1, 34
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB70_48
.LBB70_45 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_47
	JUMP	.LBB70_46
.LBB70_46 NOP 
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 28(%FP)
	JUMP	.LBB70_47
.LBB70_47 NOP 
	JUMP	.LBB70_48
.LBB70_48 NOP 
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_53
	JUMP	.LBB70_49
.LBB70_49 NOP 
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB70_51
	JUMP	.LBB70_50
.LBB70_50 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR6, %GR6, -1
	JUMP	.LBB70_52
.LBB70_51 NOP 
	LOAD	%GR6, 48(%FP)
	JUMP	.LBB70_52
.LBB70_52 NOP 
	LOAD	%GR1, 44(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB70_53
.LBB70_53 NOP 
	LOAD	%GR6, 28(%FP)
	STORE	%GR6, 56(%FP)
	JUMP	.LBB70_54
.LBB70_54 NOP 
	LOAD	%GR6, 56(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 60(%FP)
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end70 NOP 
	.size	_strtol_l, .Lfunc_end70-_strtol_l
                                        ; -- End function
	.type	__get_global_locale.84,@function ; -- Begin function __get_global_locale.84
__get_global_locale.84 NOP              ; @__get_global_locale.84
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end71 NOP 
	.size	__get_global_locale.84, .Lfunc_end71-__get_global_locale.84
                                        ; -- End function
	.globl	strtol_l                ; -- Begin function strtol_l
	.type	strtol_l,@function
strtol_l NOP                            ; @strtol_l
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	LOAD	%GR5, 4(%FP)
	COPYG	%GR1, impure_data
	CALL	_strtol_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end72 NOP 
	.size	strtol_l, .Lfunc_end72-strtol_l
                                        ; -- End function
	.globl	strtol                  ; -- Begin function strtol
	.type	strtol,@function
strtol NOP                              ; @strtol
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	__get_current_locale.83
	COPYG	%GR1, impure_data
	COPYG	%GR5, __global_locale
	CALL	_strtol_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end73 NOP 
	.size	strtol, .Lfunc_end73-strtol
                                        ; -- End function
	.type	_strtoul_r,@function    ; -- Begin function _strtoul_r
_strtoul_r NOP                          ; @_strtoul_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 12(%FP)
	LOAD	%GR3, 8(%FP)
	LOAD	%GR4, 4(%FP)
	CALL	__get_current_locale.87
	COPYG	%GR5, __global_locale
	CALL	_strtoul_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end74 NOP 
	.size	_strtoul_r, .Lfunc_end74-_strtoul_r
                                        ; -- End function
	.type	__get_current_locale.87,@function ; -- Begin function __get_current_locale.87
__get_current_locale.87 NOP             ; @__get_current_locale.87
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__get_global_locale.88
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end75 NOP 
	.size	__get_current_locale.87, .Lfunc_end75-__get_current_locale.87
                                        ; -- End function
	.type	_strtoul_l,@function    ; -- Begin function _strtoul_l
_strtoul_l NOP                          ; @_strtoul_l
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 60
	COPYR	%FP, %SP
	STORE	%GR1, 52(%FP)
	STORE	%GR2, 48(%FP)
	STORE	%GR1, 44(%FP)
	STORE	%GR2, 40(%FP)
	STORE	%GR3, 36(%FP)
	STORE	%GR4, 32(%FP)
	STORE	%GR5, 28(%FP)
	LOAD	%GR6, 40(%FP)
	STORE	%GR6, 24(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%FP)
	JUMP	.LBB76_1
.LBB76_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_2
.LBB76_2 NOP                            ;   in Loop: Header=BB76_1 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYG	%GR1, _ctype_+1
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_1
	JUMP	.LBB76_3
.LBB76_3 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_5
	JUMP	.LBB76_4
.LBB76_4 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_8
.LBB76_5 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 43
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_7
	JUMP	.LBB76_6
.LBB76_6 NOP 
	LOAD	%GR6, 24(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_7
.LBB76_7 NOP 
	JUMP	.LBB76_8
.LBB76_8 NOP 
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_10
	JUMP	.LBB76_9
.LBB76_9 NOP 
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 16
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_14
	JUMP	.LBB76_10
.LBB76_10 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 48
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_14
	JUMP	.LBB76_11
.LBB76_11 NOP 
	LOAD	%GR6, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 120
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_13
	JUMP	.LBB76_12
.LBB76_12 NOP 
	LOAD	%GR6, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 88
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_14
	JUMP	.LBB76_13
.LBB76_13 NOP 
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%FP)
	COPYI	%GR6, 16
	STORE	%GR6, 32(%FP)
	JUMP	.LBB76_14
.LBB76_14 NOP 
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_16
	JUMP	.LBB76_15
.LBB76_15 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 48
	EQ	%GR6, %GR6, %GR1
	COPYI	%GR1, 10
	COPYI	%GR2, 8
	CMOV	%GR1, %GR6, %GR2
	STORE	%GR1, 32(%FP)
	JUMP	.LBB76_16
.LBB76_16 NOP 
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, -1
	UDIV	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 32(%FP)
	UREM	%GR6, %GR1, %GR6
	STORE	%GR6, 0(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	STORE	%GR6, 4(%FP)
	JUMP	.LBB76_17
.LBB76_17 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 48
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_20
	JUMP	.LBB76_18
.LBB76_18 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 57
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB76_20
	JUMP	.LBB76_19
.LBB76_19 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_29
.LBB76_20 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 65
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_23
	JUMP	.LBB76_21
.LBB76_21 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 90
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB76_23
	JUMP	.LBB76_22
.LBB76_22 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -55
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_28
.LBB76_23 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 97
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_26
	JUMP	.LBB76_24
.LBB76_24 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 122
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB76_26
	JUMP	.LBB76_25
.LBB76_25 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -87
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_27
.LBB76_26 NOP 
	JUMP	.LBB76_39
.LBB76_27 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	JUMP	.LBB76_28
.LBB76_28 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	JUMP	.LBB76_29
.LBB76_29 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 32(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_31
	JUMP	.LBB76_30
.LBB76_30 NOP 
	JUMP	.LBB76_39
.LBB76_31 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_35
	JUMP	.LBB76_32
.LBB76_32 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 12(%FP)
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB76_35
	JUMP	.LBB76_33
.LBB76_33 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 12(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_36
	JUMP	.LBB76_34
.LBB76_34 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 0(%FP)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_36
	JUMP	.LBB76_35
.LBB76_35 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 4(%FP)
	JUMP	.LBB76_37
.LBB76_36 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	COPYI	%GR6, 1
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 32(%FP)
	LOAD	%GR1, 20(%FP)
	MUL	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 20(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB76_37
.LBB76_37 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	JUMP	.LBB76_38
.LBB76_38 NOP                           ;   in Loop: Header=BB76_17 Depth=1
	LOAD	%GR6, 24(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%FP)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB76_17
.LBB76_39 NOP 
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB76_41
	JUMP	.LBB76_40
.LBB76_40 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 34
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB76_44
.LBB76_41 NOP 
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_43
	JUMP	.LBB76_42
.LBB76_42 NOP 
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%FP)
	JUMP	.LBB76_43
.LBB76_43 NOP 
	JUMP	.LBB76_44
.LBB76_44 NOP 
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_49
	JUMP	.LBB76_45
.LBB76_45 NOP 
	LOAD	%GR6, 4(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB76_47
	JUMP	.LBB76_46
.LBB76_46 NOP 
	LOAD	%GR6, 24(%FP)
	ADDI	%GR6, %GR6, -1
	JUMP	.LBB76_48
.LBB76_47 NOP 
	LOAD	%GR6, 40(%FP)
	JUMP	.LBB76_48
.LBB76_48 NOP 
	LOAD	%GR1, 36(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB76_49
.LBB76_49 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 48(%FP)
	LOAD	%GR1, 52(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 60
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end76 NOP 
	.size	_strtoul_l, .Lfunc_end76-_strtoul_l
                                        ; -- End function
	.type	__get_global_locale.88,@function ; -- Begin function __get_global_locale.88
__get_global_locale.88 NOP              ; @__get_global_locale.88
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 4
	COPYR	%FP, %SP
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 4
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end77 NOP 
	.size	__get_global_locale.88, .Lfunc_end77-__get_global_locale.88
                                        ; -- End function
	.globl	strtoul_l               ; -- Begin function strtoul_l
	.type	strtoul_l,@function
strtoul_l NOP                           ; @strtoul_l
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	LOAD	%GR5, 4(%FP)
	COPYG	%GR1, impure_data
	CALL	_strtoul_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end78 NOP 
	.size	strtoul_l, .Lfunc_end78-strtoul_l
                                        ; -- End function
	.globl	strtoul                 ; -- Begin function strtoul
	.type	strtoul,@function
strtoul NOP                             ; @strtoul
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR5, 20(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	LOAD	%GR4, 8(%FP)
	CALL	__get_current_locale.87
	COPYG	%GR1, impure_data
	COPYG	%GR5, __global_locale
	CALL	_strtoul_l
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 20(%FP)
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end79 NOP 
	.size	strtoul, .Lfunc_end79-strtoul
                                        ; -- End function
	.type	__submore,@function     ; -- Begin function __submore
__submore NOP                           ; @__submore
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB80_7
	JUMP	.LBB80_1
.LBB80_1 NOP 
	LOAD	%GR1, 20(%FP)
	COPYI	%GR2, 1024
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB80_3
	JUMP	.LBB80_2
.LBB80_2 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 24(%FP)
	JUMP	.LBB80_10
.LBB80_3 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 48
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 52
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 1021
	STORE	%GR6, 8(%FP)
	COPYI	%GR6, 3
	STORE	%GR6, 12(%FP)
	JUMP	.LBB80_4
.LBB80_4 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 12(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB80_6
	JUMP	.LBB80_5
.LBB80_5 NOP                            ;   in Loop: Header=BB80_4 Depth=1
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 64
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%FP)
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB80_4
.LBB80_6 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 24(%FP)
	JUMP	.LBB80_10
.LBB80_7 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 52
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR6, 12(%FP)
	SHLI	%GR3, %GR6, 1
	CALL	_realloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB80_9
	JUMP	.LBB80_8
.LBB80_8 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 24(%FP)
	JUMP	.LBB80_10
.LBB80_9 NOP 
	LOAD	%GR2, 8(%FP)
	LOAD	%GR3, 12(%FP)
	ADD	%GR1, %GR2, %GR3
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 48
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	SHLI	%GR6, %GR6, 1
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 52
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 24(%FP)
	JUMP	.LBB80_10
.LBB80_10 NOP 
	LOAD	%GR6, 24(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end80 NOP 
	.size	__submore, .Lfunc_end80-__submore
                                        ; -- End function
	.type	_ungetc_r,@function     ; -- Begin function _ungetc_r
_ungetc_r NOP                           ; @_ungetc_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	LOAD	%GR6, 20(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_2
	JUMP	.LBB81_1
.LBB81_1 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_2 NOP 
	JUMP	.LBB81_3
.LBB81_3 NOP 
	LOAD	%GR6, 24(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_6
	JUMP	.LBB81_4
.LBB81_4 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_6
	JUMP	.LBB81_5
.LBB81_5 NOP 
	LOAD	%GR1, 12(%FP)
	CALL	__sinit
	JUMP	.LBB81_6
.LBB81_6 NOP 
	JUMP	.LBB81_7
.LBB81_7 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_12
	JUMP	.LBB81_8
.LBB81_8 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_10
	JUMP	.LBB81_9
.LBB81_9 NOP 
	JUMP	.LBB81_11
.LBB81_10 NOP 
	JUMP	.LBB81_11
.LBB81_11 NOP 
	JUMP	.LBB81_12
.LBB81_12 NOP 
	JUMP	.LBB81_13
.LBB81_13 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_15
	JUMP	.LBB81_14
.LBB81_14 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB81_15
.LBB81_15 NOP 
	JUMP	.LBB81_16
.LBB81_16 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65503
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_34
	JUMP	.LBB81_17
.LBB81_17 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_24
	JUMP	.LBB81_18
.LBB81_18 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_23
	JUMP	.LBB81_19
.LBB81_19 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_21
	JUMP	.LBB81_20
.LBB81_20 NOP 
	JUMP	.LBB81_22
.LBB81_21 NOP 
	JUMP	.LBB81_22
.LBB81_22 NOP 
	JUMP	.LBB81_23
.LBB81_23 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_24 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_33
	JUMP	.LBB81_25
.LBB81_25 NOP 
	LOAD	%GR1, 24(%FP)
	LOAD	%GR2, 16(%FP)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_32
	JUMP	.LBB81_26
.LBB81_26 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_31
	JUMP	.LBB81_27
.LBB81_27 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_29
	JUMP	.LBB81_28
.LBB81_28 NOP 
	JUMP	.LBB81_30
.LBB81_29 NOP 
	JUMP	.LBB81_30
.LBB81_30 NOP 
	JUMP	.LBB81_31
.LBB81_31 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_32 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65527
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 24
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB81_33
.LBB81_33 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB81_34
.LBB81_34 NOP 
	ULOADB	%GR6, 20(%FP)
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_49
	JUMP	.LBB81_35
.LBB81_35 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 52
	LOAD	%GR6, 0(%GR6)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB81_43
	JUMP	.LBB81_36
.LBB81_36 NOP 
	LOAD	%GR1, 24(%FP)
	LOAD	%GR2, 16(%FP)
	CALL	__submore
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_43
	JUMP	.LBB81_37
.LBB81_37 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_42
	JUMP	.LBB81_38
.LBB81_38 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_40
	JUMP	.LBB81_39
.LBB81_39 NOP 
	JUMP	.LBB81_41
.LBB81_40 NOP 
	JUMP	.LBB81_41
.LBB81_41 NOP 
	JUMP	.LBB81_42
.LBB81_42 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_43 NOP 
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 16(%FP)
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR1)
	STOREB	%GR6, 0(%GR2)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_48
	JUMP	.LBB81_44
.LBB81_44 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_46
	JUMP	.LBB81_45
.LBB81_45 NOP 
	JUMP	.LBB81_47
.LBB81_46 NOP 
	JUMP	.LBB81_47
.LBB81_47 NOP 
	JUMP	.LBB81_48
.LBB81_48 NOP 
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_49 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_58
	JUMP	.LBB81_50
.LBB81_50 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB81_58
	JUMP	.LBB81_51
.LBB81_51 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_58
	JUMP	.LBB81_52
.LBB81_52 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_57
	JUMP	.LBB81_53
.LBB81_53 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_55
	JUMP	.LBB81_54
.LBB81_54 NOP 
	JUMP	.LBB81_56
.LBB81_55 NOP 
	JUMP	.LBB81_56
.LBB81_56 NOP 
	JUMP	.LBB81_57
.LBB81_57 NOP 
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_58 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 60
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 56
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 64
	ADDI	%GR6, %GR6, 48
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 52
	COPYI	%GR1, 3
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 66
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 66
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB81_63
	JUMP	.LBB81_59
.LBB81_59 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB81_61
	JUMP	.LBB81_60
.LBB81_60 NOP 
	JUMP	.LBB81_62
.LBB81_61 NOP 
	JUMP	.LBB81_62
.LBB81_62 NOP 
	JUMP	.LBB81_63
.LBB81_63 NOP 
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB81_64
.LBB81_64 NOP 
	LOAD	%GR6, 28(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end81 NOP 
	.size	_ungetc_r, .Lfunc_end81-_ungetc_r
                                        ; -- End function
	.globl	ungetc                  ; -- Begin function ungetc
	.type	ungetc,@function
ungetc NOP                              ; @ungetc
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR3, 12(%FP)
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 8(%FP)
	LOAD	%GR3, 4(%FP)
	COPYG	%GR1, impure_data
	CALL	_ungetc_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 12(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end82 NOP 
	.size	ungetc, .Lfunc_end82-ungetc
                                        ; -- End function
	.type	__ascii_wctomb,@function ; -- Begin function __ascii_wctomb
__ascii_wctomb NOP                      ; @__ascii_wctomb
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%GR1, 24(%FP)
	STORE	%GR1, 16(%FP)
	STORE	%GR2, 12(%FP)
	STORE	%GR3, 8(%FP)
	STORE	%GR4, 4(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 0(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB83_2
	JUMP	.LBB83_1
.LBB83_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%FP)
	JUMP	.LBB83_5
.LBB83_2 NOP 
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 256
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB83_4
	JUMP	.LBB83_3
.LBB83_3 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB83_5
.LBB83_4 NOP 
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 12(%FP)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STORE	%GR6, 20(%FP)
	JUMP	.LBB83_5
.LBB83_5 NOP 
	LOAD	%GR6, 20(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end83 NOP 
	.size	__ascii_wctomb, .Lfunc_end83-__ascii_wctomb
                                        ; -- End function
	.type	_write_r,@function      ; -- Begin function _write_r
_write_r NOP                            ; @_write_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	STORE	%GR4, 12(%FP)
	COPYG	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	CALL	_write
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB84_3
	JUMP	.LBB84_1
.LBB84_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB84_3
	JUMP	.LBB84_2
.LBB84_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB84_3
.LBB84_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end84 NOP 
	.size	_write_r, .Lfunc_end84-_write_r
                                        ; -- End function
	.type	_close_r,@function      ; -- Begin function _close_r
_close_r NOP                            ; @_close_r
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
	CALL	_close
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB85_3
	JUMP	.LBB85_1
.LBB85_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB85_3
	JUMP	.LBB85_2
.LBB85_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB85_3
.LBB85_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end85 NOP 
	.size	_close_r, .Lfunc_end85-_close_r
                                        ; -- End function
	.type	__errno,@function       ; -- Begin function __errno
__errno NOP                             ; @__errno
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%RA, 8(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%RA, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end86 NOP 
	.size	__errno, .Lfunc_end86-__errno
                                        ; -- End function
	.type	_fclose_r,@function     ; -- Begin function _fclose_r
_fclose_r NOP                           ; @_fclose_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_2
	JUMP	.LBB87_1
.LBB87_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 24(%FP)
	JUMP	.LBB87_36
.LBB87_2 NOP 
	JUMP	.LBB87_3
.LBB87_3 NOP 
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_6
	JUMP	.LBB87_4
.LBB87_4 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_6
	JUMP	.LBB87_5
.LBB87_5 NOP 
	LOAD	%GR1, 8(%FP)
	CALL	__sinit
	JUMP	.LBB87_6
.LBB87_6 NOP 
	JUMP	.LBB87_7
.LBB87_7 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB87_12
	JUMP	.LBB87_8
.LBB87_8 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_10
	JUMP	.LBB87_9
.LBB87_9 NOP 
	JUMP	.LBB87_11
.LBB87_10 NOP 
	JUMP	.LBB87_11
.LBB87_11 NOP 
	JUMP	.LBB87_12
.LBB87_12 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_19
	JUMP	.LBB87_13
.LBB87_13 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB87_18
	JUMP	.LBB87_14
.LBB87_14 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_16
	JUMP	.LBB87_15
.LBB87_15 NOP 
	JUMP	.LBB87_17
.LBB87_16 NOP 
	JUMP	.LBB87_17
.LBB87_17 NOP 
	JUMP	.LBB87_18
.LBB87_18 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 24(%FP)
	JUMP	.LBB87_36
.LBB87_19 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	CALL	__sflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_22
	JUMP	.LBB87_20
.LBB87_20 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 44
	LOAD	%GR3, 0(%GR1)
	LOAD	%GR1, 20(%FP)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	CALLR	%GR3
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB87_22
	JUMP	.LBB87_21
.LBB87_21 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 12(%FP)
	JUMP	.LBB87_22
.LBB87_22 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_24
	JUMP	.LBB87_23
.LBB87_23 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB87_24
.LBB87_24 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_28
	JUMP	.LBB87_25
.LBB87_25 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB87_27
	JUMP	.LBB87_26
.LBB87_26 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB87_27
.LBB87_27 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB87_28
.LBB87_28 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 68
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_30
	JUMP	.LBB87_29
.LBB87_29 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 68
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 68
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB87_30
.LBB87_30 NOP 
	CALL	__sfp_lock_acquire
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	COPYI	%GR1, 0
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB87_35
	JUMP	.LBB87_31
.LBB87_31 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB87_33
	JUMP	.LBB87_32
.LBB87_32 NOP 
	JUMP	.LBB87_34
.LBB87_33 NOP 
	JUMP	.LBB87_34
.LBB87_34 NOP 
	JUMP	.LBB87_35
.LBB87_35 NOP 
	CALL	__sfp_lock_release
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 24(%FP)
	JUMP	.LBB87_36
.LBB87_36 NOP 
	LOAD	%GR6, 24(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end87 NOP 
	.size	_fclose_r, .Lfunc_end87-_fclose_r
                                        ; -- End function
	.globl	fclose                  ; -- Begin function fclose
	.type	fclose,@function
fclose NOP                              ; @fclose
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 12(%FP)
	COPYG	%GR1, impure_data
	CALL	_fclose_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end88 NOP 
	.size	fclose, .Lfunc_end88-fclose
                                        ; -- End function
	.type	__sflush_r,@function    ; -- Begin function __sflush_r
__sflush_r NOP                          ; @__sflush_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 80
	COPYR	%FP, %SP
	STORE	%RA, 72(%FP)
	STORE	%GR1, 68(%FP)
	STORE	%GR2, 64(%FP)
	STORE	%GR3, 60(%FP)
	STORE	%GR4, 56(%FP)
	STORE	%GR5, 52(%FP)
	STORE	%GR1, 44(%FP)
	STORE	%GR2, 40(%FP)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	STOREH	%GR6, 24(%FP)
	ULOADH	%GR6, 24(%FP)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_34
	JUMP	.LBB89_1
.LBB89_1 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 2048
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB89_3
	JUMP	.LBB89_2
.LBB89_2 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 60
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_33
	JUMP	.LBB89_3
.LBB89_3 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 40
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_33
	JUMP	.LBB89_4
.LBB89_4 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 44(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4096
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_6
	JUMP	.LBB89_5
.LBB89_5 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 80
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%FP)
	JUMP	.LBB89_14
.LBB89_6 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR1, %GR6, 40
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 44(%FP)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR3, 0
	COPYI	%GR4, 1
	CALLR	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_13
	JUMP	.LBB89_7
.LBB89_7 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_13
	JUMP	.LBB89_8
.LBB89_8 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 29
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_10
	JUMP	.LBB89_9
.LBB89_9 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 22
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_11
	JUMP	.LBB89_10
.LBB89_10 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 44(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB89_12
.LBB89_11 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB89_12
.LBB89_12 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_13 NOP 
	JUMP	.LBB89_14
.LBB89_14 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_18
	JUMP	.LBB89_15
.LBB89_15 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_17
	JUMP	.LBB89_16
.LBB89_16 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 60
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%FP)
	JUMP	.LBB89_17
.LBB89_17 NOP 
	JUMP	.LBB89_18
.LBB89_18 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR1, %GR6, 40
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 44(%FP)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 16(%FP)
	COPYI	%GR4, 0
	CALLR	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_22
	JUMP	.LBB89_19
.LBB89_19 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_22
	JUMP	.LBB89_20
.LBB89_20 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 29
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_22
	JUMP	.LBB89_21
.LBB89_21 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 22
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_31
	JUMP	.LBB89_22
.LBB89_22 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 63487
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR2, %GR6, 16
	LOAD	%GR2, 0(%GR2)
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4096
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_26
	JUMP	.LBB89_23
.LBB89_23 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_25
	JUMP	.LBB89_24
.LBB89_24 NOP 
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_26
	JUMP	.LBB89_25
.LBB89_25 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR1, %GR1, 80
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB89_26
.LBB89_26 NOP 
	LOAD	%GR6, 20(%FP)
	LOAD	%GR1, 44(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_30
	JUMP	.LBB89_27
.LBB89_27 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB89_29
	JUMP	.LBB89_28
.LBB89_28 NOP 
	LOAD	%GR1, 44(%FP)
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB89_29
.LBB89_29 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB89_30
.LBB89_30 NOP 
	JUMP	.LBB89_32
.LBB89_31 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_32 NOP 
	JUMP	.LBB89_33
.LBB89_33 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_34 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 36(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_36
	JUMP	.LBB89_35
.LBB89_35 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_36 NOP 
	LOAD	%GR6, 40(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 36(%FP)
	LOAD	%GR1, 40(%FP)
	STORE	%GR6, 0(%GR1)
	ULOADH	%GR6, 24(%FP)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_38
	JUMP	.LBB89_37
.LBB89_37 NOP 
	COPYI	%GR6, 0
	JUMP	.LBB89_39
.LBB89_38 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB89_39
.LBB89_39 NOP 
	LOAD	%GR1, 40(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB89_40
.LBB89_40 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 32(%FP)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB89_44
	JUMP	.LBB89_41
.LBB89_41 NOP                           ;   in Loop: Header=BB89_40 Depth=1
	LOAD	%GR6, 40(%FP)
	ADDI	%GR1, %GR6, 36
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 44(%FP)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 36(%FP)
	LOAD	%GR4, 32(%FP)
	CALLR	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 28(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB89_43
	JUMP	.LBB89_42
.LBB89_42 NOP 
	LOAD	%GR6, 40(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_43 NOP                           ;   in Loop: Header=BB89_40 Depth=1
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 36(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 28(%FP)
	LOAD	%GR1, 32(%FP)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 32(%FP)
	JUMP	.LBB89_40
.LBB89_44 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 48(%FP)
	JUMP	.LBB89_45
.LBB89_45 NOP 
	LOAD	%GR6, 48(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 52(%FP)
	LOAD	%GR4, 56(%FP)
	LOAD	%GR3, 60(%FP)
	LOAD	%GR2, 64(%FP)
	LOAD	%GR1, 68(%FP)
	LOAD	%RA, 72(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 80
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end89 NOP 
	.size	__sflush_r, .Lfunc_end89-__sflush_r
                                        ; -- End function
	.type	_fflush_r,@function     ; -- Begin function _fflush_r
_fflush_r NOP                           ; @_fflush_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	JUMP	.LBB90_1
.LBB90_1 NOP 
	LOAD	%GR6, 24(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB90_4
	JUMP	.LBB90_2
.LBB90_2 NOP 
	LOAD	%GR6, 12(%FP)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB90_4
	JUMP	.LBB90_3
.LBB90_3 NOP 
	LOAD	%GR1, 12(%FP)
	CALL	__sinit
	JUMP	.LBB90_4
.LBB90_4 NOP 
	JUMP	.LBB90_5
.LBB90_5 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB90_7
	JUMP	.LBB90_6
.LBB90_6 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 28(%FP)
	JUMP	.LBB90_18
.LBB90_7 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB90_12
	JUMP	.LBB90_8
.LBB90_8 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB90_10
	JUMP	.LBB90_9
.LBB90_9 NOP 
	JUMP	.LBB90_11
.LBB90_10 NOP 
	JUMP	.LBB90_11
.LBB90_11 NOP 
	JUMP	.LBB90_12
.LBB90_12 NOP 
	LOAD	%GR1, 24(%FP)
	LOAD	%GR2, 20(%FP)
	CALL	__sflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 100
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB90_17
	JUMP	.LBB90_13
.LBB90_13 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB90_15
	JUMP	.LBB90_14
.LBB90_14 NOP 
	JUMP	.LBB90_16
.LBB90_15 NOP 
	JUMP	.LBB90_16
.LBB90_16 NOP 
	JUMP	.LBB90_17
.LBB90_17 NOP 
	LOAD	%GR6, 16(%FP)
	STORE	%GR6, 28(%FP)
	JUMP	.LBB90_18
.LBB90_18 NOP 
	LOAD	%GR6, 28(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end90 NOP 
	.size	_fflush_r, .Lfunc_end90-_fflush_r
                                        ; -- End function
	.globl	fflush                  ; -- Begin function fflush
	.type	fflush,@function
fflush NOP                              ; @fflush
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 8(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB91_2
	JUMP	.LBB91_1
.LBB91_1 NOP 
	COPYG	%GR1, impure_data
	COPYG	%GR2, _fflush_r
	CALL	_fwalk_reent
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB91_3
.LBB91_2 NOP 
	CALL	__getreent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 8(%FP)
	COPYG	%GR1, impure_data
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	JUMP	.LBB91_3
.LBB91_3 NOP 
	LOAD	%GR6, 12(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end91 NOP 
	.size	fflush, .Lfunc_end91-fflush
                                        ; -- End function
	.type	_lseek_r,@function      ; -- Begin function _lseek_r
_lseek_r NOP                            ; @_lseek_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	STORE	%GR4, 12(%FP)
	COPYG	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	CALL	_lseek
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB92_3
	JUMP	.LBB92_1
.LBB92_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB92_3
	JUMP	.LBB92_2
.LBB92_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB92_3
.LBB92_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end92 NOP 
	.size	_lseek_r, .Lfunc_end92-_lseek_r
                                        ; -- End function
	.type	__smakebuf_r,@function  ; -- Begin function __smakebuf_r
__smakebuf_r NOP                        ; @__smakebuf_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR4, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB93_2
	JUMP	.LBB93_1
.LBB93_1 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 67
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB93_10
.LBB93_2 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	ADDI	%GR3, %FP, 4
	ADDI	%GR4, %FP, 0
	CALL	__swhatbuf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 4(%FP)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB93_6
	JUMP	.LBB93_3
.LBB93_3 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB93_5
	JUMP	.LBB93_4
.LBB93_4 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65532
	ORI	%GR1, %GR1, 2
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, 67
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB93_5
.LBB93_5 NOP 
	JUMP	.LBB93_10
.LBB93_6 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR6, %GR6, 60
	COPYG	%GR1, _cleanup_r
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 128
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB93_9
	JUMP	.LBB93_7
.LBB93_7 NOP 
	LOAD	%GR1, 20(%FP)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	CALL	_isatty_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB93_9
	JUMP	.LBB93_8
.LBB93_8 NOP 
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65532
	ORI	%GR1, %GR1, 1
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB93_9
.LBB93_9 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR1, %GR1, 12
	ULOADH	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STOREH	%GR6, 0(%GR1)
	JUMP	.LBB93_10
.LBB93_10 NOP 
	LOAD	%GR4, 24(%FP)
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end93 NOP 
	.size	__smakebuf_r, .Lfunc_end93-__smakebuf_r
                                        ; -- End function
	.type	__swhatbuf_r,@function  ; -- Begin function __swhatbuf_r
__swhatbuf_r NOP                        ; @__swhatbuf_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 128
	COPYR	%FP, %SP
	STORE	%RA, 120(%FP)
	STORE	%GR1, 116(%FP)
	STORE	%GR2, 112(%FP)
	STORE	%GR3, 108(%FP)
	STORE	%GR1, 100(%FP)
	STORE	%GR2, 96(%FP)
	STORE	%GR3, 92(%FP)
	STORE	%GR4, 88(%FP)
	COPYI	%GR6, 2048
	STORE	%GR6, 84(%FP)
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB94_2
	JUMP	.LBB94_1
.LBB94_1 NOP 
	LOAD	%GR1, 100(%FP)
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	ADDI	%GR3, %FP, 8
	CALL	_fstat_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB94_6
	JUMP	.LBB94_2
.LBB94_2 NOP 
	LOAD	%GR6, 88(%FP)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB94_4
	JUMP	.LBB94_3
.LBB94_3 NOP 
	LOAD	%GR6, 92(%FP)
	COPYI	%GR1, 64
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB94_5
.LBB94_4 NOP 
	LOAD	%GR6, 92(%FP)
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB94_5
.LBB94_5 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 104(%FP)
	JUMP	.LBB94_7
.LBB94_6 NOP 
	ADDI	%GR6, %FP, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 61440
	COPYI	%GR1, 8192
	EQ	%GR6, %GR6, %GR1
	LOAD	%GR1, 88(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 92(%FP)
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 2048
	STORE	%GR6, 104(%FP)
	JUMP	.LBB94_7
.LBB94_7 NOP 
	LOAD	%GR6, 104(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 108(%FP)
	LOAD	%GR2, 112(%FP)
	LOAD	%GR1, 116(%FP)
	LOAD	%RA, 120(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 128
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end94 NOP 
	.size	__swhatbuf_r, .Lfunc_end94-__swhatbuf_r
                                        ; -- End function
	.type	_read_r,@function       ; -- Begin function _read_r
_read_r NOP                             ; @_read_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 48
	COPYR	%FP, %SP
	STORE	%RA, 40(%FP)
	STORE	%GR1, 36(%FP)
	STORE	%GR2, 32(%FP)
	STORE	%GR3, 28(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	STORE	%GR4, 12(%FP)
	COPYG	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 20(%FP)
	LOAD	%GR2, 16(%FP)
	LOAD	%GR3, 12(%FP)
	CALL	_read
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB95_3
	JUMP	.LBB95_1
.LBB95_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB95_3
	JUMP	.LBB95_2
.LBB95_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB95_3
.LBB95_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%FP)
	LOAD	%GR2, 32(%FP)
	LOAD	%GR1, 36(%FP)
	LOAD	%RA, 40(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 48
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end95 NOP 
	.size	_read_r, .Lfunc_end95-_read_r
                                        ; -- End function
	.type	_realloc_r,@function    ; -- Begin function _realloc_r
_realloc_r NOP                          ; @_realloc_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 144
	COPYR	%FP, %SP
	STORE	%RA, 136(%FP)
	STORE	%GR1, 132(%FP)
	STORE	%GR2, 128(%FP)
	STORE	%GR3, 124(%FP)
	STORE	%GR1, 116(%FP)
	STORE	%GR2, 112(%FP)
	STORE	%GR3, 108(%FP)
	LOAD	%GR6, 112(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_2
	JUMP	.LBB96_1
.LBB96_1 NOP 
	LOAD	%GR1, 116(%FP)
	LOAD	%GR2, 108(%FP)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_2 NOP 
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_lock
	LOAD	%GR6, 112(%FP)
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 100(%FP)
	STORE	%GR6, 92(%FP)
	LOAD	%GR6, 100(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 96(%FP)
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 108(%FP)
	ADDI	%GR6, %GR6, 11
	COPYI	%GR1, 22
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_4
	JUMP	.LBB96_3
.LBB96_3 NOP 
	COPYI	%GR6, 16
	JUMP	.LBB96_5
.LBB96_4 NOP 
	LOAD	%GR6, 108(%FP)
	ADDI	%GR6, %GR6, 11
	ANDI	%GR6, %GR6, -8
	JUMP	.LBB96_5
.LBB96_5 NOP 
	STORE	%GR6, 104(%FP)
	LOAD	%GR6, 104(%FP)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_7
	JUMP	.LBB96_6
.LBB96_6 NOP 
	LOAD	%GR6, 104(%FP)
	LOAD	%GR1, 108(%FP)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_8
	JUMP	.LBB96_7
.LBB96_7 NOP 
	LOAD	%GR6, 116(%FP)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_8 NOP 
	LOAD	%GR6, 96(%FP)
	LOAD	%GR1, 104(%FP)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_83
	JUMP	.LBB96_9
.LBB96_9 NOP 
	LOAD	%GR6, 100(%FP)
	LOAD	%GR1, 96(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 80(%FP)
	LOAD	%GR6, 80(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_11
	JUMP	.LBB96_10
.LBB96_10 NOP 
	LOAD	%GR6, 80(%FP)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB96_19
	JUMP	.LBB96_11
.LBB96_11 NOP 
	LOAD	%GR6, 80(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 76(%FP)
	LOAD	%GR6, 80(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_15
	JUMP	.LBB96_12
.LBB96_12 NOP 
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 104(%FP)
	ADDI	%GR1, %GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_14
	JUMP	.LBB96_13
.LBB96_13 NOP 
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 100(%FP)
	LOAD	%GR1, 104(%FP)
	ADD	%GR6, %GR6, %GR1
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%FP)
	LOAD	%GR2, 104(%FP)
	SUB	%GR6, %GR6, %GR2
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 100(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 1
	LOAD	%GR2, 104(%FP)
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 100(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_14 NOP 
	JUMP	.LBB96_18
.LBB96_15 NOP 
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 104(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_17
	JUMP	.LBB96_16
.LBB96_16 NOP 
	LOAD	%GR6, 80(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%FP)
	LOAD	%GR6, 80(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR1, 56(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	JUMP	.LBB96_84
.LBB96_17 NOP 
	JUMP	.LBB96_18
.LBB96_18 NOP 
	JUMP	.LBB96_20
.LBB96_19 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 80(%FP)
	STORE	%GR6, 76(%FP)
	JUMP	.LBB96_20
.LBB96_20 NOP 
	LOAD	%GR6, 100(%FP)
	ADDI	%GR6, %GR6, 4
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB96_67
	JUMP	.LBB96_21
.LBB96_21 NOP 
	LOAD	%GR6, 100(%FP)
	LOAD	%GR1, 0(%GR6)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 72(%FP)
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	STORE	%GR6, 68(%FP)
	LOAD	%GR6, 80(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_52
	JUMP	.LBB96_22
.LBB96_22 NOP 
	LOAD	%GR6, 80(%FP)
	COPYG	%GR1, __malloc_av_+8
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_37
	JUMP	.LBB96_23
.LBB96_23 NOP 
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 68(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 104(%FP)
	ADDI	%GR1, %GR1, 16
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_36
	JUMP	.LBB96_24
.LBB96_24 NOP 
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%FP)
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR1, 56(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 72(%FP)
	STORE	%GR6, 92(%FP)
	LOAD	%GR6, 68(%FP)
	LOAD	%GR1, 76(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 84(%FP)
	JUMP	.LBB96_25
.LBB96_25 NOP 
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 48(%FP)
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_33
	JUMP	.LBB96_26
.LBB96_26 NOP 
	LOAD	%GR6, 112(%FP)
	STORE	%GR6, 44(%FP)
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 40(%FP)
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 20
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_32
	JUMP	.LBB96_27
.LBB96_27 NOP 
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 28
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_31
	JUMP	.LBB96_28
.LBB96_28 NOP 
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_30
	JUMP	.LBB96_29
.LBB96_29 NOP 
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_30
.LBB96_30 NOP 
	JUMP	.LBB96_31
.LBB96_31 NOP 
	JUMP	.LBB96_32
.LBB96_32 NOP 
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 40(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 44(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_34
.LBB96_33 NOP 
	LOAD	%GR1, 84(%FP)
	LOAD	%GR2, 112(%FP)
	LOAD	%GR3, 48(%FP)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB96_34
.LBB96_34 NOP 
	JUMP	.LBB96_35
.LBB96_35 NOP 
	LOAD	%GR6, 92(%FP)
	LOAD	%GR1, 104(%FP)
	ADD	%GR6, %GR6, %GR1
	COPYG	%GR1, __malloc_av_+8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%FP)
	LOAD	%GR2, 104(%FP)
	SUB	%GR6, %GR6, %GR2
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 1
	LOAD	%GR2, 104(%FP)
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_36 NOP 
	JUMP	.LBB96_51
.LBB96_37 NOP 
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 68(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 104(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_50
	JUMP	.LBB96_38
.LBB96_38 NOP 
	LOAD	%GR6, 80(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%FP)
	LOAD	%GR6, 80(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR1, 56(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%FP)
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR1, 56(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 72(%FP)
	STORE	%GR6, 92(%FP)
	LOAD	%GR6, 76(%FP)
	LOAD	%GR1, 68(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 84(%FP)
	JUMP	.LBB96_39
.LBB96_39 NOP 
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 36(%FP)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_47
	JUMP	.LBB96_40
.LBB96_40 NOP 
	LOAD	%GR6, 112(%FP)
	STORE	%GR6, 32(%FP)
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 28(%FP)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 20
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_46
	JUMP	.LBB96_41
.LBB96_41 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 28
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_45
	JUMP	.LBB96_42
.LBB96_42 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 36(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_44
	JUMP	.LBB96_43
.LBB96_43 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_44
.LBB96_44 NOP 
	JUMP	.LBB96_45
.LBB96_45 NOP 
	JUMP	.LBB96_46
.LBB96_46 NOP 
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 28(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_48
.LBB96_47 NOP 
	LOAD	%GR1, 84(%FP)
	LOAD	%GR2, 112(%FP)
	LOAD	%GR3, 36(%FP)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB96_48
.LBB96_48 NOP 
	JUMP	.LBB96_49
.LBB96_49 NOP 
	JUMP	.LBB96_84
.LBB96_50 NOP 
	JUMP	.LBB96_51
.LBB96_51 NOP 
	JUMP	.LBB96_52
.LBB96_52 NOP 
	LOAD	%GR6, 72(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_66
	JUMP	.LBB96_53
.LBB96_53 NOP 
	LOAD	%GR6, 68(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 104(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_66
	JUMP	.LBB96_54
.LBB96_54 NOP 
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%FP)
	LOAD	%GR6, 72(%FP)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%FP)
	LOAD	%GR6, 56(%FP)
	LOAD	%GR1, 52(%FP)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 52(%FP)
	LOAD	%GR1, 56(%FP)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 72(%FP)
	STORE	%GR6, 92(%FP)
	LOAD	%GR6, 68(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 84(%FP)
	JUMP	.LBB96_55
.LBB96_55 NOP 
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 24(%FP)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_63
	JUMP	.LBB96_56
.LBB96_56 NOP 
	LOAD	%GR6, 112(%FP)
	STORE	%GR6, 20(%FP)
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 16(%FP)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 20
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_62
	JUMP	.LBB96_57
.LBB96_57 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 28
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_61
	JUMP	.LBB96_58
.LBB96_58 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 24(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_60
	JUMP	.LBB96_59
.LBB96_59 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_60
.LBB96_60 NOP 
	JUMP	.LBB96_61
.LBB96_61 NOP 
	JUMP	.LBB96_62
.LBB96_62 NOP 
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 16(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_64
.LBB96_63 NOP 
	LOAD	%GR1, 84(%FP)
	LOAD	%GR2, 112(%FP)
	LOAD	%GR3, 24(%FP)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB96_64
.LBB96_64 NOP 
	JUMP	.LBB96_65
.LBB96_65 NOP 
	JUMP	.LBB96_84
.LBB96_66 NOP 
	JUMP	.LBB96_67
.LBB96_67 NOP 
	LOAD	%GR1, 116(%FP)
	LOAD	%GR2, 108(%FP)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 84(%FP)
	LOAD	%GR6, 84(%FP)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_69
	JUMP	.LBB96_68
.LBB96_68 NOP 
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_69 NOP 
	LOAD	%GR6, 84(%FP)
	ADDI	%GR6, %GR6, -8
	STORE	%GR6, 92(%FP)
	LOAD	%GR1, 100(%FP)
	ADDI	%GR2, %GR1, 4
	LOAD	%GR2, 0(%GR2)
	ANDI	%GR2, %GR2, -2
	ADD	%GR1, %GR1, %GR2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_71
	JUMP	.LBB96_70
.LBB96_70 NOP 
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, -4
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%FP)
	LOAD	%GR6, 100(%FP)
	STORE	%GR6, 92(%FP)
	JUMP	.LBB96_84
.LBB96_71 NOP 
	JUMP	.LBB96_72
.LBB96_72 NOP 
	LOAD	%GR6, 96(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB96_80
	JUMP	.LBB96_73
.LBB96_73 NOP 
	LOAD	%GR6, 112(%FP)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 20
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_79
	JUMP	.LBB96_74
.LBB96_74 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 28
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_78
	JUMP	.LBB96_75
.LBB96_75 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%FP)
	COPYI	%GR1, 36
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_77
	JUMP	.LBB96_76
.LBB96_76 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_77
.LBB96_77 NOP 
	JUMP	.LBB96_78
.LBB96_78 NOP 
	JUMP	.LBB96_79
.LBB96_79 NOP 
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB96_81
.LBB96_80 NOP 
	LOAD	%GR1, 84(%FP)
	LOAD	%GR2, 112(%FP)
	LOAD	%GR3, 12(%FP)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB96_81
.LBB96_81 NOP 
	JUMP	.LBB96_82
.LBB96_82 NOP 
	LOAD	%GR1, 116(%FP)
	LOAD	%GR2, 112(%FP)
	CALL	_free_r
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 84(%FP)
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_83 NOP 
	JUMP	.LBB96_84
.LBB96_84 NOP 
	LOAD	%GR6, 88(%FP)
	LOAD	%GR1, 104(%FP)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 60(%FP)
	LOAD	%GR6, 60(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB96_86
	JUMP	.LBB96_85
.LBB96_85 NOP 
	LOAD	%GR6, 92(%FP)
	LOAD	%GR1, 104(%FP)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 64(%FP)
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 1
	LOAD	%GR2, 104(%FP)
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 60(%FP)
	ORI	%GR6, %GR6, 1
	LOAD	%GR1, 64(%FP)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 64(%FP)
	LOAD	%GR1, 60(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 116(%FP)
	LOAD	%GR6, 64(%FP)
	ADDI	%GR2, %GR6, 8
	CALL	_free_r
	JUMP	.LBB96_87
.LBB96_86 NOP 
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 1
	LOAD	%GR2, 88(%FP)
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 92(%FP)
	LOAD	%GR1, 88(%FP)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB96_87
.LBB96_87 NOP 
	LOAD	%GR1, 116(%FP)
	CALL	__malloc_unlock
	LOAD	%GR6, 92(%FP)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 120(%FP)
	JUMP	.LBB96_88
.LBB96_88 NOP 
	LOAD	%GR6, 120(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 124(%FP)
	LOAD	%GR2, 128(%FP)
	LOAD	%GR1, 132(%FP)
	LOAD	%RA, 136(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 144
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end96 NOP 
	.size	_realloc_r, .Lfunc_end96-_realloc_r
                                        ; -- End function
	.type	_fstat_r,@function      ; -- Begin function _fstat_r
_fstat_r NOP                            ; @_fstat_r
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 32
	COPYR	%FP, %SP
	STORE	%RA, 24(%FP)
	STORE	%GR1, 20(%FP)
	STORE	%GR2, 16(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	STORE	%GR3, 4(%FP)
	COPYG	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 8(%FP)
	LOAD	%GR2, 4(%FP)
	CALL	_fstat
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB97_3
	JUMP	.LBB97_1
.LBB97_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB97_3
	JUMP	.LBB97_2
.LBB97_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB97_3
.LBB97_3 NOP 
	LOAD	%GR6, 0(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 16(%FP)
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end97 NOP 
	.size	_fstat_r, .Lfunc_end97-_fstat_r
                                        ; -- End function
	.type	_isatty_r,@function     ; -- Begin function _isatty_r
_isatty_r NOP                           ; @_isatty_r
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
	CALL	_isatty
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%FP)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB98_3
	JUMP	.LBB98_1
.LBB98_1 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB98_3
	JUMP	.LBB98_2
.LBB98_2 NOP 
	COPYG	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%FP)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB98_3
.LBB98_3 NOP 
	LOAD	%GR6, 8(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%FP)
	LOAD	%RA, 24(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 32
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end98 NOP 
	.size	_isatty_r, .Lfunc_end98-_isatty_r
                                        ; -- End function
	.globl	memmove                 ; -- Begin function memmove
	.type	memmove,@function
memmove NOP                             ; @memmove
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 40
	COPYR	%FP, %SP
	STORE	%GR1, 32(%FP)
	STORE	%GR2, 28(%FP)
	STORE	%GR1, 24(%FP)
	STORE	%GR2, 20(%FP)
	STORE	%GR3, 16(%FP)
	LOAD	%GR6, 24(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 20(%FP)
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB99_6
	JUMP	.LBB99_1
.LBB99_1 NOP 
	LOAD	%GR6, 12(%FP)
	LOAD	%GR1, 8(%FP)
	LOAD	%GR2, 16(%FP)
	ADD	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB99_6
	JUMP	.LBB99_2
.LBB99_2 NOP 
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 8(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%FP)
	LOAD	%GR6, 16(%FP)
	LOAD	%GR1, 12(%FP)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%FP)
	JUMP	.LBB99_3
.LBB99_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 16(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_5
	JUMP	.LBB99_4
.LBB99_4 NOP                            ;   in Loop: Header=BB99_3 Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 8(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 12(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB99_3
.LBB99_5 NOP 
	JUMP	.LBB99_19
.LBB99_6 NOP 
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_15
	JUMP	.LBB99_7
.LBB99_7 NOP 
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 12(%FP)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_15
	JUMP	.LBB99_8
.LBB99_8 NOP 
	LOAD	%GR6, 12(%FP)
	STORE	%GR6, 4(%FP)
	LOAD	%GR6, 8(%FP)
	STORE	%GR6, 0(%FP)
	JUMP	.LBB99_9
.LBB99_9 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 16
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_11
	JUMP	.LBB99_10
.LBB99_10 NOP                           ;   in Loop: Header=BB99_9 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 16(%FP)
	JUMP	.LBB99_9
.LBB99_11 NOP 
	JUMP	.LBB99_12
.LBB99_12 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	COPYI	%GR1, 4
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_14
	JUMP	.LBB99_13
.LBB99_13 NOP                           ;   in Loop: Header=BB99_12 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR1, %GR6, 4
	STORE	%GR1, 0(%FP)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%FP)
	ADDI	%GR2, %GR1, 4
	STORE	%GR2, 4(%FP)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%FP)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 16(%FP)
	JUMP	.LBB99_12
.LBB99_14 NOP 
	LOAD	%GR6, 4(%FP)
	STORE	%GR6, 12(%FP)
	LOAD	%GR6, 0(%FP)
	STORE	%GR6, 8(%FP)
	JUMP	.LBB99_15
.LBB99_15 NOP 
	JUMP	.LBB99_16
.LBB99_16 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%FP)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 16(%FP)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB99_18
	JUMP	.LBB99_17
.LBB99_17 NOP                           ;   in Loop: Header=BB99_16 Depth=1
	LOAD	%GR6, 8(%FP)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 8(%FP)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%FP)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 12(%FP)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB99_16
.LBB99_18 NOP 
	JUMP	.LBB99_19
.LBB99_19 NOP 
	LOAD	%GR6, 24(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 28(%FP)
	LOAD	%GR1, 32(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 40
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end99 NOP 
	.size	memmove, .Lfunc_end99-memmove
                                        ; -- End function
	.type	_read,@function         ; -- Begin function _read
_read NOP                               ; @_read
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 20
	COPYR	%FP, %SP
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	STORE	%GR3, 4(%FP)
	STORE	%GR4, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	COPYR	%TMP1, %GR2
	COPYR	%OFF, %GR3
	VMCALL	1
              
	;NO_APP
	;APP
	INPUT	%GR6
	;NO_APP
	COPYI	%GR1, 1
	LT	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB100_2
	JUMP	.LBB100_1
.LBB100_1 NOP                           ; %.preheader.preheader
	COPYI	%GR1, 0
	COPYR	%GR3, %GR6
	JUMP	.LBB100_3
.LBB100_3 NOP                           ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	;APP
	INPUT	%GR4
	;NO_APP
	STOREB	%GR4, 0(%GR2)
	ADDI	%GR2, %GR2, 1
	ADDI	%GR3, %GR3, -1
	EQ	%GR4, %GR3, %GR1
	BNEQZ	%GR4, .LBB100_2
	JUMP	.LBB100_3
.LBB100_2 NOP                           ; %.loopexit
	COPYR	%RT0, %GR6
	LOAD	%GR4, 0(%FP)
	LOAD	%GR3, 4(%FP)
	LOAD	%GR2, 8(%FP)
	LOAD	%GR1, 12(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 20
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end100 NOP 
	.size	_read, .Lfunc_end100-_read
                                        ; -- End function
	.type	_lseek,@function        ; -- Begin function _lseek
_lseek NOP                              ; @_lseek
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 12
	COPYR	%FP, %SP
	STORE	%GR1, 4(%FP)
	STORE	%GR2, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	COPYR	%TMP1, %GR2
	COPYR	%OFF, %GR3
	VMCALL	16
              
	;NO_APP
	;APP
	INPUT	%GR6
	;NO_APP
	COPYI	%GR1, -1
	NEQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB101_2
	JUMP	.LBB101_1
.LBB101_1 NOP 
	;APP
	INPUT	%GR1
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR1, 0(%GR2)
.LBB101_2 NOP 
	COPYR	%RT0, %GR6
	LOAD	%GR2, 0(%FP)
	LOAD	%GR1, 4(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 12
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end101 NOP 
	.size	_lseek, .Lfunc_end101-_lseek
                                        ; -- End function
	.type	_write,@function        ; -- Begin function _write
_write NOP                              ; @_write
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 24
	COPYR	%FP, %SP
	STORE	%GR1, 16(%FP)
	STORE	%GR1, 12(%FP)
	STORE	%GR2, 8(%FP)
	STORE	%GR3, 4(%FP)
	COPYI	%GR6, 0
	STORE	%GR6, 0(%FP)
	JUMP	.LBB102_1
.LBB102_1 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%FP)
	LOAD	%GR1, 4(%FP)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB102_3
	JUMP	.LBB102_2
.LBB102_2 NOP 
	JUMP	.LBB102_5
.LBB102_3 NOP                           ;   in Loop: Header=BB102_1 Depth=1
	LOAD	%GR6, 8(%FP)
	LOAD	%GR1, 0(%FP)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	;APP
	OUTPUT	%GR6
	;NO_APP
	JUMP	.LBB102_4
.LBB102_4 NOP                           ;   in Loop: Header=BB102_1 Depth=1
	LOAD	%GR6, 0(%FP)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%FP)
	JUMP	.LBB102_1
.LBB102_5 NOP 
	LOAD	%GR6, 4(%FP)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 16(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 24
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end102 NOP 
	.size	_write, .Lfunc_end102-_write
                                        ; -- End function
	.type	_isatty,@function       ; -- Begin function _isatty
_isatty NOP                             ; @_isatty
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 12
	COPYR	%FP, %SP
	STORE	%GR1, 4(%FP)
	STORE	%GR2, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	VMCALL	15
              
	;NO_APP
	;APP
	INPUT	%GR1
	;NO_APP
	COPYI	%GR6, 0
	NEQ	%GR2, %GR1, %GR6
	COPYI	%GR1, 1
	BNEQZ	%GR2, .LBB103_2
	JUMP	.LBB103_1
.LBB103_1 NOP 
	;APP
	INPUT	%GR1
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR1, 0(%GR2)
	COPYR	%GR1, %GR6
.LBB103_2 NOP 
	COPYR	%RT0, %GR1
	LOAD	%GR2, 0(%FP)
	LOAD	%GR1, 4(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 12
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end103 NOP 
	.size	_isatty, .Lfunc_end103-_isatty
                                        ; -- End function
	.type	_close,@function        ; -- Begin function _close
_close NOP                              ; @_close
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	STORE	%GR3, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	VMCALL	15
              
	;NO_APP
	;APP
	INPUT	%GR2
	;NO_APP
	COPYI	%GR6, 0
	NEQ	%GR2, %GR2, %GR6
	BNEQZ	%GR2, .LBB104_3
	JUMP	.LBB104_1
.LBB104_1 NOP 
	;APP
	INPUT	%GR3
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR3, 0(%GR2)
	;APP
	COPYR	%TMP0, %GR1
	VMCALL	14
              
	;NO_APP
	;APP
	INPUT	%GR3
	;NO_APP
	COPYI	%GR1, -1
	NEQ	%GR3, %GR3, %GR1
	BNEQZ	%GR3, .LBB104_3
	JUMP	.LBB104_2
.LBB104_2 NOP 
	;APP
	INPUT	%GR6
	;NO_APP
	STORE	%GR6, 0(%GR2)
	COPYR	%GR6, %GR1
.LBB104_3 NOP 
	COPYR	%RT0, %GR6
	LOAD	%GR3, 0(%FP)
	LOAD	%GR2, 4(%FP)
	LOAD	%GR1, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end104 NOP 
	.size	_close, .Lfunc_end104-_close
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
.Lfunc_end105 NOP 
	.size	_exit, .Lfunc_end105-_exit
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
.Lfunc_end106 NOP 
	.size	_sbrk, .Lfunc_end106-_sbrk
                                        ; -- End function
	.type	_fstat,@function        ; -- Begin function _fstat
_fstat NOP                              ; @_fstat
; %bb.0:
	STORE	%FP, -4(%SP)
	SUBI	%SP, %SP, 16
	COPYR	%FP, %SP
	STORE	%GR1, 8(%FP)
	STORE	%GR2, 4(%FP)
	STORE	%GR3, 0(%FP)
	;APP
	COPYR	%TMP0, %GR1
	VMCALL	11
              
	;NO_APP
	;APP
	INPUT	%GR1
	;NO_APP
	COPYI	%GR6, -1
	NEQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB107_2
	JUMP	.LBB107_1
.LBB107_2 NOP 
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR3, %GR2, 48
	STORE	%GR1, 0(%GR3)
	ADDI	%GR1, %GR2, 44
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR3, %GR2, 36
	STORE	%GR1, 0(%GR3)
	ADDI	%GR1, %GR2, 32
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR3, %GR2, 24
	STORE	%GR1, 0(%GR3)
	ADDI	%GR1, %GR2, 20
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 60
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 56
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 16
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 14
	STOREH	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 12
	STOREH	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 10
	STOREH	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 8
	STOREH	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 4
	STORE	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	ADDI	%GR1, %GR2, 2
	STOREH	%GR6, 0(%GR1)
	;APP
	INPUT	%GR6
	;NO_APP
	STOREH	%GR6, 0(%GR2)
	COPYI	%GR6, 0
.LBB107_3 NOP 
	COPYR	%RT0, %GR6
	LOAD	%GR3, 0(%FP)
	LOAD	%GR2, 4(%FP)
	LOAD	%GR1, 8(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 16
	LOAD	%FP, -4(%SP)
	RET
.LBB107_1 NOP 
	;APP
	INPUT	%GR1
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB107_3
.Lfunc_end107 NOP 
	.size	_fstat, .Lfunc_end107-_fstat
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
	BNEQZ	%GR2, .LBB108_2
	JUMP	.LBB108_1
.LBB108_1 NOP 
	;APP
	INPUT	%GR1
	;NO_APP
	COPYG	%GR2, errno
	STORE	%GR1, 0(%GR2)
	COPYR	%GR1, %GR6
.LBB108_2 NOP 
	COPYR	%RT0, %GR1
	LOAD	%GR2, 0(%FP)
	LOAD	%GR1, 4(%FP)
	COPYR	%SP, %FP
	ADDI	%SP, %SP, 12
	LOAD	%FP, -4(%SP)
	RET
.Lfunc_end108 NOP 
	.size	chmod, .Lfunc_end108-chmod
                                        ; -- End function
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"%d"
	.size	.L.str, 3

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
	.type	__svfscanf_r.basefix,@object ; @__svfscanf_r.basefix
	.rodata
	.p2align	1
__svfscanf_r.basefix NOP 
	.short	10                      ; 0xa
	.short	1                       ; 0x1
	.short	2                       ; 0x2
	.short	3                       ; 0x3
	.short	4                       ; 0x4
	.short	5                       ; 0x5
	.short	6                       ; 0x6
	.short	7                       ; 0x7
	.short	8                       ; 0x8
	.short	9                       ; 0x9
	.short	10                      ; 0xa
	.short	11                      ; 0xb
	.short	12                      ; 0xc
	.short	13                      ; 0xd
	.short	14                      ; 0xe
	.short	15                      ; 0xf
	.short	16                      ; 0x10
	.size	__svfscanf_r.basefix, 34

	.type	_ctype_b,@object        ; @_ctype_b
_ctype_b NOP 
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000         (((((                  \210\020\020\020\020\020\020\020\020\020\020\020\020\020\020\020\004\004\004\004\004\004\004\004\004\004\020\020\020\020\020\020\020AAAAAA\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\020\020\020\020\020\020BBBBBB\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\020\020\020\020 "
	.zero	128
	.size	_ctype_b, 384

	.type	_ctype_,@object         ; @_ctype_
_ctype_ NOP 
	.ascii	"\000         (((((                  \210\020\020\020\020\020\020\020\020\020\020\020\020\020\020\020\004\004\004\004\004\004\004\004\004\004\020\020\020\020\020\020\020AAAAAA\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\020\020\020\020\020\020BBBBBB\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\020\020\020\020 "
	.zero	128
	.size	_ctype_, 257

	.type	.L.str.2,@object        ; @.str.2
	.rodata.str1.1
.L.str.2 NOP 
	.asciz	"POSIX"
	.size	.L.str.2, 6

	.type	.L.str.3,@object        ; @.str.3
.L.str.3 NOP 
	.asciz	"C"
	.size	.L.str.3, 2

	.type	__global_locale,@object ; @__global_locale
	.data
	.p2align	2
__global_locale NOP 
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"C\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.long	__ascii_wctomb
	.long	__ascii_mbtowc
	.long	0                       ; 0x0
	.long	_ctype_b+127
	.long	.L.str.55
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.long	.L.str.59
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.byte	127                     ; 0x7f
	.zero	2
	.asciz	"\001"
	.asciz	"ASCII\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"ASCII\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.zero	2
	.size	__global_locale, 364

	.type	.L.str.55,@object       ; @.str.55
	.rodata.str1.1
.L.str.55 NOP 
	.asciz	"."
	.size	.L.str.55, 2

	.type	.L.str.59,@object       ; @.str.59
.L.str.59 NOP 
	.zero	1
	.size	.L.str.59, 1

	.type	errno,@object           ; @errno
	.comm	errno,4,4
	.type	__malloc_current_mallinfo.0,@object ; @__malloc_current_mallinfo.0
	.local	__malloc_current_mallinfo.0
	.comm	__malloc_current_mallinfo.0,4,4
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.ident	"clang version 10.0.0-4ubuntu1 "
	.note.GNU-stack
