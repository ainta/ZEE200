	.text
	.file	"llvm-link"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	COPYI	%GR4, 0
	STORE	%GR4, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 4(%GR7)
	LOAD	%GR3, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $gr0
	COPYR	%GR0, %GR4
	LOAD	%GR4, 16(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.globl	printf                  ; -- Begin function printf
	.type	printf,@function
printf NOP                              ; @printf
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 4(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 0(%GR7)
	COPYI	%GR6, 0
	COPYR	%GR0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end1 NOP 
	.size	printf, .Lfunc_end1-printf
                                        ; -- End function
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
