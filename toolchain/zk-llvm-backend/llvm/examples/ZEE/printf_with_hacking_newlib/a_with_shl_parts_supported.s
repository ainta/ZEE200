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
	COPYI	%GR2, 9999
	STORE	%GR2, 0(%GR6)
	ADDI	%GR6, %GR7, 4
	COPYI	%GR2, 123
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
	.globl	printf                  ; -- Begin function printf
	.type	printf,@function
printf NOP                              ; @printf
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR6, impure_data
	STORE	%GR6, 8(%GR7)
	ADDI	%GR6, %GR7, 68
	STORE	%GR6, 16(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR6, %GR1, 8
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR3, .L.str.3
	ADDI	%GR4, %GR7, 16
	CALL	_vfprintf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 44(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end1 NOP 
	.size	printf, .Lfunc_end1-printf
                                        ; -- End function
	.globl	vfprintf                ; -- Begin function vfprintf
	.type	vfprintf,@function
vfprintf NOP                            ; @vfprintf
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 16(%GR7)
	LOAD	%GR4, 8(%GR7)
	COPYI	%GR1, impure_data
	CALL	_vfprintf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end2 NOP 
	.size	vfprintf, .Lfunc_end2-vfprintf
                                        ; -- End function
	.type	_vfprintf_r,@function   ; -- Begin function _vfprintf_r
_vfprintf_r NOP                         ; @_vfprintf_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 400
	STORE	%GR1, 396(%GR7)
	STORE	%GR2, 392(%GR7)
	STORE	%GR3, 388(%GR7)
	STORE	%GR4, 384(%GR7)
	STORE	%GR5, 380(%GR7)
	STORE	%GR1, 368(%GR7)
	STORE	%GR2, 360(%GR7)
	STORE	%GR3, 352(%GR7)
	STORE	%GR4, 344(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 264(%GR7)
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB3_1
.LBB3_1 NOP                             ; %do.body
	LOAD	%GR6, 368(%GR7)
	STORE	%GR6, 80(%GR7)
	LOAD	%GR6, 80(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_4
	JUMP	.LBB3_2
.LBB3_2 NOP                             ; %land.lhs.true
	LOAD	%GR6, 80(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_4
	JUMP	.LBB3_3
.LBB3_3 NOP                             ; %if.then
	LOAD	%GR1, 80(%GR7)
	CALL	__sinit
	JUMP	.LBB3_4
.LBB3_4 NOP                             ; %if.end
	JUMP	.LBB3_5
.LBB3_5 NOP                             ; %do.end
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB3_10
	JUMP	.LBB3_6
.LBB3_6 NOP                             ; %if.then3
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_8
	JUMP	.LBB3_7
.LBB3_7 NOP                             ; %cond.true
	JUMP	.LBB3_9
.LBB3_8 NOP                             ; %cond.false
	JUMP	.LBB3_9
.LBB3_9 NOP                             ; %cond.end
	JUMP	.LBB3_10
.LBB3_10 NOP                            ; %if.end6
	JUMP	.LBB3_11
.LBB3_11 NOP                            ; %do.body7
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_13
	JUMP	.LBB3_12
.LBB3_12 NOP                            ; %if.then12
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 104
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB3_13
.LBB3_13 NOP                            ; %if.end18
	JUMP	.LBB3_14
.LBB3_14 NOP                            ; %do.end19
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_16
	JUMP	.LBB3_15
.LBB3_15 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_23
	JUMP	.LBB3_16
.LBB3_16 NOP                            ; %land.lhs.true26
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	CALL	__swsetup_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_23
	JUMP	.LBB3_17
.LBB3_17 NOP                            ; %if.then28
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB3_22
	JUMP	.LBB3_18
.LBB3_18 NOP                            ; %if.then32
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_20
	JUMP	.LBB3_19
.LBB3_19 NOP                            ; %cond.true37
	JUMP	.LBB3_21
.LBB3_20 NOP                            ; %cond.false38
	JUMP	.LBB3_21
.LBB3_21 NOP                            ; %cond.end39
	JUMP	.LBB3_22
.LBB3_22 NOP                            ; %if.end40
	COPYI	%GR6, -1
	STORE	%GR6, 376(%GR7)
	JUMP	.LBB3_375
.LBB3_23 NOP                            ; %if.end41
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 26
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_31
	JUMP	.LBB3_24
.LBB3_24 NOP                            ; %land.lhs.true47
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_31
	JUMP	.LBB3_25
.LBB3_25 NOP                            ; %if.then51
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB3_30
	JUMP	.LBB3_26
.LBB3_26 NOP                            ; %if.then55
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_28
	JUMP	.LBB3_27
.LBB3_27 NOP                            ; %cond.true60
	JUMP	.LBB3_29
.LBB3_28 NOP                            ; %cond.false61
	JUMP	.LBB3_29
.LBB3_29 NOP                            ; %cond.end62
	JUMP	.LBB3_30
.LBB3_30 NOP                            ; %if.end63
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	LOAD	%GR3, 352(%GR7)
	LOAD	%GR4, 344(%GR7)
	CALL	__sbprintf
	COPYR	%GR6, %RT0
	STORE	%GR6, 376(%GR7)
	JUMP	.LBB3_375
.LBB3_31 NOP                            ; %if.end65
	LOAD	%GR6, 352(%GR7)
	STORE	%GR6, 336(%GR7)
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	STORE	%GR6, 248(%GR7)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	COPYI	%GR3, 0
	STORE	%GR3, 0(%GR2)
	STORE	%GR3, 0(%GR1)
	ORI	%GR6, %GR6, 4
	STORE	%GR3, 0(%GR6)
	STORE	%GR3, 308(%GR7)
	JUMP	.LBB3_32
.LBB3_32 NOP                            ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_33 Depth 2
                                        ;     Child Loop BB3_46 Depth 2
                                        ;       Child Loop BB3_47 Depth 3
                                        ;         Child Loop BB3_102 Depth 4
                                        ;         Child Loop BB3_93 Depth 4
                                        ;     Child Loop BB3_256 Depth 2
                                        ;     Child Loop BB3_252 Depth 2
                                        ;     Child Loop BB3_243 Depth 2
                                        ;     Child Loop BB3_280 Depth 2
                                        ;     Child Loop BB3_307 Depth 2
                                        ;     Child Loop BB3_321 Depth 2
                                        ;     Child Loop BB3_339 Depth 2
	LOAD	%GR6, 336(%GR7)
	STORE	%GR6, 320(%GR7)
	JUMP	.LBB3_33
.LBB3_33 NOP                            ; %while.cond
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 336(%GR7)
	LOADB	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB3_35
	JUMP	.LBB3_34
.LBB3_34 NOP                            ; %land.rhs
                                        ;   in Loop: Header=BB3_33 Depth=2
	LOAD	%GR6, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 37
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB3_35
.LBB3_35 NOP                            ; %land.end
                                        ;   in Loop: Header=BB3_33 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_37
	JUMP	.LBB3_36
.LBB3_36 NOP                            ; %while.body
                                        ;   in Loop: Header=BB3_33 Depth=2
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 336(%GR7)
	JUMP	.LBB3_33
.LBB3_37 NOP                            ; %while.end
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 336(%GR7)
	LOAD	%GR1, 320(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 324(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_43
	JUMP	.LBB3_38
.LBB3_38 NOP                            ; %if.then75
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	LOAD	%GR1, 136(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 324(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 324(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 68(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 20(%GR7)
	LOAD	%GR5, 68(%GR7)
	LOAD	%GR6, 44(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 20(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_42
	JUMP	.LBB3_39
.LBB3_39 NOP                            ; %if.then82
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_41
	JUMP	.LBB3_40
.LBB3_40 NOP                            ; %if.then85
	JUMP	.LBB3_364
.LBB3_41 NOP                            ; %if.end86
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_42
.LBB3_42 NOP                            ; %if.end88
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 324(%GR7)
	LOAD	%GR1, 308(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 308(%GR7)
	JUMP	.LBB3_43
.LBB3_43 NOP                            ; %if.end90
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_45
	JUMP	.LBB3_44
.LBB3_44 NOP                            ; %if.then94
	JUMP	.LBB3_360
.LBB3_45 NOP                            ; %if.end95
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 336(%GR7)
	STORE	%GR6, 312(%GR7)
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 336(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 316(%GR7)
	STORE	%GR6, 280(%GR7)
	STORE	%GR6, 304(%GR7)
	COPYI	%GR1, -1
	STORE	%GR1, 300(%GR7)
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_46
.LBB3_46 NOP                            ; %rflag
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_47 Depth 3
                                        ;         Child Loop BB3_102 Depth 4
                                        ;         Child Loop BB3_93 Depth 4
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	STORE	%GR6, 332(%GR7)
	JUMP	.LBB3_47
.LBB3_47 NOP                            ; %reswitch
                                        ;   Parent Loop BB3_32 Depth=1
                                        ;     Parent Loop BB3_46 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_102 Depth 4
                                        ;         Child Loop BB3_93 Depth 4
	LOAD	%GR6, 332(%GR7)
	COPYI	%GR1, 32
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_71
	JUMP	.LBB3_48
.LBB3_48 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 35
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_75
	JUMP	.LBB3_49
.LBB3_49 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 42
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_76
	JUMP	.LBB3_50
.LBB3_50 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 43
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_84
	JUMP	.LBB3_51
.LBB3_51 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 45
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_82
	JUMP	.LBB3_52
.LBB3_52 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 46
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_85
	JUMP	.LBB3_53
.LBB3_53 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR1, 48
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_100
	JUMP	.LBB3_54
.LBB3_54 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_47 Depth=3
	ADDI	%GR1, %GR6, -49
	COPYI	%GR2, 9
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB3_101
	JUMP	.LBB3_55
.LBB3_55 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 68
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_112
	JUMP	.LBB3_56
.LBB3_56 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 79
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_151
	JUMP	.LBB3_57
.LBB3_57 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 85
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_191
	JUMP	.LBB3_58
.LBB3_58 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 88
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_211
	JUMP	.LBB3_59
.LBB3_59 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 99
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_108
	JUMP	.LBB3_60
.LBB3_60 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 100
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_113
	JUMP	.LBB3_61
.LBB3_61 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 104
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_105
	JUMP	.LBB3_62
.LBB3_62 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 105
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_113
	JUMP	.LBB3_63
.LBB3_63 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 108
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_106
	JUMP	.LBB3_64
.LBB3_64 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 110
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_134
	JUMP	.LBB3_65
.LBB3_65 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 111
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_152
	JUMP	.LBB3_66
.LBB3_66 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 112
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_171
	JUMP	.LBB3_67
.LBB3_67 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR1, 113
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_107
	JUMP	.LBB3_68
.LBB3_68 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR1, 115
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_175
	JUMP	.LBB3_69
.LBB3_69 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR1, 117
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_192
	JUMP	.LBB3_70
.LBB3_70 NOP                            ; %reswitch
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR1, 120
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_212
	JUMP	.LBB3_267
.LBB3_71 NOP                            ; %sw.bb
                                        ;   in Loop: Header=BB3_46 Depth=2
	ULOADB	%GR6, 296(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_73
	JUMP	.LBB3_72
.LBB3_72 NOP                            ; %if.then100
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR6, 32
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_73
.LBB3_73 NOP                            ; %if.end101
                                        ;   in Loop: Header=BB3_46 Depth=2
	JUMP	.LBB3_74
.LBB3_74 NOP                            ; %rflag.backedge
                                        ;   in Loop: Header=BB3_46 Depth=2
	JUMP	.LBB3_46
.LBB3_75 NOP                            ; %sw.bb102
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 1
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_76 NOP                            ; %sw.bb104
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_78
	JUMP	.LBB3_77
.LBB3_77 NOP                            ; %vaarg.in_reg
                                        ;   in Loop: Header=BB3_46 Depth=2
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_79
.LBB3_78 NOP                            ; %vaarg.in_mem
                                        ;   in Loop: Header=BB3_46 Depth=2
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_79
.LBB3_79 NOP                            ; %vaarg.end
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 304(%GR7)
	LOAD	%GR6, 304(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_81
	JUMP	.LBB3_80
.LBB3_80 NOP                            ; %if.then107
                                        ;   in Loop: Header=BB3_46 Depth=2
	JUMP	.LBB3_74
.LBB3_81 NOP                            ; %if.end108
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 304(%GR7)
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 304(%GR7)
	JUMP	.LBB3_83
.LBB3_82 NOP                            ; %sw.bb109.loopexit
                                        ;   in Loop: Header=BB3_46 Depth=2
	JUMP	.LBB3_83
.LBB3_83 NOP                            ; %sw.bb109
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_84 NOP                            ; %sw.bb111
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR6, 43
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_74
.LBB3_85 NOP                            ; %sw.bb112
                                        ;   in Loop: Header=BB3_47 Depth=3
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	STORE	%GR6, 332(%GR7)
	COPYI	%GR1, 42
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_92
	JUMP	.LBB3_86
.LBB3_86 NOP                            ; %if.then117
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_88
	JUMP	.LBB3_87
.LBB3_87 NOP                            ; %vaarg.in_reg121
                                        ;   in Loop: Header=BB3_46 Depth=2
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_89
.LBB3_88 NOP                            ; %vaarg.in_mem123
                                        ;   in Loop: Header=BB3_46 Depth=2
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_89
.LBB3_89 NOP                            ; %vaarg.end127
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 300(%GR7)
	LOAD	%GR6, 300(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_91
	JUMP	.LBB3_90
.LBB3_90 NOP                            ; %if.then131
                                        ;   in Loop: Header=BB3_46 Depth=2
	COPYI	%GR6, -1
	STORE	%GR6, 300(%GR7)
	JUMP	.LBB3_91
.LBB3_91 NOP                            ; %if.end132
                                        ;   in Loop: Header=BB3_46 Depth=2
	JUMP	.LBB3_74
.LBB3_92 NOP                            ; %if.end133
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR6, 0
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_93
.LBB3_93 NOP                            ; %while.cond134
                                        ;   Parent Loop BB3_32 Depth=1
                                        ;     Parent Loop BB3_46 Depth=2
                                        ;       Parent Loop BB3_47 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	LOAD	%GR6, 332(%GR7)
	ADDI	%GR6, %GR6, -48
	COPYI	%GR1, 9
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_95
	JUMP	.LBB3_94
.LBB3_94 NOP                            ; %while.body138
                                        ;   in Loop: Header=BB3_93 Depth=4
	LOAD	%GR6, 328(%GR7)
	MULI	%GR6, %GR6, 10
	LOAD	%GR1, 332(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 328(%GR7)
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	STORE	%GR6, 332(%GR7)
	JUMP	.LBB3_93
.LBB3_95 NOP                            ; %while.end143
                                        ;   in Loop: Header=BB3_47 Depth=3
	LOAD	%GR6, 328(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_97
	JUMP	.LBB3_96
.LBB3_96 NOP                            ; %cond.true146
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR6, -1
	JUMP	.LBB3_98
.LBB3_97 NOP                            ; %cond.false147
                                        ;   in Loop: Header=BB3_47 Depth=3
	LOAD	%GR6, 328(%GR7)
	JUMP	.LBB3_98
.LBB3_98 NOP                            ; %cond.end148
                                        ;   in Loop: Header=BB3_47 Depth=3
	STORE	%GR6, 300(%GR7)
	JUMP	.LBB3_99
.LBB3_99 NOP                            ; %reswitch.backedge
                                        ;   in Loop: Header=BB3_47 Depth=3
	JUMP	.LBB3_47
.LBB3_100 NOP                           ; %sw.bb149
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 128
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_101 NOP                           ; %sw.bb151
                                        ;   in Loop: Header=BB3_47 Depth=3
	COPYI	%GR6, 0
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_102
.LBB3_102 NOP                           ; %do.body152
                                        ;   Parent Loop BB3_32 Depth=1
                                        ;     Parent Loop BB3_46 Depth=2
                                        ;       Parent Loop BB3_47 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	LOAD	%GR6, 328(%GR7)
	MULI	%GR6, %GR6, 10
	LOAD	%GR1, 332(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 328(%GR7)
	LOAD	%GR6, 336(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 336(%GR7)
	LOADB	%GR6, 0(%GR6)
	STORE	%GR6, 332(%GR7)
	JUMP	.LBB3_103
.LBB3_103 NOP                           ; %do.cond
                                        ;   in Loop: Header=BB3_102 Depth=4
	LOAD	%GR6, 332(%GR7)
	ADDI	%GR6, %GR6, -48
	COPYI	%GR1, 10
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_102
	JUMP	.LBB3_104
.LBB3_104 NOP                           ; %do.end161
                                        ;   in Loop: Header=BB3_47 Depth=3
	LOAD	%GR6, 328(%GR7)
	STORE	%GR6, 304(%GR7)
	JUMP	.LBB3_99
.LBB3_105 NOP                           ; %sw.bb162
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 64
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_106 NOP                           ; %sw.bb164
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_107 NOP                           ; %sw.bb166
                                        ;   in Loop: Header=BB3_46 Depth=2
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_74
.LBB3_108 NOP                           ; %sw.bb168
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 96
	STORE	%GR6, 320(%GR7)
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_110
	JUMP	.LBB3_109
.LBB3_109 NOP                           ; %vaarg.in_reg173
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_111
.LBB3_110 NOP                           ; %vaarg.in_mem175
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_111
.LBB3_111 NOP                           ; %vaarg.end179
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STORE	%GR6, 272(%GR7)
	COPYI	%GR6, 0
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_270
.LBB3_112 NOP                           ; %sw.bb182
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_114
.LBB3_113 NOP                           ; %sw.bb184.loopexit
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_114
.LBB3_114 NOP                           ; %sw.bb184
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_119
	JUMP	.LBB3_115
.LBB3_115 NOP                           ; %cond.true187
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_117
	JUMP	.LBB3_116
.LBB3_116 NOP                           ; %vaarg.in_reg191
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_118
.LBB3_117 NOP                           ; %vaarg.in_mem193
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_118
.LBB3_118 NOP                           ; %vaarg.end197
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	JUMP	.LBB3_131
.LBB3_119 NOP                           ; %cond.false199
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_124
	JUMP	.LBB3_120
.LBB3_120 NOP                           ; %cond.true202
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_122
	JUMP	.LBB3_121
.LBB3_121 NOP                           ; %vaarg.in_reg206
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_123
.LBB3_122 NOP                           ; %vaarg.in_mem208
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_123
.LBB3_123 NOP                           ; %vaarg.end212
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOADH	%GR6, 0(%GR1)
	SRAI	%GR1, %GR6, 31
	JUMP	.LBB3_130
.LBB3_124 NOP                           ; %cond.false216
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_125
.LBB3_125 NOP                           ; %cond.false233
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_127
	JUMP	.LBB3_126
.LBB3_126 NOP                           ; %vaarg.in_reg237
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_128
.LBB3_127 NOP                           ; %vaarg.in_mem239
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_128
.LBB3_128 NOP                           ; %vaarg.end243
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	SRAI	%GR1, %GR6, 31
	JUMP	.LBB3_129
.LBB3_129 NOP                           ; %cond.end246
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_130
.LBB3_130 NOP                           ; %cond.end248
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_131
.LBB3_131 NOP                           ; %cond.end250
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR7, 288
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 288(%GR7)
	LOAD	%GR6, 0(%GR2)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_133
	JUMP	.LBB3_132
.LBB3_132 NOP                           ; %if.then254
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 288(%GR7)
	COPYI	%GR3, 0
	SUB	%GR4, %GR3, %GR2
	NEQ	%GR2, %GR2, %GR3
	ADD	%GR1, %GR1, %GR2
	SUB	%GR1, %GR3, %GR1
	STORE	%GR1, 0(%GR6)
	STORE	%GR4, 288(%GR7)
	COPYI	%GR6, 45
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_133
.LBB3_133 NOP                           ; %if.end256
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, 1
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB3_235
.LBB3_134 NOP                           ; %sw.bb257
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_139
	JUMP	.LBB3_135
.LBB3_135 NOP                           ; %if.then260
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 308(%GR7)
	SRAI	%GR6, %GR1, 31
	LOAD	%GR2, 344(%GR7)
	LOAD	%GR4, 0(%GR2)
	COPYI	%GR3, 40
	UGT	%GR3, %GR4, %GR3
	BNEQZ	%GR3, .LBB3_137
	JUMP	.LBB3_136
.LBB3_136 NOP                           ; %vaarg.in_reg265
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR3, %GR2, 12
	LOAD	%GR3, 0(%GR3)
	ADD	%GR3, %GR3, %GR4
	ADDI	%GR4, %GR4, 8
	STORE	%GR4, 0(%GR2)
	JUMP	.LBB3_138
.LBB3_137 NOP                           ; %vaarg.in_mem267
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR2, 8
	LOAD	%GR3, 0(%GR2)
	ADDI	%GR4, %GR3, 8
	STORE	%GR4, 0(%GR2)
	JUMP	.LBB3_138
.LBB3_138 NOP                           ; %vaarg.end271
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR2, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR2, 4
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB3_149
.LBB3_139 NOP                           ; %if.else
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_144
	JUMP	.LBB3_140
.LBB3_140 NOP                           ; %if.then275
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR1, 344(%GR7)
	LOAD	%GR3, 0(%GR1)
	COPYI	%GR2, 40
	UGT	%GR2, %GR3, %GR2
	BNEQZ	%GR2, .LBB3_142
	JUMP	.LBB3_141
.LBB3_141 NOP                           ; %vaarg.in_reg280
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR1, 12
	LOAD	%GR2, 0(%GR2)
	ADD	%GR2, %GR2, %GR3
	ADDI	%GR3, %GR3, 8
	STORE	%GR3, 0(%GR1)
	JUMP	.LBB3_143
.LBB3_142 NOP                           ; %vaarg.in_mem282
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 0(%GR1)
	JUMP	.LBB3_143
.LBB3_143 NOP                           ; %vaarg.end286
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 0(%GR2)
	STOREH	%GR6, 0(%GR1)
	JUMP	.LBB3_148
.LBB3_144 NOP                           ; %if.else288
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR1, 344(%GR7)
	LOAD	%GR3, 0(%GR1)
	COPYI	%GR2, 40
	UGT	%GR2, %GR3, %GR2
	BNEQZ	%GR2, .LBB3_146
	JUMP	.LBB3_145
.LBB3_145 NOP                           ; %vaarg.in_reg292
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR1, 12
	LOAD	%GR2, 0(%GR2)
	ADD	%GR2, %GR2, %GR3
	ADDI	%GR3, %GR3, 8
	STORE	%GR3, 0(%GR1)
	JUMP	.LBB3_147
.LBB3_146 NOP                           ; %vaarg.in_mem294
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 0(%GR1)
	JUMP	.LBB3_147
.LBB3_147 NOP                           ; %vaarg.end298
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB3_148
.LBB3_148 NOP                           ; %if.end300
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_149
.LBB3_149 NOP                           ; %if.end301
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_150
.LBB3_150 NOP                           ; %for.cond.backedge
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_32
.LBB3_151 NOP                           ; %sw.bb302
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_153
.LBB3_152 NOP                           ; %sw.bb304.loopexit
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_153
.LBB3_153 NOP                           ; %sw.bb304
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_158
	JUMP	.LBB3_154
.LBB3_154 NOP                           ; %cond.true307
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_156
	JUMP	.LBB3_155
.LBB3_155 NOP                           ; %vaarg.in_reg311
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_157
.LBB3_156 NOP                           ; %vaarg.in_mem313
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_157
.LBB3_157 NOP                           ; %vaarg.end317
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	JUMP	.LBB3_170
.LBB3_158 NOP                           ; %cond.false319
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_163
	JUMP	.LBB3_159
.LBB3_159 NOP                           ; %cond.true322
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_161
	JUMP	.LBB3_160
.LBB3_160 NOP                           ; %vaarg.in_reg326
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_162
.LBB3_161 NOP                           ; %vaarg.in_mem328
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_162
.LBB3_162 NOP                           ; %vaarg.end332
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADH	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_169
.LBB3_163 NOP                           ; %cond.false336
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_164
.LBB3_164 NOP                           ; %cond.false353
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_166
	JUMP	.LBB3_165
.LBB3_165 NOP                           ; %vaarg.in_reg357
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_167
.LBB3_166 NOP                           ; %vaarg.in_mem359
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_167
.LBB3_167 NOP                           ; %vaarg.end363
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_168
.LBB3_168 NOP                           ; %cond.end366
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_169
.LBB3_169 NOP                           ; %cond.end368
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_170
.LBB3_170 NOP                           ; %cond.end370
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR7, 288
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 288(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB3_234
.LBB3_171 NOP                           ; %sw.bb372
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_173
	JUMP	.LBB3_172
.LBB3_172 NOP                           ; %vaarg.in_reg376
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_174
.LBB3_173 NOP                           ; %vaarg.in_mem378
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_174
.LBB3_174 NOP                           ; %vaarg.end382
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	ADDI	%GR1, %GR7, 288
	ORI	%GR1, %GR1, 4
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 288(%GR7)
	COPYI	%GR6, 2
	STORE	%GR6, 284(%GR7)
	COPYI	%GR6, .L.str.6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 2
	STORE	%GR6, 316(%GR7)
	COPYI	%GR6, 48
	STOREB	%GR6, 92(%GR7)
	COPYI	%GR6, 120
	STORE	%GR6, 332(%GR7)
	ADDI	%GR1, %GR7, 92
	ORI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB3_234
.LBB3_175 NOP                           ; %sw.bb386
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_177
	JUMP	.LBB3_176
.LBB3_176 NOP                           ; %vaarg.in_reg390
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_178
.LBB3_177 NOP                           ; %vaarg.in_mem392
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_178
.LBB3_178 NOP                           ; %vaarg.end396
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 320(%GR7)
	COPYI	%GR6, 0
	STOREB	%GR6, 296(%GR7)
	LOAD	%GR1, 320(%GR7)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_183
	JUMP	.LBB3_179
.LBB3_179 NOP                           ; %if.then400
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, .L.str.1
	STORE	%GR6, 320(%GR7)
	LOAD	%GR6, 300(%GR7)
	COPYI	%GR1, 7
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_181
	JUMP	.LBB3_180
.LBB3_180 NOP                           ; %cond.true403
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, 6
	JUMP	.LBB3_182
.LBB3_181 NOP                           ; %cond.false404
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 300(%GR7)
	JUMP	.LBB3_182
.LBB3_182 NOP                           ; %cond.end405
                                        ;   in Loop: Header=BB3_32 Depth=1
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_190
.LBB3_183 NOP                           ; %if.else407
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 300(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_188
	JUMP	.LBB3_184
.LBB3_184 NOP                           ; %if.then410
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 320(%GR7)
	LOAD	%GR3, 300(%GR7)
	SRAI	%GR4, %GR3, 31
	COPYI	%GR2, 0
	CALL	memchr
	COPYR	%GR6, %RT0
	STORE	%GR6, 72(%GR7)
	LOAD	%GR6, 72(%GR7)
	EQ	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB3_186
	JUMP	.LBB3_185
.LBB3_185 NOP                           ; %if.then415
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 320(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_187
.LBB3_186 NOP                           ; %if.else420
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 300(%GR7)
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_187
.LBB3_187 NOP                           ; %if.end421
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_189
.LBB3_188 NOP                           ; %if.else422
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 320(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
                                        ; kill: def $gr1 killed $rt1
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_189
.LBB3_189 NOP                           ; %if.end425
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_190
.LBB3_190 NOP                           ; %if.end426
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_270
.LBB3_191 NOP                           ; %sw.bb427
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 16
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_193
.LBB3_192 NOP                           ; %sw.bb429.loopexit
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_193
.LBB3_193 NOP                           ; %sw.bb429
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_198
	JUMP	.LBB3_194
.LBB3_194 NOP                           ; %cond.true432
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_196
	JUMP	.LBB3_195
.LBB3_195 NOP                           ; %vaarg.in_reg436
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_197
.LBB3_196 NOP                           ; %vaarg.in_mem438
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_197
.LBB3_197 NOP                           ; %vaarg.end442
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	JUMP	.LBB3_210
.LBB3_198 NOP                           ; %cond.false444
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_203
	JUMP	.LBB3_199
.LBB3_199 NOP                           ; %cond.true447
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_201
	JUMP	.LBB3_200
.LBB3_200 NOP                           ; %vaarg.in_reg451
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_202
.LBB3_201 NOP                           ; %vaarg.in_mem453
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_202
.LBB3_202 NOP                           ; %vaarg.end457
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADH	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_209
.LBB3_203 NOP                           ; %cond.false461
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_204
.LBB3_204 NOP                           ; %cond.false478
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_206
	JUMP	.LBB3_205
.LBB3_205 NOP                           ; %vaarg.in_reg482
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_207
.LBB3_206 NOP                           ; %vaarg.in_mem484
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_207
.LBB3_207 NOP                           ; %vaarg.end488
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_208
.LBB3_208 NOP                           ; %cond.end491
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_209
.LBB3_209 NOP                           ; %cond.end493
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_210
.LBB3_210 NOP                           ; %cond.end495
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR7, 288
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 288(%GR7)
	COPYI	%GR6, 1
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB3_234
.LBB3_211 NOP                           ; %sw.bb497
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, .L.str.2
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB3_213
.LBB3_212 NOP                           ; %sw.bb498
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, .L.str.6
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB3_213
.LBB3_213 NOP                           ; %hex
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_218
	JUMP	.LBB3_214
.LBB3_214 NOP                           ; %cond.true501
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_216
	JUMP	.LBB3_215
.LBB3_215 NOP                           ; %vaarg.in_reg505
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_217
.LBB3_216 NOP                           ; %vaarg.in_mem507
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_217
.LBB3_217 NOP                           ; %vaarg.end511
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	JUMP	.LBB3_230
.LBB3_218 NOP                           ; %cond.false513
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_223
	JUMP	.LBB3_219
.LBB3_219 NOP                           ; %cond.true516
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_221
	JUMP	.LBB3_220
.LBB3_220 NOP                           ; %vaarg.in_reg520
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_222
.LBB3_221 NOP                           ; %vaarg.in_mem522
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_222
.LBB3_222 NOP                           ; %vaarg.end526
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADH	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_229
.LBB3_223 NOP                           ; %cond.false530
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_224
.LBB3_224 NOP                           ; %cond.false547
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 344(%GR7)
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 40
	UGT	%GR1, %GR2, %GR1
	BNEQZ	%GR1, .LBB3_226
	JUMP	.LBB3_225
.LBB3_225 NOP                           ; %vaarg.in_reg551
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR2, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_227
.LBB3_226 NOP                           ; %vaarg.in_mem553
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB3_227
.LBB3_227 NOP                           ; %vaarg.end557
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	JUMP	.LBB3_228
.LBB3_228 NOP                           ; %cond.end560
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_229
.LBB3_229 NOP                           ; %cond.end562
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_230
.LBB3_230 NOP                           ; %cond.end564
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR2, %GR7, 288
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 288(%GR7)
	COPYI	%GR6, 2
	STORE	%GR6, 284(%GR7)
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_233
	JUMP	.LBB3_231
.LBB3_231 NOP                           ; %land.lhs.true568
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_233
	JUMP	.LBB3_232
.LBB3_232 NOP                           ; %if.then571
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, 48
	STOREB	%GR6, 92(%GR7)
	LOAD	%GR6, 332(%GR7)
	ADDI	%GR1, %GR7, 92
	ORI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 316(%GR7)
	ORI	%GR6, %GR6, 2
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_233
.LBB3_233 NOP                           ; %if.end576
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_234
.LBB3_234 NOP                           ; %nosign
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_235
.LBB3_235 NOP                           ; %number
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 300(%GR7)
	STORE	%GR6, 280(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_237
	JUMP	.LBB3_236
.LBB3_236 NOP                           ; %if.then579
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, -129
	STORE	%GR6, 316(%GR7)
	JUMP	.LBB3_237
.LBB3_237 NOP                           ; %if.end581
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 96
	ADDI	%GR6, %GR6, 40
	STORE	%GR6, 320(%GR7)
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_239
	JUMP	.LBB3_238
.LBB3_238 NOP                           ; %lor.lhs.false586
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 300(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_261
	JUMP	.LBB3_239
.LBB3_239 NOP                           ; %if.then589
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 284(%GR7)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_242
	JUMP	.LBB3_240
.LBB3_240 NOP                           ; %if.then589
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR1, 1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB3_249
	JUMP	.LBB3_241
.LBB3_241 NOP                           ; %if.then589
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR1, 2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_255
	JUMP	.LBB3_259
.LBB3_242 NOP                           ; %sw.bb590
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_243
.LBB3_243 NOP                           ; %do.body591
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 288(%GR7)
	ANDI	%GR6, %GR6, 7
	ORI	%GR6, %GR6, 48
	LOAD	%GR1, 320(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 288(%GR7)
	SHLI	%GR3, %GR1, 29
	SRLI	%GR2, %GR2, 3
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 3
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 288(%GR7)
	JUMP	.LBB3_244
.LBB3_244 NOP                           ; %do.cond596
                                        ;   in Loop: Header=BB3_243 Depth=2
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_243
	JUMP	.LBB3_245
.LBB3_245 NOP                           ; %do.end598
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_248
	JUMP	.LBB3_246
.LBB3_246 NOP                           ; %land.lhs.true601
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 48
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_248
	JUMP	.LBB3_247
.LBB3_247 NOP                           ; %if.then605
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 320(%GR7)
	COPYI	%GR1, 48
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB3_248
.LBB3_248 NOP                           ; %if.end607
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_260
.LBB3_249 NOP                           ; %sw.bb608
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	COPYI	%GR2, 9
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB3_251
	JUMP	.LBB3_250
.LBB3_250 NOP                           ; %if.then611
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 288(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR1, 320(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB3_260
.LBB3_251 NOP                           ; %if.end615
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_252
.LBB3_252 NOP                           ; %do.body616
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 288
	ORI	%GR5, %GR6, 4
	LOAD	%GR2, 0(%GR5)
	LOAD	%GR1, 288(%GR7)
	COPYI	%GR3, 10
	COPYI	%GR4, 0
	CALL	__umoddi3
	COPYR	%GR6, %RT0
	ORI	%GR6, %GR6, 48
	LOAD	%GR1, 320(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR2, 0(%GR5)
	LOAD	%GR1, 288(%GR7)
	CALL	__udivdi3
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	STORE	%GR1, 0(%GR5)
	STORE	%GR6, 288(%GR7)
	JUMP	.LBB3_253
.LBB3_253 NOP                           ; %do.cond620
                                        ;   in Loop: Header=BB3_252 Depth=2
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_252
	JUMP	.LBB3_254
.LBB3_254 NOP                           ; %do.end623
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_260
.LBB3_255 NOP                           ; %sw.bb624
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_256
.LBB3_256 NOP                           ; %do.body625
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 288(%GR7)
	ANDI	%GR1, %GR1, 15
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 320(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 288(%GR7)
	SHLI	%GR3, %GR1, 28
	SRLI	%GR2, %GR2, 4
	OR	%GR2, %GR2, %GR3
	SRLI	%GR1, %GR1, 4
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 288(%GR7)
	JUMP	.LBB3_257
.LBB3_257 NOP                           ; %do.cond630
                                        ;   in Loop: Header=BB3_256 Depth=2
	ADDI	%GR6, %GR7, 288
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 288(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_256
	JUMP	.LBB3_258
.LBB3_258 NOP                           ; %do.end632
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_260
.LBB3_259 NOP                           ; %sw.default
                                        ;   in Loop: Header=BB3_32 Depth=1
	COPYI	%GR6, .L.str.3.7
	STORE	%GR6, 320(%GR7)
	LOAD	%GR1, 320(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
                                        ; kill: def $gr1 killed $rt1
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_266
.LBB3_260 NOP                           ; %sw.epilog
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_265
.LBB3_261 NOP                           ; %if.else635
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 284(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_264
	JUMP	.LBB3_262
.LBB3_262 NOP                           ; %land.lhs.true638
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_264
	JUMP	.LBB3_263
.LBB3_263 NOP                           ; %if.then641
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 320(%GR7)
	COPYI	%GR1, 48
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB3_264
.LBB3_264 NOP                           ; %if.end643
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_265
.LBB3_265 NOP                           ; %if.end644
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	ADDI	%GR1, %GR7, 96
	SUB	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 40
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB3_266
.LBB3_266 NOP                           ; %skipsize
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_270
.LBB3_267 NOP                           ; %sw.default651
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 332(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_269
	JUMP	.LBB3_268
.LBB3_268 NOP                           ; %if.then654
	JUMP	.LBB3_360
.LBB3_269 NOP                           ; %if.end655
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 96
	STORE	%GR6, 320(%GR7)
	LOAD	%GR6, 332(%GR7)
	LOAD	%GR1, 320(%GR7)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STORE	%GR6, 272(%GR7)
	COPYI	%GR6, 0
	STOREB	%GR6, 296(%GR7)
	JUMP	.LBB3_270
.LBB3_270 NOP                           ; %sw.epilog658
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 272(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_272
	JUMP	.LBB3_271
.LBB3_271 NOP                           ; %cond.true661
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 280(%GR7)
	JUMP	.LBB3_273
.LBB3_272 NOP                           ; %cond.false662
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 272(%GR7)
	JUMP	.LBB3_273
.LBB3_273 NOP                           ; %cond.end663
                                        ;   in Loop: Header=BB3_32 Depth=1
	STORE	%GR6, 276(%GR7)
	ULOADB	%GR6, 296(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_275
	JUMP	.LBB3_274
.LBB3_274 NOP                           ; %if.then666
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 276(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 276(%GR7)
	JUMP	.LBB3_275
.LBB3_275 NOP                           ; %if.end668
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_277
	JUMP	.LBB3_276
.LBB3_276 NOP                           ; %if.then671
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 276(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 276(%GR7)
	JUMP	.LBB3_277
.LBB3_277 NOP                           ; %if.end673
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 132
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_292
	JUMP	.LBB3_278
.LBB3_278 NOP                           ; %if.then677
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 328(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_291
	JUMP	.LBB3_279
.LBB3_279 NOP                           ; %if.then681
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_280
.LBB3_280 NOP                           ; %while.cond682
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 328(%GR7)
	COPYI	%GR1, 17
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_286
	JUMP	.LBB3_281
.LBB3_281 NOP                           ; %while.body685
                                        ;   in Loop: Header=BB3_280 Depth=2
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.blanks
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 16
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_285
	JUMP	.LBB3_282
.LBB3_282 NOP                           ; %if.then695
                                        ;   in Loop: Header=BB3_280 Depth=2
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_284
	JUMP	.LBB3_283
.LBB3_283 NOP                           ; %if.then698
	JUMP	.LBB3_364
.LBB3_284 NOP                           ; %if.end699
                                        ;   in Loop: Header=BB3_280 Depth=2
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_285
.LBB3_285 NOP                           ; %if.end701
                                        ;   in Loop: Header=BB3_280 Depth=2
	LOAD	%GR6, 328(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_280
.LBB3_286 NOP                           ; %while.end703
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.blanks
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 328(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 328(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 64(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	LOAD	%GR5, 64(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 16(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_290
	JUMP	.LBB3_287
.LBB3_287 NOP                           ; %if.then715
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_289
	JUMP	.LBB3_288
.LBB3_288 NOP                           ; %if.then718
	JUMP	.LBB3_364
.LBB3_289 NOP                           ; %if.end719
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_290
.LBB3_290 NOP                           ; %if.end721
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_291
.LBB3_291 NOP                           ; %if.end722
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_292
.LBB3_292 NOP                           ; %if.end723
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 296(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_298
	JUMP	.LBB3_293
.LBB3_293 NOP                           ; %if.then725
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR7, 296
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 1
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 1
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_297
	JUMP	.LBB3_294
.LBB3_294 NOP                           ; %if.then735
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_296
	JUMP	.LBB3_295
.LBB3_295 NOP                           ; %if.then738
	JUMP	.LBB3_364
.LBB3_296 NOP                           ; %if.end739
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_297
.LBB3_297 NOP                           ; %if.end741
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_298
.LBB3_298 NOP                           ; %if.end742
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_304
	JUMP	.LBB3_299
.LBB3_299 NOP                           ; %if.then745
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR7, 92
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 2
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 2
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_303
	JUMP	.LBB3_300
.LBB3_300 NOP                           ; %if.then756
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_302
	JUMP	.LBB3_301
.LBB3_301 NOP                           ; %if.then759
	JUMP	.LBB3_364
.LBB3_302 NOP                           ; %if.end760
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_303
.LBB3_303 NOP                           ; %if.end762
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_304
.LBB3_304 NOP                           ; %if.end763
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 132
	COPYI	%GR1, 128
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_319
	JUMP	.LBB3_305
.LBB3_305 NOP                           ; %if.then767
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 328(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_318
	JUMP	.LBB3_306
.LBB3_306 NOP                           ; %if.then771
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_307
.LBB3_307 NOP                           ; %while.cond772
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 328(%GR7)
	COPYI	%GR1, 17
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_313
	JUMP	.LBB3_308
.LBB3_308 NOP                           ; %while.body775
                                        ;   in Loop: Header=BB3_307 Depth=2
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.zeroes
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 16
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_312
	JUMP	.LBB3_309
.LBB3_309 NOP                           ; %if.then785
                                        ;   in Loop: Header=BB3_307 Depth=2
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_311
	JUMP	.LBB3_310
.LBB3_310 NOP                           ; %if.then788
	JUMP	.LBB3_364
.LBB3_311 NOP                           ; %if.end789
                                        ;   in Loop: Header=BB3_307 Depth=2
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_312
.LBB3_312 NOP                           ; %if.end791
                                        ;   in Loop: Header=BB3_307 Depth=2
	LOAD	%GR6, 328(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_307
.LBB3_313 NOP                           ; %while.end793
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.zeroes
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 328(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 328(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 60(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 36(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%GR7)
	LOAD	%GR5, 60(%GR7)
	LOAD	%GR6, 36(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 12(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_317
	JUMP	.LBB3_314
.LBB3_314 NOP                           ; %if.then805
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_316
	JUMP	.LBB3_315
.LBB3_315 NOP                           ; %if.then808
	JUMP	.LBB3_364
.LBB3_316 NOP                           ; %if.end809
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_317
.LBB3_317 NOP                           ; %if.end811
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_318
.LBB3_318 NOP                           ; %if.end812
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_319
.LBB3_319 NOP                           ; %if.end813
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 272(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 328(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_332
	JUMP	.LBB3_320
.LBB3_320 NOP                           ; %if.then817
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_321
.LBB3_321 NOP                           ; %while.cond818
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 328(%GR7)
	COPYI	%GR1, 17
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_327
	JUMP	.LBB3_322
.LBB3_322 NOP                           ; %while.body821
                                        ;   in Loop: Header=BB3_321 Depth=2
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.zeroes
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 16
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_326
	JUMP	.LBB3_323
.LBB3_323 NOP                           ; %if.then831
                                        ;   in Loop: Header=BB3_321 Depth=2
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_325
	JUMP	.LBB3_324
.LBB3_324 NOP                           ; %if.then834
	JUMP	.LBB3_364
.LBB3_325 NOP                           ; %if.end835
                                        ;   in Loop: Header=BB3_321 Depth=2
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_326
.LBB3_326 NOP                           ; %if.end837
                                        ;   in Loop: Header=BB3_321 Depth=2
	LOAD	%GR6, 328(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_321
.LBB3_327 NOP                           ; %while.end839
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.zeroes
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 328(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 328(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 56(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%GR7)
	LOAD	%GR5, 56(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 8(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_331
	JUMP	.LBB3_328
.LBB3_328 NOP                           ; %if.then851
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_330
	JUMP	.LBB3_329
.LBB3_329 NOP                           ; %if.then854
	JUMP	.LBB3_364
.LBB3_330 NOP                           ; %if.end855
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_331
.LBB3_331 NOP                           ; %if.end857
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_332
.LBB3_332 NOP                           ; %if.end858
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 320(%GR7)
	LOAD	%GR1, 136(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 272(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 272(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 52(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 4(%GR7)
	LOAD	%GR5, 52(%GR7)
	LOAD	%GR6, 28(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 4(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_336
	JUMP	.LBB3_333
.LBB3_333 NOP                           ; %if.then870
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_335
	JUMP	.LBB3_334
.LBB3_334 NOP                           ; %if.then873
	JUMP	.LBB3_364
.LBB3_335 NOP                           ; %if.end874
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_336
.LBB3_336 NOP                           ; %if.end876
                                        ;   in Loop: Header=BB3_32 Depth=1
	ULOADB	%GR6, 316(%GR7)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_351
	JUMP	.LBB3_337
.LBB3_337 NOP                           ; %if.then879
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 328(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_350
	JUMP	.LBB3_338
.LBB3_338 NOP                           ; %if.then883
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_339
.LBB3_339 NOP                           ; %while.cond884
                                        ;   Parent Loop BB3_32 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 328(%GR7)
	COPYI	%GR1, 17
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_345
	JUMP	.LBB3_340
.LBB3_340 NOP                           ; %while.body887
                                        ;   in Loop: Header=BB3_339 Depth=2
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.blanks
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR1, %GR6, 4
	ADDI	%GR6, %GR6, 8
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR2, %GR6, 12
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 0(%GR1)
	ADDI	%GR5, %GR4, 16
	ULT	%GR4, %GR5, %GR4
	ADD	%GR3, %GR3, %GR4
	STORE	%GR5, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 136(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR1, 136(%GR7)
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_344
	JUMP	.LBB3_341
.LBB3_341 NOP                           ; %if.then897
                                        ;   in Loop: Header=BB3_339 Depth=2
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_343
	JUMP	.LBB3_342
.LBB3_342 NOP                           ; %if.then900
	JUMP	.LBB3_364
.LBB3_343 NOP                           ; %if.end901
                                        ;   in Loop: Header=BB3_339 Depth=2
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_344
.LBB3_344 NOP                           ; %if.end903
                                        ;   in Loop: Header=BB3_339 Depth=2
	LOAD	%GR6, 328(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 328(%GR7)
	JUMP	.LBB3_339
.LBB3_345 NOP                           ; %while.end905
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 136(%GR7)
	COPYI	%GR1, _vfprintf_r.blanks
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 328(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 4
	ADDI	%GR2, %GR2, 8
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 328(%GR7)
	SRAI	%GR6, %GR1, 31
	STORE	%GR6, 48(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR2, 12
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR1, %GR6, %GR1
	ULT	%GR6, %GR1, %GR6
	STORE	%GR6, 0(%GR7)
	LOAD	%GR5, 48(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADD	%GR5, %GR6, %GR5
	LOAD	%GR6, 0(%GR7)
	ADD	%GR6, %GR5, %GR6
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 136(%GR7)
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 8
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB3_349
	JUMP	.LBB3_346
.LBB3_346 NOP                           ; %if.then917
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_348
	JUMP	.LBB3_347
.LBB3_347 NOP                           ; %if.then920
	JUMP	.LBB3_364
.LBB3_348 NOP                           ; %if.end921
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_349
.LBB3_349 NOP                           ; %if.end923
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_350
.LBB3_350 NOP                           ; %if.end924
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_351
.LBB3_351 NOP                           ; %if.end925
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 276(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_353
	JUMP	.LBB3_352
.LBB3_352 NOP                           ; %cond.true928
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 304(%GR7)
	JUMP	.LBB3_354
.LBB3_353 NOP                           ; %cond.false929
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR6, 276(%GR7)
	JUMP	.LBB3_354
.LBB3_354 NOP                           ; %cond.end930
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 308(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 308(%GR7)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_357
	JUMP	.LBB3_355
.LBB3_355 NOP                           ; %land.lhs.true935
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_357
	JUMP	.LBB3_356
.LBB3_356 NOP                           ; %if.then938
	JUMP	.LBB3_364
.LBB3_357 NOP                           ; %if.end939
                                        ;   in Loop: Header=BB3_32 Depth=1
	ADDI	%GR6, %GR7, 248
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	LOAD	%GR6, 88(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_359
	JUMP	.LBB3_358
.LBB3_358 NOP                           ; %if.then944
                                        ;   in Loop: Header=BB3_32 Depth=1
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 88(%GR7)
	CALL	_free_r
	COPYI	%GR6, 0
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB3_359
.LBB3_359 NOP                           ; %if.end945
                                        ;   in Loop: Header=BB3_32 Depth=1
	JUMP	.LBB3_150
.LBB3_360 NOP                           ; %done
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_363
	JUMP	.LBB3_361
.LBB3_361 NOP                           ; %land.lhs.true948
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 360(%GR7)
	ADDI	%GR3, %GR7, 248
	CALL	__sprint_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_363
	JUMP	.LBB3_362
.LBB3_362 NOP                           ; %if.then951
	JUMP	.LBB3_364
.LBB3_363 NOP                           ; %if.end952
	ADDI	%GR6, %GR7, 248
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 144
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB3_364
.LBB3_364 NOP                           ; %error
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_366
	JUMP	.LBB3_365
.LBB3_365 NOP                           ; %if.then957
	LOAD	%GR1, 368(%GR7)
	LOAD	%GR2, 88(%GR7)
	CALL	_free_r
	JUMP	.LBB3_366
.LBB3_366 NOP                           ; %if.end958
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB3_371
	JUMP	.LBB3_367
.LBB3_367 NOP                           ; %if.then962
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_369
	JUMP	.LBB3_368
.LBB3_368 NOP                           ; %cond.true967
	JUMP	.LBB3_370
.LBB3_369 NOP                           ; %cond.false968
	JUMP	.LBB3_370
.LBB3_370 NOP                           ; %cond.end969
	JUMP	.LBB3_371
.LBB3_371 NOP                           ; %if.end970
	LOAD	%GR6, 360(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_373
	JUMP	.LBB3_372
.LBB3_372 NOP                           ; %cond.true976
	COPYI	%GR6, -1
	JUMP	.LBB3_374
.LBB3_373 NOP                           ; %cond.false977
	LOAD	%GR6, 308(%GR7)
	JUMP	.LBB3_374
.LBB3_374 NOP                           ; %cond.end978
	STORE	%GR6, 376(%GR7)
	JUMP	.LBB3_375
.LBB3_375 NOP                           ; %return
	LOAD	%GR6, 376(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 380(%GR7)
	LOAD	%GR4, 384(%GR7)
	LOAD	%GR3, 388(%GR7)
	LOAD	%GR2, 392(%GR7)
	LOAD	%GR1, 396(%GR7)
	ADDI	%GR7, %GR7, 400
	RET
.Lfunc_end3 NOP 
	.size	_vfprintf_r, .Lfunc_end3-_vfprintf_r
                                        ; -- End function
	.type	__sbprintf,@function    ; -- Begin function __sbprintf
__sbprintf NOP                          ; @__sbprintf
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 1184
	STORE	%GR1, 1180(%GR7)
	STORE	%GR2, 1176(%GR7)
	STORE	%GR3, 1172(%GR7)
	STORE	%GR4, 1168(%GR7)
	STORE	%GR5, 1164(%GR7)
	STORE	%GR1, 1160(%GR7)
	STORE	%GR2, 1152(%GR7)
	STORE	%GR3, 1144(%GR7)
	STORE	%GR4, 1136(%GR7)
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 65533
	ADDI	%GR2, %GR7, 1024
	ADDI	%GR1, %GR2, 12
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 104
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR2, 104
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 14
	ULOADH	%GR6, 0(%GR6)
	ADDI	%GR1, %GR2, 14
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR2, 28
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR2, 36
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 0
	STORE	%GR6, 1024(%GR7)
	ADDI	%GR1, %GR2, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR2, 8
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR2, 20
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR2, 24
	COPYI	%GR5, 0
	STORE	%GR5, 0(%GR6)
	LOAD	%GR1, 1160(%GR7)
	LOAD	%GR3, 1144(%GR7)
	LOAD	%GR4, 1136(%GR7)
	CALL	_vfprintf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 1132(%GR7)
	LOAD	%GR6, 1132(%GR7)
	LT	%GR6, %GR6, %GR5
	BNEQZ	%GR6, .LBB4_3
	JUMP	.LBB4_1
.LBB4_1 NOP                             ; %land.lhs.true
	LOAD	%GR1, 1160(%GR7)
	ADDI	%GR2, %GR7, 1024
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_3
	JUMP	.LBB4_2
.LBB4_2 NOP                             ; %if.then
	COPYI	%GR6, -1
	STORE	%GR6, 1132(%GR7)
	JUMP	.LBB4_3
.LBB4_3 NOP                             ; %if.end
	ADDI	%GR6, %GR7, 1024
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_5
	JUMP	.LBB4_4
.LBB4_4 NOP                             ; %if.then15
	LOAD	%GR6, 1152(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB4_5
.LBB4_5 NOP                             ; %if.end19
	LOAD	%GR6, 1132(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 1164(%GR7)
	LOAD	%GR4, 1168(%GR7)
	LOAD	%GR3, 1172(%GR7)
	LOAD	%GR2, 1176(%GR7)
	LOAD	%GR1, 1180(%GR7)
	ADDI	%GR7, %GR7, 1184
	RET
.Lfunc_end4 NOP 
	.size	__sbprintf, .Lfunc_end4-__sbprintf
                                        ; -- End function
	.type	__swsetup_r,@function   ; -- Begin function __swsetup_r
__swsetup_r NOP                         ; @__swsetup_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 8(%GR7)
	JUMP	.LBB5_1
.LBB5_1 NOP                             ; %do.body
	COPYI	%GR6, impure_data
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_4
	JUMP	.LBB5_2
.LBB5_2 NOP                             ; %land.lhs.true
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_4
	JUMP	.LBB5_3
.LBB5_3 NOP                             ; %if.then
	LOAD	%GR1, 0(%GR7)
	CALL	__sinit
	JUMP	.LBB5_4
.LBB5_4 NOP                             ; %if.end
	JUMP	.LBB5_5
.LBB5_5 NOP                             ; %do.end
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_15
	JUMP	.LBB5_6
.LBB5_6 NOP                             ; %if.then3
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_8
	JUMP	.LBB5_7
.LBB5_7 NOP                             ; %if.then9
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 9
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB5_29
.LBB5_8 NOP                             ; %if.end13
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_14
	JUMP	.LBB5_9
.LBB5_9 NOP                             ; %if.then18
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_13
	JUMP	.LBB5_10
.LBB5_10 NOP                            ; %if.then21
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB5_12
	JUMP	.LBB5_11
.LBB5_11 NOP                            ; %if.then26
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB5_12
.LBB5_12 NOP                            ; %if.end29
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB5_13
.LBB5_13 NOP                            ; %if.end32
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65499
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 16
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB5_14
.LBB5_14 NOP                            ; %if.end38
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB5_15
.LBB5_15 NOP                            ; %if.end43
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_19
	JUMP	.LBB5_16
.LBB5_16 NOP                            ; %land.lhs.true48
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_18
	JUMP	.LBB5_17
.LBB5_17 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_19
	JUMP	.LBB5_18
.LBB5_18 NOP                            ; %if.then57
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 8(%GR7)
	CALL	__smakebuf_r
	JUMP	.LBB5_19
.LBB5_19 NOP                            ; %if.end58
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_21
	JUMP	.LBB5_20
.LBB5_20 NOP                            ; %if.then63
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR2, %GR6, 20
	LOAD	%GR2, 0(%GR2)
	SUB	%GR1, %GR1, %GR2
	ADDI	%GR6, %GR6, 24
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB5_25
.LBB5_21 NOP                            ; %if.else
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_23
	JUMP	.LBB5_22
.LBB5_22 NOP                            ; %cond.true
	COPYI	%GR6, 0
	JUMP	.LBB5_24
.LBB5_23 NOP                            ; %cond.false
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB5_24
.LBB5_24 NOP                            ; %cond.end
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB5_25
.LBB5_25 NOP                            ; %if.end72
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_28
	JUMP	.LBB5_26
.LBB5_26 NOP                            ; %land.lhs.true76
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_28
	JUMP	.LBB5_27
.LBB5_27 NOP                            ; %if.then81
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB5_29
.LBB5_28 NOP                            ; %if.end86
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB5_29
.LBB5_29 NOP                            ; %return
	LOAD	%GR6, 20(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end5 NOP 
	.size	__swsetup_r, .Lfunc_end5-__swsetup_r
                                        ; -- End function
	.type	__sflush_r,@function    ; -- Begin function __sflush_r
__sflush_r NOP                          ; @__sflush_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 96
	STORE	%GR1, 92(%GR7)
	STORE	%GR2, 88(%GR7)
	STORE	%GR3, 84(%GR7)
	STORE	%GR4, 80(%GR7)
	STORE	%GR5, 76(%GR7)
	STORE	%GR1, 64(%GR7)
	STORE	%GR2, 56(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	STOREH	%GR6, 36(%GR7)
	ULOADH	%GR6, 36(%GR7)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_34
	JUMP	.LBB6_1
.LBB6_1 NOP                             ; %if.then
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 2048
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_3
	JUMP	.LBB6_2
.LBB6_2 NOP                             ; %lor.lhs.false
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 60
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_33
	JUMP	.LBB6_3
.LBB6_3 NOP                             ; %land.lhs.true
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 40
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_33
	JUMP	.LBB6_4
.LBB6_4 NOP                             ; %if.then11
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4096
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_6
	JUMP	.LBB6_5
.LBB6_5 NOP                             ; %if.then16
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 80
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 84
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 24
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 24(%GR7)
	JUMP	.LBB6_14
.LBB6_6 NOP                             ; %if.else
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 40
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR1, 64(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR3, 0
	COPYI	%GR5, 1
	COPYR	%GR4, %GR3
	LOAD	%GR6, 16(%GR7)
	CALL	%GR6
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 24
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 24(%GR7)
	AND	%GR6, %GR1, %GR6
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_13
	JUMP	.LBB6_7
.LBB6_7 NOP                             ; %land.lhs.true20
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_13
	JUMP	.LBB6_8
.LBB6_8 NOP                             ; %if.then24
	COPYI	%GR6, -1
	STORE	%GR6, 20(%GR7)
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 29
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_10
	JUMP	.LBB6_9
.LBB6_9 NOP                             ; %lor.lhs.false28
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 22
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_11
	JUMP	.LBB6_10
.LBB6_10 NOP                            ; %if.then32
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 64(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB6_12
.LBB6_11 NOP                            ; %if.else34
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB6_12
.LBB6_12 NOP                            ; %if.end
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_13 NOP                            ; %if.end39
	JUMP	.LBB6_14
.LBB6_14 NOP                            ; %if.end40
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_18
	JUMP	.LBB6_15
.LBB6_15 NOP                            ; %if.then45
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 24
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 24(%GR7)
	ULT	%GR5, %GR4, %GR6
	SUB	%GR1, %GR3, %GR1
	SUB	%GR1, %GR1, %GR5
	SUB	%GR6, %GR4, %GR6
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_17
	JUMP	.LBB6_16
.LBB6_16 NOP                            ; %if.then50
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 60
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 24
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 24(%GR7)
	ULT	%GR5, %GR4, %GR6
	SUB	%GR1, %GR3, %GR1
	SUB	%GR1, %GR1, %GR5
	SUB	%GR6, %GR4, %GR6
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB6_17
.LBB6_17 NOP                            ; %if.end54
	JUMP	.LBB6_18
.LBB6_18 NOP                            ; %if.end55
	LOAD	%GR2, 56(%GR7)
	ADDI	%GR6, %GR2, 40
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	ADDI	%GR2, %GR2, 28
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR3, %GR7, 24
	ORI	%GR3, %GR3, 4
	STORE	%GR3, 12(%GR7)
	LOAD	%GR4, 0(%GR3)
	LOAD	%GR3, 24(%GR7)
	COPYI	%GR5, 0
	CALL	%GR6
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	LOAD	%GR2, 12(%GR7)
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 24(%GR7)
	AND	%GR6, %GR1, %GR6
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_22
	JUMP	.LBB6_19
.LBB6_19 NOP                            ; %lor.lhs.false61
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_22
	JUMP	.LBB6_20
.LBB6_20 NOP                            ; %lor.lhs.false65
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 29
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_22
	JUMP	.LBB6_21
.LBB6_21 NOP                            ; %lor.lhs.false69
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 22
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_31
	JUMP	.LBB6_22
.LBB6_22 NOP                            ; %if.then73
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 63487
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR2, %GR6, 16
	LOAD	%GR2, 0(%GR2)
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4096
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_26
	JUMP	.LBB6_23
.LBB6_23 NOP                            ; %land.lhs.true84
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	AND	%GR6, %GR1, %GR6
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_25
	JUMP	.LBB6_24
.LBB6_24 NOP                            ; %lor.lhs.false87
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_26
	JUMP	.LBB6_25
.LBB6_25 NOP                            ; %if.then91
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 56(%GR7)
	ADDI	%GR3, %GR2, 80
	ADDI	%GR2, %GR2, 84
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	JUMP	.LBB6_26
.LBB6_26 NOP                            ; %if.end93
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 64(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_30
	JUMP	.LBB6_27
.LBB6_27 NOP                            ; %if.then99
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB6_29
	JUMP	.LBB6_28
.LBB6_28 NOP                            ; %if.then104
	LOAD	%GR1, 64(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB6_29
.LBB6_29 NOP                            ; %if.end107
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB6_30
.LBB6_30 NOP                            ; %if.end110
	JUMP	.LBB6_32
.LBB6_31 NOP                            ; %if.else111
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_32 NOP                            ; %if.end116
	JUMP	.LBB6_33
.LBB6_33 NOP                            ; %if.end117
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_34 NOP                            ; %if.end118
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_36
	JUMP	.LBB6_35
.LBB6_35 NOP                            ; %if.then123
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_36 NOP                            ; %if.end124
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 56(%GR7)
	STORE	%GR6, 0(%GR1)
	ULOADH	%GR6, 36(%GR7)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_38
	JUMP	.LBB6_37
.LBB6_37 NOP                            ; %cond.true
	COPYI	%GR6, 0
	JUMP	.LBB6_39
.LBB6_38 NOP                            ; %cond.false
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB6_39
.LBB6_39 NOP                            ; %cond.end
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB6_40
.LBB6_40 NOP                            ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 44(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_44
	JUMP	.LBB6_41
.LBB6_41 NOP                            ; %while.body
                                        ;   in Loop: Header=BB6_40 Depth=1
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR1, %GR6, 36
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 64(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 48(%GR7)
	LOAD	%GR4, 44(%GR7)
	CALL	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB6_43
	JUMP	.LBB6_42
.LBB6_42 NOP                            ; %if.then138
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_43 NOP                            ; %if.end143
                                        ;   in Loop: Header=BB6_40 Depth=1
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB6_40
.LBB6_44 NOP                            ; %while.end
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB6_45
.LBB6_45 NOP                            ; %return
	LOAD	%GR6, 72(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 76(%GR7)
	LOAD	%GR4, 80(%GR7)
	LOAD	%GR3, 84(%GR7)
	LOAD	%GR2, 88(%GR7)
	LOAD	%GR1, 92(%GR7)
	ADDI	%GR7, %GR7, 96
	RET
.Lfunc_end6 NOP 
	.size	__sflush_r, .Lfunc_end6-__sflush_r
                                        ; -- End function
	.type	_fflush_r,@function     ; -- Begin function _fflush_r
_fflush_r NOP                           ; @_fflush_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 8(%GR7)
	JUMP	.LBB7_1
.LBB7_1 NOP                             ; %do.body
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_4
	JUMP	.LBB7_2
.LBB7_2 NOP                             ; %land.lhs.true
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_4
	JUMP	.LBB7_3
.LBB7_3 NOP                             ; %if.then
	LOAD	%GR1, 0(%GR7)
	CALL	__sinit
	JUMP	.LBB7_4
.LBB7_4 NOP                             ; %if.end
	JUMP	.LBB7_5
.LBB7_5 NOP                             ; %do.end
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_7
	JUMP	.LBB7_6
.LBB7_6 NOP                             ; %if.then3
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB7_18
.LBB7_7 NOP                             ; %if.end4
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB7_12
	JUMP	.LBB7_8
.LBB7_8 NOP                             ; %if.then6
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_10
	JUMP	.LBB7_9
.LBB7_9 NOP                             ; %cond.true
	JUMP	.LBB7_11
.LBB7_10 NOP                            ; %cond.false
	JUMP	.LBB7_11
.LBB7_11 NOP                            ; %cond.end
	JUMP	.LBB7_12
.LBB7_12 NOP                            ; %if.end10
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 8(%GR7)
	CALL	__sflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB7_17
	JUMP	.LBB7_13
.LBB7_13 NOP                            ; %if.then14
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB7_15
	JUMP	.LBB7_14
.LBB7_14 NOP                            ; %cond.true19
	JUMP	.LBB7_16
.LBB7_15 NOP                            ; %cond.false20
	JUMP	.LBB7_16
.LBB7_16 NOP                            ; %cond.end21
	JUMP	.LBB7_17
.LBB7_17 NOP                            ; %if.end22
	LOAD	%GR6, 4(%GR7)
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB7_18
.LBB7_18 NOP                            ; %return
	LOAD	%GR6, 20(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end7 NOP 
	.size	_fflush_r, .Lfunc_end7-_fflush_r
                                        ; -- End function
	.globl	fflush                  ; -- Begin function fflush
	.type	fflush,@function
fflush NOP                              ; @fflush
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_2
	JUMP	.LBB8_1
.LBB8_1 NOP                             ; %if.then
	COPYI	%GR1, impure_data
	COPYI	%GR2, _fflush_r
	CALL	_fwalk_reent
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB8_3
.LBB8_2 NOP                             ; %if.end
	LOAD	%GR2, 0(%GR7)
	COPYI	%GR1, impure_data
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB8_3
.LBB8_3 NOP                             ; %return
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end8 NOP 
	.size	fflush, .Lfunc_end8-fflush
                                        ; -- End function
	.type	__sfp_lock_acquire,@function ; -- Begin function __sfp_lock_acquire
__sfp_lock_acquire NOP                  ; @__sfp_lock_acquire
; %bb.0:                                ; %entry
	RET
.Lfunc_end9 NOP 
	.size	__sfp_lock_acquire, .Lfunc_end9-__sfp_lock_acquire
                                        ; -- End function
	.type	__sinit,@function       ; -- Begin function __sinit
__sinit NOP                             ; @__sinit
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	CALL	__sinit_lock_acquire
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_2
	JUMP	.LBB10_1
.LBB10_1 NOP                            ; %if.then
	CALL	__sinit_lock_release
	JUMP	.LBB10_3
.LBB10_2 NOP                            ; %if.end
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 60
	COPYI	%GR1, _cleanup_r
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 736
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 740
	COPYI	%GR1, 3
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 748
	ADDI	%GR6, %GR6, 744
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	CALL	stdin_init
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	CALL	stdout_init
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR1, 0(%GR6)
	CALL	stderr_init
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 56
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	CALL	__sinit_lock_release
	JUMP	.LBB10_3
.LBB10_3 NOP                            ; %return
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end10 NOP 
	.size	__sinit, .Lfunc_end10-__sinit
                                        ; -- End function
	.type	__sinit_lock_acquire,@function ; -- Begin function __sinit_lock_acquire
__sinit_lock_acquire NOP                ; @__sinit_lock_acquire
; %bb.0:                                ; %entry
	RET
.Lfunc_end11 NOP 
	.size	__sinit_lock_acquire, .Lfunc_end11-__sinit_lock_acquire
                                        ; -- End function
	.type	__sinit_lock_release,@function ; -- Begin function __sinit_lock_release
__sinit_lock_release NOP                ; @__sinit_lock_release
; %bb.0:                                ; %entry
	RET
.Lfunc_end12 NOP 
	.size	__sinit_lock_release, .Lfunc_end12-__sinit_lock_release
                                        ; -- End function
	.type	_cleanup_r,@function    ; -- Begin function _cleanup_r
_cleanup_r NOP                          ; @_cleanup_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	COPYI	%GR6, _fclose_r
	STORE	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 8(%GR7)
	CALL	_fwalk_reent
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end13 NOP 
	.size	_cleanup_r, .Lfunc_end13-_cleanup_r
                                        ; -- End function
	.type	stdin_init,@function    ; -- Begin function stdin_init
stdin_init NOP                          ; @stdin_init
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, 4
	COPYI	%GR3, 0
	CALL	std
	LOAD	%GR3, 4(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end14 NOP 
	.size	stdin_init, .Lfunc_end14-stdin_init
                                        ; -- End function
	.type	stdout_init,@function   ; -- Begin function stdout_init
stdout_init NOP                         ; @stdout_init
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, 9
	COPYI	%GR3, 1
	CALL	std
	LOAD	%GR3, 4(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end15 NOP 
	.size	stdout_init, .Lfunc_end15-stdout_init
                                        ; -- End function
	.type	stderr_init,@function   ; -- Begin function stderr_init
stderr_init NOP                         ; @stderr_init
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, 18
	COPYI	%GR3, 2
	CALL	std
	LOAD	%GR3, 4(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end16 NOP 
	.size	stderr_init, .Lfunc_end16-stderr_init
                                        ; -- End function
	.type	std,@function           ; -- Begin function std
std NOP                                 ; @std
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 12
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 14
	STOREH	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 20
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 24
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 96
	COPYI	%GR3, 8
	COPYR	%GR4, %GR2
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 28
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 32
	COPYI	%GR1, __sread
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 36
	COPYI	%GR1, __swrite
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 40
	COPYI	%GR1, __sseek
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 44
	COPYI	%GR1, __sclose
	STORE	%GR1, 0(%GR6)
	LOAD	%GR4, 16(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end17 NOP 
	.size	std, .Lfunc_end17-std
                                        ; -- End function
	.type	__sfp_lock_release,@function ; -- Begin function __sfp_lock_release
__sfp_lock_release NOP                  ; @__sfp_lock_release
; %bb.0:                                ; %entry
	RET
.Lfunc_end18 NOP 
	.size	__sfp_lock_release, .Lfunc_end18-__sfp_lock_release
                                        ; -- End function
	.type	_free_r,@function       ; -- Begin function _free_r
_free_r NOP                             ; @_free_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 128
	STORE	%GR1, 124(%GR7)
	STORE	%GR2, 120(%GR7)
	STORE	%GR3, 116(%GR7)
	STORE	%GR4, 112(%GR7)
	STORE	%GR5, 108(%GR7)
	STORE	%GR1, 104(%GR7)
	STORE	%GR2, 96(%GR7)
	LOAD	%GR6, 96(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_2
	JUMP	.LBB19_1
.LBB19_1 NOP                            ; %if.then
	JUMP	.LBB19_51
.LBB19_2 NOP                            ; %if.end
	LOAD	%GR1, 104(%GR7)
	CALL	__malloc_lock
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 88(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 80
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 80(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 80(%GR7)
	ANDI	%GR1, %GR1, -2
	ADDI	%GR2, %GR7, 72
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 72(%GR7)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 72(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 56
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 56(%GR7)
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_8
	JUMP	.LBB19_3
.LBB19_3 NOP                            ; %if.then5
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR2, %GR7, 72
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 72(%GR7)
	ADD	%GR1, %GR4, %GR1
	ULT	%GR4, %GR1, %GR4
	ADD	%GR6, %GR3, %GR6
	ADD	%GR6, %GR6, %GR4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 72(%GR7)
	ULOADB	%GR6, 80(%GR7)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB19_5
	JUMP	.LBB19_4
.LBB19_4 NOP                            ; %if.then7
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 48
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%GR7)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 48(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 88(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR7, 72
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 72(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR3, %GR1, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 72(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 40(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB19_5
.LBB19_5 NOP                            ; %if.end12
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 72(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 88(%GR7)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR1, 88(%GR7)
	COPYI	%GR2, __malloc_av_
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	COPYI	%GR2, 131072
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB19_7
	JUMP	.LBB19_6
.LBB19_6 NOP                            ; %if.then15
	LOAD	%GR1, 104(%GR7)
	CALL	_malloc_trim_r
	JUMP	.LBB19_7
.LBB19_7 NOP                            ; %if.end16
	LOAD	%GR1, 104(%GR7)
	CALL	__malloc_unlock
	JUMP	.LBB19_51
.LBB19_8 NOP                            ; %if.end17
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	COPYI	%GR6, 0
	STORE	%GR6, 28(%GR7)
	ULOADB	%GR6, 80(%GR7)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB19_13
	JUMP	.LBB19_9
.LBB19_9 NOP                            ; %if.then21
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 48
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 48(%GR7)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 48(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 88(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR7, 72
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 72(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR3, %GR1, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 72(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, __malloc_av_
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_11
	JUMP	.LBB19_10
.LBB19_10 NOP                           ; %if.then28
	COPYI	%GR6, 1
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB19_12
.LBB19_11 NOP                           ; %if.else
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 40(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB19_12
.LBB19_12 NOP                           ; %if.end33
	JUMP	.LBB19_13
.LBB19_13 NOP                           ; %if.end34
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR1, 56(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 8
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB19_19
	JUMP	.LBB19_14
.LBB19_14 NOP                           ; %if.then39
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR2, %GR7, 72
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 72(%GR7)
	ADD	%GR1, %GR4, %GR1
	ULT	%GR4, %GR1, %GR4
	ADD	%GR6, %GR3, %GR6
	ADD	%GR6, %GR6, %GR4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 72(%GR7)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_17
	JUMP	.LBB19_15
.LBB19_15 NOP                           ; %land.lhs.true
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, __malloc_av_
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_17
	JUMP	.LBB19_16
.LBB19_16 NOP                           ; %if.then44
	COPYI	%GR6, 1
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, __malloc_av_
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 20
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB19_18
.LBB19_17 NOP                           ; %if.else47
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 40(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB19_18
.LBB19_18 NOP                           ; %if.end52
	JUMP	.LBB19_19
.LBB19_19 NOP                           ; %if.end53
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 72(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 88(%GR7)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	LOAD	%GR2, 88(%GR7)
	ADD	%GR2, %GR2, %GR1
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR2, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_50
	JUMP	.LBB19_20
.LBB19_20 NOP                           ; %if.then59
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	COPYI	%GR2, 511
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_22
	JUMP	.LBB19_21
.LBB19_21 NOP                           ; %if.then61
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 68(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR1, %GR6, 2
	COPYI	%GR2, 1
	SHL	%GR6, %GR2, %GR1
	ADDI	%GR3, %GR1, -32
	STORE	%GR3, 20(%GR7)
	COPYI	%GR4, 0
	GTE	%GR5, %GR3, %GR4
	CMOV	%GR6, %GR5, %GR4
	EQ	%GR3, %GR1, %GR4
	STORE	%GR3, 12(%GR7)
	COPYI	%GR3, 32
	SUB	%GR1, %GR3, %GR1
	SRL	%GR1, %GR2, %GR1
	LOAD	%GR3, 12(%GR7)
	CMOV	%GR1, %GR3, %GR4
	LOAD	%GR3, 20(%GR7)
	SHL	%GR2, %GR2, %GR3
	CMOV	%GR1, %GR5, %GR2
	COPYI	%GR2, __malloc_av_
	LOAD	%GR3, 0(%GR2)
	OR	%GR1, %GR3, %GR1
	OR	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 68(%GR7)
	SHLI	%GR6, %GR6, 3
	ADD	%GR6, %GR6, %GR2
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 88(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 88(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 40(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB19_49
.LBB19_22 NOP                           ; %if.else70
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_24
	JUMP	.LBB19_23
.LBB19_23 NOP                           ; %cond.true
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	JUMP	.LBB19_40
.LBB19_24 NOP                           ; %cond.false
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 4
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_26
	JUMP	.LBB19_25
.LBB19_25 NOP                           ; %cond.true78
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 6
	SHLI	%GR6, %GR6, 26
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB19_39
.LBB19_26 NOP                           ; %cond.false81
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 20
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_28
	JUMP	.LBB19_27
.LBB19_27 NOP                           ; %cond.true85
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR6, %GR6, 23
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB19_38
.LBB19_28 NOP                           ; %cond.false88
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 84
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_30
	JUMP	.LBB19_29
.LBB19_29 NOP                           ; %cond.true92
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 12
	SHLI	%GR6, %GR6, 20
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB19_37
.LBB19_30 NOP                           ; %cond.false95
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 340
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_32
	JUMP	.LBB19_31
.LBB19_31 NOP                           ; %cond.true99
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 15
	SHLI	%GR6, %GR6, 17
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB19_36
.LBB19_32 NOP                           ; %cond.false102
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 1364
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB19_34
	JUMP	.LBB19_33
.LBB19_33 NOP                           ; %cond.true106
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	SRLI	%GR1, %GR1, 18
	SHLI	%GR6, %GR6, 14
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB19_35
.LBB19_34 NOP                           ; %cond.false109
	COPYI	%GR6, 126
	JUMP	.LBB19_35
.LBB19_35 NOP                           ; %cond.end
	JUMP	.LBB19_36
.LBB19_36 NOP                           ; %cond.end110
	JUMP	.LBB19_37
.LBB19_37 NOP                           ; %cond.end112
	JUMP	.LBB19_38
.LBB19_38 NOP                           ; %cond.end114
	JUMP	.LBB19_39
.LBB19_39 NOP                           ; %cond.end116
	JUMP	.LBB19_40
.LBB19_40 NOP                           ; %cond.end118
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 68(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 40(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_42
	JUMP	.LBB19_41
.LBB19_41 NOP                           ; %if.then129
	LOAD	%GR6, 68(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR1, %GR6, 2
	COPYI	%GR2, 1
	SHL	%GR6, %GR2, %GR1
	ADDI	%GR3, %GR1, -32
	STORE	%GR3, 24(%GR7)
	COPYI	%GR4, 0
	GTE	%GR5, %GR3, %GR4
	CMOV	%GR6, %GR5, %GR4
	EQ	%GR3, %GR1, %GR4
	STORE	%GR3, 16(%GR7)
	COPYI	%GR3, 32
	SUB	%GR1, %GR3, %GR1
	SRL	%GR1, %GR2, %GR1
	LOAD	%GR3, 16(%GR7)
	CMOV	%GR1, %GR3, %GR4
	LOAD	%GR3, 24(%GR7)
	SHL	%GR2, %GR2, %GR3
	CMOV	%GR1, %GR5, %GR2
	COPYI	%GR2, __malloc_av_
	LOAD	%GR3, 0(%GR2)
	OR	%GR1, %GR3, %GR1
	OR	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB19_48
.LBB19_42 NOP                           ; %if.else134
	JUMP	.LBB19_43
.LBB19_43 NOP                           ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 40(%GR7)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB19_45
	JUMP	.LBB19_44
.LBB19_44 NOP                           ; %land.rhs
                                        ;   in Loop: Header=BB19_43 Depth=1
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 72(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR3, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR6, 0(%GR3)
	ANDI	%GR3, %GR6, -4
	ULT	%GR6, %GR1, %GR4
	EQ	%GR1, %GR1, %GR4
	ULT	%GR2, %GR2, %GR3
	CMOV	%GR6, %GR1, %GR2
	JUMP	.LBB19_45
.LBB19_45 NOP                           ; %land.end
                                        ;   in Loop: Header=BB19_43 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB19_47
	JUMP	.LBB19_46
.LBB19_46 NOP                           ; %while.body
                                        ;   in Loop: Header=BB19_43 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB19_43
.LBB19_47 NOP                           ; %while.end
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB19_48
.LBB19_48 NOP                           ; %if.end143
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 88(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 88(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 40(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB19_49
.LBB19_49 NOP                           ; %if.end148
	JUMP	.LBB19_50
.LBB19_50 NOP                           ; %if.end149
	LOAD	%GR1, 104(%GR7)
	CALL	__malloc_unlock
	JUMP	.LBB19_51
.LBB19_51 NOP                           ; %return
	LOAD	%GR5, 108(%GR7)
	LOAD	%GR4, 112(%GR7)
	LOAD	%GR3, 116(%GR7)
	LOAD	%GR2, 120(%GR7)
	LOAD	%GR1, 124(%GR7)
	ADDI	%GR7, %GR7, 128
	RET
.Lfunc_end19 NOP 
	.size	_free_r, .Lfunc_end19-_free_r
                                        ; -- End function
	.type	_malloc_trim_r,@function ; -- Begin function _malloc_trim_r
_malloc_trim_r NOP                      ; @_malloc_trim_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 96
	STORE	%GR1, 92(%GR7)
	STORE	%GR2, 88(%GR7)
	STORE	%GR3, 84(%GR7)
	STORE	%GR4, 80(%GR7)
	STORE	%GR5, 76(%GR7)
	STORE	%GR1, 64(%GR7)
	ADDI	%GR6, %GR7, 56
	ORI	%GR2, %GR6, 4
	COPYI	%GR6, 0
	STORE	%GR6, 0(%GR2)
	STORE	%GR6, 56(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR1, 12(%GR7)
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 4096
	STORE	%GR6, 16(%GR7)
	LOAD	%GR1, 64(%GR7)
	CALL	__malloc_lock
	COPYI	%GR6, __malloc_av_
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR3, %GR7, 48
	ORI	%GR3, %GR3, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 48(%GR7)
	LOAD	%GR6, 0(%GR3)
	LOAD	%GR1, 48(%GR7)
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 56(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR5, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 16(%GR7)
	ADD	%GR2, %GR3, %GR1
	ADDI	%GR1, %GR2, -33
	ULT	%GR6, %GR1, %GR2
	ADD	%GR5, %GR4, %GR5
	ULT	%GR2, %GR2, %GR3
	ADD	%GR2, %GR5, %GR2
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR2, %GR6, -1
	CALL	__udivdi3
	COPYR	%GR6, %RT0
	COPYR	%GR2, %RT1
	ADDI	%GR1, %GR6, -1
	ULT	%GR6, %GR1, %GR6
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR2, %GR6, -1
	CALL	__muldi3
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 16(%GR7)
	GTE	%GR4, %GR6, %GR2
	UGTE	%GR1, %GR1, %GR3
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB20_2
	JUMP	.LBB20_1
.LBB20_1 NOP                            ; %if.then
	LOAD	%GR1, 64(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB20_9
.LBB20_2 NOP                            ; %if.else
	LOAD	%GR1, 64(%GR7)
	COPYI	%GR2, 0
	COPYR	%GR3, %GR2
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 48(%GR7)
	ADD	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB20_4
	JUMP	.LBB20_3
.LBB20_3 NOP                            ; %if.then5
	LOAD	%GR1, 64(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB20_9
.LBB20_4 NOP                            ; %if.else6
	LOAD	%GR1, 64(%GR7)
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR3, 40(%GR7)
	COPYI	%GR4, 0
	SUB	%GR2, %GR4, %GR3
	NEQ	%GR3, %GR3, %GR4
	ADD	%GR6, %GR6, %GR3
	SUB	%GR3, %GR4, %GR6
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB20_8
	JUMP	.LBB20_5
.LBB20_5 NOP                            ; %if.then10
	LOAD	%GR1, 64(%GR7)
	COPYI	%GR2, 0
	COPYR	%GR3, %GR2
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	SUB	%GR3, %GR6, %GR1
	ULT	%GR6, %GR6, %GR1
	SUB	%GR6, %GR2, %GR6
	ADDI	%GR1, %GR7, 48
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 48(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 48(%GR7)
	LT	%GR3, %GR6, %GR2
	COPYI	%GR4, 32
	ULT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB20_7
	JUMP	.LBB20_6
.LBB20_6 NOP                            ; %if.then13
	COPYI	%GR6, __malloc_sbrk_base
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	COPYI	%GR1, __malloc_current_mallinfo.0
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 48
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%GR7)
	ORI	%GR1, %GR1, 1
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	JUMP	.LBB20_7
.LBB20_7 NOP                            ; %if.end
	LOAD	%GR1, 64(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB20_9
.LBB20_8 NOP                            ; %if.else18
	ADDI	%GR6, %GR7, 48
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 40(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ORI	%GR1, %GR1, 1
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR3, %GR2, 8
	STORE	%GR1, 0(%GR3)
	ADDI	%GR1, %GR2, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	COPYI	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 64(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 1
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB20_9
.LBB20_9 NOP                            ; %return
	LOAD	%GR5, 76(%GR7)
	LOAD	%GR4, 80(%GR7)
	LOAD	%GR3, 84(%GR7)
	LOAD	%GR2, 88(%GR7)
	LOAD	%GR1, 92(%GR7)
	ADDI	%GR7, %GR7, 96
	RET
.Lfunc_end20 NOP 
	.size	_malloc_trim_r, .Lfunc_end20-_malloc_trim_r
                                        ; -- End function
	.type	_fwalk_reent,@function  ; -- Begin function _fwalk_reent
_fwalk_reent NOP                        ; @_fwalk_reent
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 24(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 736
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB21_1
.LBB21_1 NOP                            ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_3 Depth 2
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_12
	JUMP	.LBB21_2
.LBB21_2 NOP                            ; %for.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB21_3
.LBB21_3 NOP                            ; %for.cond1
                                        ;   Parent Loop BB21_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_10
	JUMP	.LBB21_4
.LBB21_4 NOP                            ; %for.body3
                                        ;   in Loop: Header=BB21_3 Depth=2
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_8
	JUMP	.LBB21_5
.LBB21_5 NOP                            ; %land.lhs.true
                                        ;   in Loop: Header=BB21_3 Depth=2
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_8
	JUMP	.LBB21_6
.LBB21_6 NOP                            ; %land.lhs.true10
                                        ;   in Loop: Header=BB21_3 Depth=2
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_8
	JUMP	.LBB21_7
.LBB21_7 NOP                            ; %if.then
                                        ;   in Loop: Header=BB21_3 Depth=2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	%GR6
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB21_8
.LBB21_8 NOP                            ; %if.end
                                        ;   in Loop: Header=BB21_3 Depth=2
	JUMP	.LBB21_9
.LBB21_9 NOP                            ; %for.inc
                                        ;   in Loop: Header=BB21_3 Depth=2
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 108
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB21_3
.LBB21_10 NOP                           ; %for.end
                                        ;   in Loop: Header=BB21_1 Depth=1
	JUMP	.LBB21_11
.LBB21_11 NOP                           ; %for.inc14
                                        ;   in Loop: Header=BB21_1 Depth=1
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB21_1
.LBB21_12 NOP                           ; %for.end15
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end21 NOP 
	.size	_fwalk_reent, .Lfunc_end21-_fwalk_reent
                                        ; -- End function
	.type	__smakebuf_r,@function  ; -- Begin function __smakebuf_r
__smakebuf_r NOP                        ; @__smakebuf_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 32(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_2
	JUMP	.LBB22_1
.LBB22_1 NOP                            ; %if.then
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 67
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB22_10
.LBB22_2 NOP                            ; %if.end
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR7, 8
	ADDI	%GR4, %GR7, 4
	CALL	__swhatbuf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	LOAD	%GR1, 40(%GR7)
	ORI	%GR6, %GR3, 4
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_6
	JUMP	.LBB22_3
.LBB22_3 NOP                            ; %if.then4
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_5
	JUMP	.LBB22_4
.LBB22_4 NOP                            ; %if.then9
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65532
	ORI	%GR1, %GR1, 2
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 67
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB22_5
.LBB22_5 NOP                            ; %if.end22
	JUMP	.LBB22_10
.LBB22_6 NOP                            ; %if.else
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 60
	COPYI	%GR1, _cleanup_r
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 128
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 32(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_9
	JUMP	.LBB22_7
.LBB22_7 NOP                            ; %land.lhs.true
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	CALL	_isatty_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_9
	JUMP	.LBB22_8
.LBB22_8 NOP                            ; %if.then37
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65532
	ORI	%GR1, %GR1, 1
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB22_9
.LBB22_9 NOP                            ; %if.end44
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 12
	ULOADH	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STOREH	%GR6, 0(%GR1)
	JUMP	.LBB22_10
.LBB22_10 NOP                           ; %if.end49
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end22 NOP 
	.size	__smakebuf_r, .Lfunc_end22-__smakebuf_r
                                        ; -- End function
	.type	__swhatbuf_r,@function  ; -- Begin function __swhatbuf_r
__swhatbuf_r NOP                        ; @__swhatbuf_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 160
	STORE	%GR1, 156(%GR7)
	STORE	%GR2, 152(%GR7)
	STORE	%GR3, 148(%GR7)
	STORE	%GR1, 136(%GR7)
	STORE	%GR2, 128(%GR7)
	STORE	%GR3, 120(%GR7)
	STORE	%GR4, 112(%GR7)
	COPYI	%GR6, 2048
	STORE	%GR6, 108(%GR7)
	LOAD	%GR6, 128(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_2
	JUMP	.LBB23_1
.LBB23_1 NOP                            ; %lor.lhs.false
	LOAD	%GR1, 136(%GR7)
	LOAD	%GR6, 128(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	ADDI	%GR3, %GR7, 0
	CALL	_fstat_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_6
	JUMP	.LBB23_2
.LBB23_2 NOP                            ; %if.then
	LOAD	%GR6, 112(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 128(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_4
	JUMP	.LBB23_3
.LBB23_3 NOP                            ; %if.then7
	LOAD	%GR6, 120(%GR7)
	COPYI	%GR1, 64
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB23_5
.LBB23_4 NOP                            ; %if.else
	LOAD	%GR6, 120(%GR7)
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB23_5
.LBB23_5 NOP                            ; %if.end
	COPYI	%GR6, 0
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB23_7
.LBB23_6 NOP                            ; %if.end8
	ADDI	%GR6, %GR7, 0
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 61440
	COPYI	%GR1, 8192
	EQ	%GR6, %GR6, %GR1
	LOAD	%GR1, 112(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 120(%GR7)
	COPYI	%GR1, 1024
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 2048
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB23_7
.LBB23_7 NOP                            ; %return
	LOAD	%GR6, 144(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 148(%GR7)
	LOAD	%GR2, 152(%GR7)
	LOAD	%GR1, 156(%GR7)
	ADDI	%GR7, %GR7, 160
	RET
.Lfunc_end23 NOP 
	.size	__swhatbuf_r, .Lfunc_end23-__swhatbuf_r
                                        ; -- End function
	.type	_malloc_r,@function     ; -- Begin function _malloc_r
_malloc_r NOP                           ; @_malloc_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 160
	STORE	%GR1, 156(%GR7)
	STORE	%GR2, 152(%GR7)
	STORE	%GR3, 148(%GR7)
	STORE	%GR4, 144(%GR7)
	STORE	%GR5, 140(%GR7)
	STORE	%GR1, 128(%GR7)
	ADDI	%GR6, %GR7, 120
	ORI	%GR6, %GR6, 4
	STORE	%GR3, 0(%GR6)
	STORE	%GR2, 120(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR2, %GR1, 23
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 46
	UGT	%GR1, %GR2, %GR1
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_2
	JUMP	.LBB24_1
.LBB24_1 NOP                            ; %cond.true
	COPYI	%GR6, 0
	COPYI	%GR1, 32
	JUMP	.LBB24_3
.LBB24_2 NOP                            ; %cond.false
	ADDI	%GR6, %GR7, 120
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR2, %GR1, 23
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ANDI	%GR1, %GR2, -16
	JUMP	.LBB24_3
.LBB24_3 NOP                            ; %cond.end
	ADDI	%GR2, %GR7, 32
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 32(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	LT	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_5
	JUMP	.LBB24_4
.LBB24_4 NOP                            ; %lor.lhs.false
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR2, %GR7, 120
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 120(%GR7)
	UGTE	%GR1, %GR1, %GR3
	UGTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_6
	JUMP	.LBB24_5
.LBB24_5 NOP                            ; %if.then
	LOAD	%GR6, 128(%GR7)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_6 NOP                            ; %if.end
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_lock
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 503
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_12
	JUMP	.LBB24_7
.LBB24_7 NOP                            ; %if.then5
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 100(%GR7)
	LOAD	%GR6, 100(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 40(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_9
	JUMP	.LBB24_8
.LBB24_8 NOP                            ; %if.then9
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB24_9
.LBB24_9 NOP                            ; %if.end12
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 40(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_11
	JUMP	.LBB24_10
.LBB24_10 NOP                           ; %if.then15
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_11 NOP                           ; %if.end23
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB24_41
.LBB24_12 NOP                           ; %if.else
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_14
	JUMP	.LBB24_13
.LBB24_13 NOP                           ; %cond.true28
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	JUMP	.LBB24_30
.LBB24_14 NOP                           ; %cond.false30
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 4
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_16
	JUMP	.LBB24_15
.LBB24_15 NOP                           ; %cond.true34
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 6
	SHLI	%GR6, %GR6, 26
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB24_29
.LBB24_16 NOP                           ; %cond.false37
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 20
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_18
	JUMP	.LBB24_17
.LBB24_17 NOP                           ; %cond.true41
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR6, %GR6, 23
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB24_28
.LBB24_18 NOP                           ; %cond.false44
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 84
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_20
	JUMP	.LBB24_19
.LBB24_19 NOP                           ; %cond.true48
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 12
	SHLI	%GR6, %GR6, 20
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB24_27
.LBB24_20 NOP                           ; %cond.false51
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 340
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_22
	JUMP	.LBB24_21
.LBB24_21 NOP                           ; %cond.true55
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 15
	SHLI	%GR6, %GR6, 17
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB24_26
.LBB24_22 NOP                           ; %cond.false58
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 1364
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_24
	JUMP	.LBB24_23
.LBB24_23 NOP                           ; %cond.true62
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	SRLI	%GR1, %GR1, 18
	SHLI	%GR6, %GR6, 14
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB24_25
.LBB24_24 NOP                           ; %cond.false65
	COPYI	%GR6, 126
	JUMP	.LBB24_25
.LBB24_25 NOP                           ; %cond.end66
	JUMP	.LBB24_26
.LBB24_26 NOP                           ; %cond.end68
	JUMP	.LBB24_27
.LBB24_27 NOP                           ; %cond.end70
	JUMP	.LBB24_28
.LBB24_28 NOP                           ; %cond.end72
	JUMP	.LBB24_29
.LBB24_29 NOP                           ; %cond.end74
	JUMP	.LBB24_30
.LBB24_30 NOP                           ; %cond.end76
	STORE	%GR6, 100(%GR7)
	LOAD	%GR6, 100(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB24_31
.LBB24_31 NOP                           ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 96(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_39
	JUMP	.LBB24_32
.LBB24_32 NOP                           ; %for.body
                                        ;   in Loop: Header=BB24_31 Depth=1
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 104(%GR7)
	ADDI	%GR2, %GR7, 32
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 32(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR7, 80
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 80(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	COPYI	%GR4, 32
	ULT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_34
	JUMP	.LBB24_33
.LBB24_33 NOP                           ; %if.then91
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB24_40
.LBB24_34 NOP                           ; %if.else92
                                        ;   in Loop: Header=BB24_31 Depth=1
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_36
	JUMP	.LBB24_35
.LBB24_35 NOP                           ; %if.then95
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_36 NOP                           ; %if.end104
                                        ;   in Loop: Header=BB24_31 Depth=1
	JUMP	.LBB24_37
.LBB24_37 NOP                           ; %if.end105
                                        ;   in Loop: Header=BB24_31 Depth=1
	JUMP	.LBB24_38
.LBB24_38 NOP                           ; %for.inc
                                        ;   in Loop: Header=BB24_31 Depth=1
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB24_31
.LBB24_39 NOP                           ; %for.end.loopexit
	JUMP	.LBB24_40
.LBB24_40 NOP                           ; %for.end
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB24_41
.LBB24_41 NOP                           ; %if.end107
	COPYI	%GR6, __malloc_av_
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 112(%GR7)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_76
	JUMP	.LBB24_42
.LBB24_42 NOP                           ; %if.then110
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 104(%GR7)
	ADDI	%GR2, %GR7, 32
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 32(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR7, 80
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 80(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	COPYI	%GR4, 32
	ULT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_44
	JUMP	.LBB24_43
.LBB24_43 NOP                           ; %if.then116
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 88(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	ORI	%GR1, %GR1, 1
	LOAD	%GR2, 112(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, __malloc_av_
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 20
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 80(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 88(%GR7)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	LOAD	%GR2, 88(%GR7)
	ADD	%GR2, %GR2, %GR1
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR2, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_44 NOP                           ; %if.end126
	COPYI	%GR6, __malloc_av_
	STORE	%GR6, 0(%GR6)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_46
	JUMP	.LBB24_45
.LBB24_45 NOP                           ; %if.then129
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_46 NOP                           ; %if.end134
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 511
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_48
	JUMP	.LBB24_47
.LBB24_47 NOP                           ; %if.then137
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 76(%GR7)
	LOAD	%GR6, 76(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR1, %GR6, 2
	COPYI	%GR2, 1
	SHL	%GR6, %GR2, %GR1
	ADDI	%GR3, %GR1, -32
	STORE	%GR3, 24(%GR7)
	COPYI	%GR4, 0
	GTE	%GR5, %GR3, %GR4
	CMOV	%GR6, %GR5, %GR4
	EQ	%GR3, %GR1, %GR4
	STORE	%GR3, 12(%GR7)
	COPYI	%GR3, 32
	SUB	%GR1, %GR3, %GR1
	SRL	%GR1, %GR2, %GR1
	LOAD	%GR3, 12(%GR7)
	CMOV	%GR1, %GR3, %GR4
	LOAD	%GR3, 24(%GR7)
	SHL	%GR2, %GR2, %GR3
	CMOV	%GR1, %GR5, %GR2
	COPYI	%GR2, __malloc_av_
	LOAD	%GR3, 0(%GR2)
	OR	%GR1, %GR3, %GR1
	OR	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 76(%GR7)
	SHLI	%GR6, %GR6, 3
	ADD	%GR6, %GR6, %GR2
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_75
.LBB24_48 NOP                           ; %if.else151
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_50
	JUMP	.LBB24_49
.LBB24_49 NOP                           ; %cond.true155
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 3
	SHLI	%GR6, %GR6, 29
	OR	%GR6, %GR1, %GR6
	JUMP	.LBB24_66
.LBB24_50 NOP                           ; %cond.false157
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 4
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_52
	JUMP	.LBB24_51
.LBB24_51 NOP                           ; %cond.true161
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 6
	SHLI	%GR6, %GR6, 26
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 56
	JUMP	.LBB24_65
.LBB24_52 NOP                           ; %cond.false164
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 20
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_54
	JUMP	.LBB24_53
.LBB24_53 NOP                           ; %cond.true168
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR6, %GR6, 23
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 91
	JUMP	.LBB24_64
.LBB24_54 NOP                           ; %cond.false171
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 84
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_56
	JUMP	.LBB24_55
.LBB24_55 NOP                           ; %cond.true175
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 12
	SHLI	%GR6, %GR6, 20
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 110
	JUMP	.LBB24_63
.LBB24_56 NOP                           ; %cond.false178
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 340
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_58
	JUMP	.LBB24_57
.LBB24_57 NOP                           ; %cond.true182
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 15
	SHLI	%GR6, %GR6, 17
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 119
	JUMP	.LBB24_62
.LBB24_58 NOP                           ; %cond.false185
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 9
	SHLI	%GR2, %GR6, 23
	OR	%GR1, %GR1, %GR2
	SRLI	%GR6, %GR6, 9
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	COPYI	%GR2, 1364
	UGT	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_60
	JUMP	.LBB24_59
.LBB24_59 NOP                           ; %cond.true189
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	SRLI	%GR1, %GR1, 18
	SHLI	%GR6, %GR6, 14
	OR	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 124
	JUMP	.LBB24_61
.LBB24_60 NOP                           ; %cond.false192
	COPYI	%GR6, 126
	JUMP	.LBB24_61
.LBB24_61 NOP                           ; %cond.end193
	JUMP	.LBB24_62
.LBB24_62 NOP                           ; %cond.end195
	JUMP	.LBB24_63
.LBB24_63 NOP                           ; %cond.end197
	JUMP	.LBB24_64
.LBB24_64 NOP                           ; %cond.end199
	JUMP	.LBB24_65
.LBB24_65 NOP                           ; %cond.end201
	JUMP	.LBB24_66
.LBB24_66 NOP                           ; %cond.end203
	STORE	%GR6, 76(%GR7)
	LOAD	%GR6, 76(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_68
	JUMP	.LBB24_67
.LBB24_67 NOP                           ; %if.then214
	LOAD	%GR6, 76(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR1, %GR6, 2
	COPYI	%GR2, 1
	SHL	%GR6, %GR2, %GR1
	ADDI	%GR3, %GR1, -32
	STORE	%GR3, 28(%GR7)
	COPYI	%GR4, 0
	GTE	%GR5, %GR3, %GR4
	CMOV	%GR6, %GR5, %GR4
	EQ	%GR3, %GR1, %GR4
	STORE	%GR3, 16(%GR7)
	COPYI	%GR3, 32
	SUB	%GR1, %GR3, %GR1
	SRL	%GR1, %GR2, %GR1
	LOAD	%GR3, 16(%GR7)
	CMOV	%GR1, %GR3, %GR4
	LOAD	%GR3, 28(%GR7)
	SHL	%GR2, %GR2, %GR3
	CMOV	%GR1, %GR5, %GR2
	COPYI	%GR2, __malloc_av_
	LOAD	%GR3, 0(%GR2)
	OR	%GR1, %GR3, %GR1
	OR	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB24_74
.LBB24_68 NOP                           ; %if.else219
	JUMP	.LBB24_69
.LBB24_69 NOP                           ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB24_71
	JUMP	.LBB24_70
.LBB24_70 NOP                           ; %land.rhs
                                        ;   in Loop: Header=BB24_69 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR3, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR6, 0(%GR3)
	ANDI	%GR3, %GR6, -4
	ULT	%GR6, %GR1, %GR4
	EQ	%GR1, %GR1, %GR4
	ULT	%GR2, %GR2, %GR3
	CMOV	%GR6, %GR1, %GR2
	JUMP	.LBB24_71
.LBB24_71 NOP                           ; %land.end
                                        ;   in Loop: Header=BB24_69 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_73
	JUMP	.LBB24_72
.LBB24_72 NOP                           ; %while.body
                                        ;   in Loop: Header=BB24_69 Depth=1
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	JUMP	.LBB24_69
.LBB24_73 NOP                           ; %while.end
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB24_74
.LBB24_74 NOP                           ; %if.end228
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB24_75
.LBB24_75 NOP                           ; %if.end233
	JUMP	.LBB24_76
.LBB24_76 NOP                           ; %if.end234
	LOAD	%GR6, 100(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR1, %GR1, 30
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR1, %GR6, 2
	COPYI	%GR2, 1
	SHL	%GR6, %GR2, %GR1
	ADDI	%GR3, %GR1, -32
	STORE	%GR3, 20(%GR7)
	COPYI	%GR4, 0
	GTE	%GR5, %GR3, %GR4
	CMOV	%GR6, %GR5, %GR4
	EQ	%GR3, %GR1, %GR4
	STORE	%GR3, 8(%GR7)
	COPYI	%GR3, 32
	SUB	%GR1, %GR3, %GR1
	SRL	%GR1, %GR2, %GR1
	LOAD	%GR3, 8(%GR7)
	CMOV	%GR1, %GR3, %GR4
	LOAD	%GR3, 20(%GR7)
	SHL	%GR2, %GR2, %GR3
	CMOV	%GR1, %GR5, %GR2
	ADDI	%GR2, %GR7, 64
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 64(%GR7)
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	UGT	%GR3, %GR1, %GR2
	UGT	%GR6, %GR6, %GR2
	EQ	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR1, %GR6
	BNEQZ	%GR3, .LBB24_110
	JUMP	.LBB24_77
.LBB24_77 NOP                           ; %if.then240
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	OR	%GR6, %GR1, %GR6
	AND	%GR6, %GR6, %GR2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_82
	JUMP	.LBB24_78
.LBB24_78 NOP                           ; %if.then244
	LOAD	%GR6, 100(%GR7)
	ANDI	%GR6, %GR6, -4
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 100(%GR7)
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 64(%GR7)
	JUMP	.LBB24_79
.LBB24_79 NOP                           ; %while.cond248
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	OR	%GR6, %GR1, %GR6
	AND	%GR6, %GR6, %GR2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_81
	JUMP	.LBB24_80
.LBB24_80 NOP                           ; %while.body252
                                        ;   in Loop: Header=BB24_79 Depth=1
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 100(%GR7)
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 64(%GR7)
	JUMP	.LBB24_79
.LBB24_81 NOP                           ; %while.end255
	JUMP	.LBB24_82
.LBB24_82 NOP                           ; %if.end256
	JUMP	.LBB24_83
.LBB24_83 NOP                           ; %for.cond257
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB24_84 Depth 2
                                        ;       Child Loop BB24_85 Depth 3
                                        ;     Child Loop BB24_96 Depth 2
                                        ;     Child Loop BB24_104 Depth 2
	LOAD	%GR6, 100(%GR7)
	STORE	%GR6, 60(%GR7)
	LOAD	%GR6, 100(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __malloc_av_
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 96(%GR7)
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB24_84
.LBB24_84 NOP                           ; %do.body
                                        ;   Parent Loop BB24_83 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB24_85 Depth 3
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB24_85
.LBB24_85 NOP                           ; %for.cond264
                                        ;   Parent Loop BB24_83 Depth=1
                                        ;     Parent Loop BB24_84 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 96(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_93
	JUMP	.LBB24_86
.LBB24_86 NOP                           ; %for.body267
                                        ;   in Loop: Header=BB24_85 Depth=3
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 104(%GR7)
	ADDI	%GR2, %GR7, 32
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 32(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR7, 80
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 80(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 0
	LT	%GR3, %GR6, %GR2
	COPYI	%GR4, 32
	ULT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_88
	JUMP	.LBB24_87
.LBB24_87 NOP                           ; %if.then273
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 88(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	ORI	%GR1, %GR1, 1
	LOAD	%GR2, 112(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, __malloc_av_
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 20
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 80(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 88(%GR7)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	LOAD	%GR2, 88(%GR7)
	ADD	%GR2, %GR2, %GR1
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR2, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_88 NOP                           ; %if.else288
                                        ;   in Loop: Header=BB24_85 Depth=3
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_90
	JUMP	.LBB24_89
.LBB24_89 NOP                           ; %if.then291
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 56(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_90 NOP                           ; %if.end300
                                        ;   in Loop: Header=BB24_85 Depth=3
	JUMP	.LBB24_91
.LBB24_91 NOP                           ; %if.end301
                                        ;   in Loop: Header=BB24_85 Depth=3
	JUMP	.LBB24_92
.LBB24_92 NOP                           ; %for.inc302
                                        ;   in Loop: Header=BB24_85 Depth=3
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB24_85
.LBB24_93 NOP                           ; %for.end304
                                        ;   in Loop: Header=BB24_84 Depth=2
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 96(%GR7)
	JUMP	.LBB24_94
.LBB24_94 NOP                           ; %do.cond
                                        ;   in Loop: Header=BB24_84 Depth=2
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 100(%GR7)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_84
	JUMP	.LBB24_95
.LBB24_95 NOP                           ; %do.end
                                        ;   in Loop: Header=BB24_83 Depth=1
	JUMP	.LBB24_96
.LBB24_96 NOP                           ; %do.body310
                                        ;   Parent Loop BB24_83 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 60(%GR7)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_98
	JUMP	.LBB24_97
.LBB24_97 NOP                           ; %if.then314
                                        ;   in Loop: Header=BB24_83 Depth=1
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	XORI	%GR1, %GR1, -1
	XORI	%GR6, %GR6, -1
	COPYI	%GR2, __malloc_av_
	LOAD	%GR3, 0(%GR2)
	AND	%GR6, %GR3, %GR6
	AND	%GR1, %GR3, %GR1
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR2)
	JUMP	.LBB24_101
.LBB24_98 NOP                           ; %if.end316
                                        ;   in Loop: Header=BB24_96 Depth=2
	LOAD	%GR6, 60(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 60(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB24_99
.LBB24_99 NOP                           ; %do.cond319
                                        ;   in Loop: Header=BB24_96 Depth=2
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR1, %GR6, 16
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB24_96
	JUMP	.LBB24_100
.LBB24_100 NOP                          ; %do.end323.loopexit
                                        ;   in Loop: Header=BB24_83 Depth=1
	JUMP	.LBB24_101
.LBB24_101 NOP                          ; %do.end323
                                        ;   in Loop: Header=BB24_83 Depth=1
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 64(%GR7)
	COPYI	%GR6, __malloc_av_
	LOAD	%GR6, 0(%GR6)
	UGT	%GR3, %GR1, %GR6
	UGT	%GR2, %GR2, %GR6
	EQ	%GR6, %GR1, %GR6
	CMOV	%GR3, %GR6, %GR2
	BNEQZ	%GR3, .LBB24_107
	JUMP	.LBB24_102
.LBB24_102 NOP                          ; %land.lhs.true
                                        ;   in Loop: Header=BB24_83 Depth=1
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_107
	JUMP	.LBB24_103
.LBB24_103 NOP                          ; %if.then329
                                        ;   in Loop: Header=BB24_83 Depth=1
	JUMP	.LBB24_104
.LBB24_104 NOP                          ; %while.cond330
                                        ;   Parent Loop BB24_83 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 64(%GR7)
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	OR	%GR6, %GR1, %GR6
	AND	%GR6, %GR6, %GR2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB24_106
	JUMP	.LBB24_105
.LBB24_105 NOP                          ; %while.body334
                                        ;   in Loop: Header=BB24_104 Depth=2
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 100(%GR7)
	ADDI	%GR6, %GR7, 64
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	SRLI	%GR3, %GR2, 31
	SHLI	%GR1, %GR1, 1
	OR	%GR1, %GR1, %GR3
	SHLI	%GR2, %GR2, 1
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 64(%GR7)
	JUMP	.LBB24_104
.LBB24_106 NOP                          ; %while.end337
                                        ;   in Loop: Header=BB24_83 Depth=1
	JUMP	.LBB24_108
.LBB24_107 NOP                          ; %if.else338
	JUMP	.LBB24_109
.LBB24_108 NOP                          ; %if.end339
                                        ;   in Loop: Header=BB24_83 Depth=1
	JUMP	.LBB24_83
.LBB24_109 NOP                          ; %for.end340
	JUMP	.LBB24_110
.LBB24_110 NOP                          ; %if.end341
	COPYI	%GR6, __malloc_av_
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	ADDI	%GR1, %GR1, 12
	LOAD	%GR3, 0(%GR1)
	LOAD	%GR1, 0(%GR2)
	ANDI	%GR2, %GR1, -4
	ADDI	%GR1, %GR7, 32
	ORI	%GR1, %GR1, 4
	LOAD	%GR4, 0(%GR1)
	LOAD	%GR5, 32(%GR7)
	SUB	%GR3, %GR3, %GR4
	ULT	%GR4, %GR2, %GR5
	SUB	%GR3, %GR3, %GR4
	SUB	%GR2, %GR2, %GR5
	ADDI	%GR4, %GR7, 80
	ORI	%GR4, %GR4, 4
	STORE	%GR3, 0(%GR4)
	STORE	%GR2, 80(%GR7)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 0(%GR2)
	ANDI	%GR2, %GR2, -4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR3, 32(%GR7)
	ULT	%GR4, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR2, %GR3
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB24_112
	JUMP	.LBB24_111
.LBB24_111 NOP                          ; %lor.lhs.false349
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 31
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	GT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_116
	JUMP	.LBB24_112
.LBB24_112 NOP                          ; %if.then352
	LOAD	%GR1, 128(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR4, %GR6, 4
	LOAD	%GR3, 0(%GR4)
	LOAD	%GR2, 32(%GR7)
	CALL	malloc_extend_top
	COPYI	%GR6, __malloc_av_
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 8
	ADDI	%GR1, %GR1, 12
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 0(%GR2)
	ANDI	%GR2, %GR2, -4
	LOAD	%GR3, 0(%GR4)
	LOAD	%GR5, 32(%GR7)
	SUB	%GR1, %GR1, %GR3
	ULT	%GR3, %GR2, %GR5
	SUB	%GR1, %GR1, %GR3
	SUB	%GR2, %GR2, %GR5
	ADDI	%GR3, %GR7, 80
	ORI	%GR3, %GR3, 4
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 80(%GR7)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	LOAD	%GR2, 0(%GR4)
	LOAD	%GR3, 32(%GR7)
	ULT	%GR4, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	ULT	%GR1, %GR1, %GR3
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB24_114
	JUMP	.LBB24_113
.LBB24_113 NOP                          ; %lor.lhs.false360
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 31
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	GT	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB24_115
	JUMP	.LBB24_114
.LBB24_114 NOP                          ; %if.then363
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_115 NOP                          ; %if.end364
	JUMP	.LBB24_116
.LBB24_116 NOP                          ; %if.end365
	COPYI	%GR6, __malloc_av_
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 112(%GR7)
	ADDI	%GR1, %GR7, 32
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 32(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 112(%GR7)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR1, 112(%GR7)
	LOAD	%GR2, 32(%GR7)
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	ADDI	%GR1, %GR7, 80
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 80(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR3, %GR6, 8
	ADDI	%GR6, %GR6, 12
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 0(%GR3)
	LOAD	%GR1, 128(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB24_117
.LBB24_117 NOP                          ; %return
	LOAD	%GR6, 136(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 140(%GR7)
	LOAD	%GR4, 144(%GR7)
	LOAD	%GR3, 148(%GR7)
	LOAD	%GR2, 152(%GR7)
	LOAD	%GR1, 156(%GR7)
	ADDI	%GR7, %GR7, 160
	RET
.Lfunc_end24 NOP 
	.size	_malloc_r, .Lfunc_end24-_malloc_r
                                        ; -- End function
	.type	malloc_extend_top,@function ; -- Begin function malloc_extend_top
malloc_extend_top NOP                   ; @malloc_extend_top
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 128
	STORE	%GR1, 124(%GR7)
	STORE	%GR2, 120(%GR7)
	STORE	%GR3, 116(%GR7)
	STORE	%GR4, 112(%GR7)
	STORE	%GR5, 108(%GR7)
	STORE	%GR1, 104(%GR7)
	ADDI	%GR6, %GR7, 96
	ORI	%GR1, %GR6, 4
	STORE	%GR3, 0(%GR1)
	STORE	%GR2, 96(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	STORE	%GR2, 48(%GR7)
	LOAD	%GR2, 48(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 0(%GR3)
	ANDI	%GR3, %GR3, -4
	ADDI	%GR4, %GR7, 40
	ORI	%GR4, %GR4, 4
	STORE	%GR2, 0(%GR4)
	STORE	%GR3, 40(%GR7)
	LOAD	%GR2, 48(%GR7)
	LOAD	%GR3, 40(%GR7)
	ADD	%GR2, %GR2, %GR3
	STORE	%GR2, 32(%GR7)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 96(%GR7)
	ADDI	%GR3, %GR2, 32
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR7, 24
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR3, 24(%GR7)
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 4096
	STORE	%GR6, 16(%GR7)
	COPYI	%GR6, __malloc_sbrk_base
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_2
	JUMP	.LBB25_1
.LBB25_1 NOP                            ; %if.then
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 24(%GR7)
	ADDI	%GR3, %GR7, 16
	ORI	%GR3, %GR3, 4
	LOAD	%GR3, 0(%GR3)
	LOAD	%GR4, 16(%GR7)
	ADD	%GR2, %GR4, %GR2
	ULT	%GR5, %GR2, %GR4
	ADD	%GR1, %GR3, %GR1
	ADD	%GR1, %GR1, %GR5
	ADDI	%GR5, %GR2, -1
	ULT	%GR2, %GR5, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	COPYI	%GR2, 0
	SUB	%GR6, %GR2, %GR4
	NEQ	%GR4, %GR4, %GR2
	ADD	%GR3, %GR3, %GR4
	SUB	%GR2, %GR2, %GR3
	AND	%GR1, %GR1, %GR2
	AND	%GR6, %GR5, %GR6
	LOAD	%GR2, 12(%GR7)
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB25_2
.LBB25_2 NOP                            ; %if.end
	LOAD	%GR1, 104(%GR7)
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 24(%GR7)
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 88(%GR7)
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_5
	JUMP	.LBB25_3
.LBB25_3 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 32(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_6
	JUMP	.LBB25_4
.LBB25_4 NOP                            ; %land.lhs.true
	LOAD	%GR6, 48(%GR7)
	COPYI	%GR1, __malloc_av_
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_6
	JUMP	.LBB25_5
.LBB25_5 NOP                            ; %if.then8
	JUMP	.LBB25_30
.LBB25_6 NOP                            ; %if.end9
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 32(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_9
	JUMP	.LBB25_7
.LBB25_7 NOP                            ; %land.lhs.true14
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, -1
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_9
	JUMP	.LBB25_8
.LBB25_8 NOP                            ; %if.then19
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 40(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 56
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 56(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%GR7)
	ORI	%GR1, %GR1, 1
	COPYI	%GR2, __malloc_av_
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	JUMP	.LBB25_26
.LBB25_9 NOP                            ; %if.else
	COPYI	%GR6, __malloc_sbrk_base
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_11
	JUMP	.LBB25_10
.LBB25_10 NOP                           ; %if.then24
	LOAD	%GR6, 88(%GR7)
	COPYI	%GR1, __malloc_sbrk_base
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_12
.LBB25_11 NOP                           ; %if.else25
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	COPYI	%GR1, __malloc_current_mallinfo.0
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_12
.LBB25_12 NOP                           ; %if.end29
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 16
	ANDI	%GR6, %GR6, 15
	ADDI	%GR1, %GR7, 80
	ORI	%GR1, %GR1, 4
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 80(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 80(%GR7)
	OR	%GR6, %GR1, %GR6
	EQ	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB25_14
	JUMP	.LBB25_13
.LBB25_13 NOP                           ; %if.then34
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 16
	SUB	%GR3, %GR2, %GR1
	UGT	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	ADDI	%GR1, %GR7, 72
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 72(%GR7)
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 88(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB25_15
.LBB25_14 NOP                           ; %if.else37
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 72(%GR7)
	JUMP	.LBB25_15
.LBB25_15 NOP                           ; %if.end38
	ADDI	%GR6, %GR7, 16
	ORI	%GR1, %GR6, 4
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR3, 88(%GR7)
	LOAD	%GR4, 24(%GR7)
	ADD	%GR3, %GR3, %GR4
	ADDI	%GR4, %GR2, -1
	AND	%GR3, %GR3, %GR4
	ULT	%GR4, %GR2, %GR3
	SUB	%GR4, %GR6, %GR4
	SUB	%GR2, %GR2, %GR3
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR5, 72(%GR7)
	ADD	%GR2, %GR5, %GR2
	ULT	%GR5, %GR2, %GR5
	ADD	%GR3, %GR3, %GR4
	ADD	%GR3, %GR3, %GR5
	STORE	%GR3, 0(%GR6)
	STORE	%GR2, 72(%GR7)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR4, 72(%GR7)
	AND	%GR3, %GR4, %GR3
	AND	%GR1, %GR2, %GR1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 72(%GR7)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 72(%GR7)
	CALL	_sbrk_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_19
	JUMP	.LBB25_16
.LBB25_16 NOP                           ; %if.then49
	ADDI	%GR6, %GR7, 72
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 72(%GR7)
	COPYI	%GR6, 1
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR2, 24(%GR7)
	ADD	%GR6, %GR6, %GR2
	STORE	%GR6, 64(%GR7)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 80(%GR7)
	OR	%GR6, %GR2, %GR6
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB25_18
	JUMP	.LBB25_17
.LBB25_17 NOP                           ; %if.then53
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 64(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB25_18
.LBB25_18 NOP                           ; %if.end56
	JUMP	.LBB25_19
.LBB25_19 NOP                           ; %if.end57
	ADDI	%GR6, %GR7, 72
	ORI	%GR1, %GR6, 4
	LOAD	%GR6, 72(%GR7)
	COPYI	%GR2, __malloc_current_mallinfo.0
	LOAD	%GR3, 0(%GR2)
	ADD	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR2)
	LOAD	%GR2, 88(%GR7)
	COPYI	%GR6, __malloc_av_
	STORE	%GR2, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	LOAD	%GR3, 88(%GR7)
	ULT	%GR4, %GR2, %GR3
	SUB	%GR2, %GR2, %GR3
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR3, 72(%GR7)
	ADD	%GR3, %GR2, %GR3
	ULT	%GR2, %GR3, %GR2
	SUB	%GR1, %GR1, %GR4
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR7, 56
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR3, 56(%GR7)
	LOAD	%GR1, 0(%GR2)
	LOAD	%GR2, 56(%GR7)
	ORI	%GR2, %GR2, 1
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 8
	ADDI	%GR3, %GR3, 12
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 0(%GR4)
	LOAD	%GR1, 48(%GR7)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB25_25
	JUMP	.LBB25_20
.LBB25_20 NOP                           ; %if.then69
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	COPYI	%GR2, 31
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB25_22
	JUMP	.LBB25_21
.LBB25_21 NOP                           ; %if.then72
	COPYI	%GR6, __malloc_av_
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, 1
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB25_30
.LBB25_22 NOP                           ; %if.end74
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, -24
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	ANDI	%GR2, %GR3, -16
	STORE	%GR1, 0(%GR6)
	STORE	%GR2, 40(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR1, 8
	ADDI	%GR1, %GR1, 12
	LOAD	%GR3, 0(%GR2)
	ANDI	%GR3, %GR3, 1
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR5, 40(%GR7)
	OR	%GR3, %GR3, %GR5
	STORE	%GR4, 0(%GR1)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 48(%GR7)
	LOAD	%GR2, 40(%GR7)
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR2, %GR1, 8
	ADDI	%GR3, %GR1, 12
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR3)
	COPYI	%GR3, 9
	STORE	%GR3, 0(%GR2)
	LOAD	%GR2, 48(%GR7)
	LOAD	%GR4, 40(%GR7)
	ADD	%GR2, %GR4, %GR2
	ADDI	%GR4, %GR2, 16
	ADDI	%GR2, %GR2, 20
	STORE	%GR1, 0(%GR2)
	STORE	%GR3, 0(%GR4)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	COPYI	%GR3, 32
	ULT	%GR2, %GR2, %GR3
	EQ	%GR6, %GR6, %GR1
	CMOV	%GR1, %GR6, %GR2
	BNEQZ	%GR1, .LBB25_24
	JUMP	.LBB25_23
.LBB25_23 NOP                           ; %if.then88
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR2, %GR6, 16
	CALL	_free_r
	JUMP	.LBB25_24
.LBB25_24 NOP                           ; %if.end90
	JUMP	.LBB25_25
.LBB25_25 NOP                           ; %if.end91
	JUMP	.LBB25_26
.LBB25_26 NOP                           ; %if.end92
	COPYI	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	COPYI	%GR2, __malloc_max_sbrked_mem
	LOAD	%GR2, 0(%GR2)
	ULTE	%GR6, %GR6, %GR2
	ULTE	%GR3, %GR1, %GR2
	EQ	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR1, %GR6
	BNEQZ	%GR3, .LBB25_28
	JUMP	.LBB25_27
.LBB25_27 NOP                           ; %if.then96
	COPYI	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	COPYI	%GR2, __malloc_max_sbrked_mem
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB25_28
.LBB25_28 NOP                           ; %if.end98
	COPYI	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	COPYI	%GR2, __malloc_max_total_mem
	LOAD	%GR2, 0(%GR2)
	ULTE	%GR6, %GR6, %GR2
	ULTE	%GR3, %GR1, %GR2
	EQ	%GR1, %GR1, %GR2
	CMOV	%GR3, %GR1, %GR6
	BNEQZ	%GR3, .LBB25_30
	JUMP	.LBB25_29
.LBB25_29 NOP                           ; %if.then102
	COPYI	%GR6, __malloc_current_mallinfo.0
	LOAD	%GR6, 0(%GR6)
	SRAI	%GR1, %GR6, 31
	COPYI	%GR2, __malloc_max_total_mem
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB25_30
.LBB25_30 NOP                           ; %if.end104
	LOAD	%GR5, 108(%GR7)
	LOAD	%GR4, 112(%GR7)
	LOAD	%GR3, 116(%GR7)
	LOAD	%GR2, 120(%GR7)
	LOAD	%GR1, 124(%GR7)
	ADDI	%GR7, %GR7, 128
	RET
.Lfunc_end25 NOP 
	.size	malloc_extend_top, .Lfunc_end25-malloc_extend_top
                                        ; -- End function
	.globl	memchr                  ; -- Begin function memchr
	.type	memchr,@function
memchr NOP                              ; @memchr
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 88
	STORE	%GR1, 84(%GR7)
	STORE	%GR2, 80(%GR7)
	STORE	%GR3, 76(%GR7)
	STORE	%GR4, 72(%GR7)
	STORE	%GR5, 68(%GR7)
	STORE	%GR1, 56(%GR7)
	STORE	%GR2, 52(%GR7)
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 40(%GR7)
	LOAD	%GR6, 56(%GR7)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 52(%GR7)
	STOREB	%GR6, 28(%GR7)
	JUMP	.LBB26_1
.LBB26_1 NOP                            ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 32(%GR7)
	ANDI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_7
	JUMP	.LBB26_2
.LBB26_2 NOP                            ; %while.body
                                        ;   in Loop: Header=BB26_1 Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR4, %GR3, %GR2
	ADD	%GR4, %GR1, %GR4
	ADDI	%GR4, %GR4, -1
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 40(%GR7)
	OR	%GR6, %GR2, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_4
	JUMP	.LBB26_3
.LBB26_3 NOP                            ; %if.then
	COPYI	%GR6, 0
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB26_25
.LBB26_4 NOP                            ; %if.end
                                        ;   in Loop: Header=BB26_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ULOADB	%GR6, 0(%GR6)
	ULOADB	%GR1, 28(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_6
	JUMP	.LBB26_5
.LBB26_5 NOP                            ; %if.then5
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB26_25
.LBB26_6 NOP                            ; %if.end6
                                        ;   in Loop: Header=BB26_1 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB26_1
.LBB26_7 NOP                            ; %while.end
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	COPYI	%GR2, 8
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB26_19
	JUMP	.LBB26_8
.LBB26_8 NOP                            ; %if.then9
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 24(%GR7)
	ULOADB	%GR6, 28(%GR7)
	SHLI	%GR1, %GR6, 8
	OR	%GR6, %GR1, %GR6
	ADDI	%GR1, %GR7, 16
	ORI	%GR1, %GR1, 4
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR2, 16(%GR7)
	SRLI	%GR3, %GR2, 16
	SHLI	%GR4, %GR6, 16
	OR	%GR3, %GR4, %GR3
	SHLI	%GR4, %GR2, 16
	OR	%GR2, %GR4, %GR2
	OR	%GR6, %GR3, %GR6
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 16(%GR7)
	COPYI	%GR6, 32
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB26_9
.LBB26_9 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 63
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_12
	JUMP	.LBB26_10
.LBB26_10 NOP                           ; %for.body
                                        ;   in Loop: Header=BB26_9 Depth=1
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 8(%GR7)
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 4(%GR7)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR4, 12(%GR7)
	COPYI	%GR3, 0
	EQ	%GR5, %GR4, %GR3
	COPYI	%GR6, 32
	SUB	%GR6, %GR6, %GR4
	SRL	%GR6, %GR2, %GR6
	CMOV	%GR6, %GR5, %GR3
	SHL	%GR5, %GR1, %GR4
	OR	%GR6, %GR6, %GR5
	ADDI	%GR5, %GR4, -32
	SHL	%GR1, %GR2, %GR5
	GTE	%GR5, %GR5, %GR3
	CMOV	%GR6, %GR5, %GR1
	SHL	%GR1, %GR2, %GR4
	CMOV	%GR1, %GR5, %GR3
	OR	%GR1, %GR1, %GR2
	LOAD	%GR2, 4(%GR7)
	OR	%GR6, %GR6, %GR2
	LOAD	%GR2, 8(%GR7)
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 16(%GR7)
	JUMP	.LBB26_11
.LBB26_11 NOP                           ; %for.inc
                                        ;   in Loop: Header=BB26_9 Depth=1
	LOAD	%GR6, 12(%GR7)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB26_9
.LBB26_12 NOP                           ; %for.end
	JUMP	.LBB26_13
.LBB26_13 NOP                           ; %while.cond21
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	COPYI	%GR2, 8
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB26_17
	JUMP	.LBB26_14
.LBB26_14 NOP                           ; %while.body24
                                        ;   in Loop: Header=BB26_13 Depth=1
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 16
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 16(%GR7)
	XOR	%GR6, %GR6, %GR2
	XOR	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR1, -16843009
	ULT	%GR3, %GR2, %GR1
	ADD	%GR3, %GR6, %GR3
	ADDI	%GR3, %GR3, -16843010
	XORI	%GR6, %GR6, -1
	XORI	%GR1, %GR1, -1
	AND	%GR1, %GR2, %GR1
	AND	%GR6, %GR3, %GR6
	OR	%GR6, %GR1, %GR6
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_16
	JUMP	.LBB26_15
.LBB26_15 NOP                           ; %if.then29
	JUMP	.LBB26_18
.LBB26_16 NOP                           ; %if.end30
                                        ;   in Loop: Header=BB26_13 Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, -8
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 40(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB26_13
.LBB26_17 NOP                           ; %while.end33.loopexit
	JUMP	.LBB26_18
.LBB26_18 NOP                           ; %while.end33
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB26_19
.LBB26_19 NOP                           ; %if.end34
	JUMP	.LBB26_20
.LBB26_20 NOP                           ; %while.cond35
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR4, %GR3, %GR2
	ADD	%GR4, %GR1, %GR4
	ADDI	%GR4, %GR4, -1
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 40(%GR7)
	OR	%GR6, %GR2, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_24
	JUMP	.LBB26_21
.LBB26_21 NOP                           ; %while.body38
                                        ;   in Loop: Header=BB26_20 Depth=1
	LOAD	%GR6, 32(%GR7)
	ULOADB	%GR6, 0(%GR6)
	ULOADB	%GR1, 28(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_23
	JUMP	.LBB26_22
.LBB26_22 NOP                           ; %if.then43
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB26_25
.LBB26_23 NOP                           ; %if.end44
                                        ;   in Loop: Header=BB26_20 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB26_20
.LBB26_24 NOP                           ; %while.end46
	COPYI	%GR6, 0
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB26_25
.LBB26_25 NOP                           ; %return
	LOAD	%GR6, 64(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 68(%GR7)
	LOAD	%GR4, 72(%GR7)
	LOAD	%GR3, 76(%GR7)
	LOAD	%GR2, 80(%GR7)
	LOAD	%GR1, 84(%GR7)
	ADDI	%GR7, %GR7, 88
	RET
.Lfunc_end26 NOP 
	.size	memchr, .Lfunc_end26-memchr
                                        ; -- End function
	.type	__malloc_lock,@function ; -- Begin function __malloc_lock
__malloc_lock NOP                       ; @__malloc_lock
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 8
	STORE	%GR1, 0(%GR7)
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end27 NOP 
	.size	__malloc_lock, .Lfunc_end27-__malloc_lock
                                        ; -- End function
	.type	__malloc_unlock,@function ; -- Begin function __malloc_unlock
__malloc_unlock NOP                     ; @__malloc_unlock
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 8
	STORE	%GR1, 0(%GR7)
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end28 NOP 
	.size	__malloc_unlock, .Lfunc_end28-__malloc_unlock
                                        ; -- End function
	.type	_sbrk_r,@function       ; -- Begin function _sbrk_r
_sbrk_r NOP                             ; @_sbrk_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR3, 0(%GR6)
	STORE	%GR2, 8(%GR7)
	COPYI	%GR1, errno
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	CALL	sbrk
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB29_3
	JUMP	.LBB29_1
.LBB29_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB29_3
	JUMP	.LBB29_2
.LBB29_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB29_3
.LBB29_3 NOP                            ; %if.end
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end29 NOP 
	.size	_sbrk_r, .Lfunc_end29-_sbrk_r
                                        ; -- End function
	.type	__sread,@function       ; -- Begin function __sread
__sread NOP                             ; @__sread
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 32(%GR7)
	STORE	%GR3, 24(%GR7)
	STORE	%GR4, 20(%GR7)
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	LOAD	%GR3, 24(%GR7)
	LOAD	%GR4, 20(%GR7)
	SRAI	%GR5, %GR4, 31
	CALL	_read_r
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR2)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_2
	JUMP	.LBB30_1
.LBB30_1 NOP                            ; %if.then
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 80
	LOAD	%GR4, 0(%GR3)
	ADDI	%GR2, %GR2, 84
	LOAD	%GR5, 0(%GR2)
	ADD	%GR6, %GR5, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR4, %GR1, %GR4
	ADD	%GR6, %GR6, %GR4
	STORE	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR2)
	JUMP	.LBB30_3
.LBB30_2 NOP                            ; %if.else
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB30_3
.LBB30_3 NOP                            ; %if.end
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 44(%GR7)
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end30 NOP 
	.size	__sread, .Lfunc_end30-__sread
                                        ; -- End function
	.type	__swrite,@function      ; -- Begin function __swrite
__swrite NOP                            ; @__swrite
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 32(%GR7)
	STORE	%GR3, 24(%GR7)
	STORE	%GR4, 20(%GR7)
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 256
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB31_2
	JUMP	.LBB31_1
.LBB31_1 NOP                            ; %if.then
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	COPYI	%GR3, 0
	COPYI	%GR5, 2
	COPYR	%GR4, %GR3
	CALL	_lseek_r
                                        ; kill: def $gr6 killed $rt0
                                        ; kill: def $gr6 killed $rt1
	JUMP	.LBB31_2
.LBB31_2 NOP                            ; %if.end
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	LOAD	%GR3, 24(%GR7)
	LOAD	%GR4, 20(%GR7)
	SRAI	%GR5, %GR4, 31
	CALL	_write_r
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 44(%GR7)
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end31 NOP 
	.size	__swrite, .Lfunc_end31-__swrite
                                        ; -- End function
	.type	__sseek,@function       ; -- Begin function __sseek
__sseek NOP                             ; @__sseek
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 32(%GR7)
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 24(%GR7)
	STORE	%GR5, 20(%GR7)
	LOAD	%GR1, 32(%GR7)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR2, %GR2, 14
	LOADH	%GR2, 0(%GR2)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 24(%GR7)
	LOAD	%GR5, 20(%GR7)
	CALL	_lseek_r
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 8(%GR7)
	AND	%GR6, %GR1, %GR6
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB32_2
	JUMP	.LBB32_1
.LBB32_1 NOP                            ; %if.then
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 61439
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB32_3
.LBB32_2 NOP                            ; %if.else
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4096
	STOREH	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 80
	ADDI	%GR2, %GR2, 84
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	JUMP	.LBB32_3
.LBB32_3 NOP                            ; %if.end
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR5, 44(%GR7)
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end32 NOP 
	.size	__sseek, .Lfunc_end32-__sseek
                                        ; -- End function
	.type	__sclose,@function      ; -- Begin function __sclose
__sclose NOP                            ; @__sclose
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 14
	LOADH	%GR2, 0(%GR6)
	CALL	_close_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end33 NOP 
	.size	__sclose, .Lfunc_end33-__sclose
                                        ; -- End function
	.globl	strlen                  ; -- Begin function strlen
	.type	strlen,@function
strlen NOP                              ; @strlen
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB34_1
.LBB34_1 NOP                            ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%GR7)
	ANDI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB34_5
	JUMP	.LBB34_2
.LBB34_2 NOP                            ; %while.body
                                        ;   in Loop: Header=BB34_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB34_4
	JUMP	.LBB34_3
.LBB34_3 NOP                            ; %if.then
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR2, %GR6, %GR1
	ULT	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	ADDI	%GR1, %GR7, 24
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 24(%GR7)
	JUMP	.LBB34_12
.LBB34_4 NOP                            ; %if.end
                                        ;   in Loop: Header=BB34_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB34_1
.LBB34_5 NOP                            ; %while.end
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB34_6
.LBB34_6 NOP                            ; %while.cond2
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR6, -16843009
	ULT	%GR3, %GR2, %GR6
	ADD	%GR3, %GR1, %GR3
	ADDI	%GR3, %GR3, -16843010
	XORI	%GR1, %GR1, -1
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR2, %GR6
	AND	%GR1, %GR3, %GR1
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB34_8
	JUMP	.LBB34_7
.LBB34_7 NOP                            ; %while.body6
                                        ;   in Loop: Header=BB34_6 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB34_6
.LBB34_8 NOP                            ; %while.end8
	LOAD	%GR6, 0(%GR7)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB34_9
.LBB34_9 NOP                            ; %while.cond9
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB34_11
	JUMP	.LBB34_10
.LBB34_10 NOP                           ; %while.body11
                                        ;   in Loop: Header=BB34_9 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB34_9
.LBB34_11 NOP                           ; %while.end13
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR2, %GR6, %GR1
	ULT	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	SUB	%GR6, %GR1, %GR6
	ADDI	%GR1, %GR7, 24
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 24(%GR7)
	JUMP	.LBB34_12
.LBB34_12 NOP                           ; %return
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end34 NOP 
	.size	strlen, .Lfunc_end34-strlen
                                        ; -- End function
	.type	__sprint_r,@function    ; -- Begin function __sprint_r
__sprint_r NOP                          ; @__sprint_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 96
	STORE	%GR1, 92(%GR7)
	STORE	%GR2, 88(%GR7)
	STORE	%GR3, 84(%GR7)
	STORE	%GR4, 80(%GR7)
	STORE	%GR5, 76(%GR7)
	STORE	%GR1, 64(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 48(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 44(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR1, 8
	ADDI	%GR1, %GR1, 12
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 0(%GR2)
	OR	%GR1, %GR2, %GR1
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB35_2
	JUMP	.LBB35_1
.LBB35_1 NOP                            ; %if.then
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 72(%GR7)
	JUMP	.LBB35_17
.LBB35_2 NOP                            ; %if.end
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR6, %GR6, 105
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_14
	JUMP	.LBB35_3
.LBB35_3 NOP                            ; %if.then1
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB35_4
.LBB35_4 NOP                            ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB35_6 Depth 2
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_13
	JUMP	.LBB35_5
.LBB35_5 NOP                            ; %for.body
                                        ;   in Loop: Header=BB35_4 Depth=1
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 30
	SRLI	%GR1, %GR1, 2
	OR	%GR6, %GR1, %GR6
	STORE	%GR6, 24(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB35_6
.LBB35_6 NOP                            ; %for.cond4
                                        ;   Parent Loop BB35_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 24(%GR7)
	GTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_11
	JUMP	.LBB35_7
.LBB35_7 NOP                            ; %for.body7
                                        ;   in Loop: Header=BB35_6 Depth=2
	LOAD	%GR1, 64(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR2, 28(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 56(%GR7)
	CALL	_fputwc_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_9
	JUMP	.LBB35_8
.LBB35_8 NOP                            ; %if.then10
	COPYI	%GR6, -1
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB35_16
.LBB35_9 NOP                            ; %if.end11
                                        ;   in Loop: Header=BB35_6 Depth=2
	JUMP	.LBB35_10
.LBB35_10 NOP                           ; %for.inc
                                        ;   in Loop: Header=BB35_6 Depth=2
	LOAD	%GR6, 28(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB35_6
.LBB35_11 NOP                           ; %for.end
                                        ;   in Loop: Header=BB35_4 Depth=1
	JUMP	.LBB35_12
.LBB35_12 NOP                           ; %for.inc12
                                        ;   in Loop: Header=BB35_4 Depth=1
	LOAD	%GR6, 24(%GR7)
	SRAI	%GR1, %GR6, 31
	SRLI	%GR2, %GR6, 30
	SHLI	%GR1, %GR1, 2
	OR	%GR1, %GR1, %GR2
	STORE	%GR1, 20(%GR7)
	SHLI	%GR6, %GR6, 2
	LOAD	%GR2, 48(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	LOAD	%GR1, 0(%GR2)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR5, 0(%GR3)
	ULT	%GR1, %GR5, %GR6
	STORE	%GR1, 12(%GR7)
	LOAD	%GR4, 20(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR4, %GR1, %GR4
	LOAD	%GR1, 12(%GR7)
	SUB	%GR1, %GR4, %GR1
	SUB	%GR6, %GR5, %GR6
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB35_4
.LBB35_13 NOP                           ; %for.end15
	JUMP	.LBB35_15
.LBB35_14 NOP                           ; %if.else
	LOAD	%GR1, 64(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR3, 48(%GR7)
	CALL	__sfvwrite_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB35_15
.LBB35_15 NOP                           ; %if.end17
	JUMP	.LBB35_16
.LBB35_16 NOP                           ; %out
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	STORE	%GR2, 0(%GR1)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 44(%GR7)
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB35_17
.LBB35_17 NOP                           ; %return
	LOAD	%GR6, 72(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 76(%GR7)
	LOAD	%GR4, 80(%GR7)
	LOAD	%GR3, 84(%GR7)
	LOAD	%GR2, 88(%GR7)
	LOAD	%GR1, 92(%GR7)
	ADDI	%GR7, %GR7, 96
	RET
.Lfunc_end35 NOP 
	.size	__sprint_r, .Lfunc_end35-__sprint_r
                                        ; -- End function
	.type	_write_r,@function      ; -- Begin function _write_r
_write_r NOP                            ; @_write_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 20(%GR7)
	STORE	%GR3, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR5, 0(%GR6)
	STORE	%GR4, 8(%GR7)
	COPYI	%GR1, errno
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 8(%GR7)
	CALL	write
	COPYR	%GR6, %RT0
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 0
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR7)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB36_3
	JUMP	.LBB36_1
.LBB36_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB36_3
	JUMP	.LBB36_2
.LBB36_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB36_3
.LBB36_3 NOP                            ; %if.end
	ADDI	%GR6, %GR7, 0
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end36 NOP 
	.size	_write_r, .Lfunc_end36-_write_r
                                        ; -- End function
	.type	_close_r,@function      ; -- Begin function _close_r
_close_r NOP                            ; @_close_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	COPYI	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	CALL	close
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB37_3
	JUMP	.LBB37_1
.LBB37_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB37_3
	JUMP	.LBB37_2
.LBB37_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB37_3
.LBB37_3 NOP                            ; %if.end
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end37 NOP 
	.size	_close_r, .Lfunc_end37-_close_r
                                        ; -- End function
	.type	_fclose_r,@function     ; -- Begin function _fclose_r
_fclose_r NOP                           ; @_fclose_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_2
	JUMP	.LBB38_1
.LBB38_1 NOP                            ; %if.then
	COPYI	%GR6, 0
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB38_36
.LBB38_2 NOP                            ; %if.end
	JUMP	.LBB38_3
.LBB38_3 NOP                            ; %do.body
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_6
	JUMP	.LBB38_4
.LBB38_4 NOP                            ; %land.lhs.true
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_6
	JUMP	.LBB38_5
.LBB38_5 NOP                            ; %if.then2
	LOAD	%GR1, 8(%GR7)
	CALL	__sinit
	JUMP	.LBB38_6
.LBB38_6 NOP                            ; %if.end3
	JUMP	.LBB38_7
.LBB38_7 NOP                            ; %do.end
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB38_12
	JUMP	.LBB38_8
.LBB38_8 NOP                            ; %if.then5
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_10
	JUMP	.LBB38_9
.LBB38_9 NOP                            ; %cond.true
	JUMP	.LBB38_11
.LBB38_10 NOP                           ; %cond.false
	JUMP	.LBB38_11
.LBB38_11 NOP                           ; %cond.end
	JUMP	.LBB38_12
.LBB38_12 NOP                           ; %if.end8
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	LOADH	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_19
	JUMP	.LBB38_13
.LBB38_13 NOP                           ; %if.then13
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB38_18
	JUMP	.LBB38_14
.LBB38_14 NOP                           ; %if.then17
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_16
	JUMP	.LBB38_15
.LBB38_15 NOP                           ; %cond.true22
	JUMP	.LBB38_17
.LBB38_16 NOP                           ; %cond.false23
	JUMP	.LBB38_17
.LBB38_17 NOP                           ; %cond.end24
	JUMP	.LBB38_18
.LBB38_18 NOP                           ; %if.end25
	COPYI	%GR6, 0
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB38_36
.LBB38_19 NOP                           ; %if.end26
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	__sflush_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_22
	JUMP	.LBB38_20
.LBB38_20 NOP                           ; %land.lhs.true29
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 44
	LOAD	%GR3, 0(%GR1)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	CALL	%GR3
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_22
	JUMP	.LBB38_21
.LBB38_21 NOP                           ; %if.then34
	COPYI	%GR6, -1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB38_22
.LBB38_22 NOP                           ; %if.end35
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_24
	JUMP	.LBB38_23
.LBB38_23 NOP                           ; %if.then40
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB38_24
.LBB38_24 NOP                           ; %if.end41
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_28
	JUMP	.LBB38_25
.LBB38_25 NOP                           ; %if.then45
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 48
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 64
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB38_27
	JUMP	.LBB38_26
.LBB38_26 NOP                           ; %if.then50
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 48
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	JUMP	.LBB38_27
.LBB38_27 NOP                           ; %if.end53
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 48
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB38_28
.LBB38_28 NOP                           ; %if.end56
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 68
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_30
	JUMP	.LBB38_29
.LBB38_29 NOP                           ; %if.then60
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 68
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 68
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB38_30
.LBB38_30 NOP                           ; %if.end65
	CALL	__sfp_lock_acquire
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	COPYI	%GR1, 0
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB38_35
	JUMP	.LBB38_31
.LBB38_31 NOP                           ; %if.then70
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_33
	JUMP	.LBB38_32
.LBB38_32 NOP                           ; %cond.true75
	JUMP	.LBB38_34
.LBB38_33 NOP                           ; %cond.false76
	JUMP	.LBB38_34
.LBB38_34 NOP                           ; %cond.end77
	JUMP	.LBB38_35
.LBB38_35 NOP                           ; %if.end78
	CALL	__sfp_lock_release
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB38_36
.LBB38_36 NOP                           ; %return
	LOAD	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end38 NOP 
	.size	_fclose_r, .Lfunc_end38-_fclose_r
                                        ; -- End function
	.globl	fclose                  ; -- Begin function fclose
	.type	fclose,@function
fclose NOP                              ; @fclose
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR2, 0(%GR7)
	COPYI	%GR1, impure_data
	CALL	_fclose_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end39 NOP 
	.size	fclose, .Lfunc_end39-fclose
                                        ; -- End function
	.type	__fputwc,@function      ; -- Begin function __fputwc
__fputwc NOP                            ; @__fputwc
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 36(%GR7)
	STORE	%GR3, 32(%GR7)
	CALL	__locale_mb_cur_max
	COPYR	%GR6, %RT0
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_4
	JUMP	.LBB40_1
.LBB40_1 NOP                            ; %land.lhs.true
	LOAD	%GR6, 36(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_4
	JUMP	.LBB40_2
.LBB40_2 NOP                            ; %land.lhs.true2
	LOAD	%GR6, 36(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_4
	JUMP	.LBB40_3
.LBB40_3 NOP                            ; %if.then
	LOAD	%GR6, 36(%GR7)
	STOREB	%GR6, 28(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB40_7
.LBB40_4 NOP                            ; %if.else
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR4, %GR6, 96
	ADDI	%GR2, %GR7, 28
	CALL	_wcrtomb_r
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_6
	JUMP	.LBB40_5
.LBB40_5 NOP                            ; %if.then8
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB40_14
.LBB40_6 NOP                            ; %if.end
	JUMP	.LBB40_7
.LBB40_7 NOP                            ; %if.end11
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 16(%GR7)
	JUMP	.LBB40_8
.LBB40_8 NOP                            ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 8(%GR7)
	UGTE	%GR1, %GR1, %GR3
	UGTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB40_13
	JUMP	.LBB40_9
.LBB40_9 NOP                            ; %for.body
                                        ;   in Loop: Header=BB40_8 Depth=1
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR2, %GR7, 28
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	LOAD	%GR3, 32(%GR7)
	CALL	__sputc_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_11
	JUMP	.LBB40_10
.LBB40_10 NOP                           ; %if.then18
	COPYI	%GR6, -1
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB40_14
.LBB40_11 NOP                           ; %if.end19
                                        ;   in Loop: Header=BB40_8 Depth=1
	JUMP	.LBB40_12
.LBB40_12 NOP                           ; %for.inc
                                        ;   in Loop: Header=BB40_8 Depth=1
	ADDI	%GR6, %GR7, 16
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 1
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 16(%GR7)
	JUMP	.LBB40_8
.LBB40_13 NOP                           ; %for.end
	LOAD	%GR6, 36(%GR7)
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB40_14
.LBB40_14 NOP                           ; %return
	LOAD	%GR6, 44(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end40 NOP 
	.size	__fputwc, .Lfunc_end40-__fputwc
                                        ; -- End function
	.type	__sputc_r,@function     ; -- Begin function __sputc_r
__sputc_r NOP                           ; @__sputc_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	GT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB41_3
	JUMP	.LBB41_1
.LBB41_1 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR6, 0(%GR6)
	LT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB41_4
	JUMP	.LBB41_2
.LBB41_2 NOP                            ; %land.lhs.true
	LOADB	%GR6, 4(%GR7)
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_4
	JUMP	.LBB41_3
.LBB41_3 NOP                            ; %if.then
	ULOADB	%GR6, 4(%GR7)
	LOAD	%GR1, 0(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR1)
	STOREB	%GR6, 0(%GR2)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB41_5
.LBB41_4 NOP                            ; %if.else
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 4(%GR7)
	LOAD	%GR3, 0(%GR7)
	CALL	__swbuf_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB41_5
.LBB41_5 NOP                            ; %return
	LOAD	%GR6, 16(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end41 NOP 
	.size	__sputc_r, .Lfunc_end41-__sputc_r
                                        ; -- End function
	.type	_fputwc_r,@function     ; -- Begin function _fputwc_r
_fputwc_r NOP                           ; @_fputwc_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB42_5
	JUMP	.LBB42_1
.LBB42_1 NOP                            ; %if.then
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB42_3
	JUMP	.LBB42_2
.LBB42_2 NOP                            ; %cond.true
	JUMP	.LBB42_4
.LBB42_3 NOP                            ; %cond.false
	JUMP	.LBB42_4
.LBB42_4 NOP                            ; %cond.end
	JUMP	.LBB42_5
.LBB42_5 NOP                            ; %if.end
	JUMP	.LBB42_6
.LBB42_6 NOP                            ; %do.body
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB42_8
	JUMP	.LBB42_7
.LBB42_7 NOP                            ; %if.then7
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB42_8
.LBB42_8 NOP                            ; %if.end13
	JUMP	.LBB42_9
.LBB42_9 NOP                            ; %do.end
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR3, 8(%GR7)
	CALL	__fputwc
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 104
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB42_14
	JUMP	.LBB42_10
.LBB42_10 NOP                           ; %if.then17
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB42_12
	JUMP	.LBB42_11
.LBB42_11 NOP                           ; %cond.true22
	JUMP	.LBB42_13
.LBB42_12 NOP                           ; %cond.false23
	JUMP	.LBB42_13
.LBB42_13 NOP                           ; %cond.end24
	JUMP	.LBB42_14
.LBB42_14 NOP                           ; %if.end25
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end42 NOP 
	.size	_fputwc_r, .Lfunc_end42-_fputwc_r
                                        ; -- End function
	.globl	fputwc                  ; -- Begin function fputwc
	.type	fputwc,@function
fputwc NOP                              ; @fputwc
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 24(%GR7)
	COPYI	%GR6, impure_data
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB43_1
.LBB43_1 NOP                            ; %do.body
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_4
	JUMP	.LBB43_2
.LBB43_2 NOP                            ; %land.lhs.true
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_4
	JUMP	.LBB43_3
.LBB43_3 NOP                            ; %if.then
	LOAD	%GR1, 8(%GR7)
	CALL	__sinit
	JUMP	.LBB43_4
.LBB43_4 NOP                            ; %if.end
	JUMP	.LBB43_5
.LBB43_5 NOP                            ; %do.end
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR3, 24(%GR7)
	CALL	_fputwc_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end43 NOP 
	.size	fputwc, .Lfunc_end43-fputwc
                                        ; -- End function
	.type	_fstat_r,@function      ; -- Begin function _fstat_r
_fstat_r NOP                            ; @_fstat_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	COPYI	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR2, 8(%GR7)
	CALL	fstat
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_3
	JUMP	.LBB44_1
.LBB44_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_3
	JUMP	.LBB44_2
.LBB44_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_3
.LBB44_3 NOP                            ; %if.end
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end44 NOP 
	.size	_fstat_r, .Lfunc_end44-_fstat_r
                                        ; -- End function
	.type	__sfvwrite_r,@function  ; -- Begin function __sfvwrite_r
__sfvwrite_r NOP                        ; @__sfvwrite_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 160
	STORE	%GR1, 156(%GR7)
	STORE	%GR2, 152(%GR7)
	STORE	%GR3, 148(%GR7)
	STORE	%GR4, 144(%GR7)
	STORE	%GR5, 140(%GR7)
	STORE	%GR1, 128(%GR7)
	STORE	%GR2, 120(%GR7)
	STORE	%GR3, 112(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 96(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR2, %GR1, 8
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 12
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR3, %GR7, 104
	ORI	%GR3, %GR3, 4
	STORE	%GR1, 0(%GR3)
	STORE	%GR2, 104(%GR7)
	OR	%GR1, %GR2, %GR1
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB45_2
	JUMP	.LBB45_1
.LBB45_1 NOP                            ; %if.then
	COPYI	%GR6, 0
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB45_92
.LBB45_2 NOP                            ; %if.end
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_4
	JUMP	.LBB45_3
.LBB45_3 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_6
	JUMP	.LBB45_4
.LBB45_4 NOP                            ; %land.lhs.true
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR2, 120(%GR7)
	CALL	__swsetup_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_6
	JUMP	.LBB45_5
.LBB45_5 NOP                            ; %if.then5
	COPYI	%GR6, -1
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB45_92
.LBB45_6 NOP                            ; %if.end6
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 88(%GR7)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_19
	JUMP	.LBB45_7
.LBB45_7 NOP                            ; %if.then11
	JUMP	.LBB45_8
.LBB45_8 NOP                            ; %do.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB45_9 Depth 2
	JUMP	.LBB45_9
.LBB45_9 NOP                            ; %while.cond
                                        ;   Parent Loop BB45_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_11
	JUMP	.LBB45_10
.LBB45_10 NOP                           ; %while.body
                                        ;   in Loop: Header=BB45_9 Depth=2
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB45_9
.LBB45_11 NOP                           ; %while.end
                                        ;   in Loop: Header=BB45_8 Depth=1
	LOAD	%GR2, 120(%GR7)
	ADDI	%GR6, %GR2, 36
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 128(%GR7)
	STORE	%GR6, 40(%GR7)
	ADDI	%GR2, %GR2, 28
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 96(%GR7)
	ADDI	%GR4, %GR7, 104
	ORI	%GR4, %GR4, 4
	LOAD	%GR4, 0(%GR4)
	LOAD	%GR5, 104(%GR7)
	COPYI	%GR6, 2147482623
	UGT	%GR1, %GR5, %GR6
	COPYI	%GR5, 0
	NEQ	%GR6, %GR4, %GR5
	EQ	%GR4, %GR4, %GR5
	CMOV	%GR6, %GR4, %GR1
	BNEQZ	%GR6, .LBB45_13
	JUMP	.LBB45_12
.LBB45_12 NOP                           ; %cond.true
                                        ;   in Loop: Header=BB45_8 Depth=1
	LOAD	%GR4, 104(%GR7)
	LOAD	%GR6, 44(%GR7)
	LOAD	%GR1, 40(%GR7)
	JUMP	.LBB45_14
.LBB45_13 NOP                           ; %cond.false
                                        ;   in Loop: Header=BB45_8 Depth=1
	COPYI	%GR4, 2147482624
	LOAD	%GR6, 44(%GR7)
	LOAD	%GR1, 40(%GR7)
	JUMP	.LBB45_14
.LBB45_14 NOP                           ; %cond.end
                                        ;   in Loop: Header=BB45_8 Depth=1
	CALL	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 84(%GR7)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_16
	JUMP	.LBB45_15
.LBB45_15 NOP                           ; %if.then20
	JUMP	.LBB45_91
.LBB45_16 NOP                           ; %if.end21
                                        ;   in Loop: Header=BB45_8 Depth=1
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 96(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 104(%GR7)
	ULT	%GR5, %GR4, %GR6
	SUB	%GR1, %GR3, %GR1
	SUB	%GR1, %GR1, %GR5
	SUB	%GR6, %GR4, %GR6
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 104(%GR7)
	JUMP	.LBB45_17
.LBB45_17 NOP                           ; %do.cond
                                        ;   in Loop: Header=BB45_8 Depth=1
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	STORE	%GR1, 28(%GR7)
	LOAD	%GR2, 112(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	LOAD	%GR1, 0(%GR2)
	STORE	%GR1, 16(%GR7)
	LOAD	%GR5, 0(%GR3)
	ULT	%GR1, %GR5, %GR6
	STORE	%GR1, 4(%GR7)
	LOAD	%GR4, 28(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR4, %GR1, %GR4
	LOAD	%GR1, 4(%GR7)
	SUB	%GR1, %GR4, %GR1
	SUB	%GR6, %GR5, %GR6
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	OR	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_8
	JUMP	.LBB45_18
.LBB45_18 NOP                           ; %do.end
	JUMP	.LBB45_90
.LBB45_19 NOP                           ; %if.else
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB45_59
	JUMP	.LBB45_20
.LBB45_20 NOP                           ; %if.then33
	JUMP	.LBB45_21
.LBB45_21 NOP                           ; %do.body34
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB45_22 Depth 2
	JUMP	.LBB45_22
.LBB45_22 NOP                           ; %while.cond35
                                        ;   Parent Loop BB45_21 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_24
	JUMP	.LBB45_23
.LBB45_23 NOP                           ; %while.body38
                                        ;   in Loop: Header=BB45_22 Depth=2
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB45_22
.LBB45_24 NOP                           ; %while.end42
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_40
	JUMP	.LBB45_25
.LBB45_25 NOP                           ; %if.then47
                                        ;   in Loop: Header=BB45_21 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR2, 84(%GR7)
	SRAI	%GR3, %GR2, 31
	ULT	%GR1, %GR1, %GR2
	ULT	%GR2, %GR6, %GR3
	EQ	%GR6, %GR6, %GR3
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB45_37
	JUMP	.LBB45_26
.LBB45_26 NOP                           ; %land.lhs.true51
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1152
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_37
	JUMP	.LBB45_27
.LBB45_27 NOP                           ; %if.then56
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR1, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 52(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 3
	SRLI	%GR1, %GR6, 31
	ADD	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 1
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 48(%GR7)
	SRAI	%GR1, %GR6, 31
	LOAD	%GR2, 52(%GR7)
	SRAI	%GR3, %GR2, 31
	ADDI	%GR4, %GR7, 104
	ORI	%GR4, %GR4, 4
	LOAD	%GR4, 0(%GR4)
	LOAD	%GR5, 104(%GR7)
	ADD	%GR5, %GR2, %GR5
	ULT	%GR2, %GR5, %GR2
	ADD	%GR3, %GR3, %GR4
	ADD	%GR2, %GR3, %GR2
	ADDI	%GR3, %GR5, 1
	ULT	%GR4, %GR3, %GR5
	ADD	%GR2, %GR2, %GR4
	UGTE	%GR4, %GR1, %GR2
	EQ	%GR1, %GR1, %GR2
	UGTE	%GR6, %GR6, %GR3
	CMOV	%GR4, %GR1, %GR6
	BNEQZ	%GR4, .LBB45_29
	JUMP	.LBB45_28
.LBB45_28 NOP                           ; %if.then66
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 52(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB45_29
.LBB45_29 NOP                           ; %if.end71
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1024
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_33
	JUMP	.LBB45_30
.LBB45_30 NOP                           ; %if.then76
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR2, 48(%GR7)
	SRAI	%GR3, %GR2, 31
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_32
	JUMP	.LBB45_31
.LBB45_31 NOP                           ; %if.then80
	LOAD	%GR6, 128(%GR7)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB45_91
.LBB45_32 NOP                           ; %if.end81
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR1, 56(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 52(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 64383
	ORI	%GR1, %GR1, 128
	STOREH	%GR1, 0(%GR6)
	JUMP	.LBB45_36
.LBB45_33 NOP                           ; %if.else91
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 48(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	_realloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_35
	JUMP	.LBB45_34
.LBB45_34 NOP                           ; %if.then97
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR2, 0(%GR6)
	CALL	_free_r
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 65407
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 128(%GR7)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB45_91
.LBB45_35 NOP                           ; %if.end105
                                        ;   in Loop: Header=BB45_21 Depth=1
	JUMP	.LBB45_36
.LBB45_36 NOP                           ; %if.end106
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 56(%GR7)
	LOAD	%GR1, 52(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 120(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 104(%GR7)
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB45_37
.LBB45_37 NOP                           ; %if.end117
                                        ;   in Loop: Header=BB45_21 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR2, 84(%GR7)
	SRAI	%GR3, %GR2, 31
	UGTE	%GR1, %GR1, %GR2
	UGTE	%GR2, %GR6, %GR3
	EQ	%GR6, %GR6, %GR3
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB45_39
	JUMP	.LBB45_38
.LBB45_38 NOP                           ; %if.then121
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 104(%GR7)
	STORE	%GR6, 84(%GR7)
	JUMP	.LBB45_39
.LBB45_39 NOP                           ; %if.end123
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR3, 84(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 104(%GR7)
	STORE	%GR6, 84(%GR7)
	JUMP	.LBB45_56
.LBB45_40 NOP                           ; %if.else133
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	UGT	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB45_42
	JUMP	.LBB45_41
.LBB45_41 NOP                           ; %lor.lhs.false139
                                        ;   in Loop: Header=BB45_21 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR2, 120(%GR7)
	ADDI	%GR2, %GR2, 20
	LOAD	%GR2, 0(%GR2)
	SRAI	%GR3, %GR2, 31
	UGTE	%GR1, %GR1, %GR2
	UGTE	%GR2, %GR6, %GR3
	EQ	%GR6, %GR6, %GR3
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB45_49
	JUMP	.LBB45_42
.LBB45_42 NOP                           ; %if.then145
                                        ;   in Loop: Header=BB45_21 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR2, 84(%GR7)
	SRAI	%GR3, %GR2, 31
	UGTE	%GR1, %GR1, %GR2
	UGTE	%GR2, %GR6, %GR3
	EQ	%GR6, %GR6, %GR3
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB45_44
	JUMP	.LBB45_43
.LBB45_43 NOP                           ; %cond.true149
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 104(%GR7)
	JUMP	.LBB45_45
.LBB45_44 NOP                           ; %cond.false150
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	JUMP	.LBB45_45
.LBB45_45 NOP                           ; %cond.end152
                                        ;   in Loop: Header=BB45_21 Depth=1
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR3, 84(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_48
	JUMP	.LBB45_46
.LBB45_46 NOP                           ; %land.lhs.true166
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR2, 120(%GR7)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_48
	JUMP	.LBB45_47
.LBB45_47 NOP                           ; %if.then169
	JUMP	.LBB45_91
.LBB45_48 NOP                           ; %if.end170
                                        ;   in Loop: Header=BB45_21 Depth=1
	JUMP	.LBB45_55
.LBB45_49 NOP                           ; %if.else171
                                        ;   in Loop: Header=BB45_21 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 2147483646
	UGT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB45_51
	JUMP	.LBB45_50
.LBB45_50 NOP                           ; %cond.true174
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 104(%GR7)
	JUMP	.LBB45_52
.LBB45_51 NOP                           ; %cond.false175
                                        ;   in Loop: Header=BB45_21 Depth=1
	COPYI	%GR6, 2147483647
	JUMP	.LBB45_52
.LBB45_52 NOP                           ; %cond.end176
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 20
	LOAD	%GR1, 0(%GR1)
	SDIV	%GR6, %GR6, %GR1
	MUL	%GR6, %GR6, %GR1
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR1, %GR6, 36
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 96(%GR7)
	LOAD	%GR4, 84(%GR7)
	CALL	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 84(%GR7)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_54
	JUMP	.LBB45_53
.LBB45_53 NOP                           ; %if.then190
	JUMP	.LBB45_91
.LBB45_54 NOP                           ; %if.end191
                                        ;   in Loop: Header=BB45_21 Depth=1
	JUMP	.LBB45_55
.LBB45_55 NOP                           ; %if.end192
                                        ;   in Loop: Header=BB45_21 Depth=1
	JUMP	.LBB45_56
.LBB45_56 NOP                           ; %if.end193
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 96(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 104(%GR7)
	ULT	%GR5, %GR4, %GR6
	SUB	%GR1, %GR3, %GR1
	SUB	%GR1, %GR1, %GR5
	SUB	%GR6, %GR4, %GR6
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 104(%GR7)
	JUMP	.LBB45_57
.LBB45_57 NOP                           ; %do.cond198
                                        ;   in Loop: Header=BB45_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	STORE	%GR1, 32(%GR7)
	LOAD	%GR2, 112(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	LOAD	%GR1, 0(%GR2)
	STORE	%GR1, 20(%GR7)
	LOAD	%GR5, 0(%GR3)
	ULT	%GR1, %GR5, %GR6
	STORE	%GR1, 8(%GR7)
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR4, %GR1, %GR4
	LOAD	%GR1, 8(%GR7)
	SUB	%GR1, %GR4, %GR1
	SUB	%GR6, %GR5, %GR6
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	OR	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_21
	JUMP	.LBB45_58
.LBB45_58 NOP                           ; %do.end204
	JUMP	.LBB45_89
.LBB45_59 NOP                           ; %if.else205
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB45_60
.LBB45_60 NOP                           ; %do.body206
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB45_61 Depth 2
	JUMP	.LBB45_61
.LBB45_61 NOP                           ; %while.cond207
                                        ;   Parent Loop BB45_60 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_63
	JUMP	.LBB45_62
.LBB45_62 NOP                           ; %while.body210
                                        ;   in Loop: Header=BB45_61 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 104(%GR7)
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB45_61
.LBB45_63 NOP                           ; %while.end214
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_68
	JUMP	.LBB45_64
.LBB45_64 NOP                           ; %if.then216
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR1, 96(%GR7)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 104(%GR7)
	COPYI	%GR2, 10
	CALL	memchr
	COPYR	%GR6, %RT0
	STORE	%GR6, 72(%GR7)
	LOAD	%GR6, 72(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_66
	JUMP	.LBB45_65
.LBB45_65 NOP                           ; %cond.true219
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 1
	LOAD	%GR1, 96(%GR7)
	SUB	%GR6, %GR6, %GR1
	JUMP	.LBB45_67
.LBB45_66 NOP                           ; %cond.false224
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 104(%GR7)
	ADDI	%GR6, %GR6, 1
	JUMP	.LBB45_67
.LBB45_67 NOP                           ; %cond.end226
                                        ;   in Loop: Header=BB45_60 Depth=1
	STORE	%GR6, 64(%GR7)
	COPYI	%GR6, 1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB45_68
.LBB45_68 NOP                           ; %if.end229
                                        ;   in Loop: Header=BB45_60 Depth=1
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	LOAD	%GR2, 64(%GR7)
	SRAI	%GR3, %GR2, 31
	UGTE	%GR1, %GR1, %GR2
	UGTE	%GR2, %GR6, %GR3
	EQ	%GR6, %GR6, %GR3
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB45_70
	JUMP	.LBB45_69
.LBB45_69 NOP                           ; %cond.true233
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 104(%GR7)
	JUMP	.LBB45_71
.LBB45_70 NOP                           ; %cond.false234
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 64(%GR7)
	JUMP	.LBB45_71
.LBB45_71 NOP                           ; %cond.end236
                                        ;   in Loop: Header=BB45_60 Depth=1
	STORE	%GR6, 80(%GR7)
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	ULTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB45_76
	JUMP	.LBB45_72
.LBB45_72 NOP                           ; %land.lhs.true248
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 84(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_76
	JUMP	.LBB45_73
.LBB45_73 NOP                           ; %if.then251
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR3, 84(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR2, 120(%GR7)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_75
	JUMP	.LBB45_74
.LBB45_74 NOP                           ; %if.then260
	JUMP	.LBB45_91
.LBB45_75 NOP                           ; %if.end261
                                        ;   in Loop: Header=BB45_60 Depth=1
	JUMP	.LBB45_82
.LBB45_76 NOP                           ; %if.else262
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 20
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 84(%GR7)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_80
	JUMP	.LBB45_77
.LBB45_77 NOP                           ; %if.then267
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR1, %GR6, 36
	LOAD	%GR5, 0(%GR1)
	LOAD	%GR1, 128(%GR7)
	ADDI	%GR6, %GR6, 28
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 96(%GR7)
	LOAD	%GR4, 84(%GR7)
	CALL	%GR5
	COPYR	%GR6, %RT0
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 84(%GR7)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_79
	JUMP	.LBB45_78
.LBB45_78 NOP                           ; %if.then273
	JUMP	.LBB45_91
.LBB45_79 NOP                           ; %if.end274
                                        ;   in Loop: Header=BB45_60 Depth=1
	JUMP	.LBB45_81
.LBB45_80 NOP                           ; %if.else275
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 80(%GR7)
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR3, 84(%GR7)
	SRAI	%GR4, %GR3, 31
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 120(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB45_81
.LBB45_81 NOP                           ; %if.end284
                                        ;   in Loop: Header=BB45_60 Depth=1
	JUMP	.LBB45_82
.LBB45_82 NOP                           ; %if.end285
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 64(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_86
	JUMP	.LBB45_83
.LBB45_83 NOP                           ; %if.then289
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR1, 128(%GR7)
	LOAD	%GR2, 120(%GR7)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_85
	JUMP	.LBB45_84
.LBB45_84 NOP                           ; %if.then292
	JUMP	.LBB45_91
.LBB45_85 NOP                           ; %if.end293
                                        ;   in Loop: Header=BB45_60 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB45_86
.LBB45_86 NOP                           ; %if.end294
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 96(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 104
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 104(%GR7)
	ULT	%GR5, %GR4, %GR6
	SUB	%GR1, %GR3, %GR1
	SUB	%GR1, %GR1, %GR5
	SUB	%GR6, %GR4, %GR6
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 104(%GR7)
	JUMP	.LBB45_87
.LBB45_87 NOP                           ; %do.cond299
                                        ;   in Loop: Header=BB45_60 Depth=1
	LOAD	%GR6, 84(%GR7)
	SRAI	%GR1, %GR6, 31
	STORE	%GR1, 36(%GR7)
	LOAD	%GR2, 112(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	LOAD	%GR1, 0(%GR2)
	STORE	%GR1, 24(%GR7)
	LOAD	%GR5, 0(%GR3)
	ULT	%GR1, %GR5, %GR6
	STORE	%GR1, 12(%GR7)
	LOAD	%GR4, 36(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR4, %GR1, %GR4
	LOAD	%GR1, 12(%GR7)
	SUB	%GR1, %GR4, %GR1
	SUB	%GR6, %GR5, %GR6
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	OR	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB45_60
	JUMP	.LBB45_88
.LBB45_88 NOP                           ; %do.end305
	JUMP	.LBB45_89
.LBB45_89 NOP                           ; %if.end306
	JUMP	.LBB45_90
.LBB45_90 NOP                           ; %if.end307
	COPYI	%GR6, 0
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB45_92
.LBB45_91 NOP                           ; %err
	LOAD	%GR6, 120(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 64
	STOREH	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 136(%GR7)
	JUMP	.LBB45_92
.LBB45_92 NOP                           ; %return
	LOAD	%GR6, 136(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 140(%GR7)
	LOAD	%GR4, 144(%GR7)
	LOAD	%GR3, 148(%GR7)
	LOAD	%GR2, 152(%GR7)
	LOAD	%GR1, 156(%GR7)
	ADDI	%GR7, %GR7, 160
	RET
.Lfunc_end45 NOP 
	.size	__sfvwrite_r, .Lfunc_end45-__sfvwrite_r
                                        ; -- End function
	.type	_isatty_r,@function     ; -- Begin function _isatty_r
_isatty_r NOP                           ; @_isatty_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	COPYI	%GR6, errno
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	CALL	isatty
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_3
	JUMP	.LBB46_1
.LBB46_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_3
	JUMP	.LBB46_2
.LBB46_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB46_3
.LBB46_3 NOP                            ; %if.end
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end46 NOP 
	.size	_isatty_r, .Lfunc_end46-_isatty_r
                                        ; -- End function
	.type	_setlocale_r,@function  ; -- Begin function _setlocale_r
_setlocale_r NOP                        ; @_setlocale_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_6
	JUMP	.LBB47_1
.LBB47_1 NOP                            ; %if.then
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, .L.str.2.75
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_5
	JUMP	.LBB47_2
.LBB47_2 NOP                            ; %land.lhs.true
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, .L.str.3.76
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_5
	JUMP	.LBB47_3
.LBB47_3 NOP                            ; %land.lhs.true4
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR2, .L.str.1.77
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_5
	JUMP	.LBB47_4
.LBB47_4 NOP                            ; %if.then7
	COPYI	%GR6, 0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB47_7
.LBB47_5 NOP                            ; %if.end
	JUMP	.LBB47_6
.LBB47_6 NOP                            ; %if.end8
	COPYI	%GR6, .L.str.3.76
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB47_7
.LBB47_7 NOP                            ; %return
	LOAD	%GR6, 16(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end47 NOP 
	.size	_setlocale_r, .Lfunc_end47-_setlocale_r
                                        ; -- End function
	.type	__locale_mb_cur_max,@function ; -- Begin function __locale_mb_cur_max
__locale_mb_cur_max NOP                 ; @__locale_mb_cur_max
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 0
	CALL	__get_current_locale
	COPYI	%GR6, __global_locale
	LOADB	%GR6, 0(%GR6)
	COPYR	%RT0, %GR6
	ADDI	%GR7, %GR7, 0
	RET
.Lfunc_end48 NOP 
	.size	__locale_mb_cur_max, .Lfunc_end48-__locale_mb_cur_max
                                        ; -- End function
	.type	__get_current_locale,@function ; -- Begin function __get_current_locale
__get_current_locale NOP                ; @__get_current_locale
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 0
	CALL	__get_global_locale
	ADDI	%GR7, %GR7, 0
	RET
.Lfunc_end49 NOP 
	.size	__get_current_locale, .Lfunc_end49-__get_current_locale
                                        ; -- End function
	.type	__get_global_locale,@function ; -- Begin function __get_global_locale
__get_global_locale NOP                 ; @__get_global_locale
; %bb.0:                                ; %entry
	RET
.Lfunc_end50 NOP 
	.size	__get_global_locale, .Lfunc_end50-__get_global_locale
                                        ; -- End function
	.globl	setlocale               ; -- Begin function setlocale
	.type	setlocale,@function
setlocale NOP                           ; @setlocale
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 8(%GR7)
	COPYI	%GR6, _impure_ptr
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR3, 8(%GR7)
	CALL	_setlocale_r
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end51 NOP 
	.size	setlocale, .Lfunc_end51-setlocale
                                        ; -- End function
	.type	_lseek_r,@function      ; -- Begin function _lseek_r
_lseek_r NOP                            ; @_lseek_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 36(%GR7)
	ADDI	%GR6, %GR7, 24
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 24(%GR7)
	STORE	%GR5, 20(%GR7)
	COPYI	%GR1, errno
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 36(%GR7)
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR4, 20(%GR7)
	CALL	lseek
	COPYR	%GR6, %RT0
	COPYR	%GR1, %RT1
	ADDI	%GR2, %GR7, 8
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 8(%GR7)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB52_3
	JUMP	.LBB52_1
.LBB52_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB52_3
	JUMP	.LBB52_2
.LBB52_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB52_3
.LBB52_3 NOP                            ; %if.end
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end52 NOP 
	.size	_lseek_r, .Lfunc_end52-_lseek_r
                                        ; -- End function
	.type	__ascii_mbtowc,@function ; -- Begin function __ascii_mbtowc
__ascii_mbtowc NOP                      ; @__ascii_mbtowc
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	LOAD	%GR6, 48(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR5, 0(%GR6)
	STORE	%GR4, 8(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_2
	JUMP	.LBB53_1
.LBB53_1 NOP                            ; %if.then
	ADDI	%GR6, %GR7, 4
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB53_2
.LBB53_2 NOP                            ; %if.end
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_4
	JUMP	.LBB53_3
.LBB53_3 NOP                            ; %if.then2
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB53_9
.LBB53_4 NOP                            ; %if.end3
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	OR	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_6
	JUMP	.LBB53_5
.LBB53_5 NOP                            ; %if.then5
	COPYI	%GR6, -2
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB53_9
.LBB53_6 NOP                            ; %if.end6
	LOAD	%GR6, 0(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_8
	JUMP	.LBB53_7
.LBB53_7 NOP                            ; %if.then10
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB53_9
.LBB53_8 NOP                            ; %if.end11
	COPYI	%GR6, 1
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB53_9
.LBB53_9 NOP                            ; %return
	LOAD	%GR6, 40(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end53 NOP 
	.size	__ascii_mbtowc, .Lfunc_end53-__ascii_mbtowc
                                        ; -- End function
	.globl	memmove                 ; -- Begin function memmove
	.type	memmove,@function
memmove NOP                             ; @memmove
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 72
	STORE	%GR1, 68(%GR7)
	STORE	%GR2, 64(%GR7)
	STORE	%GR3, 60(%GR7)
	STORE	%GR4, 56(%GR7)
	STORE	%GR1, 48(%GR7)
	STORE	%GR2, 40(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%GR7)
	LOAD	%GR6, 48(%GR7)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 40(%GR7)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 24(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_6
	JUMP	.LBB54_1
.LBB54_1 NOP                            ; %land.lhs.true
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 32(%GR7)
	ADD	%GR1, %GR1, %GR2
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_6
	JUMP	.LBB54_2
.LBB54_2 NOP                            ; %if.then
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB54_3
.LBB54_3 NOP                            ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR4, %GR3, %GR2
	ADD	%GR4, %GR1, %GR4
	ADDI	%GR4, %GR4, -1
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%GR7)
	OR	%GR6, %GR2, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_5
	JUMP	.LBB54_4
.LBB54_4 NOP                            ; %while.body
                                        ;   in Loop: Header=BB54_3 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 24(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB54_3
.LBB54_5 NOP                            ; %while.end
	JUMP	.LBB54_19
.LBB54_6 NOP                            ; %if.else
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 32
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB54_15
	JUMP	.LBB54_7
.LBB54_7 NOP                            ; %land.lhs.true6
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 24(%GR7)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_15
	JUMP	.LBB54_8
.LBB54_8 NOP                            ; %if.then9
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB54_9
.LBB54_9 NOP                            ; %while.cond10
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 32
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB54_11
	JUMP	.LBB54_10
.LBB54_10 NOP                           ; %while.body12
                                        ;   in Loop: Header=BB54_9 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 8(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 8(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 8(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 8(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR2, -32
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 32(%GR7)
	JUMP	.LBB54_9
.LBB54_11 NOP                           ; %while.end21
	JUMP	.LBB54_12
.LBB54_12 NOP                           ; %while.cond22
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 8
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB54_14
	JUMP	.LBB54_13
.LBB54_13 NOP                           ; %while.body24
                                        ;   in Loop: Header=BB54_12 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 8(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR2, -8
	ULT	%GR2, %GR3, %GR2
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 32(%GR7)
	JUMP	.LBB54_12
.LBB54_14 NOP                           ; %while.end28
	LOAD	%GR6, 8(%GR7)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR7)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB54_15
.LBB54_15 NOP                           ; %if.end
	JUMP	.LBB54_16
.LBB54_16 NOP                           ; %while.cond29
                                        ; =>This Inner Loop Header: Depth=1
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 32(%GR7)
	ADDI	%GR3, %GR2, -1
	ULT	%GR4, %GR3, %GR2
	ADD	%GR4, %GR1, %GR4
	ADDI	%GR4, %GR4, -1
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 32(%GR7)
	OR	%GR6, %GR2, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_18
	JUMP	.LBB54_17
.LBB54_17 NOP                           ; %while.body32
                                        ;   in Loop: Header=BB54_16 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 24(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB54_16
.LBB54_18 NOP                           ; %while.end35
	JUMP	.LBB54_19
.LBB54_19 NOP                           ; %if.end36
	LOAD	%GR6, 48(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 56(%GR7)
	LOAD	%GR3, 60(%GR7)
	LOAD	%GR2, 64(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADDI	%GR7, %GR7, 72
	RET
.Lfunc_end54 NOP 
	.size	memmove, .Lfunc_end54-memmove
                                        ; -- End function
	.type	_read_r,@function       ; -- Begin function _read_r
_read_r NOP                             ; @_read_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 20(%GR7)
	STORE	%GR3, 16(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 4
	STORE	%GR5, 0(%GR6)
	STORE	%GR4, 8(%GR7)
	COPYI	%GR1, errno
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 8(%GR7)
	CALL	read
	COPYR	%GR6, %RT0
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 0
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 0(%GR7)
	AND	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_3
	JUMP	.LBB55_1
.LBB55_1 NOP                            ; %land.lhs.true
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_3
	JUMP	.LBB55_2
.LBB55_2 NOP                            ; %if.then
	COPYI	%GR6, errno
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB55_3
.LBB55_3 NOP                            ; %if.end
	ADDI	%GR6, %GR7, 0
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end55 NOP 
	.size	_read_r, .Lfunc_end55-_read_r
                                        ; -- End function
	.type	_realloc_r,@function    ; -- Begin function _realloc_r
_realloc_r NOP                          ; @_realloc_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 272
	STORE	%GR1, 268(%GR7)
	STORE	%GR2, 264(%GR7)
	STORE	%GR3, 260(%GR7)
	STORE	%GR4, 256(%GR7)
	STORE	%GR5, 252(%GR7)
	STORE	%GR1, 240(%GR7)
	STORE	%GR2, 232(%GR7)
	ADDI	%GR6, %GR7, 224
	ORI	%GR6, %GR6, 4
	STORE	%GR4, 0(%GR6)
	STORE	%GR3, 224(%GR7)
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_2
	JUMP	.LBB56_1
.LBB56_1 NOP                            ; %if.then
	LOAD	%GR1, 240(%GR7)
	ADDI	%GR6, %GR7, 224
	ORI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 224(%GR7)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_2 NOP                            ; %if.end
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_lock
	LOAD	%GR6, 232(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 208(%GR7)
	STORE	%GR6, 192(%GR7)
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 200
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 200(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 184(%GR7)
	ADDI	%GR6, %GR7, 224
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 224(%GR7)
	ADDI	%GR2, %GR1, 23
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 46
	UGT	%GR1, %GR2, %GR1
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_4
	JUMP	.LBB56_3
.LBB56_3 NOP                            ; %cond.true
	COPYI	%GR6, 0
	COPYI	%GR1, 32
	JUMP	.LBB56_5
.LBB56_4 NOP                            ; %cond.false
	ADDI	%GR6, %GR7, 224
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 224(%GR7)
	ADDI	%GR2, %GR1, 23
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ANDI	%GR1, %GR2, -16
	JUMP	.LBB56_5
.LBB56_5 NOP                            ; %cond.end
	ADDI	%GR2, %GR7, 216
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 216(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 216(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	LT	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_7
	JUMP	.LBB56_6
.LBB56_6 NOP                            ; %lor.lhs.false
	ADDI	%GR6, %GR7, 216
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 216(%GR7)
	ADDI	%GR2, %GR7, 224
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 224(%GR7)
	UGTE	%GR1, %GR1, %GR3
	UGTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_8
	JUMP	.LBB56_7
.LBB56_7 NOP                            ; %if.then6
	LOAD	%GR6, 240(%GR7)
	COPYI	%GR1, 12
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_8 NOP                            ; %if.end7
	ADDI	%GR6, %GR7, 200
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 200(%GR7)
	ADDI	%GR2, %GR7, 216
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 216(%GR7)
	UGTE	%GR1, %GR1, %GR3
	GTE	%GR3, %GR6, %GR2
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_83
	JUMP	.LBB56_9
.LBB56_9 NOP                            ; %if.then9
	LOAD	%GR6, 208(%GR7)
	LOAD	%GR1, 200(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 168(%GR7)
	LOAD	%GR6, 168(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_11
	JUMP	.LBB56_10
.LBB56_10 NOP                           ; %lor.lhs.false12
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 8
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB56_19
	JUMP	.LBB56_11
.LBB56_11 NOP                           ; %if.then18
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 160
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 160(%GR7)
	LOAD	%GR6, 168(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_15
	JUMP	.LBB56_12
.LBB56_12 NOP                           ; %if.then22
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 184(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 216
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 216(%GR7)
	ADDI	%GR4, %GR2, 32
	ULT	%GR2, %GR4, %GR2
	ADD	%GR1, %GR1, %GR2
	LT	%GR2, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR3, %GR4
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_14
	JUMP	.LBB56_13
.LBB56_13 NOP                           ; %if.then26
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR1, %GR4, %GR1
	ULT	%GR4, %GR1, %GR4
	ADD	%GR6, %GR3, %GR6
	ADD	%GR6, %GR6, %GR4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 184(%GR7)
	LOAD	%GR6, 208(%GR7)
	LOAD	%GR1, 216(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, __malloc_av_
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR2)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR3, 184(%GR7)
	ADDI	%GR6, %GR7, 216
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 0(%GR7)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR5, 216(%GR7)
	ULT	%GR6, %GR3, %GR5
	LOAD	%GR2, 4(%GR7)
	SUB	%GR4, %GR2, %GR4
	SUB	%GR6, %GR4, %GR6
	SUB	%GR3, %GR3, %GR5
	ORI	%GR3, %GR3, 1
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR4, %GR1, 8
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 0(%GR4)
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR3, 0(%GR1)
	ANDI	%GR3, %GR3, 1
	LOAD	%GR2, 0(%GR7)
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR4, 216(%GR7)
	OR	%GR3, %GR3, %GR4
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_14 NOP                           ; %if.end35
	JUMP	.LBB56_18
.LBB56_15 NOP                           ; %if.else
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 184(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 216
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 216(%GR7)
	LT	%GR4, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR3, %GR2
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB56_17
	JUMP	.LBB56_16
.LBB56_16 NOP                           ; %if.then38
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 120(%GR7)
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR3, %GR1, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 184(%GR7)
	JUMP	.LBB56_84
.LBB56_17 NOP                           ; %if.end42
	JUMP	.LBB56_18
.LBB56_18 NOP                           ; %if.end43
	JUMP	.LBB56_20
.LBB56_19 NOP                           ; %if.else44
	COPYI	%GR6, 0
	STORE	%GR6, 168(%GR7)
	ADDI	%GR1, %GR7, 160
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR6, 160(%GR7)
	JUMP	.LBB56_20
.LBB56_20 NOP                           ; %if.end45
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR6, %GR6, 8
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB56_67
	JUMP	.LBB56_21
.LBB56_21 NOP                           ; %if.then49
	LOAD	%GR6, 208(%GR7)
	LOAD	%GR1, 0(%GR6)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 152(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 144
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 144(%GR7)
	LOAD	%GR6, 168(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_52
	JUMP	.LBB56_22
.LBB56_22 NOP                           ; %if.then54
	LOAD	%GR6, 168(%GR7)
	COPYI	%GR1, __malloc_av_
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_37
	JUMP	.LBB56_23
.LBB56_23 NOP                           ; %if.then56
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 144
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 144(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 184
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 184(%GR7)
	ADD	%GR2, %GR3, %GR2
	ULT	%GR3, %GR2, %GR3
	ADD	%GR6, %GR6, %GR1
	ADD	%GR6, %GR6, %GR3
	ADDI	%GR1, %GR7, 216
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR3, 216(%GR7)
	ADDI	%GR4, %GR3, 32
	ULT	%GR3, %GR4, %GR3
	ADD	%GR1, %GR1, %GR3
	LT	%GR3, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR2, %GR4
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_36
	JUMP	.LBB56_24
.LBB56_24 NOP                           ; %if.then61
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 120(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 152(%GR7)
	STORE	%GR6, 192(%GR7)
	ADDI	%GR6, %GR7, 144
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 144(%GR7)
	ADDI	%GR2, %GR7, 160
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 160(%GR7)
	ADD	%GR6, %GR6, %GR2
	ADD	%GR2, %GR1, %GR3
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 184
	ORI	%GR1, %GR1, 4
	LOAD	%GR3, 0(%GR1)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR2, %GR4, %GR2
	ULT	%GR3, %GR2, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 184(%GR7)
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 176(%GR7)
	JUMP	.LBB56_25
.LBB56_25 NOP                           ; %do.body
	ADDI	%GR6, %GR7, 200
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 200(%GR7)
	ADDI	%GR2, %GR1, -8
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	ADDI	%GR1, %GR7, 104
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 104(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 72
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_33
	JUMP	.LBB56_26
.LBB56_26 NOP                           ; %if.then71
	LOAD	%GR6, 232(%GR7)
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 88(%GR7)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 40
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_32
	JUMP	.LBB56_27
.LBB56_27 NOP                           ; %if.then73
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 56
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_31
	JUMP	.LBB56_28
.LBB56_28 NOP                           ; %if.then78
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 104(%GR7)
	COPYI	%GR2, 72
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_30
	JUMP	.LBB56_29
.LBB56_29 NOP                           ; %if.then84
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_30
.LBB56_30 NOP                           ; %if.end89
	JUMP	.LBB56_31
.LBB56_31 NOP                           ; %if.end90
	JUMP	.LBB56_32
.LBB56_32 NOP                           ; %if.end91
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 96(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 96(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 88(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_34
.LBB56_33 NOP                           ; %if.else96
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 232(%GR7)
	ADDI	%GR6, %GR7, 104
	ORI	%GR6, %GR6, 4
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 104(%GR7)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB56_34
.LBB56_34 NOP                           ; %if.end98
	JUMP	.LBB56_35
.LBB56_35 NOP                           ; %do.end
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 216(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, __malloc_av_
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 184
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR3, 184(%GR7)
	ADDI	%GR6, %GR7, 216
	ORI	%GR6, %GR6, 4
	STORE	%GR6, 8(%GR7)
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR5, 216(%GR7)
	ULT	%GR6, %GR3, %GR5
	LOAD	%GR2, 12(%GR7)
	SUB	%GR4, %GR2, %GR4
	SUB	%GR6, %GR4, %GR6
	SUB	%GR3, %GR3, %GR5
	ORI	%GR3, %GR3, 1
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR4, %GR1, 8
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	STORE	%GR3, 0(%GR4)
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR3, 0(%GR1)
	ANDI	%GR3, %GR3, 1
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR4, 216(%GR7)
	OR	%GR3, %GR3, %GR4
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_36 NOP                           ; %if.end107
	JUMP	.LBB56_51
.LBB56_37 NOP                           ; %if.else108
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 144
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 144(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 184
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 184(%GR7)
	ADD	%GR2, %GR3, %GR2
	ULT	%GR3, %GR2, %GR3
	ADD	%GR6, %GR6, %GR1
	ADD	%GR6, %GR6, %GR3
	ADDI	%GR1, %GR7, 216
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR3, 216(%GR7)
	LT	%GR4, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR2, %GR3
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB56_50
	JUMP	.LBB56_38
.LBB56_38 NOP                           ; %if.then112
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 120(%GR7)
	LOAD	%GR6, 168(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 120(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 152(%GR7)
	STORE	%GR6, 192(%GR7)
	ADDI	%GR6, %GR7, 160
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 160(%GR7)
	ADDI	%GR2, %GR7, 144
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 144(%GR7)
	ADD	%GR6, %GR6, %GR2
	ADD	%GR2, %GR1, %GR3
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 184
	ORI	%GR1, %GR1, 4
	LOAD	%GR3, 0(%GR1)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR2, %GR4, %GR2
	ULT	%GR3, %GR2, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 184(%GR7)
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 176(%GR7)
	JUMP	.LBB56_39
.LBB56_39 NOP                           ; %do.body124
	ADDI	%GR6, %GR7, 200
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 200(%GR7)
	ADDI	%GR2, %GR1, -8
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	ADDI	%GR1, %GR7, 80
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 80(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 72
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_47
	JUMP	.LBB56_40
.LBB56_40 NOP                           ; %if.then128
	LOAD	%GR6, 232(%GR7)
	STORE	%GR6, 72(%GR7)
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 64(%GR7)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 40
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_46
	JUMP	.LBB56_41
.LBB56_41 NOP                           ; %if.then132
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 56
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_45
	JUMP	.LBB56_42
.LBB56_42 NOP                           ; %if.then138
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 80(%GR7)
	COPYI	%GR2, 72
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_44
	JUMP	.LBB56_43
.LBB56_43 NOP                           ; %if.then144
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_44
.LBB56_44 NOP                           ; %if.end149
	JUMP	.LBB56_45
.LBB56_45 NOP                           ; %if.end150
	JUMP	.LBB56_46
.LBB56_46 NOP                           ; %if.end151
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 64(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_48
.LBB56_47 NOP                           ; %if.else156
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 232(%GR7)
	ADDI	%GR6, %GR7, 80
	ORI	%GR6, %GR6, 4
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 80(%GR7)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB56_48
.LBB56_48 NOP                           ; %if.end158
	JUMP	.LBB56_49
.LBB56_49 NOP                           ; %do.end159
	JUMP	.LBB56_84
.LBB56_50 NOP                           ; %if.end160
	JUMP	.LBB56_51
.LBB56_51 NOP                           ; %if.end161
	JUMP	.LBB56_52
.LBB56_52 NOP                           ; %if.end162
	LOAD	%GR6, 152(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_66
	JUMP	.LBB56_53
.LBB56_53 NOP                           ; %land.lhs.true
	ADDI	%GR6, %GR7, 144
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 144(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 184(%GR7)
	ADD	%GR3, %GR1, %GR3
	ULT	%GR1, %GR3, %GR1
	ADD	%GR6, %GR6, %GR2
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR7, 216
	ORI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 216(%GR7)
	LT	%GR4, %GR6, %GR1
	EQ	%GR6, %GR6, %GR1
	ULT	%GR1, %GR3, %GR2
	CMOV	%GR4, %GR6, %GR1
	BNEQZ	%GR4, .LBB56_66
	JUMP	.LBB56_54
.LBB56_54 NOP                           ; %if.then166
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 120(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 152(%GR7)
	STORE	%GR6, 192(%GR7)
	ADDI	%GR6, %GR7, 144
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 144(%GR7)
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR3, %GR1, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 184(%GR7)
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 176(%GR7)
	JUMP	.LBB56_55
.LBB56_55 NOP                           ; %do.body173
	ADDI	%GR6, %GR7, 200
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 200(%GR7)
	ADDI	%GR2, %GR1, -8
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	ADDI	%GR1, %GR7, 56
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 56(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 56(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 72
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_63
	JUMP	.LBB56_56
.LBB56_56 NOP                           ; %if.then177
	LOAD	%GR6, 232(%GR7)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 40(%GR7)
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	COPYI	%GR2, 40
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_62
	JUMP	.LBB56_57
.LBB56_57 NOP                           ; %if.then181
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	COPYI	%GR2, 56
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_61
	JUMP	.LBB56_58
.LBB56_58 NOP                           ; %if.then187
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 56(%GR7)
	COPYI	%GR2, 72
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_60
	JUMP	.LBB56_59
.LBB56_59 NOP                           ; %if.then193
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_60
.LBB56_60 NOP                           ; %if.end198
	JUMP	.LBB56_61
.LBB56_61 NOP                           ; %if.end199
	JUMP	.LBB56_62
.LBB56_62 NOP                           ; %if.end200
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 40(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_64
.LBB56_63 NOP                           ; %if.else205
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 232(%GR7)
	ADDI	%GR6, %GR7, 56
	ORI	%GR6, %GR6, 4
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 56(%GR7)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB56_64
.LBB56_64 NOP                           ; %if.end207
	JUMP	.LBB56_65
.LBB56_65 NOP                           ; %do.end208
	JUMP	.LBB56_84
.LBB56_66 NOP                           ; %if.end209
	JUMP	.LBB56_67
.LBB56_67 NOP                           ; %if.end210
	LOAD	%GR1, 240(%GR7)
	ADDI	%GR6, %GR7, 224
	ORI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR2, 224(%GR7)
	CALL	_malloc_r
	COPYR	%GR6, %RT0
	STORE	%GR6, 176(%GR7)
	LOAD	%GR6, 176(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_69
	JUMP	.LBB56_68
.LBB56_68 NOP                           ; %if.then213
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_unlock
	COPYI	%GR6, 0
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_69 NOP                           ; %if.end214
	LOAD	%GR6, 176(%GR7)
	ADDI	%GR6, %GR6, -16
	STORE	%GR6, 192(%GR7)
	LOAD	%GR1, 208(%GR7)
	ADDI	%GR2, %GR1, 8
	LOAD	%GR2, 0(%GR2)
	ANDI	%GR2, %GR2, -2
	ADD	%GR1, %GR1, %GR2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_71
	JUMP	.LBB56_70
.LBB56_70 NOP                           ; %if.then220
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, -4
	ADDI	%GR2, %GR7, 184
	ORI	%GR2, %GR2, 4
	LOAD	%GR3, 0(%GR2)
	LOAD	%GR4, 184(%GR7)
	ADD	%GR6, %GR3, %GR6
	ADD	%GR1, %GR4, %GR1
	ULT	%GR3, %GR1, %GR4
	ADD	%GR6, %GR6, %GR3
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 184(%GR7)
	LOAD	%GR6, 208(%GR7)
	STORE	%GR6, 192(%GR7)
	JUMP	.LBB56_84
.LBB56_71 NOP                           ; %if.end224
	JUMP	.LBB56_72
.LBB56_72 NOP                           ; %do.body225
	ADDI	%GR6, %GR7, 200
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 200(%GR7)
	ADDI	%GR2, %GR1, -8
	ULT	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	ADDI	%GR1, %GR7, 32
	ORI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	STORE	%GR2, 32(%GR7)
	LOAD	%GR6, 0(%GR1)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 0
	NEQ	%GR3, %GR6, %GR2
	COPYI	%GR4, 72
	UGT	%GR1, %GR1, %GR4
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR3, %GR6, %GR1
	BNEQZ	%GR3, .LBB56_80
	JUMP	.LBB56_73
.LBB56_73 NOP                           ; %if.then229
	LOAD	%GR6, 232(%GR7)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 16(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 40
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_79
	JUMP	.LBB56_74
.LBB56_74 NOP                           ; %if.then233
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 56
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_78
	JUMP	.LBB56_75
.LBB56_75 NOP                           ; %if.then239
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	COPYI	%GR2, 72
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_77
	JUMP	.LBB56_76
.LBB56_76 NOP                           ; %if.then245
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_77
.LBB56_77 NOP                           ; %if.end250
	JUMP	.LBB56_78
.LBB56_78 NOP                           ; %if.end251
	JUMP	.LBB56_79
.LBB56_79 NOP                           ; %if.end252
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 8
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 8
	STORE	%GR3, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	STORE	%GR1, 0(%GR2)
	JUMP	.LBB56_81
.LBB56_80 NOP                           ; %if.else257
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 232(%GR7)
	ADDI	%GR6, %GR7, 32
	ORI	%GR6, %GR6, 4
	LOAD	%GR4, 0(%GR6)
	LOAD	%GR3, 32(%GR7)
	CALL	memmove
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB56_81
.LBB56_81 NOP                           ; %if.end259
	JUMP	.LBB56_82
.LBB56_82 NOP                           ; %do.end260
	LOAD	%GR1, 240(%GR7)
	LOAD	%GR2, 232(%GR7)
	CALL	_free_r
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 176(%GR7)
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_83 NOP                           ; %if.end261
	JUMP	.LBB56_84
.LBB56_84 NOP                           ; %split
	ADDI	%GR6, %GR7, 184
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 184(%GR7)
	ADDI	%GR2, %GR7, 216
	ORI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	LOAD	%GR3, 216(%GR7)
	ULT	%GR4, %GR1, %GR3
	SUB	%GR6, %GR6, %GR2
	SUB	%GR6, %GR6, %GR4
	SUB	%GR1, %GR1, %GR3
	ADDI	%GR2, %GR7, 128
	ORI	%GR2, %GR2, 4
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 128(%GR7)
	LOAD	%GR6, 0(%GR2)
	LOAD	%GR1, 128(%GR7)
	COPYI	%GR2, 32
	ULT	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	CMOV	%GR2, %GR6, %GR1
	BNEQZ	%GR2, .LBB56_86
	JUMP	.LBB56_85
.LBB56_85 NOP                           ; %if.then264
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 216(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 136(%GR7)
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR1)
	ANDI	%GR2, %GR2, 1
	ADDI	%GR3, %GR7, 216
	ORI	%GR3, %GR3, 4
	LOAD	%GR3, 0(%GR3)
	LOAD	%GR4, 216(%GR7)
	OR	%GR2, %GR2, %GR4
	STORE	%GR3, 0(%GR6)
	STORE	%GR2, 0(%GR1)
	ADDI	%GR6, %GR7, 128
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 128(%GR7)
	ORI	%GR1, %GR1, 1
	LOAD	%GR2, 136(%GR7)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR3)
	LOAD	%GR6, 136(%GR7)
	LOAD	%GR1, 128(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	LOAD	%GR1, 240(%GR7)
	LOAD	%GR6, 136(%GR7)
	ADDI	%GR2, %GR6, 16
	CALL	_free_r
	JUMP	.LBB56_87
.LBB56_86 NOP                           ; %if.else276
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR1)
	ANDI	%GR2, %GR2, 1
	ADDI	%GR3, %GR7, 184
	ORI	%GR3, %GR3, 4
	LOAD	%GR3, 0(%GR3)
	LOAD	%GR4, 184(%GR7)
	OR	%GR2, %GR2, %GR4
	STORE	%GR3, 0(%GR6)
	STORE	%GR2, 0(%GR1)
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 184(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 8
	ADDI	%GR6, %GR6, 12
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR3, 0(%GR1)
	ORI	%GR3, %GR3, 1
	STORE	%GR2, 0(%GR6)
	STORE	%GR3, 0(%GR1)
	JUMP	.LBB56_87
.LBB56_87 NOP                           ; %if.end284
	LOAD	%GR1, 240(%GR7)
	CALL	__malloc_unlock
	LOAD	%GR6, 192(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR6, 248(%GR7)
	JUMP	.LBB56_88
.LBB56_88 NOP                           ; %return
	LOAD	%GR6, 248(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 252(%GR7)
	LOAD	%GR4, 256(%GR7)
	LOAD	%GR3, 260(%GR7)
	LOAD	%GR2, 264(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR7, %GR7, 272
	RET
.Lfunc_end56 NOP 
	.size	_realloc_r, .Lfunc_end56-_realloc_r
                                        ; -- End function
	.globl	strcmp                  ; -- Begin function strcmp
	.type	strcmp,@function
strcmp NOP                              ; @strcmp
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 16(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 16(%GR7)
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_7
	JUMP	.LBB57_1
.LBB57_1 NOP                            ; %if.then
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB57_2
.LBB57_2 NOP                            ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 0(%GR7)
	ADDI	%GR3, %GR2, 4
	LOAD	%GR3, 0(%GR3)
	LOAD	%GR2, 0(%GR2)
	XOR	%GR6, %GR6, %GR2
	XOR	%GR1, %GR1, %GR3
	OR	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_6
	JUMP	.LBB57_3
.LBB57_3 NOP                            ; %while.body
                                        ;   in Loop: Header=BB57_2 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR2, %GR6, -16843009
	ULT	%GR3, %GR2, %GR6
	ADD	%GR3, %GR1, %GR3
	ADDI	%GR3, %GR3, -16843010
	XORI	%GR1, %GR1, -1
	XORI	%GR6, %GR6, -1
	AND	%GR6, %GR2, %GR6
	AND	%GR1, %GR3, %GR1
	OR	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, -2139062144
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_5
	JUMP	.LBB57_4
.LBB57_4 NOP                            ; %if.then5
	COPYI	%GR6, 0
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB57_13
.LBB57_5 NOP                            ; %if.end
                                        ;   in Loop: Header=BB57_2 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB57_2
.LBB57_6 NOP                            ; %while.end
	LOAD	%GR6, 8(%GR7)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 0(%GR7)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB57_7
.LBB57_7 NOP                            ; %if.end7
	JUMP	.LBB57_8
.LBB57_8 NOP                            ; %while.cond8
                                        ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 24(%GR7)
	LOADB	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB57_10
	JUMP	.LBB57_9
.LBB57_9 NOP                            ; %land.rhs
                                        ;   in Loop: Header=BB57_8 Depth=1
	LOAD	%GR6, 24(%GR7)
	LOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	LOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB57_10
.LBB57_10 NOP                           ; %land.end
                                        ;   in Loop: Header=BB57_8 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_12
	JUMP	.LBB57_11
.LBB57_11 NOP                           ; %while.body15
                                        ;   in Loop: Header=BB57_8 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB57_8
.LBB57_12 NOP                           ; %while.end18
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB57_13
.LBB57_13 NOP                           ; %return
	LOAD	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end57 NOP 
	.size	strcmp, .Lfunc_end57-strcmp
                                        ; -- End function
	.type	__swbuf_r,@function     ; -- Begin function __swbuf_r
__swbuf_r NOP                           ; @__swbuf_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 20(%GR7)
	STORE	%GR3, 16(%GR7)
	JUMP	.LBB58_1
.LBB58_1 NOP                            ; %do.body
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_4
	JUMP	.LBB58_2
.LBB58_2 NOP                            ; %land.lhs.true
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 56
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_4
	JUMP	.LBB58_3
.LBB58_3 NOP                            ; %if.then
	LOAD	%GR1, 8(%GR7)
	CALL	__sinit
	JUMP	.LBB58_4
.LBB58_4 NOP                            ; %if.end
	JUMP	.LBB58_5
.LBB58_5 NOP                            ; %do.end
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 24
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_7
	JUMP	.LBB58_6
.LBB58_6 NOP                            ; %lor.lhs.false
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_9
	JUMP	.LBB58_7
.LBB58_7 NOP                            ; %land.lhs.true5
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	__swsetup_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_9
	JUMP	.LBB58_8
.LBB58_8 NOP                            ; %if.then7
	COPYI	%GR6, -1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB58_24
.LBB58_9 NOP                            ; %if.end8
	ULOADB	%GR6, 20(%GR7)
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB58_10
.LBB58_10 NOP                           ; %do.body11
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_12
	JUMP	.LBB58_11
.LBB58_11 NOP                           ; %if.then16
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8192
	STOREH	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 104
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -8193
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB58_12
.LBB58_12 NOP                           ; %if.end21
	JUMP	.LBB58_13
.LBB58_13 NOP                           ; %do.end22
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 20
	LOAD	%GR1, 0(%GR1)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_17
	JUMP	.LBB58_14
.LBB58_14 NOP                           ; %if.then29
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_16
	JUMP	.LBB58_15
.LBB58_15 NOP                           ; %if.then32
	COPYI	%GR6, -1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB58_24
.LBB58_16 NOP                           ; %if.end33
	COPYI	%GR6, 0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB58_17
.LBB58_17 NOP                           ; %if.end34
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR1)
	STOREB	%GR6, 0(%GR2)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 20
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_20
	JUMP	.LBB58_18
.LBB58_18 NOP                           ; %lor.lhs.false42
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_23
	JUMP	.LBB58_19
.LBB58_19 NOP                           ; %land.lhs.true47
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_23
	JUMP	.LBB58_20
.LBB58_20 NOP                           ; %if.then50
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	_fflush_r
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB58_22
	JUMP	.LBB58_21
.LBB58_21 NOP                           ; %if.then53
	COPYI	%GR6, -1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB58_24
.LBB58_22 NOP                           ; %if.end54
	JUMP	.LBB58_23
.LBB58_23 NOP                           ; %if.end55
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB58_24
.LBB58_24 NOP                           ; %return
	LOAD	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end58 NOP 
	.size	__swbuf_r, .Lfunc_end58-__swbuf_r
                                        ; -- End function
	.type	_wcrtomb_r,@function    ; -- Begin function _wcrtomb_r
_wcrtomb_r NOP                          ; @_wcrtomb_r
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 24(%GR7)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB59_2
	JUMP	.LBB59_1
.LBB59_1 NOP                            ; %if.then
	CALL	__get_current_locale.99
	COPYI	%GR6, __global_locale
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR4, 16(%GR7)
	ADDI	%GR2, %GR7, 0
	COPYI	%GR3, 0
	CALL	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB59_3
.LBB59_2 NOP                            ; %if.else
	CALL	__get_current_locale.99
	COPYI	%GR6, __global_locale
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR4, 16(%GR7)
	CALL	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB59_3
.LBB59_3 NOP                            ; %if.end
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_5
	JUMP	.LBB59_4
.LBB59_4 NOP                            ; %if.then7
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 40(%GR7)
	JUMP	.LBB59_6
.LBB59_5 NOP                            ; %if.else8
	LOAD	%GR6, 12(%GR7)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB59_6
.LBB59_6 NOP                            ; %return
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end59 NOP 
	.size	_wcrtomb_r, .Lfunc_end59-_wcrtomb_r
                                        ; -- End function
	.type	__get_current_locale.99,@function ; -- Begin function __get_current_locale.99
__get_current_locale.99 NOP             ; @__get_current_locale.99
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 0
	CALL	__get_global_locale.100
	ADDI	%GR7, %GR7, 0
	RET
.Lfunc_end60 NOP 
	.size	__get_current_locale.99, .Lfunc_end60-__get_current_locale.99
                                        ; -- End function
	.type	__get_global_locale.100,@function ; -- Begin function __get_global_locale.100
__get_global_locale.100 NOP             ; @__get_global_locale.100
; %bb.0:                                ; %entry
	RET
.Lfunc_end61 NOP 
	.size	__get_global_locale.100, .Lfunc_end61-__get_global_locale.100
                                        ; -- End function
	.globl	wcrtomb                 ; -- Begin function wcrtomb
	.type	wcrtomb,@function
wcrtomb NOP                             ; @wcrtomb
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 28(%GR7)
	STORE	%GR3, 24(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	COPYI	%GR1, impure_data
	STORE	%GR1, 16(%GR7)
	LOAD	%GR1, 32(%GR7)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB62_2
	JUMP	.LBB62_1
.LBB62_1 NOP                            ; %if.then
	CALL	__get_current_locale.99
	COPYI	%GR6, __global_locale
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR4, 24(%GR7)
	ADDI	%GR2, %GR7, 4
	COPYI	%GR3, 0
	CALL	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB62_3
.LBB62_2 NOP                            ; %if.else
	CALL	__get_current_locale.99
	COPYI	%GR6, __global_locale
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR3, 28(%GR7)
	LOAD	%GR4, 24(%GR7)
	CALL	%GR6
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB62_3
.LBB62_3 NOP                            ; %if.end
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB62_5
	JUMP	.LBB62_4
.LBB62_4 NOP                            ; %if.then7
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	COPYI	%GR1, -1
	STORE	%GR1, 0(%GR6)
	STORE	%GR1, 40(%GR7)
	JUMP	.LBB62_6
.LBB62_5 NOP                            ; %if.else8
	LOAD	%GR6, 20(%GR7)
	SRAI	%GR1, %GR6, 31
	ADDI	%GR2, %GR7, 40
	ORI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB62_6
.LBB62_6 NOP                            ; %return
	ADDI	%GR6, %GR7, 40
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 40(%GR7)
	COPYR	%RT0, %GR1
	COPYR	%RT1, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end62 NOP 
	.size	wcrtomb, .Lfunc_end62-wcrtomb
                                        ; -- End function
	.type	__ascii_wctomb,@function ; -- Begin function __ascii_wctomb
__ascii_wctomb NOP                      ; @__ascii_wctomb
; %bb.0:                                ; %entry
	SUBI	%GR7, %GR7, 40
	STORE	%GR1, 36(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 12(%GR7)
	STORE	%GR4, 8(%GR7)
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB63_2
	JUMP	.LBB63_1
.LBB63_1 NOP                            ; %if.then
	COPYI	%GR6, 0
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB63_5
.LBB63_2 NOP                            ; %if.end
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 256
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB63_4
	JUMP	.LBB63_3
.LBB63_3 NOP                            ; %if.then3
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 138
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, -1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB63_5
.LBB63_4 NOP                            ; %if.end4
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 16(%GR7)
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STORE	%GR6, 32(%GR7)
	JUMP	.LBB63_5
.LBB63_5 NOP                            ; %return
	LOAD	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 36(%GR7)
	ADDI	%GR7, %GR7, 40
	RET
.Lfunc_end63 NOP 
	.size	__ascii_wctomb, .Lfunc_end63-__ascii_wctomb
                                        ; -- End function
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"%d%d\n"
	.size	.L.str, 6

	.type	.L.str.3,@object        ; @.str.3
.L.str.3 NOP 
	.asciz	"hacking\n"
	.size	.L.str.3, 9

	.type	.L.str.6,@object        ; @.str.6
.L.str.6 NOP 
	.asciz	"0123456789abcdef"
	.size	.L.str.6, 17

	.type	.L.str.1,@object        ; @.str.1
.L.str.1 NOP 
	.asciz	"(null)"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        ; @.str.2
.L.str.2 NOP 
	.asciz	"0123456789ABCDEF"
	.size	.L.str.2, 17

	.type	.L.str.3.7,@object      ; @.str.3.7
.L.str.3.7 NOP 
	.asciz	"bug in vfprintf: bad base"
	.size	.L.str.3.7, 26

	.type	_vfprintf_r.blanks,@object ; @_vfprintf_r.blanks
	.rodata
	.p2align	4
_vfprintf_r.blanks NOP 
	.zero	16,32
	.size	_vfprintf_r.blanks, 16

	.type	_vfprintf_r.zeroes,@object ; @_vfprintf_r.zeroes
	.p2align	4
_vfprintf_r.zeroes NOP 
	.zero	16,48
	.size	_vfprintf_r.zeroes, 16

	.type	_impure_ptr,@object     ; @_impure_ptr
	.p2align	3
_impure_ptr NOP 
	.long	impure_data
	.size	_impure_ptr, 4

	.type	impure_data,@object     ; @impure_data
	.data
	.p2align	3
impure_data NOP 
	.long	0                       ; 0x0
	.long	impure_data+1336
	.long	impure_data+1512
	.long	impure_data+1688
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
	.zero	144
	.long	0
	.zero	400
	.long	0
	.zero	12
	.zero	324
	.size	impure_data, 1180

	.type	__malloc_av_,@object    ; @__malloc_av_
	.p2align	4
__malloc_av_ NOP 
	.long	0
	.long	0
	.long	__malloc_av_
	.long	__malloc_av_
	.long	__malloc_av_+16
	.long	__malloc_av_+16
	.long	__malloc_av_+32
	.long	__malloc_av_+32
	.long	__malloc_av_+48
	.long	__malloc_av_+48
	.long	__malloc_av_+64
	.long	__malloc_av_+64
	.long	__malloc_av_+80
	.long	__malloc_av_+80
	.long	__malloc_av_+96
	.long	__malloc_av_+96
	.long	__malloc_av_+112
	.long	__malloc_av_+112
	.long	__malloc_av_+128
	.long	__malloc_av_+128
	.long	__malloc_av_+144
	.long	__malloc_av_+144
	.long	__malloc_av_+160
	.long	__malloc_av_+160
	.long	__malloc_av_+176
	.long	__malloc_av_+176
	.long	__malloc_av_+192
	.long	__malloc_av_+192
	.long	__malloc_av_+208
	.long	__malloc_av_+208
	.long	__malloc_av_+224
	.long	__malloc_av_+224
	.long	__malloc_av_+240
	.long	__malloc_av_+240
	.long	__malloc_av_+256
	.long	__malloc_av_+256
	.long	__malloc_av_+272
	.long	__malloc_av_+272
	.long	__malloc_av_+288
	.long	__malloc_av_+288
	.long	__malloc_av_+304
	.long	__malloc_av_+304
	.long	__malloc_av_+320
	.long	__malloc_av_+320
	.long	__malloc_av_+336
	.long	__malloc_av_+336
	.long	__malloc_av_+352
	.long	__malloc_av_+352
	.long	__malloc_av_+368
	.long	__malloc_av_+368
	.long	__malloc_av_+384
	.long	__malloc_av_+384
	.long	__malloc_av_+400
	.long	__malloc_av_+400
	.long	__malloc_av_+416
	.long	__malloc_av_+416
	.long	__malloc_av_+432
	.long	__malloc_av_+432
	.long	__malloc_av_+448
	.long	__malloc_av_+448
	.long	__malloc_av_+464
	.long	__malloc_av_+464
	.long	__malloc_av_+480
	.long	__malloc_av_+480
	.long	__malloc_av_+496
	.long	__malloc_av_+496
	.long	__malloc_av_+512
	.long	__malloc_av_+512
	.long	__malloc_av_+528
	.long	__malloc_av_+528
	.long	__malloc_av_+544
	.long	__malloc_av_+544
	.long	__malloc_av_+560
	.long	__malloc_av_+560
	.long	__malloc_av_+576
	.long	__malloc_av_+576
	.long	__malloc_av_+592
	.long	__malloc_av_+592
	.long	__malloc_av_+608
	.long	__malloc_av_+608
	.long	__malloc_av_+624
	.long	__malloc_av_+624
	.long	__malloc_av_+640
	.long	__malloc_av_+640
	.long	__malloc_av_+656
	.long	__malloc_av_+656
	.long	__malloc_av_+672
	.long	__malloc_av_+672
	.long	__malloc_av_+688
	.long	__malloc_av_+688
	.long	__malloc_av_+704
	.long	__malloc_av_+704
	.long	__malloc_av_+720
	.long	__malloc_av_+720
	.long	__malloc_av_+736
	.long	__malloc_av_+736
	.long	__malloc_av_+752
	.long	__malloc_av_+752
	.long	__malloc_av_+768
	.long	__malloc_av_+768
	.long	__malloc_av_+784
	.long	__malloc_av_+784
	.long	__malloc_av_+800
	.long	__malloc_av_+800
	.long	__malloc_av_+816
	.long	__malloc_av_+816
	.long	__malloc_av_+832
	.long	__malloc_av_+832
	.long	__malloc_av_+848
	.long	__malloc_av_+848
	.long	__malloc_av_+864
	.long	__malloc_av_+864
	.long	__malloc_av_+880
	.long	__malloc_av_+880
	.long	__malloc_av_+896
	.long	__malloc_av_+896
	.long	__malloc_av_+912
	.long	__malloc_av_+912
	.long	__malloc_av_+928
	.long	__malloc_av_+928
	.long	__malloc_av_+944
	.long	__malloc_av_+944
	.long	__malloc_av_+960
	.long	__malloc_av_+960
	.long	__malloc_av_+976
	.long	__malloc_av_+976
	.long	__malloc_av_+992
	.long	__malloc_av_+992
	.long	__malloc_av_+1008
	.long	__malloc_av_+1008
	.long	__malloc_av_+1024
	.long	__malloc_av_+1024
	.long	__malloc_av_+1040
	.long	__malloc_av_+1040
	.long	__malloc_av_+1056
	.long	__malloc_av_+1056
	.long	__malloc_av_+1072
	.long	__malloc_av_+1072
	.long	__malloc_av_+1088
	.long	__malloc_av_+1088
	.long	__malloc_av_+1104
	.long	__malloc_av_+1104
	.long	__malloc_av_+1120
	.long	__malloc_av_+1120
	.long	__malloc_av_+1136
	.long	__malloc_av_+1136
	.long	__malloc_av_+1152
	.long	__malloc_av_+1152
	.long	__malloc_av_+1168
	.long	__malloc_av_+1168
	.long	__malloc_av_+1184
	.long	__malloc_av_+1184
	.long	__malloc_av_+1200
	.long	__malloc_av_+1200
	.long	__malloc_av_+1216
	.long	__malloc_av_+1216
	.long	__malloc_av_+1232
	.long	__malloc_av_+1232
	.long	__malloc_av_+1248
	.long	__malloc_av_+1248
	.long	__malloc_av_+1264
	.long	__malloc_av_+1264
	.long	__malloc_av_+1280
	.long	__malloc_av_+1280
	.long	__malloc_av_+1296
	.long	__malloc_av_+1296
	.long	__malloc_av_+1312
	.long	__malloc_av_+1312
	.long	__malloc_av_+1328
	.long	__malloc_av_+1328
	.long	__malloc_av_+1344
	.long	__malloc_av_+1344
	.long	__malloc_av_+1360
	.long	__malloc_av_+1360
	.long	__malloc_av_+1376
	.long	__malloc_av_+1376
	.long	__malloc_av_+1392
	.long	__malloc_av_+1392
	.long	__malloc_av_+1408
	.long	__malloc_av_+1408
	.long	__malloc_av_+1424
	.long	__malloc_av_+1424
	.long	__malloc_av_+1440
	.long	__malloc_av_+1440
	.long	__malloc_av_+1456
	.long	__malloc_av_+1456
	.long	__malloc_av_+1472
	.long	__malloc_av_+1472
	.long	__malloc_av_+1488
	.long	__malloc_av_+1488
	.long	__malloc_av_+1504
	.long	__malloc_av_+1504
	.long	__malloc_av_+1520
	.long	__malloc_av_+1520
	.long	__malloc_av_+1536
	.long	__malloc_av_+1536
	.long	__malloc_av_+1552
	.long	__malloc_av_+1552
	.long	__malloc_av_+1568
	.long	__malloc_av_+1568
	.long	__malloc_av_+1584
	.long	__malloc_av_+1584
	.long	__malloc_av_+1600
	.long	__malloc_av_+1600
	.long	__malloc_av_+1616
	.long	__malloc_av_+1616
	.long	__malloc_av_+1632
	.long	__malloc_av_+1632
	.long	__malloc_av_+1648
	.long	__malloc_av_+1648
	.long	__malloc_av_+1664
	.long	__malloc_av_+1664
	.long	__malloc_av_+1680
	.long	__malloc_av_+1680
	.long	__malloc_av_+1696
	.long	__malloc_av_+1696
	.long	__malloc_av_+1712
	.long	__malloc_av_+1712
	.long	__malloc_av_+1728
	.long	__malloc_av_+1728
	.long	__malloc_av_+1744
	.long	__malloc_av_+1744
	.long	__malloc_av_+1760
	.long	__malloc_av_+1760
	.long	__malloc_av_+1776
	.long	__malloc_av_+1776
	.long	__malloc_av_+1792
	.long	__malloc_av_+1792
	.long	__malloc_av_+1808
	.long	__malloc_av_+1808
	.long	__malloc_av_+1824
	.long	__malloc_av_+1824
	.long	__malloc_av_+1840
	.long	__malloc_av_+1840
	.long	__malloc_av_+1856
	.long	__malloc_av_+1856
	.long	__malloc_av_+1872
	.long	__malloc_av_+1872
	.long	__malloc_av_+1888
	.long	__malloc_av_+1888
	.long	__malloc_av_+1904
	.long	__malloc_av_+1904
	.long	__malloc_av_+1920
	.long	__malloc_av_+1920
	.long	__malloc_av_+1936
	.long	__malloc_av_+1936
	.long	__malloc_av_+1952
	.long	__malloc_av_+1952
	.long	__malloc_av_+1968
	.long	__malloc_av_+1968
	.long	__malloc_av_+1984
	.long	__malloc_av_+1984
	.long	__malloc_av_+2000
	.long	__malloc_av_+2000
	.long	__malloc_av_+2016
	.long	__malloc_av_+2016
	.long	__malloc_av_+2032
	.long	__malloc_av_+2032
	.size	__malloc_av_, 1032

	.type	__malloc_sbrk_base,@object ; @__malloc_sbrk_base
	.p2align	3
__malloc_sbrk_base NOP 
	.long	4294967295
	.size	__malloc_sbrk_base, 4

	.type	__malloc_max_sbrked_mem,@object ; @__malloc_max_sbrked_mem
	.local	__malloc_max_sbrked_mem
	.comm	__malloc_max_sbrked_mem,8,8
	.type	__malloc_max_total_mem,@object ; @__malloc_max_total_mem
	.local	__malloc_max_total_mem
	.comm	__malloc_max_total_mem,8,8
	.type	.L.str.2.75,@object     ; @.str.2.75
	.rodata.str1.1
.L.str.2.75 NOP 
	.asciz	"POSIX"
	.size	.L.str.2.75, 6

	.type	.L.str.3.76,@object     ; @.str.3.76
.L.str.3.76 NOP 
	.asciz	"C"
	.size	.L.str.3.76, 2

	.type	.L.str.1.77,@object     ; @.str.1.77
.L.str.1.77 NOP 
	.zero	1
	.size	.L.str.1.77, 1

	.type	__global_locale,@object ; @__global_locale
	.rodata
	.p2align	3
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
	.long	.L.str.80
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
	.long	.L.str.1.77
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

	.type	.L.str.80,@object       ; @.str.80
	.rodata.str1.1
.L.str.80 NOP 
	.asciz	"."
	.size	.L.str.80, 2

	.type	errno,@object           ; @errno
	.comm	errno,4,4
	.type	_ctype_b,@object        ; @_ctype_b
	.rodata
	.p2align	4
_ctype_b NOP 
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000         (((((                  \210\020\020\020\020\020\020\020\020\020\020\020\020\020\020\020\004\004\004\004\004\004\004\004\004\004\020\020\020\020\020\020\020AAAAAA\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\020\020\020\020\020\020BBBBBB\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\020\020\020\020 "
	.zero	128
	.size	_ctype_b, 384

	.type	__malloc_current_mallinfo.0,@object ; @__malloc_current_mallinfo.0
	.local	__malloc_current_mallinfo.0
	.comm	__malloc_current_mallinfo.0,4,4
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
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.ident	"clang version 10.0.0 "
	.note.GNU-stack
