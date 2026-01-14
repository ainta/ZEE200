	.text
	.file	"ld-temp.o"
	.type	Fib,@function           ; -- Begin function Fib
Fib NOP                                 ; @Fib
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_2
	JUMP	.LBB0_1
.LBB0_1 NOP                             ; %lor.lhs.false
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_3
	JUMP	.LBB0_2
.LBB0_2 NOP                             ; %if.then
	COPYI	%GR6, 1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB0_4
.LBB0_3 NOP                             ; %if.else
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -1
	CALL	Fib
	COPYR	%GR2, %RT0
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -2
	CALL	Fib
	COPYR	%GR6, %RT0
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB0_4
.LBB0_4 NOP                             ; %return
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
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
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 20(%GR7)
	CALL	ZKInput
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	LOAD	%GR1, 16(%GR7)
	CALL	Fib
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 12(%GR7)
	CALL	ZKOutput
	STORE	%GR2, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.type	ZKInput,@function       ; -- Begin function ZKInput
ZKInput NOP                             ; @ZKInput
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 4
	;APP
	INPUT	%GR6
	
	;NO_APP
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	ADDI	%GR7, %GR7, 4
	RET
.Lfunc_end2 NOP 
	.size	ZKInput, .Lfunc_end2-ZKInput
                                        ; -- End function
	.type	ZKOutput,@function      ; -- Begin function ZKOutput
ZKOutput NOP                            ; @ZKOutput
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 4
	STORE	%GR1, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	;APP
	OUTPUT	%GR6
	
	;NO_APP
	ADDI	%GR7, %GR7, 4
	RET
.Lfunc_end3 NOP 
	.size	ZKOutput, .Lfunc_end3-ZKOutput
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
