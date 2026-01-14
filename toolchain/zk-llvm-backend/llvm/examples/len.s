	.text
	.file	"len.cpp"
	.text.startup
	.type	__cxx_global_var_init,@function ; -- Begin function __cxx_global_var_init
__cxx_global_var_init NOP               ; @__cxx_global_var_init
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	ADDI	%GR3, %GR7, 16
	COPYR	%GR1, %GR3
	CALL	_ZNSaIcEC1Ev
	COPYI	%GR1, s
	COPYI	%GR2, .L.str
	CALL	_ZNSsC1EPKcRKSaIcE
; %bb.1:
	ADDI	%GR1, %GR7, 16
	CALL	_ZNSaIcED1Ev
	COPYI	%GR1, _ZNSsD1Ev
	COPYI	%GR2, s
	COPYI	%GR3, __dso_handle
	CALL	__cxa_atexit
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
                                        ; -- End function
	.text
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	COPYI	%GR1, s
	CALL	_ZNKSs6lengthEv
	COPYR	%GR6, %GR0
	COPYR	%GR0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end1 NOP 
	.size	main, .Lfunc_end1-main
                                        ; -- End function
	.text.startup
	.type	_GLOBAL__sub_I_len.cpp,@function ; -- Begin function _GLOBAL__sub_I_len.cpp
_GLOBAL__sub_I_len.cpp NOP              ; @_GLOBAL__sub_I_len.cpp
; %bb.0:
	SUBI	%GR7, %GR7, 0
	CALL	__cxx_global_var_init
	ADDI	%GR7, %GR7, 0
	RET
.Lfunc_end2 NOP 
	.size	_GLOBAL__sub_I_len.cpp, .Lfunc_end2-_GLOBAL__sub_I_len.cpp
                                        ; -- End function
	.type	s,@object               ; @s
	.bss
	.globl	s
	.p2align	2
s NOP 
	.zero	4
	.size	s, 4

	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"apple"
	.size	.L.str, 6

	.hidden	__dso_handle
	.init_array
	.p2align	2
	.long	_GLOBAL__sub_I_len.cpp
	.ident	"clang version 9.0.1 "
	.note.GNU-stack
