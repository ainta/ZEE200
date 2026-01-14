	.text
	.file	"add32.ll"
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
	.note.GNU-stack
