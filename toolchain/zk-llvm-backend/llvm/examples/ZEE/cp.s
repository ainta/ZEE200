	.text
	.file	"cp.ll"
	.globl	add                     ; -- Begin function add
	.type	add,@function
add NOP                                 ; @add
; %bb.0:
	SUBI	%GR7, %GR7, 12
	STORE	%GR2, 4(%GR7)
	STORE	%GR1, 8(%GR7)
	ADD	%GR6, %GR1, %GR2
	STORE	%GR6, 0(%GR7)
	COPYR	%GR0, %GR6
	ADDI	%GR7, %GR7, 12
	RET
.Lfunc_end0 NOP 
	.size	add, .Lfunc_end0-add
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	COPYI	%GR3, 0
	STORE	%GR3, 16(%GR7)
	COPYI	%GR1, 1
	COPYR	%GR2, %GR1
	CALL	add
	COPYR	%GR6, %GR0
	STORE	%GR6, 12(%GR7)
	COPYR	%GR0, %GR3
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.note.GNU-stack
