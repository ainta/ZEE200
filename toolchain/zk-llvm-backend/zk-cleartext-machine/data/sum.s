	.text
	.file	"ld-temp.o"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 24(%GR7)
	STORE	%GR6, 20(%GR7)
	CALL	ZKInput
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB0_1
.LBB0_1 NOP                             ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 16(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_3
	JUMP	.LBB0_2
.LBB0_2 NOP                             ; %while.body
                                        ;   in Loop: Header=BB0_1 Depth=1
	CALL	ZKInput
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 20(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB0_1
.LBB0_3 NOP                             ; %while.end
	LOAD	%GR1, 20(%GR7)
	CALL	ZKOutput
	COPYI	%GR6, 0
	COPYR	%RT0, %GR6
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
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
.Lfunc_end1 NOP 
	.size	ZKInput, .Lfunc_end1-ZKInput
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
.Lfunc_end2 NOP 
	.size	ZKOutput, .Lfunc_end2-ZKOutput
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
