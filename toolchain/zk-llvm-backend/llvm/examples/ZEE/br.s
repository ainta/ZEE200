	.text
	.file	"br.ll"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 4(%GR7)
	LTE	%GR6, %GR1, %GR6
	BEQZ	%GR6, .LBB0_1
	JUMP	.LBB0_1
.LBB0_1 NOP 
	COPYI	%GR6, 0
	COPYR	%GR0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.note.GNU-stack
