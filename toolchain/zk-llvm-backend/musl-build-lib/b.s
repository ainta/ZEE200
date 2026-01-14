	.text
	.file	"ld-temp.o"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 20(%GR7)
	ADDI	%GR6, %GR7, 8
	COPYI	%GR2, 90999
	STORE	%GR2, 0(%GR6)
	ADDI	%GR6, %GR7, 4
	COPYI	%GR2, 111
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, .L.str
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	COPYR	%RT0, %GR1
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.type	__init_libc,@function   ; -- Begin function __init_libc
__init_libc NOP                         ; @__init_libc
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 400
	STORE	%GR1, 396(%GR7)
	STORE	%GR2, 392(%GR7)
	STORE	%GR3, 388(%GR7)
	STORE	%GR1, 384(%GR7)
	STORE	%GR2, 376(%GR7)
	ADDI	%GR1, %GR7, 48
	COPYI	%GR2, 0
	COPYI	%GR3, 304
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 384(%GR7)
	COPYI	%GR1, __environ
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR2, 368(%GR7)
	JUMP	.LBB1_1
.LBB1_1 NOP                             ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 384(%GR7)
	LOAD	%GR1, 368(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_4
	JUMP	.LBB1_2
.LBB1_2 NOP                             ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	JUMP	.LBB1_3
.LBB1_3 NOP                             ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 368(%GR7)
	ADDI	%GR3, %GR2, 1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 368(%GR7)
	JUMP	.LBB1_1
.LBB1_4 NOP                             ; %for.end
	LOAD	%GR6, 384(%GR7)
	LOAD	%GR1, 368(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 360(%GR7)
	COPYI	%GR1, __libc
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 368(%GR7)
	JUMP	.LBB1_5
.LBB1_5 NOP                             ; %for.cond2
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 360(%GR7)
	LOAD	%GR1, 368(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_10
	JUMP	.LBB1_6
.LBB1_6 NOP                             ; %for.body5
                                        ;   in Loop: Header=BB1_5 Depth=1
	LOAD	%GR6, 360(%GR7)
	LOAD	%GR1, 368(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR2, 37
	UGT	%GR6, %GR6, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR1, %GR2
	EQ	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR1, %GR6
	BNEQZ	%GR3, .LBB1_8
	JUMP	.LBB1_7
.LBB1_7 NOP                             ; %if.then
                                        ;   in Loop: Header=BB1_5 Depth=1
	LOAD	%GR6, 360(%GR7)
	LOAD	%GR1, 368(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 3
	ADDI	%GR3, %GR7, 48
	ADD	%GR6, %GR3, %GR6
	STORE	%GR1, 0(%GR6)
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB1_8
.LBB1_8 NOP                             ; %if.end
                                        ;   in Loop: Header=BB1_5 Depth=1
	JUMP	.LBB1_9
.LBB1_9 NOP                             ; %for.inc10
                                        ;   in Loop: Header=BB1_5 Depth=1
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 368(%GR7)
	ADDI	%GR3, %GR2, 2
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 368(%GR7)
	JUMP	.LBB1_5
.LBB1_10 NOP                            ; %for.end12
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 256
	ADDI	%GR6, %GR6, 260
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_12
	JUMP	.LBB1_11
.LBB1_11 NOP                            ; %if.then16
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 256
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 260
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR2, __sysinfo
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB1_12
.LBB1_12 NOP                            ; %if.end18
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 52
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR2, __libc
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 376(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_14
	JUMP	.LBB1_13
.LBB1_13 NOP                            ; %if.then21
	ADDI	%GR6, %GR7, 48
	ADDI	%GR6, %GR6, 248
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 376(%GR7)
	JUMP	.LBB1_14
.LBB1_14 NOP                            ; %if.end23
	LOAD	%GR6, 376(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_16
	JUMP	.LBB1_15
.LBB1_15 NOP                            ; %if.then25
	COPYI	%GR6, .L.str.1
	STORE	%GR6, 376(%GR7)
	JUMP	.LBB1_16
.LBB1_16 NOP                            ; %if.end26
	LOAD	%GR6, 376(%GR7)
	COPYI	%GR1, __progname_full
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, __progname
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 368(%GR7)
	JUMP	.LBB1_17
.LBB1_17 NOP                            ; %for.cond27
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 376(%GR7)
	LOAD	%GR1, 368(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_22
	JUMP	.LBB1_18
.LBB1_18 NOP                            ; %for.body30
                                        ;   in Loop: Header=BB1_17 Depth=1
	LOAD	%GR6, 376(%GR7)
	LOAD	%GR1, 368(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 47
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_20
	JUMP	.LBB1_19
.LBB1_19 NOP                            ; %if.then34
                                        ;   in Loop: Header=BB1_17 Depth=1
	LOAD	%GR6, 376(%GR7)
	LOAD	%GR1, 368(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 1
	COPYI	%GR1, __progname
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB1_20
.LBB1_20 NOP                            ; %if.end37
                                        ;   in Loop: Header=BB1_17 Depth=1
	JUMP	.LBB1_21
.LBB1_21 NOP                            ; %for.inc38
                                        ;   in Loop: Header=BB1_17 Depth=1
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 368(%GR7)
	ADDI	%GR3, %GR2, 1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 368(%GR7)
	JUMP	.LBB1_17
.LBB1_22 NOP                            ; %for.end40
	ADDI	%GR2, %GR7, 48
	COPYR	%GR1, %GR2
	CALL	static_init_tls
	ADDI	%GR6, %GR2, 200
	LOAD	%GR1, 0(%GR6)
	CALL	dummy1
	ADDI	%GR6, %GR2, 88
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR2, 92
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR3, %GR2, 96
	LOAD	%GR3, 0(%GR3)
	ADDI	%GR2, %GR2, 100
	LOAD	%GR2, 0(%GR2)
	XOR	%GR1, %GR1, %GR2
	XOR	%GR6, %GR6, %GR3
	OR	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_26
	JUMP	.LBB1_23
.LBB1_23 NOP                            ; %land.lhs.true
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 104
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR2, %GR6, 108
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR3, %GR6, 112
	LOAD	%GR3, 0(%GR3)
	ADDI	%GR6, %GR6, 116
	LOAD	%GR6, 0(%GR6)
	XOR	%GR6, %GR2, %GR6
	XOR	%GR1, %GR1, %GR3
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_26
	JUMP	.LBB1_24
.LBB1_24 NOP                            ; %land.lhs.true50
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 184
	ADDI	%GR6, %GR6, 188
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_26
	JUMP	.LBB1_25
.LBB1_25 NOP                            ; %if.then53
	JUMP	.LBB1_37
.LBB1_26 NOP                            ; %if.end54
	ADDI	%GR1, %GR7, 16
	ADDI	%GR6, %GR1, 20
	COPYI	%GR2, .L__const.__init_libc.pfd
	LOAD	%GR2, 0(%GR2)
	STORE	%GR2, 0(%GR6)
	ADDI	%GR6, %GR1, 16
	STORE	%GR2, 0(%GR6)
	ORI	%GR6, %GR1, 12
	STORE	%GR2, 0(%GR6)
	ORI	%GR6, %GR1, 8
	STORE	%GR2, 0(%GR6)
	ORI	%GR6, %GR1, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR2, 16(%GR7)
	COPYI	%GR2, 0
	CALL	__syscall3
	COPYR	%GR6, %RT0
                                        ; kill: def $gr1 killed $rt1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_28
	JUMP	.LBB1_27
.LBB1_27 NOP                            ; %if.then59
	CALL	a_crash
	JUMP	.LBB1_28
.LBB1_28 NOP                            ; %if.end60
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 368(%GR7)
	JUMP	.LBB1_29
.LBB1_29 NOP                            ; %for.cond61
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 368(%GR7)
	COPYI	%GR2, 2
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB1_36
	JUMP	.LBB1_30
.LBB1_30 NOP                            ; %for.body64
                                        ;   in Loop: Header=BB1_29 Depth=1
	LOAD	%GR6, 368(%GR7)
	SHLI	%GR6, %GR6, 3
	ADDI	%GR1, %GR7, 16
	ADD	%GR6, %GR1, %GR6
	ORI	%GR6, %GR6, 6
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_34
	JUMP	.LBB1_31
.LBB1_31 NOP                            ; %if.then68
                                        ;   in Loop: Header=BB1_29 Depth=1
	CALL	__syscall2
                                        ; kill: def $gr6 killed $rt0
	COPYR	%GR6, %RT1
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB1_33
	JUMP	.LBB1_32
.LBB1_32 NOP                            ; %if.then72
                                        ;   in Loop: Header=BB1_29 Depth=1
	CALL	a_crash
	JUMP	.LBB1_33
.LBB1_33 NOP                            ; %if.end73
                                        ;   in Loop: Header=BB1_29 Depth=1
	JUMP	.LBB1_34
.LBB1_34 NOP                            ; %if.end74
                                        ;   in Loop: Header=BB1_29 Depth=1
	JUMP	.LBB1_35
.LBB1_35 NOP                            ; %for.inc75
                                        ;   in Loop: Header=BB1_29 Depth=1
	ADDI	%GR6, %GR7, 368
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 368(%GR7)
	ADDI	%GR3, %GR2, 1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 368(%GR7)
	JUMP	.LBB1_29
.LBB1_36 NOP                            ; %for.end77
	COPYI	%GR6, __libc
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB1_37
.LBB1_37 NOP                            ; %return
	LOAD	%GR3, 388(%GR7)
	LOAD	%GR2, 392(%GR7)
	LOAD	%GR1, 396(%GR7)
	ADDI	%GR7, %GR7, 400
	RET
.Lfunc_end1 NOP 
	.size	__init_libc, .Lfunc_end1-__init_libc
                                        ; -- End function
	.type	__syscall3,@function    ; -- Begin function __syscall3
__syscall3 NOP                          ; @__syscall3
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR3, 40(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR3, %GR6, 4
	COPYI	%GR6, 0
	STORE	%GR6, 0(%GR3)
	COPYI	%GR3, 7
	STORE	%GR3, 32(%GR7)
	ADDI	%GR3, %GR7, 24
	ORI	%GR3, %GR3, 4
	STORE	%GR2, 0(%GR3)
	STORE	%GR1, 24(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, 3
	STORE	%GR1, 16(%GR7)
	ADDI	%GR1, %GR7, 8
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	COPYR	%RT1, %GR6
	LOAD	%GR3, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end2 NOP 
	.size	__syscall3, .Lfunc_end2-__syscall3
                                        ; -- End function
	.type	a_crash,@function       ; -- Begin function a_crash
a_crash NOP                             ; @a_crash
; %bb.0:                                ; %entry
	;APP
	hlt
	;NO_APP
	RET
.Lfunc_end3 NOP 
	.size	a_crash, .Lfunc_end3-a_crash
                                        ; -- End function
	.type	__syscall2,@function    ; -- Begin function __syscall2
__syscall2 NOP                          ; @__syscall2
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 40
	STORE	%GR1, 36(%GR7)
	STORE	%GR2, 32(%GR7)
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 2
	STORE	%GR6, 24(%GR7)
	ADDI	%GR2, %GR7, 16
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	COPYI	%GR2, .L.str.1.2
	STORE	%GR2, 16(%GR7)
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR1
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR1, 36(%GR7)
	ADDI	%GR7, %GR7, 40
	RET
.Lfunc_end4 NOP 
	.size	__syscall2, .Lfunc_end4-__syscall2
                                        ; -- End function
	.type	dummy1,@function        ; -- Begin function dummy1
dummy1 NOP                              ; @dummy1
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 8
	STORE	%GR1, 0(%GR7)
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end5 NOP 
	.size	dummy1, .Lfunc_end5-dummy1
                                        ; -- End function
	.globl	__libc_start_main       ; -- Begin function __libc_start_main
	.type	__libc_start_main,@function
__libc_start_main NOP                   ; @__libc_start_main
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 28(%GR7)
	STORE	%GR3, 24(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 16(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR2, 0(%GR6)
	CALL	__init_libc
	COPYI	%GR6, libc_start_main_stage2
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	;APP
	;NO_APP
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 28(%GR7)
	LOAD	%GR3, 24(%GR7)
	CALL	%GR6
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end6 NOP 
	.size	__libc_start_main, .Lfunc_end6-__libc_start_main
                                        ; -- End function
	.type	libc_start_main_stage2,@function ; -- Begin function libc_start_main_stage2
libc_start_main_stage2 NOP              ; @libc_start_main_stage2
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 0(%GR7)
	CALL	libc_start_init
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR3, 0(%GR7)
	CALL	%GR6
	COPYR	%GR1, %RT0
	CALL	exit
.Lfunc_end7 NOP 
	.size	libc_start_main_stage2, .Lfunc_end7-libc_start_main_stage2
                                        ; -- End function
	.type	libc_start_init,@function ; -- Begin function libc_start_init
libc_start_init NOP                     ; @libc_start_init
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	CALL	_init
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, __init_array_start
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB8_1
.LBB8_1 NOP                             ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	COPYI	%GR2, __init_array_end
	UGTE	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 1
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB8_4
	JUMP	.LBB8_2
.LBB8_2 NOP                             ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR6)
	CALL	%GR6
	JUMP	.LBB8_3
.LBB8_3 NOP                             ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 8(%GR7)
	JUMP	.LBB8_1
.LBB8_4 NOP                             ; %for.end
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end8 NOP 
	.size	libc_start_init, .Lfunc_end8-libc_start_init
                                        ; -- End function
	.globl	exit                    ; -- Begin function exit
	.type	exit,@function
exit NOP                                ; @exit
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	CALL	dummy
	CALL	libc_exit_fini
	CALL	dummy
	LOAD	%GR1, 8(%GR7)
	CALL	_Exit
.Lfunc_end9 NOP 
	.size	exit, .Lfunc_end9-exit
                                        ; -- End function
	.type	dummy,@function         ; -- Begin function dummy
dummy NOP                               ; @dummy
; %bb.0:                                ; %entry
	RET
.Lfunc_end10 NOP 
	.size	dummy, .Lfunc_end10-dummy
                                        ; -- End function
	.type	libc_exit_fini,@function ; -- Begin function libc_exit_fini
libc_exit_fini NOP                      ; @libc_exit_fini
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, __fini_array_end
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB11_1
.LBB11_1 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	COPYI	%GR2, __fini_array_start
	ULTE	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_4
	JUMP	.LBB11_2
.LBB11_2 NOP                            ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, -8
	LOAD	%GR6, 0(%GR6)
	CALL	%GR6
	JUMP	.LBB11_3
.LBB11_3 NOP                            ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, -8
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 8(%GR7)
	JUMP	.LBB11_1
.LBB11_4 NOP                            ; %for.end
	CALL	_fini
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end11 NOP 
	.size	libc_exit_fini, .Lfunc_end11-libc_exit_fini
                                        ; -- End function
	.globl	printf                  ; -- Begin function printf
	.type	printf,@function
printf NOP                              ; @printf
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 8
	LOAD	%GR6, 8(%GR7)
	;APP
	INPUT	%GR6
	
	;NO_APP
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end12 NOP 
	.size	printf, .Lfunc_end12-printf
                                        ; -- End function
	.type	__init_tp,@function     ; -- Begin function __init_tp
__init_tp NOP                           ; @__init_tp
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	STORE	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	CALL	__set_thread_area
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_2
	JUMP	.LBB13_1
.LBB13_1 NOP                            ; %if.then
	COPYI	%GR6, -1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB13_5
.LBB13_2 NOP                            ; %if.end
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_4
	JUMP	.LBB13_3
.LBB13_3 NOP                            ; %if.then1
	COPYI	%GR6, __libc
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB13_4
.LBB13_4 NOP                            ; %if.end2
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	CALL	__syscall1
	COPYR	%GR6, %RT0
                                        ; kill: def $gr1 killed $rt1
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 40
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 124
	COPYI	%GR1, __libc
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	STORE	%GR6, 0(%GR6)
	COPYI	%GR6, __sysinfo
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR2, %GR1, 16
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	STORE	%GR6, 0(%GR2)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB13_5
.LBB13_5 NOP                            ; %return
	LOAD	%GR6, 20(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end13 NOP 
	.size	__init_tp, .Lfunc_end13-__init_tp
                                        ; -- End function
	.type	__syscall1,@function    ; -- Begin function __syscall1
__syscall1 NOP                          ; @__syscall1
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 218
	STORE	%GR6, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, __thread_list_lock
	STORE	%GR6, 8(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR1
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end14 NOP 
	.size	__syscall1, .Lfunc_end14-__syscall1
                                        ; -- End function
	.type	__copy_tls,@function    ; -- Begin function __copy_tls
__copy_tls NOP                          ; @__copy_tls
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	STORE	%GR6, 8(%GR7)
	COPYI	%GR6, __libc
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -224
	STORE	%GR1, 40(%GR7)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR3, 0
	SUB	%GR2, %GR3, %GR2
	AND	%GR1, %GR1, %GR2
	STORE	%GR1, 40(%GR7)
	LOAD	%GR1, 40(%GR7)
	STORE	%GR1, 32(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR3, 0(%GR1)
	COPYI	%GR1, 1
	STORE	%GR1, 16(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB15_1
.LBB15_1 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_4
	JUMP	.LBB15_2
.LBB15_2 NOP                            ; %for.body
                                        ;   in Loop: Header=BB15_1 Depth=1
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 32
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 16(%GR7)
	SHLI	%GR2, %GR2, 3
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR1, 4
	COPYI	%GR3, 0
	STORE	%GR3, 0(%GR2)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR3, 24(%GR7)
	ADDI	%GR1, %GR3, 32
	LOAD	%GR1, 0(%GR1)
	SUB	%GR1, %GR6, %GR1
	ADDI	%GR6, %GR3, 4
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR6, %GR3, 8
	ADDI	%GR3, %GR3, 12
	LOAD	%GR4, 0(%GR3)
	LOAD	%GR3, 0(%GR6)
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB15_3
.LBB15_3 NOP                            ; %for.inc
                                        ;   in Loop: Header=BB15_1 Depth=1
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 16(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB15_1
.LBB15_4 NOP                            ; %for.end
	COPYI	%GR6, __libc
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR2, %GR1, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 148
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end15 NOP 
	.size	__copy_tls, .Lfunc_end15-__copy_tls
                                        ; -- End function
	.type	static_init_tls,@function ; -- Begin function static_init_tls
static_init_tls NOP                     ; @static_init_tls
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 80
	STORE	%GR1, 76(%GR7)
	STORE	%GR2, 72(%GR7)
	STORE	%GR3, 68(%GR7)
	STORE	%GR4, 64(%GR7)
	STORE	%GR5, 60(%GR7)
	STORE	%GR1, 56(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 24(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 40
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 40(%GR7)
	JUMP	.LBB16_1
.LBB16_1 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_17
	JUMP	.LBB16_2
.LBB16_2 NOP                            ; %for.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 48(%GR7)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 6
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_4
	JUMP	.LBB16_3
.LBB16_3 NOP                            ; %if.then
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 24
	ADDI	%GR6, %GR6, 28
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR2, 16
	ADDI	%GR2, %GR2, 20
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 0(%GR3)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR7, 16
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 16(%GR7)
	JUMP	.LBB16_4
.LBB16_4 NOP                            ; %if.end
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_7
	JUMP	.LBB16_5
.LBB16_5 NOP                            ; %land.lhs.true
                                        ;   in Loop: Header=BB16_1 Depth=1
	COPYI	%GR6, _DYNAMIC
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_7
	JUMP	.LBB16_6
.LBB16_6 NOP                            ; %if.then5
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 16
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	COPYI	%GR2, _DYNAMIC
	SUB	%GR3, %GR2, %GR1
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 16(%GR7)
	JUMP	.LBB16_7
.LBB16_7 NOP                            ; %if.end8
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 7
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_9
	JUMP	.LBB16_8
.LBB16_8 NOP                            ; %if.then11
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB16_9
.LBB16_9 NOP                            ; %if.end12
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1685382481
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_15
	JUMP	.LBB16_10
.LBB16_10 NOP                           ; %land.lhs.true15
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 40
	ADDI	%GR6, %GR6, 44
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	COPYI	%GR2, __default_stacksize
	LOAD	%GR2, 0(%GR2)
	ULTE	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_15
	JUMP	.LBB16_11
.LBB16_11 NOP                           ; %if.then18
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 40
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 8388607
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB16_13
	JUMP	.LBB16_12
.LBB16_12 NOP                           ; %cond.true
                                        ;   in Loop: Header=BB16_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 40
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB16_14
.LBB16_13 NOP                           ; %cond.false
                                        ;   in Loop: Header=BB16_1 Depth=1
	COPYI	%GR6, 8388608
	JUMP	.LBB16_14
.LBB16_14 NOP                           ; %cond.end
                                        ;   in Loop: Header=BB16_1 Depth=1
	COPYI	%GR1, __default_stacksize
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_15
.LBB16_15 NOP                           ; %if.end24
                                        ;   in Loop: Header=BB16_1 Depth=1
	JUMP	.LBB16_16
.LBB16_16 NOP                           ; %for.inc
                                        ;   in Loop: Header=BB16_1 Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 40(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB16_1
.LBB16_17 NOP                           ; %for.end
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_19
	JUMP	.LBB16_18
.LBB16_18 NOP                           ; %if.then27
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 16
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR6, %GR1
	COPYI	%GR6, main_tls
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR2, %GR1, 32
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 36
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR2, %GR1, 40
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 44
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR2, %GR1, 48
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 52
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 0(%GR6)
	COPYI	%GR1, __libc
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	COPYI	%GR2, 1
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB16_19
.LBB16_19 NOP                           ; %if.end30
	COPYI	%GR1, main_tls
	LOAD	%GR2, 0(%GR1)
	ADD	%GR3, %GR2, %GR2
	COPYI	%GR6, 0
	NEQ	%GR4, %GR3, %GR6
	ULT	%GR5, %GR3, %GR2
	ADD	%GR5, %GR2, %GR5
	ADD	%GR4, %GR5, %GR4
	SUB	%GR4, %GR6, %GR4
	SUB	%GR3, %GR6, %GR3
	STORE	%GR3, 4(%GR7)
	ADDI	%GR5, %GR2, -1
	ULT	%GR3, %GR5, %GR2
	ADD	%GR3, %GR2, %GR3
	ADDI	%GR3, %GR3, -1
	AND	%GR3, %GR4, %GR3
	LOAD	%GR4, 4(%GR7)
	AND	%GR4, %GR4, %GR5
	ADD	%GR3, %GR2, %GR3
	ADD	%GR4, %GR2, %GR4
	ULT	%GR2, %GR4, %GR2
	ADD	%GR2, %GR3, %GR2
	STORE	%GR4, 0(%GR1)
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR2, %GR1, %GR6
	COPYI	%GR3, 7
	UGT	%GR3, %GR1, %GR3
	EQ	%GR6, %GR1, %GR6
	CMOV	%GR2, %GR6, %GR3
	BNEQZ	%GR2, .LBB16_21
	JUMP	.LBB16_20
.LBB16_20 NOP                           ; %if.then37
	COPYI	%GR6, main_tls
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR1, 8
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB16_21
.LBB16_21 NOP                           ; %if.end38
	COPYI	%GR6, main_tls
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR2, __libc
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR6)
	ADD	%GR1, %GR6, %GR6
	ULT	%GR6, %GR1, %GR6
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR3, %GR1, 247
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR1
	ANDI	%GR1, %GR3, -8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR2)
	LOAD	%GR6, 0(%GR2)
	COPYI	%GR1, 361
	ULT	%GR1, %GR6, %GR1
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB16_23
	JUMP	.LBB16_22
.LBB16_22 NOP                           ; %if.then46
	COPYI	%GR6, __libc
	LOAD	%GR1, 0(%GR6)
	COPYR	%GR2, %GR1
	CALL	__syscall6
	COPYR	%GR6, %RT0
                                        ; kill: def $gr1 killed $rt1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB16_24
.LBB16_23 NOP                           ; %if.else
	COPYI	%GR6, builtin_tls
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB16_24
.LBB16_24 NOP                           ; %if.end47
	LOAD	%GR1, 8(%GR7)
	CALL	__copy_tls
	COPYR	%GR1, %RT0
	CALL	__init_tp
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB16_26
	JUMP	.LBB16_25
.LBB16_25 NOP                           ; %if.then52
	CALL	a_crash.21
	JUMP	.LBB16_26
.LBB16_26 NOP                           ; %if.end53
	LOAD	%GR5, 60(%GR7)
	LOAD	%GR4, 64(%GR7)
	LOAD	%GR3, 68(%GR7)
	LOAD	%GR2, 72(%GR7)
	LOAD	%GR1, 76(%GR7)
	ADDI	%GR7, %GR7, 80
	RET
.Lfunc_end16 NOP 
	.size	static_init_tls, .Lfunc_end16-static_init_tls
                                        ; -- End function
	.type	__syscall6,@function    ; -- Begin function __syscall6
__syscall6 NOP                          ; @__syscall6
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 112
	STORE	%GR1, 108(%GR7)
	STORE	%GR2, 104(%GR7)
	STORE	%GR3, 100(%GR7)
	STORE	%GR4, 96(%GR7)
	STORE	%GR5, 92(%GR7)
	ADDI	%GR6, %GR7, 80
	ORI	%GR3, %GR6, 4
	COPYI	%GR6, 0
	STORE	%GR6, 0(%GR3)
	COPYI	%GR3, 9
	STORE	%GR3, 80(%GR7)
	ADDI	%GR3, %GR7, 72
	ORI	%GR3, %GR3, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR6, 72(%GR7)
	ADDI	%GR3, %GR7, 64
	ORI	%GR3, %GR3, 4
	STORE	%GR2, 0(%GR3)
	STORE	%GR1, 64(%GR7)
	ADDI	%GR1, %GR7, 56
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, 3
	STORE	%GR1, 56(%GR7)
	ADDI	%GR1, %GR7, 48
	ORI	%GR2, %GR1, 4
	STORE	%GR6, 0(%GR2)
	COPYI	%GR1, 34
	STORE	%GR1, 48(%GR7)
	ADDI	%GR1, %GR7, 40
	ORI	%GR3, %GR1, 4
	COPYI	%GR1, -1
	STORE	%GR1, 0(%GR3)
	STORE	%GR1, 40(%GR7)
	ADDI	%GR1, %GR7, 32
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR4, 48(%GR7)
	ADDI	%GR5, %GR7, 16
	ORI	%GR5, %GR5, 4
	STORE	%GR2, 0(%GR5)
	STORE	%GR4, 16(%GR7)
	LOAD	%GR2, 0(%GR3)
	LOAD	%GR3, 40(%GR7)
	ADDI	%GR4, %GR7, 8
	ORI	%GR4, %GR4, 4
	STORE	%GR2, 0(%GR4)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR7, 0
	ORI	%GR3, %GR3, 4
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR7)
	COPYR	%RT0, %GR6
	COPYR	%RT1, %GR6
	LOAD	%GR5, 92(%GR7)
	LOAD	%GR4, 96(%GR7)
	LOAD	%GR3, 100(%GR7)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR1, 108(%GR7)
	ADDI	%GR7, %GR7, 112
	RET
.Lfunc_end17 NOP 
	.size	__syscall6, .Lfunc_end17-__syscall6
                                        ; -- End function
	.type	a_crash.21,@function    ; -- Begin function a_crash.21
a_crash.21 NOP                          ; @a_crash.21
; %bb.0:                                ; %entry
	;APP
	hlt
	;NO_APP
	RET
.Lfunc_end18 NOP 
	.size	a_crash.21, .Lfunc_end18-a_crash.21
                                        ; -- End function
	.globl	_Exit                   ; -- Begin function _Exit
	.type	_Exit,@function
_Exit NOP                               ; @_Exit
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	STORE	%GR1, 12(%GR7)
	LOAD	%GR3, 12(%GR7)
	SRAI	%GR4, %GR3, 31
	COPYI	%GR1, 231
	COPYI	%GR2, 0
	CALL	__syscall1.24
	JUMP	.LBB19_1
.LBB19_1 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR3, 12(%GR7)
	SRAI	%GR4, %GR3, 31
	COPYI	%GR1, 60
	COPYI	%GR2, 0
	CALL	__syscall1.24
	JUMP	.LBB19_1
.Lfunc_end19 NOP 
	.size	_Exit, .Lfunc_end19-_Exit
                                        ; -- End function
	.type	__syscall1.24,@function ; -- Begin function __syscall1.24
__syscall1.24 NOP                       ; @__syscall1.24
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 24
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 8(%GR7)
	ADDI	%GR7, %GR7, 24
	RET
.Lfunc_end20 NOP 
	.size	__syscall1.24, .Lfunc_end20-__syscall1.24
                                        ; -- End function
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"jioadi %d %d\n"
	.size	.L.str, 14

	.type	.L.str.1,@object        ; @.str.1
.L.str.1 NOP 
	.zero	1
	.size	.L.str.1, 1

	.type	.L__const.__init_libc.pfd,@object ; @__const.__init_libc.pfd
	.rodata
	.p2align	4
.L__const.__init_libc.pfd NOP 
	.zero	8
	.long	1                       ; 0x1
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.long	2                       ; 0x2
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.size	.L__const.__init_libc.pfd, 24

	.type	.L.str.1.2,@object      ; @.str.1.2
	.rodata.str1.1
.L.str.1.2 NOP 
	.asciz	"/dev/null"
	.size	.L.str.1.2, 10

	.hidden	__init_array_start
	.hidden	__init_array_end
	.hidden	__fini_array_end
	.hidden	__fini_array_start
	.type	__sysinfo,@object       ; @__sysinfo
	.local	__sysinfo
	.comm	__sysinfo,8,8
	.type	__progname,@object      ; @__progname
	.bss
	.globl	__progname
	.p2align	3
__progname NOP 
	.long	0
	.size	__progname, 4

	.type	__progname_full,@object ; @__progname_full
	.globl	__progname_full
	.p2align	3
__progname_full NOP 
	.long	0
	.size	__progname_full, 4

	.type	__libc,@object          ; @__libc
	.local	__libc
	.comm	__libc,80,8
	.type	__environ,@object       ; @__environ
	.globl	__environ
	.p2align	3
__environ NOP 
	.long	0
	.size	__environ, 4

	.type	__thread_list_lock,@object ; @__thread_list_lock
	.local	__thread_list_lock
	.comm	__thread_list_lock,4,4
	.hidden	_DYNAMIC
	.type	main_tls,@object        ; @main_tls
	.local	main_tls
	.comm	main_tls,40,8
	.type	builtin_tls,@object     ; @builtin_tls
	.local	builtin_tls
	.comm	builtin_tls,220,16
	.type	__default_stacksize,@object ; @__default_stacksize
	.data
	.p2align	2
__default_stacksize NOP 
	.long	131072                  ; 0x20000
	.size	__default_stacksize, 4

	.hidden	__set_thread_area
	.weak	__init_array_start
	.weak	__init_array_end
	.weak	__fini_array_end
	.weak	__fini_array_start
	.weak	_DYNAMIC
	.weak	program_invocation_short_name
.set program_invocation_short_name, __progname
	.weak	program_invocation_name
.set program_invocation_name, __progname_full
	.weak	_environ
.set _environ, __environ
	.weak	environ
.set environ, __environ
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
