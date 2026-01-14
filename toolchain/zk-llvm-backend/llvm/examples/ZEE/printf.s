	.text
	.file	"printf.c"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 4(%GR7)
	COPYI	%GR1, .L.str
	CALL	printf
                                        ; kill: def $gr6 killed $gr0
	COPYR	%GR0, %GR2
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"1\n"
	.size	.L.str, 3

	.ident	"clang version 10.0.0 "
	.note.GNU-stack
