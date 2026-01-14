	.text
	.file	"sed.c"
	.globl	main                    ; -- Begin function main
	.type	main,@function
main NOP                                ; @main
; %bb.0:
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	STORE	%GR1, 36(%GR7)
	STORE	%GR2, 32(%GR7)
	STORE	%GR6, 24(%GR7)
	STORE	%GR6, 20(%GR7)
	COPYI	%GR1, 66246
	CALL	re_set_syntax
                                        ; kill: def $gr6 killed $rt0
	COPYI	%GR6, myname
	COPYI	%GR1, .L.str.1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_1
.LBB0_1 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR1, 36(%GR7)
	LOAD	%GR2, 32(%GR7)
	COPYI	%GR3, .L.str.2
	COPYI	%GR4, longopts
	COPYI	%GR5, 0
	CALL	getopt_long
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_17
	JUMP	.LBB0_2
.LBB0_2 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 86
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB0_13
	JUMP	.LBB0_3
.LBB0_3 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 101
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB0_8
	JUMP	.LBB0_4
.LBB0_4 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 102
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB0_12
	JUMP	.LBB0_5
.LBB0_5 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 104
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB0_14
	JUMP	.LBB0_6
.LBB0_6 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 110
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_15
	JUMP	.LBB0_7
.LBB0_7 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR6, no_default_output
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_16
.LBB0_8 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_10
	JUMP	.LBB0_9
.LBB0_9 NOP                             ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR2, optarg
	LOAD	%GR1, 0(%GR2)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR6, 2
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%GR7)
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 0(%GR2)
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB0_11
.LBB0_10 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	LOAD	%GR3, 24(%GR7)
	COPYR	%GR1, %GR3
	CALL	strlen
	COPYR	%GR2, %RT0
	COPYI	%GR4, optarg
	LOAD	%GR1, 0(%GR4)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR2, %GR6, 2
	COPYR	%GR1, %GR3
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%GR7)
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 0(%GR4)
	CALL	strcat
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB0_11
.LBB0_11 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, .L.str.3
	CALL	strcat
                                        ; kill: def $gr6 killed $rt0
	COPYI	%GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB0_16
.LBB0_12 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR6, optarg
	LOAD	%GR1, 0(%GR6)
	CALL	compile_file
	COPYI	%GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB0_16
.LBB0_13 NOP 
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, version_string
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.4
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	COPYI	%GR1, 0
	CALL	exit
.LBB0_14 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 0
	CALL	usage
	JUMP	.LBB0_16
.LBB0_15 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	COPYI	%GR1, 4
	CALL	usage
	JUMP	.LBB0_16
.LBB0_16 NOP                            ;   in Loop: Header=BB0_1 Depth=1
	JUMP	.LBB0_1
.LBB0_17 NOP 
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_19
	JUMP	.LBB0_18
.LBB0_18 NOP 
	LOAD	%GR1, 24(%GR7)
	CALL	compile_string
	LOAD	%GR1, 24(%GR7)
	CALL	free
	JUMP	.LBB0_19
.LBB0_19 NOP 
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_23
	JUMP	.LBB0_20
.LBB0_20 NOP 
	COPYI	%GR6, optind
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_22
	JUMP	.LBB0_21
.LBB0_21 NOP 
	COPYI	%GR1, 4
	CALL	usage
	JUMP	.LBB0_22
.LBB0_22 NOP 
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, optind
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR1)
	SHLI	%GR1, %GR2, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	CALL	compile_string
	JUMP	.LBB0_23
.LBB0_23 NOP 
	COPYI	%GR6, jumps
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB0_24
.LBB0_24 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_26 Depth 2
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_37
	JUMP	.LBB0_25
.LBB0_25 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	COPYI	%GR6, labels
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB0_26
.LBB0_26 NOP                            ;   Parent Loop BB0_24 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_31
	JUMP	.LBB0_27
.LBB0_27 NOP                            ;   in Loop: Header=BB0_26 Depth=2
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_29
	JUMP	.LBB0_28
.LBB0_28 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	JUMP	.LBB0_32
.LBB0_29 NOP                            ;   in Loop: Header=BB0_26 Depth=2
	JUMP	.LBB0_30
.LBB0_30 NOP                            ;   in Loop: Header=BB0_26 Depth=2
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB0_26
.LBB0_31 NOP                            ; %.loopexit1
                                        ;   in Loop: Header=BB0_24 Depth=1
	JUMP	.LBB0_32
.LBB0_32 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_35
	JUMP	.LBB0_33
.LBB0_33 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_35
	JUMP	.LBB0_34
.LBB0_34 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.5
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB0_35
.LBB0_35 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 0(%GR1)
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	MULI	%GR1, %GR1, 56
	ADD	%GR1, %GR2, %GR1
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB0_36
.LBB0_36 NOP                            ;   in Loop: Header=BB0_24 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB0_24
.LBB0_37 NOP 
	COPYI	%GR2, line
	COPYI	%GR3, 0
	STORE	%GR3, 0(%GR2)
	COPYI	%GR1, 50
	STORE	%GR1, 0(%GR2)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR2)
	COPYI	%GR2, append
	STORE	%GR3, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR2)
	COPYI	%GR2, hold
	COPYI	%GR6, 1
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 0(%GR2)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR2)
	LOAD	%GR6, 0(%GR2)
	COPYI	%GR1, 10
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 36(%GR7)
	COPYI	%GR1, optind
	LOAD	%GR1, 0(%GR1)
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_39
	JUMP	.LBB0_38
.LBB0_38 NOP 
	COPYI	%GR6, last_input_file
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR1, .L.str.6
	CALL	read_file
	JUMP	.LBB0_48
.LBB0_39 NOP 
	JUMP	.LBB0_40
.LBB0_40 NOP                            ; =>This Inner Loop Header: Depth=1
	COPYI	%GR6, optind
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%GR7)
	GTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_46
	JUMP	.LBB0_41
.LBB0_41 NOP                            ;   in Loop: Header=BB0_40 Depth=1
	COPYI	%GR6, optind
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 36(%GR7)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_43
	JUMP	.LBB0_42
.LBB0_42 NOP                            ;   in Loop: Header=BB0_40 Depth=1
	COPYI	%GR6, last_input_file
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB0_43
.LBB0_43 NOP                            ;   in Loop: Header=BB0_40 Depth=1
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR2, optind
	LOAD	%GR1, 0(%GR2)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	CALL	read_file
	LOAD	%GR6, 0(%GR2)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR2)
	COPYI	%GR6, quit_cmd
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_45
	JUMP	.LBB0_44
.LBB0_44 NOP 
	JUMP	.LBB0_47
.LBB0_45 NOP                            ;   in Loop: Header=BB0_40 Depth=1
	JUMP	.LBB0_40
.LBB0_46 NOP                            ; %.loopexit
	JUMP	.LBB0_47
.LBB0_47 NOP 
	JUMP	.LBB0_48
.LBB0_48 NOP 
	CALL	close_files
	COPYI	%GR6, bad_input
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB0_50
	JUMP	.LBB0_49
.LBB0_49 NOP 
	COPYI	%GR1, 2
	CALL	exit
.LBB0_50 NOP 
	COPYI	%GR1, 0
	CALL	exit
.Lfunc_end0 NOP 
	.size	main, .Lfunc_end0-main
                                        ; -- End function
	.globl	re_set_syntax           ; -- Begin function re_set_syntax
	.type	re_set_syntax,@function
re_set_syntax NOP                       ; @re_set_syntax
; %bb.0:
	SUBI	%GR7, %GR7, 12
	STORE	%GR1, 8(%GR7)
	STORE	%GR1, 4(%GR7)
	COPYI	%GR6, re_syntax_options
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 0(%GR7)
	LOAD	%GR1, 4(%GR7)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR7, %GR7, 12
	RET
.Lfunc_end1 NOP 
	.size	re_set_syntax, .Lfunc_end1-re_set_syntax
                                        ; -- End function
	.globl	ck_malloc               ; -- Begin function ck_malloc
	.type	ck_malloc,@function
ck_malloc NOP                           ; @ck_malloc
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB2_2
	JUMP	.LBB2_1
.LBB2_1 NOP 
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB2_2
.LBB2_2 NOP 
	LOAD	%GR1, 8(%GR7)
	CALL	malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB2_4
	JUMP	.LBB2_3
.LBB2_3 NOP 
	COPYI	%GR6, .L.str.48
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB2_4
.LBB2_4 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end2 NOP 
	.size	ck_malloc, .Lfunc_end2-ck_malloc
                                        ; -- End function
	.globl	ck_realloc              ; -- Begin function ck_realloc
	.type	ck_realloc,@function
ck_realloc NOP                          ; @ck_realloc
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB3_2
	JUMP	.LBB3_1
.LBB3_1 NOP 
	COPYI	%GR6, .L.str.49
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB3_2
.LBB3_2 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end3 NOP 
	.size	ck_realloc, .Lfunc_end3-ck_realloc
                                        ; -- End function
	.globl	compile_file            ; -- Begin function compile_file
	.type	compile_file,@function
compile_file NOP                        ; @compile_file
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	COPYI	%GR6, prog_end
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, prog_cur
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, prog_start
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, prog_name
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, prog_line
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_3
	JUMP	.LBB4_1
.LBB4_1 NOP 
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_3
	JUMP	.LBB4_2
.LBB4_2 NOP 
	COPYI	%GR6, stdin
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, prog_file
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB4_4
.LBB4_3 NOP 
	LOAD	%GR1, 16(%GR7)
	COPYI	%GR2, .L.str.7
	CALL	ck_fopen
	COPYR	%GR6, %RT0
	COPYI	%GR1, prog_file
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB4_4
.LBB4_4 NOP 
	COPYI	%GR6, prog_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 35
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_13
	JUMP	.LBB4_5
.LBB4_5 NOP 
	COPYI	%GR6, prog_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 110
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_7
	JUMP	.LBB4_6
.LBB4_6 NOP 
	COPYI	%GR6, no_default_output
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB4_7
.LBB4_7 NOP 
	JUMP	.LBB4_8
.LBB4_8 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB4_10
	JUMP	.LBB4_9
.LBB4_9 NOP                             ;   in Loop: Header=BB4_8 Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB4_10
.LBB4_10 NOP                            ;   in Loop: Header=BB4_8 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_12
	JUMP	.LBB4_11
.LBB4_11 NOP                            ;   in Loop: Header=BB4_8 Depth=1
	COPYI	%GR6, prog_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB4_8
.LBB4_12 NOP 
	COPYI	%GR6, prog_line
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB4_16
.LBB4_13 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB4_15
	JUMP	.LBB4_14
.LBB4_14 NOP 
	LOAD	%GR1, 12(%GR7)
	COPYI	%GR6, prog_file
	LOAD	%GR2, 0(%GR6)
	CALL	ungetc
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB4_15
.LBB4_15 NOP 
	JUMP	.LBB4_16
.LBB4_16 NOP 
	COPYI	%GR3, the_program
	LOAD	%GR1, 0(%GR3)
	COPYI	%GR6, prog_line
	LOAD	%GR2, 0(%GR6)
	CALL	compile_program
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end4 NOP 
	.size	compile_file, .Lfunc_end4-compile_file
                                        ; -- End function
	.globl	usage                   ; -- Begin function usage
	.type	usage,@function
usage NOP                               ; @usage
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB5_2
	JUMP	.LBB5_1
.LBB5_1 NOP 
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB5_3
.LBB5_2 NOP 
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB5_3
.LBB5_3 NOP 
	COPYI	%GR1, myname
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.41
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR1, 20(%GR7)
	CALL	exit
.Lfunc_end5 NOP 
	.size	usage, .Lfunc_end5-usage
                                        ; -- End function
	.globl	compile_string          ; -- Begin function compile_string
	.type	compile_string,@function
compile_string NOP                      ; @compile_string
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	STORE	%GR1, 0(%GR7)
	COPYI	%GR6, prog_file
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR2, prog_line
	STORE	%GR1, 0(%GR2)
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, prog_cur
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, prog_start
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 0(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADD	%GR6, %GR1, %GR6
	COPYI	%GR1, prog_end
	STORE	%GR6, 0(%GR1)
	COPYI	%GR3, the_program
	LOAD	%GR1, 0(%GR3)
	LOAD	%GR2, 0(%GR2)
	CALL	compile_program
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	LOAD	%GR3, 4(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end6 NOP 
	.size	compile_string, .Lfunc_end6-compile_string
                                        ; -- End function
	.globl	panic                   ; -- Begin function panic
	.type	panic,@function
panic NOP                               ; @panic
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR4, stdout
	LOAD	%GR6, 0(%GR4)
	COPYI	%GR1, myname
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.42
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	ADDI	%GR6, %GR7, 36
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR3, 12(%GR7)
	CALL	vfprintf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR2, 0(%GR4)
	COPYI	%GR1, 10
	CALL	_IO_putc
                                        ; kill: def $gr6 killed $rt0
	COPYI	%GR1, 4
	CALL	exit
.Lfunc_end7 NOP 
	.size	panic, .Lfunc_end7-panic
                                        ; -- End function
	.globl	read_file               ; -- Begin function read_file
	.type	read_file,@function
read_file NOP                           ; @read_file
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR5, 28(%GR7)
	STORE	%GR1, 24(%GR7)
	LOAD	%GR6, 24(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_3
	JUMP	.LBB8_1
.LBB8_1 NOP 
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_3
	JUMP	.LBB8_2
.LBB8_2 NOP 
	COPYI	%GR6, stdin
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, input_file
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB8_6
.LBB8_3 NOP 
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, .L.str.7
	CALL	fopen
	COPYR	%GR6, %RT0
	COPYI	%GR1, input_file
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR1)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_5
	JUMP	.LBB8_4
.LBB8_4 NOP 
	CALL	__errno_location
	COPYR	%GR6, %RT0
	LOAD	%GR1, 0(%GR6)
	CALL	strerror
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	COPYI	%GR6, bad_input
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, myname
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	ADDI	%GR4, %GR7, 16
	STORE	%GR3, 0(%GR4)
	ADDI	%GR3, %GR7, 12
	STORE	%GR2, 0(%GR3)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.27
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB8_17
.LBB8_5 NOP 
	JUMP	.LBB8_6
.LBB8_6 NOP 
	JUMP	.LBB8_7
.LBB8_7 NOP                             ; =>This Inner Loop Header: Depth=1
	CALL	read_pattern_space
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_15
	JUMP	.LBB8_8
.LBB8_8 NOP                             ;   in Loop: Header=BB8_7 Depth=1
	COPYI	%GR6, the_program
	LOAD	%GR1, 0(%GR6)
	CALL	execute_program
	COPYI	%GR6, no_default_output
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_10
	JUMP	.LBB8_9
.LBB8_9 NOP                             ;   in Loop: Header=BB8_7 Depth=1
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB8_10
.LBB8_10 NOP                            ;   in Loop: Header=BB8_7 Depth=1
	COPYI	%GR6, append
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_12
	JUMP	.LBB8_11
.LBB8_11 NOP                            ;   in Loop: Header=BB8_7 Depth=1
	COPYI	%GR5, append
	LOAD	%GR1, 0(%GR5)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	COPYI	%GR6, 0
	STORE	%GR6, 0(%GR5)
	JUMP	.LBB8_12
.LBB8_12 NOP                            ;   in Loop: Header=BB8_7 Depth=1
	COPYI	%GR6, quit_cmd
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB8_14
	JUMP	.LBB8_13
.LBB8_13 NOP 
	JUMP	.LBB8_16
.LBB8_14 NOP                            ;   in Loop: Header=BB8_7 Depth=1
	JUMP	.LBB8_7
.LBB8_15 NOP                            ; %.loopexit
	JUMP	.LBB8_16
.LBB8_16 NOP 
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	ck_fclose
	JUMP	.LBB8_17
.LBB8_17 NOP 
	LOAD	%GR5, 28(%GR7)
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end8 NOP 
	.size	read_file, .Lfunc_end8-read_file
                                        ; -- End function
	.globl	close_files             ; -- Begin function close_files
	.type	close_files,@function
close_files NOP                         ; @close_files
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB9_1
.LBB9_1 NOP                             ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB9_6
	JUMP	.LBB9_2
.LBB9_2 NOP                             ;   in Loop: Header=BB9_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB9_4
	JUMP	.LBB9_3
.LBB9_3 NOP                             ;   in Loop: Header=BB9_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	CALL	fclose
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB9_4
.LBB9_4 NOP                             ;   in Loop: Header=BB9_1 Depth=1
	JUMP	.LBB9_5
.LBB9_5 NOP                             ;   in Loop: Header=BB9_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB9_1
.LBB9_6 NOP 
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end9 NOP 
	.size	close_files, .Lfunc_end9-close_files
                                        ; -- End function
	.globl	compile_program         ; -- Begin function compile_program
	.type	compile_program,@function
compile_program NOP                     ; @compile_program
; %bb.0:
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 36(%GR7)
	LOAD	%GR6, 40(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_2
	JUMP	.LBB10_1
.LBB10_1 NOP 
	COPYI	%GR1, 20
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 40(%GR7)
	COPYI	%GR1, 2240
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 40(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 40
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_2
.LBB10_2 NOP 
	JUMP	.LBB10_3
.LBB10_3 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB10_4 Depth 2
                                        ;       Child Loop BB10_5 Depth 3
                                        ;       Child Loop BB10_22 Depth 3
                                        ;       Child Loop BB10_39 Depth 3
                                        ;         Child Loop BB10_76 Depth 4
                                        ;       Child Loop BB10_68 Depth 3
                                        ;     Child Loop BB10_195 Depth 2
                                        ;     Child Loop BB10_199 Depth 2
                                        ;     Child Loop BB10_204 Depth 2
                                        ;     Child Loop BB10_140 Depth 2
                                        ;     Child Loop BB10_160 Depth 2
                                        ;       Child Loop BB10_181 Depth 3
                                        ;     Child Loop BB10_91 Depth 2
                                        ;     Child Loop BB10_123 Depth 2
	JUMP	.LBB10_4
.LBB10_4 NOP                            ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_5 Depth 3
                                        ;       Child Loop BB10_22 Depth 3
                                        ;       Child Loop BB10_39 Depth 3
                                        ;         Child Loop BB10_76 Depth 4
                                        ;       Child Loop BB10_68 Depth 3
	JUMP	.LBB10_5
.LBB10_5 NOP                            ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 28(%GR7)
	STORE	%GR6, 24(%GR7)
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_8
	JUMP	.LBB10_6
.LBB10_6 NOP                            ;   in Loop: Header=BB10_5 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_8
	JUMP	.LBB10_7
.LBB10_7 NOP                            ;   in Loop: Header=BB10_5 Depth=3
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_8
.LBB10_8 NOP                            ;   in Loop: Header=BB10_5 Depth=3
	JUMP	.LBB10_9
.LBB10_9 NOP                            ;   in Loop: Header=BB10_5 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_14
	JUMP	.LBB10_10
.LBB10_10 NOP                           ;   in Loop: Header=BB10_5 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR1, %GR6, 1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB10_13
	JUMP	.LBB10_11
.LBB10_11 NOP                           ;   in Loop: Header=BB10_5 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB10_13
	JUMP	.LBB10_12
.LBB10_12 NOP                           ;   in Loop: Header=BB10_5 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_13
.LBB10_13 NOP                           ;   in Loop: Header=BB10_5 Depth=3
	JUMP	.LBB10_14
.LBB10_14 NOP                           ;   in Loop: Header=BB10_5 Depth=3
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_5
	JUMP	.LBB10_15
.LBB10_15 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_17
	JUMP	.LBB10_16
.LBB10_16 NOP 
	JUMP	.LBB10_219
.LBB10_17 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR1, 28(%GR7)
	CALL	savchar
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB10_19
	JUMP	.LBB10_18
.LBB10_18 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 56
	ADDI	%GR2, %GR6, 2240
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 40(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 40
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_19
.LBB10_19 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 56
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 24
	STORE	%GR2, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 28
	STOREB	%GR2, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	CALL	compile_address
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB10_32
	JUMP	.LBB10_20
.LBB10_20 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 44
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_30
	JUMP	.LBB10_21
.LBB10_21 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_22
.LBB10_22 NOP                           ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_23
.LBB10_23 NOP                           ;   in Loop: Header=BB10_22 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_25
	JUMP	.LBB10_24
.LBB10_24 NOP                           ;   in Loop: Header=BB10_22 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB10_25
.LBB10_25 NOP                           ;   in Loop: Header=BB10_22 Depth=3
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_22
	JUMP	.LBB10_26
.LBB10_26 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR1, 28(%GR7)
	CALL	savchar
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 12
	CALL	compile_address
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_28
	JUMP	.LBB10_27
.LBB10_27 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_29
.LBB10_28 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	COPYI	%GR1, .L.str.8
	CALL	bad_prog
	JUMP	.LBB10_29
.LBB10_29 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_31
.LBB10_30 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR1, 28(%GR7)
	CALL	savchar
	JUMP	.LBB10_31
.LBB10_31 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_32
.LBB10_32 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_36
	JUMP	.LBB10_33
.LBB10_33 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_36
	JUMP	.LBB10_34
.LBB10_34 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 20
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	GTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB10_36
	JUMP	.LBB10_35
.LBB10_35 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 20
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_36
.LBB10_36 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_38
	JUMP	.LBB10_37
.LBB10_37 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	COPYI	%GR1, NO_COMMAND
	CALL	bad_prog
	JUMP	.LBB10_38
.LBB10_38 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_39
.LBB10_39 NOP                           ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB10_76 Depth 4
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 33
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_73
	JUMP	.LBB10_40
.LBB10_40 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	COPYI	%GR1, 35
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_65
	JUMP	.LBB10_41
.LBB10_41 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 58
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_114
	JUMP	.LBB10_42
.LBB10_42 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 61
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_118
	JUMP	.LBB10_43
.LBB10_43 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 68
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_44
.LBB10_44 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	ADDI	%GR1, %GR6, -71
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_45
.LBB10_45 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 78
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_46
.LBB10_46 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 80
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_47
.LBB10_47 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 97
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_83
	JUMP	.LBB10_48
.LBB10_48 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 98
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_117
	JUMP	.LBB10_49
.LBB10_49 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 99
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_86
	JUMP	.LBB10_50
.LBB10_50 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 100
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_51
.LBB10_51 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	ADDI	%GR1, %GR6, -103
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_52
.LBB10_52 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 105
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_83
	JUMP	.LBB10_53
.LBB10_53 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 108
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_54
.LBB10_54 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 110
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_55
.LBB10_55 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 112
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_56
.LBB10_56 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 113
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_118
	JUMP	.LBB10_57
.LBB10_57 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 114
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_134
	JUMP	.LBB10_58
.LBB10_58 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 115
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_139
	JUMP	.LBB10_59
.LBB10_59 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 116
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_117
	JUMP	.LBB10_60
.LBB10_60 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 119
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_137
	JUMP	.LBB10_61
.LBB10_61 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 120
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_121
	JUMP	.LBB10_62
.LBB10_62 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 121
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_194
	JUMP	.LBB10_63
.LBB10_63 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 123
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_100
	JUMP	.LBB10_64
.LBB10_64 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, 125
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_101
	JUMP	.LBB10_217
.LBB10_65 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_67
	JUMP	.LBB10_66
.LBB10_66 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	COPYI	%GR1, NO_ADDR
	CALL	bad_prog
	JUMP	.LBB10_67
.LBB10_67 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	JUMP	.LBB10_68
.LBB10_68 NOP                           ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_69
.LBB10_69 NOP                           ;   in Loop: Header=BB10_68 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_71
	JUMP	.LBB10_70
.LBB10_70 NOP                           ;   in Loop: Header=BB10_68 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_71
.LBB10_71 NOP                           ;   in Loop: Header=BB10_68 Depth=3
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_68
	JUMP	.LBB10_72
.LBB10_72 NOP                           ;   in Loop: Header=BB10_4 Depth=2
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_4
.LBB10_73 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 24
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_75
	JUMP	.LBB10_74
.LBB10_74 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	COPYI	%GR1, .L.str.9
	CALL	bad_prog
	JUMP	.LBB10_75
.LBB10_75 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_76
.LBB10_76 NOP                           ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_4 Depth=2
                                        ;       Parent Loop BB10_39 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_77
.LBB10_77 NOP                           ;   in Loop: Header=BB10_76 Depth=4
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_79
	JUMP	.LBB10_78
.LBB10_78 NOP                           ;   in Loop: Header=BB10_76 Depth=4
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB10_79
.LBB10_79 NOP                           ;   in Loop: Header=BB10_76 Depth=4
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_76
	JUMP	.LBB10_80
.LBB10_80 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_82
	JUMP	.LBB10_81
.LBB10_81 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	COPYI	%GR1, NO_COMMAND
	CALL	bad_prog
	JUMP	.LBB10_82
.LBB10_82 NOP                           ;   in Loop: Header=BB10_39 Depth=3
	JUMP	.LBB10_39
.LBB10_83 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_85
	JUMP	.LBB10_84
.LBB10_84 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, ONE_ADDR
	CALL	bad_prog
	JUMP	.LBB10_85
.LBB10_85 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_87
.LBB10_86 NOP                           ; %.loopexit
                                        ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_87
.LBB10_87 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	CALL	inchar
	COPYR	%GR6, %RT0
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_89
	JUMP	.LBB10_88
.LBB10_88 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_90
	JUMP	.LBB10_89
.LBB10_89 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, LINE_JUNK
	CALL	bad_prog
	JUMP	.LBB10_90
.LBB10_90 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB10_91
.LBB10_91 NOP                           ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_93
	JUMP	.LBB10_92
.LBB10_92 NOP                           ;   in Loop: Header=BB10_91 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_93
.LBB10_93 NOP                           ;   in Loop: Header=BB10_91 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_97
	JUMP	.LBB10_94
.LBB10_94 NOP                           ;   in Loop: Header=BB10_91 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_96
	JUMP	.LBB10_95
.LBB10_95 NOP                           ;   in Loop: Header=BB10_91 Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_96
.LBB10_96 NOP                           ;   in Loop: Header=BB10_91 Depth=2
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 28(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_91
.LBB10_97 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_99
	JUMP	.LBB10_98
.LBB10_98 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 28(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_99
.LBB10_99 NOP                           ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR1, 16(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR1, 8(%GR7)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	CALL	get_buffer
	COPYR	%GR1, %RT0
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR3, 8(%GR7)
	CALL	bcopy
	LOAD	%GR1, 16(%GR7)
	CALL	flush_buffer
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 36
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB10_218
.LBB10_100 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, program_depth
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, prog_line
	LOAD	%GR2, 0(%GR6)
	COPYI	%GR1, 0
	CALL	compile_program
	COPYR	%GR6, %RT0
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 40(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB10_218
.LBB10_101 NOP 
	COPYI	%GR6, program_depth
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_103
	JUMP	.LBB10_102
.LBB10_102 NOP 
	COPYI	%GR1, .L.str.10
	CALL	bad_prog
	JUMP	.LBB10_103
.LBB10_103 NOP 
	COPYI	%GR6, program_depth
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_105
	JUMP	.LBB10_104
.LBB10_104 NOP 
	COPYI	%GR1, .L.str.11
	CALL	bad_prog
	JUMP	.LBB10_105
.LBB10_105 NOP 
	JUMP	.LBB10_106
.LBB10_106 NOP                          ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_109
	JUMP	.LBB10_107
.LBB10_107 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_109
	JUMP	.LBB10_108
.LBB10_108 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_109
.LBB10_109 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_113
	JUMP	.LBB10_110
.LBB10_110 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_112
	JUMP	.LBB10_111
.LBB10_111 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	COPYI	%GR1, LINE_JUNK
	CALL	bad_prog
	JUMP	.LBB10_112
.LBB10_112 NOP                          ;   in Loop: Header=BB10_106 Depth=1
	JUMP	.LBB10_106
.LBB10_113 NOP 
	LOAD	%GR6, 40(%GR7)
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB10_222
.LBB10_114 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_116
	JUMP	.LBB10_115
.LBB10_115 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, .L.str.12
	CALL	bad_prog
	JUMP	.LBB10_116
.LBB10_116 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR4, labels
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR3, 40(%GR7)
	CALL	setup_jump
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR4)
	JUMP	.LBB10_218
.LBB10_117 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR4, jumps
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR3, 40(%GR7)
	CALL	setup_jump
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR4)
	JUMP	.LBB10_218
.LBB10_118 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_120
	JUMP	.LBB10_119
.LBB10_119 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, ONE_ADDR
	CALL	bad_prog
	JUMP	.LBB10_120
.LBB10_120 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_122
.LBB10_121 NOP                          ; %.loopexit1
                                        ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_122
.LBB10_122 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB10_123
.LBB10_123 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_124
.LBB10_124 NOP                          ;   in Loop: Header=BB10_123 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_128
	JUMP	.LBB10_125
.LBB10_125 NOP                          ;   in Loop: Header=BB10_123 Depth=2
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR1, %GR6, 1
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB10_128
	JUMP	.LBB10_126
.LBB10_126 NOP                          ;   in Loop: Header=BB10_123 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_128
	JUMP	.LBB10_127
.LBB10_127 NOP                          ;   in Loop: Header=BB10_123 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_128
.LBB10_128 NOP                          ;   in Loop: Header=BB10_123 Depth=2
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_123
	JUMP	.LBB10_129
.LBB10_129 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_133
	JUMP	.LBB10_130
.LBB10_130 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_133
	JUMP	.LBB10_131
.LBB10_131 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_133
	JUMP	.LBB10_132
.LBB10_132 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, LINE_JUNK
	CALL	bad_prog
	JUMP	.LBB10_133
.LBB10_133 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_218
.LBB10_134 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_136
	JUMP	.LBB10_135
.LBB10_135 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, ONE_ADDR
	CALL	bad_prog
	JUMP	.LBB10_136
.LBB10_136 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_138
.LBB10_137 NOP                          ; %.loopexit2
                                        ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_138
.LBB10_138 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 114
	EQ	%GR1, %GR6, %GR1
	CALL	compile_filename
	COPYR	%GR6, %RT0
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB10_218
.LBB10_139 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	LOAD	%GR1, 20(%GR7)
	CALL	compile_regex
	COPYI	%GR6, last_regex
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB10_140
.LBB10_140 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_143
	JUMP	.LBB10_141
.LBB10_141 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 20(%GR7)
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_143
	JUMP	.LBB10_142
.LBB10_142 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_143
.LBB10_143 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_152
	JUMP	.LBB10_144
.LBB10_144 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_150
	JUMP	.LBB10_145
.LBB10_145 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_149
	JUMP	.LBB10_146
.LBB10_146 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_148
	JUMP	.LBB10_147
.LBB10_147 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 28(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_148
.LBB10_148 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 4(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_149
.LBB10_149 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	JUMP	.LBB10_151
.LBB10_150 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 28(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_151
.LBB10_151 NOP                          ;   in Loop: Header=BB10_140 Depth=2
	JUMP	.LBB10_140
.LBB10_152 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 20(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_157
	JUMP	.LBB10_153
.LBB10_153 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_156
	JUMP	.LBB10_154
.LBB10_154 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR6, prog_line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 2
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_156
	JUMP	.LBB10_155
.LBB10_155 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR6, prog_line
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_156
.LBB10_156 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, .L.str.13
	CALL	bad_prog
	JUMP	.LBB10_157
.LBB10_157 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR1, 16(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 40
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 40
	LOAD	%GR1, 0(%GR6)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 36
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 16(%GR7)
	CALL	get_buffer
	COPYR	%GR1, %RT0
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR2, %GR6, 36
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR6, %GR6, 40
	LOAD	%GR3, 0(%GR6)
	CALL	bcopy
	LOAD	%GR1, 16(%GR7)
	CALL	flush_buffer
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 48
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_159
	JUMP	.LBB10_158
.LBB10_158 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_218
.LBB10_159 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_160
.LBB10_160 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB10_181 Depth 3
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_184
	JUMP	.LBB10_161
.LBB10_161 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_184
	JUMP	.LBB10_162
.LBB10_162 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	ADDI	%GR1, %GR6, -48
	COPYI	%GR2, 10
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB10_176
	JUMP	.LBB10_163
.LBB10_163 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, 59
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_184
	JUMP	.LBB10_164
.LBB10_164 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, 103
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_170
	JUMP	.LBB10_165
.LBB10_165 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, 112
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB10_167
	JUMP	.LBB10_166
.LBB10_166 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, 119
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_175
	JUMP	.LBB10_185
.LBB10_167 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_169
	JUMP	.LBB10_168
.LBB10_168 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, .L.str.14
	CALL	bad_prog
	JUMP	.LBB10_169
.LBB10_169 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_186
.LBB10_170 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_172
	JUMP	.LBB10_171
.LBB10_171 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -9
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_172
.LBB10_172 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_174
	JUMP	.LBB10_173
.LBB10_173 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, .L.str.15
	CALL	bad_prog
	JUMP	.LBB10_174
.LBB10_174 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_186
.LBB10_175 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STORE	%GR1, 0(%GR6)
	COPYI	%GR1, 0
	CALL	compile_filename
	COPYR	%GR6, %RT0
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 52
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 10
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_186
.LBB10_176 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_178
	JUMP	.LBB10_177
.LBB10_177 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, .L.str.16
	CALL	bad_prog
	JUMP	.LBB10_178
.LBB10_178 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_180
	JUMP	.LBB10_179
.LBB10_179 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 32(%GR7)
	ADDI	%GR6, %GR6, 44
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB10_180
.LBB10_180 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB10_181
.LBB10_181 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ;     Parent Loop BB10_160 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_183
	JUMP	.LBB10_182
.LBB10_182 NOP                          ;   in Loop: Header=BB10_181 Depth=3
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 10
	LOAD	%GR1, 28(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 8(%GR7)
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB10_181
.LBB10_183 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR1, 28(%GR7)
	CALL	savchar
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 48
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB10_186
.LBB10_184 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	JUMP	.LBB10_186
.LBB10_185 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	COPYI	%GR1, .L.str.17
	CALL	bad_prog
	JUMP	.LBB10_186
.LBB10_186 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	JUMP	.LBB10_187
.LBB10_187 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_190
	JUMP	.LBB10_188
.LBB10_188 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_190
	JUMP	.LBB10_189
.LBB10_189 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_190
.LBB10_190 NOP                          ;   in Loop: Header=BB10_160 Depth=2
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB10_160
	JUMP	.LBB10_191
.LBB10_191 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_193
	JUMP	.LBB10_192
.LBB10_192 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_218
.LBB10_193 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_218
.LBB10_194 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 28
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR1, 256
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB10_195
.LBB10_195 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_198
	JUMP	.LBB10_196
.LBB10_196 NOP                          ;   in Loop: Header=BB10_195 Depth=2
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADD	%GR1, %GR1, %GR6
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB10_197
.LBB10_197 NOP                          ;   in Loop: Header=BB10_195 Depth=2
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB10_195
.LBB10_198 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB10_199
.LBB10_199 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB10_201
	JUMP	.LBB10_200
.LBB10_200 NOP                          ;   in Loop: Header=BB10_199 Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB10_201
.LBB10_201 NOP                          ;   in Loop: Header=BB10_199 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_203
	JUMP	.LBB10_202
.LBB10_202 NOP                          ;   in Loop: Header=BB10_199 Depth=2
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 28(%GR7)
	CALL	add1_buffer
	JUMP	.LBB10_199
.LBB10_203 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 16(%GR7)
	CALL	get_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB10_204
.LBB10_204 NOP                          ;   Parent Loop BB10_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_211
	JUMP	.LBB10_205
.LBB10_205 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_207
	JUMP	.LBB10_206
.LBB10_206 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	COPYI	%GR1, BAD_EOF
	CALL	bad_prog
	JUMP	.LBB10_207
.LBB10_207 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_209
	JUMP	.LBB10_208
.LBB10_208 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	COPYI	%GR1, .L.str.18
	CALL	bad_prog
	JUMP	.LBB10_209
.LBB10_209 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	ADDI	%GR1, %GR1, 32
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 12(%GR7)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 12(%GR7)
	ULOADB	%GR2, 0(%GR2)
	ADD	%GR1, %GR1, %GR2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB10_210
.LBB10_210 NOP                          ;   in Loop: Header=BB10_204 Depth=2
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB10_204
.LBB10_211 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR1, 16(%GR7)
	CALL	flush_buffer
	CALL	inchar
	COPYR	%GR6, %RT0
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_215
	JUMP	.LBB10_212
.LBB10_212 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 28(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_216
	JUMP	.LBB10_213
.LBB10_213 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_216
	JUMP	.LBB10_214
.LBB10_214 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	LOAD	%GR6, 28(%GR7)
	COPYI	%GR1, 59
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_216
	JUMP	.LBB10_215
.LBB10_215 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, LINE_JUNK
	CALL	bad_prog
	JUMP	.LBB10_216
.LBB10_216 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_218
.LBB10_217 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	COPYI	%GR1, .L.str.19
	CALL	bad_prog
	JUMP	.LBB10_218
.LBB10_218 NOP                          ;   in Loop: Header=BB10_3 Depth=1
	JUMP	.LBB10_3
.LBB10_219 NOP 
	COPYI	%GR6, program_depth
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB10_221
	JUMP	.LBB10_220
.LBB10_220 NOP 
	LOAD	%GR6, 36(%GR7)
	COPYI	%GR1, prog_line
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, .L.str.20
	CALL	bad_prog
	JUMP	.LBB10_221
.LBB10_221 NOP 
	LOAD	%GR6, 40(%GR7)
	STORE	%GR6, 44(%GR7)
	JUMP	.LBB10_222
.LBB10_222 NOP 
	LOAD	%GR6, 44(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end10 NOP 
	.size	compile_program, .Lfunc_end10-compile_program
                                        ; -- End function
	.globl	ck_fopen                ; -- Begin function ck_fopen
	.type	ck_fopen,@function
ck_fopen NOP                            ; @ck_fopen
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	fopen
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_2
	JUMP	.LBB11_1
.LBB11_1 NOP 
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.44
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB11_2
.LBB11_2 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB11_3
.LBB11_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_8
	JUMP	.LBB11_4
.LBB11_4 NOP                            ;   in Loop: Header=BB11_3 Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	SHLI	%GR1, %GR1, 3
	COPYI	%GR2, __id_s
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_6
	JUMP	.LBB11_5
.LBB11_5 NOP 
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR2, __id_s
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR1, 0(%GR6)
	CALL	free
	LOAD	%GR1, 20(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR6, 1
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR6, %GR6, 3
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 20(%GR7)
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB11_9
.LBB11_6 NOP                            ;   in Loop: Header=BB11_3 Depth=1
	JUMP	.LBB11_7
.LBB11_7 NOP                            ;   in Loop: Header=BB11_3 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB11_3
.LBB11_8 NOP                            ; %.loopexit1
	JUMP	.LBB11_9
.LBB11_9 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 32
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_20
	JUMP	.LBB11_10
.LBB11_10 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB11_11
.LBB11_11 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_16
	JUMP	.LBB11_12
.LBB11_12 NOP                           ;   in Loop: Header=BB11_11 Depth=1
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __id_s
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_14
	JUMP	.LBB11_13
.LBB11_13 NOP 
	JUMP	.LBB11_17
.LBB11_14 NOP                           ;   in Loop: Header=BB11_11 Depth=1
	JUMP	.LBB11_15
.LBB11_15 NOP                           ;   in Loop: Header=BB11_11 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB11_11
.LBB11_16 NOP                           ; %.loopexit
	JUMP	.LBB11_17
.LBB11_17 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 32
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB11_19
	JUMP	.LBB11_18
.LBB11_18 NOP 
	COPYI	%GR6, .L.str.45
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB11_19
.LBB11_19 NOP 
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	SHLI	%GR1, %GR1, 3
	COPYI	%GR2, __id_s
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 20(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR6, 1
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	SHLI	%GR6, %GR6, 3
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 20(%GR7)
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB11_20
.LBB11_20 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end11 NOP 
	.size	ck_fopen, .Lfunc_end11-ck_fopen
                                        ; -- End function
	.globl	inchar                  ; -- Begin function inchar
	.type	inchar,@function
inchar NOP                              ; @inchar
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	COPYI	%GR6, prog_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_5
	JUMP	.LBB12_1
.LBB12_1 NOP 
	COPYI	%GR6, prog_file
	LOAD	%GR1, 0(%GR6)
	CALL	feof
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_3
	JUMP	.LBB12_2
.LBB12_2 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB12_16
.LBB12_3 NOP 
	COPYI	%GR6, prog_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB12_4
.LBB12_4 NOP 
	JUMP	.LBB12_12
.LBB12_5 NOP 
	COPYI	%GR6, prog_cur
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_7
	JUMP	.LBB12_6
.LBB12_6 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB12_16
.LBB12_7 NOP 
	COPYI	%GR6, prog_cur
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, prog_end
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_9
	JUMP	.LBB12_8
.LBB12_8 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 0(%GR7)
	COPYI	%GR6, prog_cur
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB12_10
.LBB12_9 NOP 
	COPYI	%GR6, prog_cur
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 0(%GR6)
	ULOADB	%GR6, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB12_10
.LBB12_10 NOP 
	JUMP	.LBB12_11
.LBB12_11 NOP 
	JUMP	.LBB12_12
.LBB12_12 NOP 
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_15
	JUMP	.LBB12_13
.LBB12_13 NOP 
	COPYI	%GR6, prog_line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB12_15
	JUMP	.LBB12_14
.LBB12_14 NOP 
	COPYI	%GR6, prog_line
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB12_15
.LBB12_15 NOP 
	LOAD	%GR6, 0(%GR7)
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB12_16
.LBB12_16 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end12 NOP 
	.size	inchar, .Lfunc_end12-inchar
                                        ; -- End function
	.globl	savchar                 ; -- Begin function savchar
	.type	savchar,@function
savchar NOP                             ; @savchar
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_2
	JUMP	.LBB13_1
.LBB13_1 NOP 
	JUMP	.LBB13_8
.LBB13_2 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_5
	JUMP	.LBB13_3
.LBB13_3 NOP 
	COPYI	%GR6, prog_line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 2
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_5
	JUMP	.LBB13_4
.LBB13_4 NOP 
	COPYI	%GR6, prog_line
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB13_5
.LBB13_5 NOP 
	COPYI	%GR6, prog_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB13_7
	JUMP	.LBB13_6
.LBB13_6 NOP 
	LOAD	%GR1, 4(%GR7)
	COPYI	%GR6, prog_file
	LOAD	%GR2, 0(%GR6)
	CALL	ungetc
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB13_8
.LBB13_7 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, prog_cur
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR1)
	STOREB	%GR6, 0(%GR2)
	JUMP	.LBB13_8
.LBB13_8 NOP 
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end13 NOP 
	.size	savchar, .Lfunc_end13-savchar
                                        ; -- End function
	.globl	compile_address         ; -- Begin function compile_address
	.type	compile_address,@function
compile_address NOP                     ; @compile_address
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_12
	JUMP	.LBB14_1
.LBB14_1 NOP 
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB14_2
.LBB14_2 NOP                            ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB14_4
	JUMP	.LBB14_3
.LBB14_3 NOP                            ;   in Loop: Header=BB14_2 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	SRLI	%GR6, %GR6, 11
	JUMP	.LBB14_4
.LBB14_4 NOP                            ;   in Loop: Header=BB14_2 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_6
	JUMP	.LBB14_5
.LBB14_5 NOP                            ;   in Loop: Header=BB14_2 Depth=1
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 10
	LOAD	%GR1, 12(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB14_2
.LBB14_6 NOP 
	JUMP	.LBB14_7
.LBB14_7 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB14_9
	JUMP	.LBB14_8
.LBB14_8 NOP                            ;   in Loop: Header=BB14_7 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB14_9
.LBB14_9 NOP                            ;   in Loop: Header=BB14_7 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_11
	JUMP	.LBB14_10
.LBB14_10 NOP                           ;   in Loop: Header=BB14_7 Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB14_7
.LBB14_11 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	savchar
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR2, 16(%GR7)
	ADDI	%GR2, %GR2, 8
	STORE	%GR6, 0(%GR2)
	STORE	%GR1, 20(%GR7)
	JUMP	.LBB14_33
.LBB14_12 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 47
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_14
	JUMP	.LBB14_13
.LBB14_13 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_22
	JUMP	.LBB14_14
.LBB14_14 NOP 
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 2
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_16
	JUMP	.LBB14_15
.LBB14_15 NOP 
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB14_16
.LBB14_16 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	compile_regex
	COPYI	%GR6, last_regex
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB14_17
.LBB14_17 NOP                           ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB14_18
.LBB14_18 NOP                           ;   in Loop: Header=BB14_17 Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB14_20
	JUMP	.LBB14_19
.LBB14_19 NOP                           ;   in Loop: Header=BB14_17 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB14_20
.LBB14_20 NOP                           ;   in Loop: Header=BB14_17 Depth=1
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB14_17
	JUMP	.LBB14_21
.LBB14_21 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	savchar
	COPYI	%GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB14_33
.LBB14_22 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 36
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB14_29
	JUMP	.LBB14_23
.LBB14_23 NOP 
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 3
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB14_24
.LBB14_24 NOP                           ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB14_25
.LBB14_25 NOP                           ;   in Loop: Header=BB14_24 Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB14_27
	JUMP	.LBB14_26
.LBB14_26 NOP                           ;   in Loop: Header=BB14_24 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB14_27
.LBB14_27 NOP                           ;   in Loop: Header=BB14_24 Depth=1
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB14_24
	JUMP	.LBB14_28
.LBB14_28 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	savchar
	COPYI	%GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB14_33
.LBB14_29 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	savchar
	JUMP	.LBB14_30
.LBB14_30 NOP 
	JUMP	.LBB14_31
.LBB14_31 NOP 
	JUMP	.LBB14_32
.LBB14_32 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB14_33
.LBB14_33 NOP 
	LOAD	%GR6, 20(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end14 NOP 
	.size	compile_address, .Lfunc_end14-compile_address
                                        ; -- End function
	.globl	bad_prog                ; -- Begin function bad_prog
	.type	bad_prog,@function
bad_prog NOP                            ; @bad_prog
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR5, 28(%GR7)
	STORE	%GR1, 24(%GR7)
	COPYI	%GR6, prog_line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB15_2
	JUMP	.LBB15_1
.LBB15_1 NOP 
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, myname
	LOAD	%GR1, 0(%GR1)
	COPYI	%GR2, prog_name
	LOAD	%GR2, 0(%GR2)
	COPYI	%GR3, prog_line
	LOAD	%GR3, 0(%GR3)
	LOAD	%GR4, 24(%GR7)
	ADDI	%GR5, %GR7, 20
	STORE	%GR4, 0(%GR5)
	ADDI	%GR4, %GR7, 16
	STORE	%GR3, 0(%GR4)
	ADDI	%GR3, %GR7, 12
	STORE	%GR2, 0(%GR3)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.21
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB15_3
.LBB15_2 NOP 
	COPYI	%GR6, stdout
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, myname
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 24(%GR7)
	ADDI	%GR3, %GR7, 12
	STORE	%GR2, 0(%GR3)
	ADDI	%GR2, %GR7, 8
	STORE	%GR1, 0(%GR2)
	ADDI	%GR1, %GR7, 4
	COPYI	%GR2, .L.str.22
	STORE	%GR2, 0(%GR1)
	STORE	%GR6, 0(%GR7)
	CALL	fprintf
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB15_3
.LBB15_3 NOP 
	COPYI	%GR1, 1
	CALL	exit
.Lfunc_end15 NOP 
	.size	bad_prog, .Lfunc_end15-bad_prog
                                        ; -- End function
	.globl	init_buffer             ; -- Begin function init_buffer
	.type	init_buffer,@function
init_buffer NOP                         ; @init_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	COPYI	%GR1, 12
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 50
	STORE	%GR1, 0(%GR6)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end16 NOP 
	.size	init_buffer, .Lfunc_end16-init_buffer
                                        ; -- End function
	.globl	add1_buffer             ; -- Begin function add1_buffer
	.type	add1_buffer,@function
add1_buffer NOP                         ; @add1_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 1
	LOAD	%GR6, 0(%GR6)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB17_2
	JUMP	.LBB17_1
.LBB17_1 NOP 
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 0(%GR6)
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB17_2
.LBB17_2 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR2, %GR1, 8
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end17 NOP 
	.size	add1_buffer, .Lfunc_end17-add1_buffer
                                        ; -- End function
	.globl	size_buffer             ; -- Begin function size_buffer
	.type	size_buffer,@function
size_buffer NOP                         ; @size_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 8
	STORE	%GR1, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYR	%RT0, %GR6
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end18 NOP 
	.size	size_buffer, .Lfunc_end18-size_buffer
                                        ; -- End function
	.globl	get_buffer              ; -- Begin function get_buffer
	.type	get_buffer,@function
get_buffer NOP                          ; @get_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 8
	STORE	%GR1, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYR	%RT0, %GR6
	ADDI	%GR7, %GR7, 8
	RET
.Lfunc_end19 NOP 
	.size	get_buffer, .Lfunc_end19-get_buffer
                                        ; -- End function
	.globl	flush_buffer            ; -- Begin function flush_buffer
	.type	flush_buffer,@function
flush_buffer NOP                        ; @flush_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	CALL	free
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	CALL	free
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end20 NOP 
	.size	flush_buffer, .Lfunc_end20-flush_buffer
                                        ; -- End function
	.globl	setup_jump              ; -- Begin function setup_jump
	.type	setup_jump,@function
setup_jump NOP                          ; @setup_jump
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 12(%GR7)
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB21_1
.LBB21_1 NOP                            ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB21_3
	JUMP	.LBB21_2
.LBB21_2 NOP                            ;   in Loop: Header=BB21_1 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB21_3
.LBB21_3 NOP                            ;   in Loop: Header=BB21_1 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_5
	JUMP	.LBB21_4
.LBB21_4 NOP                            ;   in Loop: Header=BB21_1 Depth=1
	JUMP	.LBB21_1
.LBB21_5 NOP 
	JUMP	.LBB21_6
.LBB21_6 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB21_11
	JUMP	.LBB21_7
.LBB21_7 NOP                            ;   in Loop: Header=BB21_6 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB21_11
	JUMP	.LBB21_8
.LBB21_8 NOP                            ;   in Loop: Header=BB21_6 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR1, %GR6, 1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB21_11
	JUMP	.LBB21_9
.LBB21_9 NOP                            ;   in Loop: Header=BB21_6 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 59
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB21_11
	JUMP	.LBB21_10
.LBB21_10 NOP                           ;   in Loop: Header=BB21_6 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 125
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB21_11
.LBB21_11 NOP                           ;   in Loop: Header=BB21_6 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB21_13
	JUMP	.LBB21_12
.LBB21_12 NOP                           ;   in Loop: Header=BB21_6 Depth=1
	LOAD	%GR1, 4(%GR7)
	LOAD	%GR2, 0(%GR7)
	CALL	add1_buffer
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB21_6
.LBB21_13 NOP 
	LOAD	%GR1, 0(%GR7)
	CALL	savchar
	LOAD	%GR1, 4(%GR7)
	COPYI	%GR2, 0
	CALL	add1_buffer
	COPYI	%GR1, 16
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	SRAI	%GR6, %GR6, 3
	MULI	%GR6, %GR6, -1227133513
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 4(%GR7)
	CALL	get_buffer
	COPYR	%GR1, %RT0
	CALL	ck_strdup
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 12
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 4(%GR7)
	CALL	flush_buffer
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end21 NOP 
	.size	setup_jump, .Lfunc_end21-setup_jump
                                        ; -- End function
	.globl	compile_filename        ; -- Begin function compile_filename
	.type	compile_filename,@function
compile_filename NOP                    ; @compile_filename
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 16(%GR7)
	CALL	inchar
	COPYR	%GR6, %RT0
	COPYI	%GR1, 32
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_2
	JUMP	.LBB22_1
.LBB22_1 NOP 
	COPYI	%GR1, .L.str.23
	CALL	bad_prog
	JUMP	.LBB22_2
.LBB22_2 NOP 
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB22_3
.LBB22_3 NOP                            ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB22_5
	JUMP	.LBB22_4
.LBB22_4 NOP                            ;   in Loop: Header=BB22_3 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB22_5
.LBB22_5 NOP                            ;   in Loop: Header=BB22_3 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_7
	JUMP	.LBB22_6
.LBB22_6 NOP                            ;   in Loop: Header=BB22_3 Depth=1
	LOAD	%GR1, 4(%GR7)
	LOAD	%GR2, 0(%GR7)
	CALL	add1_buffer
	JUMP	.LBB22_3
.LBB22_7 NOP 
	LOAD	%GR1, 4(%GR7)
	COPYI	%GR2, 0
	CALL	add1_buffer
	LOAD	%GR1, 4(%GR7)
	CALL	get_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	JUMP	.LBB22_8
.LBB22_8 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_17
	JUMP	.LBB22_9
.LBB22_9 NOP                            ;   in Loop: Header=BB22_8 Depth=1
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_11
	JUMP	.LBB22_10
.LBB22_10 NOP 
	JUMP	.LBB22_18
.LBB22_11 NOP                           ;   in Loop: Header=BB22_8 Depth=1
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_15
	JUMP	.LBB22_12
.LBB22_12 NOP 
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 16(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_14
	JUMP	.LBB22_13
.LBB22_13 NOP 
	COPYI	%GR1, .L.str.24
	CALL	bad_prog
	JUMP	.LBB22_14
.LBB22_14 NOP 
	LOAD	%GR1, 4(%GR7)
	CALL	flush_buffer
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB22_24
.LBB22_15 NOP                           ;   in Loop: Header=BB22_8 Depth=1
	JUMP	.LBB22_16
.LBB22_16 NOP                           ;   in Loop: Header=BB22_8 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB22_8
.LBB22_17 NOP                           ; %.loopexit
	JUMP	.LBB22_18
.LBB22_18 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_23
	JUMP	.LBB22_19
.LBB22_19 NOP 
	LOAD	%GR1, 12(%GR7)
	CALL	ck_strdup
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	COPYI	%GR2, file_ptrs
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB22_21
	JUMP	.LBB22_20
.LBB22_20 NOP 
	LOAD	%GR1, 12(%GR7)
	COPYI	%GR2, .L.str.25
	CALL	ck_fopen
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	COPYI	%GR2, file_ptrs
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB22_22
.LBB22_21 NOP 
	LOAD	%GR1, 12(%GR7)
	COPYI	%GR2, .L.str.7
	CALL	ck_fopen
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	MULI	%GR1, %GR1, 12
	COPYI	%GR2, file_ptrs
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB22_22
.LBB22_22 NOP 
	LOAD	%GR1, 4(%GR7)
	CALL	flush_buffer
	LOAD	%GR6, 8(%GR7)
	MULI	%GR6, %GR6, 12
	COPYI	%GR1, file_ptrs
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB22_24
.LBB22_23 NOP 
	COPYI	%GR1, .L.str.26
	CALL	bad_prog
	COPYI	%GR6, 0
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB22_24
.LBB22_24 NOP 
	LOAD	%GR6, 20(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end22 NOP 
	.size	compile_filename, .Lfunc_end22-compile_filename
                                        ; -- End function
	.globl	compile_regex           ; -- Begin function compile_regex
	.type	compile_regex,@function
compile_regex NOP                       ; @compile_regex
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 28(%GR7)
	COPYI	%GR6, -1
	STORE	%GR6, 16(%GR7)
	CALL	init_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB23_1
.LBB23_1 NOP                            ; =>This Inner Loop Header: Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB23_5
	JUMP	.LBB23_2
.LBB23_2 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 28(%GR7)
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB23_4
	JUMP	.LBB23_3
.LBB23_3 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	JUMP	.LBB23_4
.LBB23_4 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_5
.LBB23_5 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_41
	JUMP	.LBB23_6
.LBB23_6 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 94
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_12
	JUMP	.LBB23_7
.LBB23_7 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_9
	JUMP	.LBB23_8
.LBB23_8 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 92
	CALL	add1_buffer
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 96
	CALL	add1_buffer
	JUMP	.LBB23_10
.LBB23_9 NOP                            ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 20(%GR7)
	CALL	add1_buffer
	JUMP	.LBB23_10
.LBB23_10 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_11
.LBB23_11 NOP                           ; %.backedge
                                        ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_1
.LBB23_12 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 36
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_17
	JUMP	.LBB23_13
.LBB23_13 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	LOAD	%GR1, 20(%GR7)
	CALL	savchar
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 28(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_15
	JUMP	.LBB23_14
.LBB23_14 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 92
	CALL	add1_buffer
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 39
	CALL	add1_buffer
	JUMP	.LBB23_16
.LBB23_15 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 36
	CALL	add1_buffer
	JUMP	.LBB23_16
.LBB23_16 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_11
.LBB23_17 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 91
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_21
	JUMP	.LBB23_18
.LBB23_18 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_20
	JUMP	.LBB23_19
.LBB23_19 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB23_20
.LBB23_20 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 20(%GR7)
	CALL	add1_buffer
	JUMP	.LBB23_11
.LBB23_21 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 93
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_28
	JUMP	.LBB23_22
.LBB23_22 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 20(%GR7)
	CALL	add1_buffer
	LOAD	%GR1, 24(%GR7)
	CALL	get_buffer
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_26
	JUMP	.LBB23_23
.LBB23_23 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_27
	JUMP	.LBB23_24
.LBB23_24 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_26
	JUMP	.LBB23_25
.LBB23_25 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 94
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_27
	JUMP	.LBB23_26
.LBB23_26 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB23_27
.LBB23_27 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_11
.LBB23_28 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_30
	JUMP	.LBB23_29
.LBB23_29 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_31
	JUMP	.LBB23_30
.LBB23_30 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 20(%GR7)
	CALL	add1_buffer
	JUMP	.LBB23_11
.LBB23_31 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_32
.LBB23_32 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_33
.LBB23_33 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_34
.LBB23_34 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_35
.LBB23_35 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	CALL	inchar
	COPYR	%GR6, %RT0
	STORE	%GR6, 20(%GR7)
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, -1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB23_38
	JUMP	.LBB23_36
.LBB23_36 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	COPYI	%GR1, 110
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_39
	JUMP	.LBB23_37
.LBB23_37 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 10
	CALL	add1_buffer
	JUMP	.LBB23_40
.LBB23_38 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_40
.LBB23_39 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	LOAD	%GR1, 24(%GR7)
	COPYI	%GR2, 92
	CALL	add1_buffer
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 20(%GR7)
	CALL	add1_buffer
	JUMP	.LBB23_40
.LBB23_40 NOP                           ;   in Loop: Header=BB23_1 Depth=1
	JUMP	.LBB23_11
.LBB23_41 NOP 
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_43
	JUMP	.LBB23_42
.LBB23_42 NOP 
	COPYI	%GR1, BAD_EOF
	CALL	bad_prog
	JUMP	.LBB23_43
.LBB23_43 NOP 
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_45
	JUMP	.LBB23_44
.LBB23_44 NOP 
	COPYI	%GR1, 32
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	COPYI	%GR3, last_regex
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR6, %RT0
	ADDI	%GR6, %GR6, 10
	LOAD	%GR1, 0(%GR3)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR3)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 0(%GR3)
	STORE	%GR6, 0(%GR1)
	COPYI	%GR1, 256
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 0(%GR3)
	ADDI	%GR1, %GR1, 16
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR3)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	CALL	get_buffer
	COPYR	%GR4, %RT0
	LOAD	%GR1, 24(%GR7)
	CALL	size_buffer
	COPYR	%GR2, %RT0
	LOAD	%GR3, 0(%GR3)
	COPYR	%GR1, %GR4
	CALL	re_compile_pattern
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB23_48
.LBB23_45 NOP 
	COPYI	%GR6, last_regex
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB23_47
	JUMP	.LBB23_46
.LBB23_46 NOP 
	COPYI	%GR1, NO_REGEX
	CALL	bad_prog
	JUMP	.LBB23_47
.LBB23_47 NOP 
	JUMP	.LBB23_48
.LBB23_48 NOP 
	LOAD	%GR1, 24(%GR7)
	CALL	flush_buffer
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end23 NOP 
	.size	compile_regex, .Lfunc_end23-compile_regex
                                        ; -- End function
	.globl	re_compile_pattern      ; -- Begin function re_compile_pattern
	.type	re_compile_pattern,@function
re_compile_pattern NOP                  ; @re_compile_pattern
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 249
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 239
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 128
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR2, 8(%GR7)
	COPYI	%GR6, re_syntax_options
	LOAD	%GR3, 0(%GR6)
	LOAD	%GR4, 4(%GR7)
	CALL	regex_compile
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 0(%GR7)
	SHLI	%GR6, %GR6, 2
	COPYI	%GR1, re_error_msg
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 16(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end24 NOP 
	.size	re_compile_pattern, .Lfunc_end24-re_compile_pattern
                                        ; -- End function
	.globl	ck_strdup               ; -- Begin function ck_strdup
	.type	ck_strdup,@function
ck_strdup NOP                           ; @ck_strdup
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 4(%GR7)
	LOAD	%GR1, 4(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR6, 2
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR7)
	LOAD	%GR1, 0(%GR7)
	LOAD	%GR2, 4(%GR7)
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 0(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end25 NOP 
	.size	ck_strdup, .Lfunc_end25-ck_strdup
                                        ; -- End function
	.globl	read_pattern_space      ; -- Begin function read_pattern_space
	.type	read_pattern_space,@function
read_pattern_space NOP                  ; @read_pattern_space
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 8(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	feof
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_2
	JUMP	.LBB26_1
.LBB26_1 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB26_20
.LBB26_2 NOP 
	COPYI	%GR6, input_line_number
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, replaced
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB26_3
.LBB26_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_5
	JUMP	.LBB26_4
.LBB26_4 NOP                            ;   in Loop: Header=BB26_3 Depth=1
	COPYI	%GR3, line
	LOAD	%GR1, 0(%GR3)
	SHLI	%GR2, %GR1, 1
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR6, %GR6, %GR6
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 0(%GR3)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 0(%GR3)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR3)
	JUMP	.LBB26_5
.LBB26_5 NOP                            ;   in Loop: Header=BB26_3 Depth=1
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_11
	JUMP	.LBB26_6
.LBB26_6 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, line
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_8
	JUMP	.LBB26_7
.LBB26_7 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB26_20
.LBB26_8 NOP 
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, last_input_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_10
	JUMP	.LBB26_9
.LBB26_9 NOP 
	COPYI	%GR6, input_EOF
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB26_10
.LBB26_10 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB26_20
.LBB26_11 NOP                           ;   in Loop: Header=BB26_3 Depth=1
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 8(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_13
	JUMP	.LBB26_12
.LBB26_12 NOP 
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB26_14
.LBB26_13 NOP                           ;   in Loop: Header=BB26_3 Depth=1
	JUMP	.LBB26_3
.LBB26_14 NOP 
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_16
	JUMP	.LBB26_15
.LBB26_15 NOP 
	LOAD	%GR1, 4(%GR7)
	COPYI	%GR6, input_file
	LOAD	%GR2, 0(%GR6)
	CALL	ungetc
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB26_19
.LBB26_16 NOP 
	COPYI	%GR6, last_input_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB26_18
	JUMP	.LBB26_17
.LBB26_17 NOP 
	COPYI	%GR6, input_EOF
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB26_18
.LBB26_18 NOP 
	JUMP	.LBB26_19
.LBB26_19 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB26_20
.LBB26_20 NOP 
	LOAD	%GR6, 16(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end26 NOP 
	.size	read_pattern_space, .Lfunc_end26-read_pattern_space
                                        ; -- End function
	.globl	execute_program         ; -- Begin function execute_program
	.type	execute_program,@function
execute_program NOP                     ; @execute_program
; %bb.0:
	SUBI	%GR7, %GR7, 176
	STORE	%GR1, 172(%GR7)
	STORE	%GR2, 168(%GR7)
	STORE	%GR3, 164(%GR7)
	STORE	%GR4, 160(%GR7)
	STORE	%GR5, 156(%GR7)
	STORE	%GR1, 152(%GR7)
	LOAD	%GR6, 152(%GR7)
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB27_1
.LBB27_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB27_2 Depth 2
                                        ;       Child Loop BB27_4 Depth 3
                                        ;       Child Loop BB27_194 Depth 3
                                        ;       Child Loop BB27_132 Depth 3
                                        ;         Child Loop BB27_146 Depth 4
                                        ;       Child Loop BB27_121 Depth 3
                                        ;       Child Loop BB27_74 Depth 3
                                        ;       Child Loop BB27_54 Depth 3
	LOAD	%GR6, 88(%GR7)
	STORE	%GR6, 152(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 92(%GR7)
	COPYI	%GR1, execute_program.end_cycle
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 152(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 148(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB27_2
.LBB27_2 NOP                            ;   Parent Loop BB27_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB27_4 Depth 3
                                        ;       Child Loop BB27_194 Depth 3
                                        ;       Child Loop BB27_132 Depth 3
                                        ;         Child Loop BB27_146 Depth 4
                                        ;       Child Loop BB27_121 Depth 3
                                        ;       Child Loop BB27_74 Depth 3
                                        ;       Child Loop BB27_54 Depth 3
	LOAD	%GR6, 144(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_203
	JUMP	.LBB27_3
.LBB27_3 NOP                            ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_4
.LBB27_4 NOP                            ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	COPYI	%GR6, 0
	STORE	%GR6, 140(%GR7)
	LOAD	%GR1, 148(%GR7)
	ADDI	%GR1, %GR1, 24
	ULOADB	%GR1, 0(%GR1)
	ANDI	%GR1, %GR1, 1
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB27_8
	JUMP	.LBB27_5
.LBB27_5 NOP                            ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR6, 1
	STORE	%GR6, 140(%GR7)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR1, %GR6, 12
	CALL	match_address
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_7
	JUMP	.LBB27_6
.LBB27_6 NOP                            ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, -2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_7
.LBB27_7 NOP                            ;   in Loop: Header=BB27_4 Depth=3
	JUMP	.LBB27_16
.LBB27_8 NOP                            ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR1, 148(%GR7)
	CALL	match_address
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_15
	JUMP	.LBB27_9
.LBB27_9 NOP                            ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR6, 1
	STORE	%GR6, 140(%GR7)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_14
	JUMP	.LBB27_10
.LBB27_10 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_12
	JUMP	.LBB27_11
.LBB27_11 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR1, %GR6, 12
	CALL	match_address
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_13
	JUMP	.LBB27_12
.LBB27_12 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_13
.LBB27_13 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	JUMP	.LBB27_14
.LBB27_14 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	JUMP	.LBB27_15
.LBB27_15 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	JUMP	.LBB27_16
.LBB27_16 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 24
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_18
	JUMP	.LBB27_17
.LBB27_17 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 140(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	STORE	%GR6, 140(%GR7)
	JUMP	.LBB27_18
.LBB27_18 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 140(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_20
	JUMP	.LBB27_19
.LBB27_19 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_202
.LBB27_20 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 28
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 58
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_51
	JUMP	.LBB27_21
.LBB27_21 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 61
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_52
	JUMP	.LBB27_22
.LBB27_22 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 68
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_65
	JUMP	.LBB27_23
.LBB27_23 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 71
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_69
	JUMP	.LBB27_24
.LBB27_24 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 72
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_71
	JUMP	.LBB27_25
.LBB27_25 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 78
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_109
	JUMP	.LBB27_26
.LBB27_26 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 80
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_113
	JUMP	.LBB27_27
.LBB27_27 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 97
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_53
	JUMP	.LBB27_28
.LBB27_28 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 98
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_57
	JUMP	.LBB27_29
.LBB27_29 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 99
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_61
	JUMP	.LBB27_30
.LBB27_30 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 100
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_64
	JUMP	.LBB27_31
.LBB27_31 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 103
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_68
	JUMP	.LBB27_32
.LBB27_32 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 104
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_70
	JUMP	.LBB27_33
.LBB27_33 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 105
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_72
	JUMP	.LBB27_34
.LBB27_34 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 108
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_73
	JUMP	.LBB27_35
.LBB27_35 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 110
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_104
	JUMP	.LBB27_36
.LBB27_36 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 112
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_112
	JUMP	.LBB27_37
.LBB27_37 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 113
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_117
	JUMP	.LBB27_38
.LBB27_38 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 114
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_119
	JUMP	.LBB27_39
.LBB27_39 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 115
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_129
	JUMP	.LBB27_40
.LBB27_40 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 116
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_182
	JUMP	.LBB27_41
.LBB27_41 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 119
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_189
	JUMP	.LBB27_42
.LBB27_42 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 120
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_192
	JUMP	.LBB27_43
.LBB27_43 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 121
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_193
	JUMP	.LBB27_44
.LBB27_44 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR1, 123
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_46
	JUMP	.LBB27_45
.LBB27_45 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, 125
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_50
	JUMP	.LBB27_198
.LBB27_46 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_49
	JUMP	.LBB27_47
.LBB27_47 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 152(%GR7)
	LOAD	%GR6, 152(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 148(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB27_48
.LBB27_48 NOP                           ; %.backedge3
                                        ;   in Loop: Header=BB27_4 Depth=3
	JUMP	.LBB27_4
.LBB27_49 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_50 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 56
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 148(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR1, %GR6, 12
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 144(%GR7)
	LOAD	%GR6, 152(%GR7)
	ADDI	%GR6, %GR6, 12
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 152(%GR7)
	JUMP	.LBB27_199
.LBB27_51 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_52 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, input_line_number
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.28
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB27_199
.LBB27_53 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_54
.LBB27_54 NOP                           ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	GTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB27_56
	JUMP	.LBB27_55
.LBB27_55 NOP                           ;   in Loop: Header=BB27_54 Depth=3
	COPYI	%GR3, append
	LOAD	%GR6, 0(%GR3)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 0(%GR3)
	COPYR	%GR2, %GR1
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	JUMP	.LBB27_54
.LBB27_56 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR1, %GR6, 32
	LOAD	%GR1, 0(%GR1)
	COPYI	%GR4, append
	LOAD	%GR2, 0(%GR4)
	ADD	%GR2, %GR2, %GR2
	ADDI	%GR6, %GR6, 36
	LOAD	%GR3, 0(%GR6)
	CALL	bcopy
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR4)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 0(%GR4)
	JUMP	.LBB27_199
.LBB27_57 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_59
	JUMP	.LBB27_58
.LBB27_58 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_60
.LBB27_59 NOP                           ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 144(%GR7)
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 56
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 148(%GR7)
	JUMP	.LBB27_48
.LBB27_60 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_61 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 24
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB27_63
	JUMP	.LBB27_62
.LBB27_62 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR1, %GR6, 32
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR3, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	CALL	ck_fwrite
	JUMP	.LBB27_63
.LBB27_63 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_199
.LBB27_64 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_199
.LBB27_65 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR3, line
	LOAD	%GR1, 0(%GR3)
	COPYR	%GR2, %GR1
	CALL	eol_pos
	COPYR	%GR6, %RT0
	STORE	%GR6, 80(%GR7)
	LOAD	%GR6, 0(%GR3)
	LOAD	%GR1, 80(%GR7)
	SUB	%GR1, %GR1, %GR6
	XORI	%GR1, %GR1, -1
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 76(%GR7)
	LOAD	%GR6, 76(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_67
	JUMP	.LBB27_66
.LBB27_66 NOP                           ;   in Loop: Header=BB27_1 Depth=1
	COPYI	%GR4, line
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR6, 80(%GR7)
	ADDI	%GR2, %GR6, 1
	LOAD	%GR3, 76(%GR7)
	CALL	chr_copy
	LOAD	%GR6, 76(%GR7)
	STORE	%GR6, 0(%GR4)
	JUMP	.LBB27_1
.LBB27_67 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_199
.LBB27_68 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, hold
	COPYI	%GR2, line
	CALL	line_copy
	JUMP	.LBB27_199
.LBB27_69 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, hold
	COPYI	%GR2, line
	CALL	line_append
	JUMP	.LBB27_199
.LBB27_70 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, line
	COPYI	%GR2, hold
	CALL	line_copy
	JUMP	.LBB27_199
.LBB27_71 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, line
	COPYI	%GR2, hold
	CALL	line_append
	JUMP	.LBB27_199
.LBB27_72 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR1, %GR6, 32
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR3, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	CALL	ck_fwrite
	JUMP	.LBB27_199
.LBB27_73 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 64(%GR7)
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 68(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB27_74
.LBB27_74 NOP                           ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 68(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_102
	JUMP	.LBB27_75
.LBB27_75 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_78
	JUMP	.LBB27_76
.LBB27_76 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_78
	JUMP	.LBB27_77
.LBB27_77 NOP                           ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_103
.LBB27_78 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, 78
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_80
	JUMP	.LBB27_79
.LBB27_79 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, 0
	STORE	%GR6, 64(%GR7)
	COPYI	%GR1, 10
	CALL	putchar
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB27_80
.LBB27_80 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_82
	JUMP	.LBB27_81
.LBB27_81 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.29
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_101
.LBB27_82 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 72(%GR7)
	LOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16384
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_84
	JUMP	.LBB27_83
.LBB27_83 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	LOADB	%GR1, 0(%GR6)
	CALL	putchar
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_100
.LBB27_84 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 7
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_91
	JUMP	.LBB27_85
.LBB27_85 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 8
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_92
	JUMP	.LBB27_86
.LBB27_86 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 9
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_96
	JUMP	.LBB27_87
.LBB27_87 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_94
	JUMP	.LBB27_88
.LBB27_88 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 11
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_97
	JUMP	.LBB27_89
.LBB27_89 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 12
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB27_93
	JUMP	.LBB27_90
.LBB27_90 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR1, 13
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_95
	JUMP	.LBB27_98
.LBB27_91 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.30
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_92 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.31
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_93 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.32
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_94 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.33
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_95 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.34
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_96 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.35
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_97 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	COPYI	%GR6, .L.str.36
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_98 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	ULOADB	%GR6, 0(%GR6)
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.37
	STORE	%GR6, 0(%GR7)
	CALL	printf
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 64(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB27_99
.LBB27_99 NOP                           ;   in Loop: Header=BB27_74 Depth=3
	JUMP	.LBB27_100
.LBB27_100 NOP                          ;   in Loop: Header=BB27_74 Depth=3
	JUMP	.LBB27_101
.LBB27_101 NOP                          ;   in Loop: Header=BB27_74 Depth=3
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 72(%GR7)
	JUMP	.LBB27_74
.LBB27_102 NOP                          ; %.loopexit
                                        ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_103
.LBB27_103 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR1, 10
	CALL	putchar
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB27_199
.LBB27_104 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	feof
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_106
	JUMP	.LBB27_105
.LBB27_105 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_118
.LBB27_106 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, no_default_output
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_108
	JUMP	.LBB27_107
.LBB27_107 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB27_108
.LBB27_108 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	CALL	read_pattern_space
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB27_199
.LBB27_109 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	feof
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_111
	JUMP	.LBB27_110
.LBB27_110 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_118
.LBB27_111 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	CALL	append_pattern_space
	JUMP	.LBB27_199
.LBB27_112 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB27_199
.LBB27_113 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR3, line
	LOAD	%GR1, 0(%GR3)
	COPYR	%GR2, %GR1
	CALL	eol_pos
	COPYR	%GR6, %RT0
	STORE	%GR6, 60(%GR7)
	LOAD	%GR1, 0(%GR3)
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR2, 0
	EQ	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB27_115
	JUMP	.LBB27_114
.LBB27_114 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR2, line
	LOAD	%GR2, 0(%GR2)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, 1
	JUMP	.LBB27_116
.LBB27_115 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR3, 0(%GR6)
	JUMP	.LBB27_116
.LBB27_116 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	CALL	ck_fwrite
	JUMP	.LBB27_199
.LBB27_117 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_118
.LBB27_118 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, quit_cmd
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_199
.LBB27_119 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 56(%GR7)
	LOAD	%GR1, 148(%GR7)
	ADDI	%GR1, %GR1, 32
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB27_128
	JUMP	.LBB27_120
.LBB27_120 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR1, 0(%GR6)
	CALL	rewind
	JUMP	.LBB27_121
.LBB27_121 NOP                          ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, append
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR1)
	NEQ	%GR6, %GR6, %GR6
	BNEQZ	%GR6, .LBB27_123
	JUMP	.LBB27_122
.LBB27_122 NOP                          ;   in Loop: Header=BB27_121 Depth=3
	COPYI	%GR3, append
	LOAD	%GR6, 0(%GR3)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR3)
	LOAD	%GR1, 0(%GR3)
	COPYR	%GR2, %GR1
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	JUMP	.LBB27_123
.LBB27_123 NOP                          ;   in Loop: Header=BB27_121 Depth=3
	COPYI	%GR6, append
	LOAD	%GR6, 0(%GR6)
	ADD	%GR1, %GR6, %GR6
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYI	%GR3, 0
	CALL	fread
	COPYR	%GR6, %RT0
	STORE	%GR6, 56(%GR7)
	JUMP	.LBB27_124
.LBB27_124 NOP                          ;   in Loop: Header=BB27_121 Depth=3
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 0
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_121
	JUMP	.LBB27_125
.LBB27_125 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR1, 0(%GR6)
	CALL	ferror
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_127
	JUMP	.LBB27_126
.LBB27_126 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, .L.str.38
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB27_127
.LBB27_127 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_128
.LBB27_128 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_129 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR6, %GR6
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	STORE	%GR6, 52(%GR7)
	COPYI	%GR6, execute_program.tmp
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_131
	JUMP	.LBB27_130
.LBB27_130 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR2, execute_program.tmp
	COPYI	%GR1, 50
	STORE	%GR1, 0(%GR2)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR2)
	JUMP	.LBB27_131
.LBB27_131 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 92(%GR7)
	STORE	%GR6, 136(%GR7)
	COPYI	%GR1, line
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 52(%GR7)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 132(%GR7)
	COPYI	%GR1, execute_program.tmp
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 36
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 108(%GR7)
	LOAD	%GR6, 108(%GR7)
	LOAD	%GR1, 148(%GR7)
	ADDI	%GR1, %GR1, 40
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 104(%GR7)
	JUMP	.LBB27_132
.LBB27_132 NOP                          ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB27_146 Depth 4
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR6, line
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR6, 52(%GR7)
	SUB	%GR3, %GR2, %GR6
	LOAD	%GR4, 136(%GR7)
	LOAD	%GR5, 132(%GR7)
	COPYI	%GR6, regs
	STORE	%GR6, 0(%GR7)
	CALL	re_search
	COPYR	%GR6, %RT0
	STORE	%GR6, 128(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_173
	JUMP	.LBB27_133
.LBB27_133 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 92(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 92(%GR7)
	LOAD	%GR6, 128(%GR7)
	LOAD	%GR1, 136(%GR7)
	SUB	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_135
	JUMP	.LBB27_134
.LBB27_134 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 136(%GR7)
	ADD	%GR2, %GR6, %GR1
	LOAD	%GR6, 128(%GR7)
	SUB	%GR3, %GR6, %GR1
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	JUMP	.LBB27_135
.LBB27_135 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_145
	JUMP	.LBB27_136
.LBB27_136 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 92(%GR7)
	LOAD	%GR1, 148(%GR7)
	ADDI	%GR1, %GR1, 48
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_144
	JUMP	.LBB27_137
.LBB27_137 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, 0
	STORE	%GR6, 48(%GR7)
	LOAD	%GR1, 48(%GR7)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB27_139
	JUMP	.LBB27_138
.LBB27_138 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, 1
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB27_139
.LBB27_139 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR4, regs
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR2, %GR6, %GR1
	LOAD	%GR3, 48(%GR7)
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	LOAD	%GR6, 128(%GR7)
	LOAD	%GR1, 0(%GR4)
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_141
	JUMP	.LBB27_140
.LBB27_140 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 128(%GR7)
	ADDI	%GR6, %GR6, 1
	JUMP	.LBB27_142
.LBB27_141 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, regs
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB27_142
.LBB27_142 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	STORE	%GR6, 136(%GR7)
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 136(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 132(%GR7)
	JUMP	.LBB27_143
.LBB27_143 NOP                          ; %.backedge
                                        ;   in Loop: Header=BB27_132 Depth=3
	JUMP	.LBB27_132
.LBB27_144 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	JUMP	.LBB27_145
.LBB27_145 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 108(%GR7)
	STORE	%GR6, 96(%GR7)
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB27_146
.LBB27_146 NOP                          ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ;       Parent Loop BB27_132 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 104(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_164
	JUMP	.LBB27_147
.LBB27_147 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 38
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_151
	JUMP	.LBB27_148
.LBB27_148 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 96(%GR7)
	SUB	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_150
	JUMP	.LBB27_149
.LBB27_149 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR6, 100(%GR7)
	SUB	%GR3, %GR6, %GR2
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	JUMP	.LBB27_150
.LBB27_150 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, regs
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR2, %GR6, %GR1
	COPYI	%GR1, execute_program.tmp
	COPYI	%GR3, 0
	CALL	str_append
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 96(%GR7)
	JUMP	.LBB27_162
.LBB27_151 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_161
	JUMP	.LBB27_152
.LBB27_152 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 96(%GR7)
	SUB	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_154
	JUMP	.LBB27_153
.LBB27_153 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR6, 100(%GR7)
	SUB	%GR3, %GR6, %GR2
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	JUMP	.LBB27_154
.LBB27_154 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 100(%GR7)
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 104(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_160
	JUMP	.LBB27_155
.LBB27_155 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 48
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_158
	JUMP	.LBB27_156
.LBB27_156 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 57
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_158
	JUMP	.LBB27_157
.LBB27_157 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	LOADB	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 44(%GR7)
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 44(%GR7)
	SHLI	%GR1, %GR1, 2
	COPYI	%GR2, regs
	LOAD	%GR2, 0(%GR2)
	ADD	%GR1, %GR2, %GR1
	LOAD	%GR1, 0(%GR1)
	ADD	%GR2, %GR6, %GR1
	COPYI	%GR1, execute_program.tmp
	COPYI	%GR3, 0
	CALL	str_append
	JUMP	.LBB27_159
.LBB27_158 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR2, 100(%GR7)
	COPYI	%GR1, execute_program.tmp
	COPYI	%GR3, 1
	CALL	str_append
	JUMP	.LBB27_159
.LBB27_159 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	JUMP	.LBB27_160
.LBB27_160 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 96(%GR7)
	JUMP	.LBB27_161
.LBB27_161 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	JUMP	.LBB27_162
.LBB27_162 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	JUMP	.LBB27_163
.LBB27_163 NOP                          ;   in Loop: Header=BB27_146 Depth=4
	LOAD	%GR6, 100(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB27_146
.LBB27_164 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 96(%GR7)
	SUB	%GR6, %GR6, %GR1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_166
	JUMP	.LBB27_165
.LBB27_165 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR2, 96(%GR7)
	LOAD	%GR6, 100(%GR7)
	SUB	%GR3, %GR6, %GR2
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	JUMP	.LBB27_166
.LBB27_166 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 128(%GR7)
	COPYI	%GR1, regs
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_168
	JUMP	.LBB27_167
.LBB27_167 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 128(%GR7)
	ADD	%GR2, %GR6, %GR1
	COPYI	%GR1, execute_program.tmp
	COPYI	%GR3, 1
	CALL	str_append
	COPYI	%GR6, regs
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_168
.LBB27_168 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	COPYI	%GR6, regs
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 136(%GR7)
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 136(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 132(%GR7)
	LOAD	%GR6, 132(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_170
	JUMP	.LBB27_169
.LBB27_169 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_174
.LBB27_170 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB27_172
	JUMP	.LBB27_171
.LBB27_171 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_174
.LBB27_172 NOP                          ;   in Loop: Header=BB27_132 Depth=3
	JUMP	.LBB27_143
.LBB27_173 NOP                          ; %.loopexit1
                                        ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_174
.LBB27_174 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 92(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_176
	JUMP	.LBB27_175
.LBB27_175 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_176 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, replaced
	COPYI	%GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR4, line
	LOAD	%GR6, 0(%GR4)
	LOAD	%GR1, 136(%GR7)
	ADD	%GR2, %GR6, %GR1
	LOAD	%GR6, 132(%GR7)
	LOAD	%GR1, 52(%GR7)
	ADD	%GR3, %GR6, %GR1
	COPYI	%GR1, execute_program.tmp
	CALL	str_append
	LOAD	%GR6, 0(%GR4)
	STORE	%GR6, 112(%GR7)
	LOAD	%GR6, 0(%GR4)
	ADDI	%GR2, %GR7, 112
	ORI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	LOAD	%GR6, 0(%GR4)
	ADDI	%GR2, %GR2, 8
	STORE	%GR6, 0(%GR2)
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 0(%GR1)
	STORE	%GR6, 0(%GR4)
	LOAD	%GR6, 112(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR3)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR2)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_179
	JUMP	.LBB27_177
.LBB27_177 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 52
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_179
	JUMP	.LBB27_178
.LBB27_178 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 52
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB27_179
.LBB27_179 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 44
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_181
	JUMP	.LBB27_180
.LBB27_180 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR6, stdout
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB27_181
.LBB27_181 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_182 NOP                          ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR6, replaced
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_187
	JUMP	.LBB27_183
.LBB27_183 NOP                          ;   in Loop: Header=BB27_4 Depth=3
	COPYI	%GR6, replaced
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_185
	JUMP	.LBB27_184
.LBB27_184 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB27_186
.LBB27_185 NOP                          ;   in Loop: Header=BB27_4 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	STORE	%GR6, 144(%GR7)
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 56
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 148(%GR7)
	JUMP	.LBB27_48
.LBB27_186 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_188
.LBB27_187 NOP                          ; %.loopexit2
                                        ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_188
.LBB27_188 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_189 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_191
	JUMP	.LBB27_190
.LBB27_190 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR4, 0(%GR6)
	COPYI	%GR2, 1
	COPYR	%GR3, %GR1
	CALL	ck_fwrite
	JUMP	.LBB27_191
.LBB27_191 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_192 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	ADDI	%GR6, %GR7, 24
	ADDI	%GR1, %GR6, 8
	COPYI	%GR2, line
	LOAD	%GR3, 0(%GR2)
	STORE	%GR3, 0(%GR1)
	ORI	%GR6, %GR6, 4
	STORE	%GR3, 0(%GR6)
	STORE	%GR3, 24(%GR7)
	COPYI	%GR3, hold
	LOAD	%GR4, 0(%GR3)
	STORE	%GR4, 0(%GR2)
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 0(%GR3)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 0(%GR3)
	LOAD	%GR6, 24(%GR7)
	STORE	%GR6, 0(%GR3)
	JUMP	.LBB27_199
.LBB27_193 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	STORE	%GR1, 20(%GR7)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB27_194
.LBB27_194 NOP                          ;   Parent Loop BB27_1 Depth=1
                                        ;     Parent Loop BB27_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 16(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_197
	JUMP	.LBB27_195
.LBB27_195 NOP                          ;   in Loop: Header=BB27_194 Depth=3
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 32
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 20(%GR7)
	ULOADB	%GR2, 0(%GR1)
	ADD	%GR6, %GR6, %GR2
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB27_196
.LBB27_196 NOP                          ;   in Loop: Header=BB27_194 Depth=3
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB27_194
.LBB27_197 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_199
.LBB27_198 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 28
	LOADB	%GR6, 0(%GR6)
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.39
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB27_199
.LBB27_199 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	COPYI	%GR6, execute_program.end_cycle
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB27_201
	JUMP	.LBB27_200
.LBB27_200 NOP 
	JUMP	.LBB27_204
.LBB27_201 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	JUMP	.LBB27_202
.LBB27_202 NOP                          ;   in Loop: Header=BB27_2 Depth=2
	LOAD	%GR6, 148(%GR7)
	ADDI	%GR6, %GR6, 56
	STORE	%GR6, 148(%GR7)
	LOAD	%GR6, 144(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB27_2
.LBB27_203 NOP                          ; %.loopexit4
	JUMP	.LBB27_204
.LBB27_204 NOP 
	LOAD	%GR5, 156(%GR7)
	LOAD	%GR4, 160(%GR7)
	LOAD	%GR3, 164(%GR7)
	LOAD	%GR2, 168(%GR7)
	LOAD	%GR1, 172(%GR7)
	ADDI	%GR7, %GR7, 176
	RET
.Lfunc_end27 NOP 
	.size	execute_program, .Lfunc_end27-execute_program
                                        ; -- End function
	.globl	ck_fwrite               ; -- Begin function ck_fwrite
	.type	ck_fwrite,@function
ck_fwrite NOP                           ; @ck_fwrite
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	LOAD	%GR1, 28(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR4, 16(%GR7)
	CALL	fwrite
	COPYR	%GR6, %RT0
	LOAD	%GR1, 20(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB28_2
	JUMP	.LBB28_1
.LBB28_1 NOP 
	LOAD	%GR2, 20(%GR7)
	LOAD	%GR1, 16(%GR7)
	CALL	__fp_name
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR7, 8
	STORE	%GR6, 0(%GR1)
	ADDI	%GR6, %GR7, 4
	STORE	%GR2, 0(%GR6)
	COPYI	%GR6, .L.str.46
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB28_2
.LBB28_2 NOP 
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end28 NOP 
	.size	ck_fwrite, .Lfunc_end28-ck_fwrite
                                        ; -- End function
	.globl	ck_fclose               ; -- Begin function ck_fclose
	.type	ck_fclose,@function
ck_fclose NOP                           ; @ck_fclose
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	LOAD	%GR1, 8(%GR7)
	CALL	fclose
	COPYR	%GR6, %RT0
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB29_2
	JUMP	.LBB29_1
.LBB29_1 NOP 
	LOAD	%GR1, 8(%GR7)
	CALL	__fp_name
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR7, 4
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, .L.str.47
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB29_2
.LBB29_2 NOP 
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end29 NOP 
	.size	ck_fclose, .Lfunc_end29-ck_fclose
                                        ; -- End function
	.globl	match_address           ; -- Begin function match_address
	.type	match_address,@function
match_address NOP                       ; @match_address
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR5, 28(%GR7)
	STORE	%GR1, 20(%GR7)
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB30_4
	JUMP	.LBB30_1
.LBB30_1 NOP 
	COPYI	%GR1, 1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB30_5
	JUMP	.LBB30_2
.LBB30_2 NOP 
	COPYI	%GR1, 2
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB30_6
	JUMP	.LBB30_3
.LBB30_3 NOP 
	COPYI	%GR1, 3
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB30_7
	JUMP	.LBB30_8
.LBB30_4 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB30_10
.LBB30_5 NOP 
	COPYI	%GR6, input_line_number
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 20(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB30_10
.LBB30_6 NOP 
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	ADD	%GR1, %GR1, %GR1
	ADDI	%GR1, %GR1, -1
	LOADB	%GR1, 0(%GR1)
	COPYI	%GR2, 10
	EQ	%GR1, %GR1, %GR2
	STORE	%GR1, 16(%GR7)
	LOAD	%GR1, 20(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 0(%GR6)
	LOAD	%GR6, 16(%GR7)
	SUB	%GR3, %GR2, %GR6
	COPYI	%GR4, 0
	STORE	%GR4, 0(%GR7)
	COPYR	%GR5, %GR3
	CALL	re_search
	COPYR	%GR6, %RT0
	XORI	%GR6, %GR6, -1
	SRLI	%GR6, %GR6, 31
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB30_10
.LBB30_7 NOP 
	COPYI	%GR6, input_EOF
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB30_10
.LBB30_8 NOP 
	COPYI	%GR6, .L.str.40
	STORE	%GR6, 0(%GR7)
	CALL	panic
	JUMP	.LBB30_9
.LBB30_9 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB30_10
.LBB30_10 NOP 
	LOAD	%GR6, 24(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 28(%GR7)
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end30 NOP 
	.size	match_address, .Lfunc_end30-match_address
                                        ; -- End function
	.type	eol_pos,@function       ; -- Begin function eol_pos
eol_pos NOP                             ; @eol_pos
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 4(%GR7)
	STORE	%GR2, 0(%GR7)
	JUMP	.LBB31_1
.LBB31_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB31_5
	JUMP	.LBB31_2
.LBB31_2 NOP                            ;   in Loop: Header=BB31_1 Depth=1
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 4(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB31_4
	JUMP	.LBB31_3
.LBB31_3 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 4(%GR7)
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB31_6
.LBB31_4 NOP                            ;   in Loop: Header=BB31_1 Depth=1
	JUMP	.LBB31_1
.LBB31_5 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 4(%GR7)
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB31_6
.LBB31_6 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end31 NOP 
	.size	eol_pos, .Lfunc_end31-eol_pos
                                        ; -- End function
	.type	chr_copy,@function      ; -- Begin function chr_copy
chr_copy NOP                            ; @chr_copy
; %bb.0:
	SUBI	%GR7, %GR7, 20
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	JUMP	.LBB32_1
.LBB32_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB32_3
	JUMP	.LBB32_2
.LBB32_2 NOP                            ;   in Loop: Header=BB32_1 Depth=1
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 8(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB32_1
.LBB32_3 NOP 
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR7, %GR7, 20
	RET
.Lfunc_end32 NOP 
	.size	chr_copy, .Lfunc_end32-chr_copy
                                        ; -- End function
	.globl	line_copy               ; -- Begin function line_copy
	.type	line_copy,@function
line_copy NOP                           ; @line_copy
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB33_2
	JUMP	.LBB33_1
.LBB33_1 NOP 
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 12(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB33_2
.LBB33_2 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	CALL	bcopy
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end33 NOP 
	.size	line_copy, .Lfunc_end33-line_copy
                                        ; -- End function
	.globl	line_append             ; -- Begin function line_append
	.type	line_append,@function
line_append NOP                         ; @line_append
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR2, %GR1, 8
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	SUB	%GR1, %GR2, %GR1
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB34_2
	JUMP	.LBB34_1
.LBB34_1 NOP 
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 12(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB34_2
.LBB34_2 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	LOAD	%GR3, 0(%GR2)
	ADDI	%GR2, %GR2, 4
	LOAD	%GR2, 0(%GR2)
	ADD	%GR2, %GR3, %GR2
	ADDI	%GR6, %GR6, 4
	LOAD	%GR3, 0(%GR6)
	CALL	bcopy
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end34 NOP 
	.size	line_append, .Lfunc_end34-line_append
                                        ; -- End function
	.globl	append_pattern_space    ; -- Begin function append_pattern_space
	.type	append_pattern_space,@function
append_pattern_space NOP                ; @append_pattern_space
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	COPYI	%GR6, line
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR6, %GR6
	STORE	%GR6, 16(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 12(%GR7)
	COPYI	%GR1, input_line_number
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, 1
	STORE	%GR2, 0(%GR1)
	COPYI	%GR1, replaced
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB35_1
.LBB35_1 NOP                            ; =>This Inner Loop Header: Depth=1
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_7
	JUMP	.LBB35_2
.LBB35_2 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, line
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_4
	JUMP	.LBB35_3
.LBB35_3 NOP 
	JUMP	.LBB35_17
.LBB35_4 NOP 
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, last_input_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_6
	JUMP	.LBB35_5
.LBB35_5 NOP 
	COPYI	%GR6, input_EOF
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB35_6
.LBB35_6 NOP 
	JUMP	.LBB35_17
.LBB35_7 NOP                            ;   in Loop: Header=BB35_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_9
	JUMP	.LBB35_8
.LBB35_8 NOP                            ;   in Loop: Header=BB35_1 Depth=1
	COPYI	%GR3, line
	LOAD	%GR1, 0(%GR3)
	SHLI	%GR2, %GR1, 1
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 0(%GR3)
	LOAD	%GR6, 0(%GR3)
	ADD	%GR6, %GR6, %GR6
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 0(%GR3)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 0(%GR3)
	SHLI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR3)
	JUMP	.LBB35_9
.LBB35_9 NOP                            ;   in Loop: Header=BB35_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 16(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_11
	JUMP	.LBB35_10
.LBB35_10 NOP 
	COPYI	%GR6, line
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 12(%GR7)
	SUB	%GR1, %GR1, %GR2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB35_12
.LBB35_11 NOP                           ;   in Loop: Header=BB35_1 Depth=1
	JUMP	.LBB35_1
.LBB35_12 NOP 
	COPYI	%GR6, input_file
	LOAD	%GR1, 0(%GR6)
	CALL	_IO_getc
	COPYR	%GR6, %RT0
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_14
	JUMP	.LBB35_13
.LBB35_13 NOP 
	LOAD	%GR1, 8(%GR7)
	COPYI	%GR6, input_file
	LOAD	%GR2, 0(%GR6)
	CALL	ungetc
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB35_17
.LBB35_14 NOP 
	COPYI	%GR6, last_input_file
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB35_16
	JUMP	.LBB35_15
.LBB35_15 NOP 
	COPYI	%GR6, input_EOF
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB35_16
.LBB35_16 NOP 
	JUMP	.LBB35_17
.LBB35_17 NOP 
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end35 NOP 
	.size	append_pattern_space, .Lfunc_end35-append_pattern_space
                                        ; -- End function
	.globl	re_search               ; -- Begin function re_search
	.type	re_search,@function
re_search NOP                           ; @re_search
; %bb.0:
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	LOAD	%GR6, 64(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 36(%GR7)
	STORE	%GR3, 32(%GR7)
	STORE	%GR4, 28(%GR7)
	STORE	%GR5, 24(%GR7)
	LOAD	%GR4, 40(%GR7)
	LOAD	%GR6, 36(%GR7)
	STORE	%GR6, 20(%GR7)
	LOAD	%GR5, 32(%GR7)
	LOAD	%GR1, 28(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 64(%GR7)
	ADDI	%GR6, %GR7, 12
	STORE	%GR5, 0(%GR6)
	ADDI	%GR6, %GR7, 8
	STORE	%GR3, 0(%GR6)
	ADDI	%GR6, %GR7, 4
	STORE	%GR2, 0(%GR6)
	STORE	%GR1, 0(%GR7)
	COPYI	%GR2, 0
	COPYR	%GR1, %GR4
	COPYR	%GR3, %GR2
	LOAD	%GR4, 20(%GR7)
	CALL	re_search_2
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 44(%GR7)
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end36 NOP 
	.size	re_search, .Lfunc_end36-re_search
                                        ; -- End function
	.globl	str_append              ; -- Begin function str_append
	.type	str_append,@function
str_append NOP                          ; @str_append
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR2, %GR1, 8
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	SUB	%GR1, %GR2, %GR1
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB37_2
	JUMP	.LBB37_1
.LBB37_1 NOP 
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 16(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB37_2
.LBB37_2 NOP 
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADD	%GR2, %GR2, %GR6
	LOAD	%GR3, 8(%GR7)
	CALL	bcopy
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end37 NOP 
	.size	str_append, .Lfunc_end37-str_append
                                        ; -- End function
	.globl	__fp_name               ; -- Begin function __fp_name
	.type	__fp_name,@function
__fp_name NOP                           ; @__fp_name
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 4(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB38_1
.LBB38_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 31
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_6
	JUMP	.LBB38_2
.LBB38_2 NOP                            ;   in Loop: Header=BB38_1 Depth=1
	LOAD	%GR6, 0(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __id_s
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB38_4
	JUMP	.LBB38_3
.LBB38_3 NOP 
	LOAD	%GR6, 0(%GR7)
	SHLI	%GR6, %GR6, 3
	COPYI	%GR1, __id_s
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB38_7
.LBB38_4 NOP                            ;   in Loop: Header=BB38_1 Depth=1
	JUMP	.LBB38_5
.LBB38_5 NOP                            ;   in Loop: Header=BB38_1 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB38_1
.LBB38_6 NOP 
	COPYI	%GR6, .L.str.43
	STORE	%GR6, 8(%GR7)
	JUMP	.LBB38_7
.LBB38_7 NOP 
	LOAD	%GR6, 8(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end38 NOP 
	.size	__fp_name, .Lfunc_end38-__fp_name
                                        ; -- End function
	.globl	xmalloc                 ; -- Begin function xmalloc
	.type	xmalloc,@function
xmalloc NOP                             ; @xmalloc
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	LOAD	%GR1, 8(%GR7)
	CALL	ck_malloc
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end39 NOP 
	.size	xmalloc, .Lfunc_end39-xmalloc
                                        ; -- End function
	.globl	add_buffer              ; -- Begin function add_buffer
	.type	add_buffer,@function
add_buffer NOP                          ; @add_buffer
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 12(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 12(%GR7)
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR6, 0(%GR6)
	LTE	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB40_2
	JUMP	.LBB40_1
.LBB40_1 NOP 
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 0(%GR6)
	CALL	ck_realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB40_2
.LBB40_2 NOP 
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB40_3
.LBB40_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR1, %GR6, -1
	STORE	%GR1, 4(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB40_5
	JUMP	.LBB40_4
.LBB40_4 NOP                            ;   in Loop: Header=BB40_3 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 0(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 0(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB40_3
.LBB40_5 NOP 
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR2, 0(%GR1)
	ADD	%GR6, %GR2, %GR6
	STORE	%GR6, 0(%GR1)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end40 NOP 
	.size	add_buffer, .Lfunc_end40-add_buffer
                                        ; -- End function
	.globl	re_compile_fastmap      ; -- Begin function re_compile_fastmap
	.type	re_compile_fastmap,@function
re_compile_fastmap NOP                  ; @re_compile_fastmap
; %bb.0:
	SUBI	%GR7, %GR7, 96
	STORE	%GR1, 92(%GR7)
	STORE	%GR2, 88(%GR7)
	STORE	%GR3, 84(%GR7)
	STORE	%GR4, 80(%GR7)
	STORE	%GR1, 72(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	LOAD	%GR1, 72(%GR7)
	ADDI	%GR1, %GR1, 16
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 36(%GR7)
	LOAD	%GR1, 72(%GR7)
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 32(%GR7)
	LOAD	%GR1, 72(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 28(%GR7)
	LOAD	%GR1, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 28(%GR7)
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 20(%GR7)
	COPYI	%GR1, 1
	STOREB	%GR1, 16(%GR7)
	STOREB	%GR6, 12(%GR7)
	JUMP	.LBB41_1
.LBB41_1 NOP 
	ADDI	%GR6, %GR7, -32
	COPYR	%GR7, %GR6
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 48(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_3
	JUMP	.LBB41_2
.LBB41_2 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB41_128
.LBB41_3 NOP 
	ADDI	%GR6, %GR7, 48
	ORI	%GR1, %GR6, 4
	COPYI	%GR2, 5
	STORE	%GR2, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB41_4
.LBB41_4 NOP 
	LOAD	%GR1, 36(%GR7)
	COPYI	%GR2, 0
	COPYI	%GR3, 256
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 254
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_5
.LBB41_5 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB41_56 Depth 2
                                        ;     Child Loop BB41_49 Depth 2
                                        ;     Child Loop BB41_38 Depth 2
                                        ;     Child Loop BB41_42 Depth 2
                                        ;     Child Loop BB41_31 Depth 2
                                        ;     Child Loop BB41_63 Depth 2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB41_7
	JUMP	.LBB41_6
.LBB41_6 NOP                            ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB41_7
.LBB41_7 NOP                            ;   in Loop: Header=BB41_5 Depth=1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_127
	JUMP	.LBB41_8
.LBB41_8 NOP                            ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 20(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_10
	JUMP	.LBB41_9
.LBB41_9 NOP                            ;   in Loop: Header=BB41_5 Depth=1
	ULOADB	%GR6, 16(%GR7)
	LOAD	%GR1, 72(%GR7)
	ADDI	%GR1, %GR1, 28
	ULOADB	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	ANDI	%GR6, %GR6, 1
	ANDI	%GR2, %GR2, 254
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STOREB	%GR6, 16(%GR7)
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR7, 48
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR1)
	SHLI	%GR1, %GR2, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_10
.LBB41_10 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_72
	JUMP	.LBB41_11
.LBB41_11 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_29
	JUMP	.LBB41_12
.LBB41_12 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 2
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_62
	JUMP	.LBB41_13
.LBB41_13 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 3
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_30
	JUMP	.LBB41_14
.LBB41_14 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 4
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_37
	JUMP	.LBB41_15
.LBB41_15 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR1, %GR6, -5
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB41_124
	JUMP	.LBB41_16
.LBB41_16 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 7
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_28
	JUMP	.LBB41_17
.LBB41_17 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR1, %GR6, -8
	COPYI	%GR2, 4
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB41_72
	JUMP	.LBB41_18
.LBB41_18 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR1, %GR6, -12
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB41_74
	JUMP	.LBB41_19
.LBB41_19 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR1, %GR6, -14
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB41_91
	JUMP	.LBB41_20
.LBB41_20 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR1, %GR6, -16
	COPYI	%GR2, 3
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB41_74
	JUMP	.LBB41_21
.LBB41_21 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 19
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_72
	JUMP	.LBB41_22
.LBB41_22 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 20
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_116
	JUMP	.LBB41_23
.LBB41_23 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 21
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_74
	JUMP	.LBB41_24
.LBB41_24 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 22
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_123
	JUMP	.LBB41_25
.LBB41_25 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 23
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_48
	JUMP	.LBB41_26
.LBB41_26 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 24
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB41_55
	JUMP	.LBB41_27
.LBB41_27 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR6, -25
	COPYI	%GR1, 4
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_72
	JUMP	.LBB41_125
.LBB41_28 NOP 
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STOREB	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB41_128
.LBB41_29 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 1
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_126
.LBB41_30 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 3
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_31
.LBB41_31 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_36
	JUMP	.LBB41_32
.LBB41_32 NOP                           ;   in Loop: Header=BB41_31 Depth=2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 68(%GR7)
	SRAI	%GR2, %GR1, 31
	SRLI	%GR2, %GR2, 29
	ADD	%GR2, %GR1, %GR2
	SRAI	%GR3, %GR2, 3
	ADD	%GR6, %GR6, %GR3
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR2, %GR2, -8
	SUB	%GR1, %GR1, %GR2
	SRL	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_34
	JUMP	.LBB41_33
.LBB41_33 NOP                           ;   in Loop: Header=BB41_31 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_34
.LBB41_34 NOP                           ;   in Loop: Header=BB41_31 Depth=2
	JUMP	.LBB41_35
.LBB41_35 NOP                           ;   in Loop: Header=BB41_31 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_31
.LBB41_36 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_126
.LBB41_37 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 3
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_38
.LBB41_38 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_41
	JUMP	.LBB41_39
.LBB41_39 NOP                           ;   in Loop: Header=BB41_38 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_40
.LBB41_40 NOP                           ;   in Loop: Header=BB41_38 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_38
.LBB41_41 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 3
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_42
.LBB41_42 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_47
	JUMP	.LBB41_43
.LBB41_43 NOP                           ;   in Loop: Header=BB41_42 Depth=2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 68(%GR7)
	SRAI	%GR2, %GR1, 31
	SRLI	%GR2, %GR2, 29
	ADD	%GR2, %GR1, %GR2
	SRAI	%GR3, %GR2, 3
	ADD	%GR6, %GR6, %GR3
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR2, %GR2, -8
	SUB	%GR1, %GR1, %GR2
	SRL	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB41_45
	JUMP	.LBB41_44
.LBB41_44 NOP                           ;   in Loop: Header=BB41_42 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_45
.LBB41_45 NOP                           ;   in Loop: Header=BB41_42 Depth=2
	JUMP	.LBB41_46
.LBB41_46 NOP                           ;   in Loop: Header=BB41_42 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_42
.LBB41_47 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_126
.LBB41_48 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_49
.LBB41_49 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_54
	JUMP	.LBB41_50
.LBB41_50 NOP                           ;   in Loop: Header=BB41_49 Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_52
	JUMP	.LBB41_51
.LBB41_51 NOP                           ;   in Loop: Header=BB41_49 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_52
.LBB41_52 NOP                           ;   in Loop: Header=BB41_49 Depth=2
	JUMP	.LBB41_53
.LBB41_53 NOP                           ;   in Loop: Header=BB41_49 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_49
.LBB41_54 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_126
.LBB41_55 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_56
.LBB41_56 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_61
	JUMP	.LBB41_57
.LBB41_57 NOP                           ;   in Loop: Header=BB41_56 Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_59
	JUMP	.LBB41_58
.LBB41_58 NOP                           ;   in Loop: Header=BB41_56 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_59
.LBB41_59 NOP                           ;   in Loop: Header=BB41_56 Depth=2
	JUMP	.LBB41_60
.LBB41_60 NOP                           ;   in Loop: Header=BB41_56 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_56
.LBB41_61 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_126
.LBB41_62 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_63
.LBB41_63 NOP                           ;   Parent Loop BB41_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_66
	JUMP	.LBB41_64
.LBB41_64 NOP                           ;   in Loop: Header=BB41_63 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_65
.LBB41_65 NOP                           ;   in Loop: Header=BB41_63 Depth=2
	LOAD	%GR6, 68(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_63
.LBB41_66 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_68
	JUMP	.LBB41_67
.LBB41_67 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 36(%GR7)
	ADDI	%GR6, %GR6, 10
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_71
.LBB41_68 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_70
	JUMP	.LBB41_69
.LBB41_69 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB41_128
.LBB41_70 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_71
.LBB41_71 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_126
.LBB41_72 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_73 NOP                           ; %.backedge
                                        ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_5
.LBB41_74 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_75
.LBB41_75 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_76
.LBB41_76 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_77
.LBB41_77 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_78
.LBB41_78 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 68(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_80
	JUMP	.LBB41_79
.LBB41_79 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_80 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 14
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_83
	JUMP	.LBB41_81
.LBB41_81 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 20
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_83
	JUMP	.LBB41_82
.LBB41_82 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_83 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_84
.LBB41_84 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_85
.LBB41_85 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_86
.LBB41_86 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_87
.LBB41_87 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 68(%GR7)
	LOAD	%GR1, 24(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 24(%GR7)
	ADDI	%GR6, %GR7, 48
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_90
	JUMP	.LBB41_88
.LBB41_88 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR1, %GR7, 48
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 24(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_90
	JUMP	.LBB41_89
.LBB41_89 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB41_90
.LBB41_90 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_91 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_92
.LBB41_92 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_93
.LBB41_93 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_94
.LBB41_94 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB41_95
.LBB41_95 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_96
.LBB41_96 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 20(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_108
	JUMP	.LBB41_97
.LBB41_97 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB41_105
	JUMP	.LBB41_98
.LBB41_98 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 40(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_100
	JUMP	.LBB41_99
.LBB41_99 NOP                           ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB41_105
	JUMP	.LBB41_104
.LBB41_100 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 44(%GR7)
	LOAD	%GR1, 44(%GR7)
	LOAD	%GR2, 48(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 44(%GR7)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 48(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_102
	JUMP	.LBB41_101
.LBB41_101 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	JUMP	.LBB41_103
.LBB41_102 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	ADDI	%GR6, %GR7, 48
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB41_103
.LBB41_103 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_105
	JUMP	.LBB41_104
.LBB41_104 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB41_107
	JUMP	.LBB41_106
.LBB41_105 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR2, %GR7, 48
	ADDI	%GR2, %GR2, 8
	LOAD	%GR3, 0(%GR2)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR2)
	SHLI	%GR2, %GR3, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	BNEQZ	%GR6, .LBB41_107
	JUMP	.LBB41_106
.LBB41_106 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB41_128
.LBB41_107 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_109
.LBB41_108 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 72(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB41_109
.LBB41_109 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	ULOADB	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_115
	JUMP	.LBB41_110
.LBB41_110 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_111
.LBB41_111 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_112
.LBB41_112 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 64(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB41_113
.LBB41_113 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_114
.LBB41_114 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 12(%GR7)
	JUMP	.LBB41_115
.LBB41_115 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_116 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_117
.LBB41_117 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_118
.LBB41_118 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 64(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 64(%GR7)
	JUMP	.LBB41_119
.LBB41_119 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_120
.LBB41_120 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB41_122
	JUMP	.LBB41_121
.LBB41_121 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 24(%GR7)
	COPYI	%GR6, 1
	STOREB	%GR6, 12(%GR7)
	JUMP	.LBB41_92
.LBB41_122 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	JUMP	.LBB41_73
.LBB41_123 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_73
.LBB41_124 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_73
.LBB41_125 NOP 
	CALL	abort
.LBB41_126 NOP                          ;   in Loop: Header=BB41_5 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 16(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB41_73
.LBB41_127 NOP 
	ULOADB	%GR6, 16(%GR7)
	LOAD	%GR1, 72(%GR7)
	ADDI	%GR1, %GR1, 28
	ULOADB	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	ANDI	%GR6, %GR6, 1
	ANDI	%GR2, %GR2, 254
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB41_128
.LBB41_128 NOP 
	LOAD	%GR6, 76(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 80(%GR7)
	LOAD	%GR3, 84(%GR7)
	LOAD	%GR2, 88(%GR7)
	LOAD	%GR1, 92(%GR7)
	ADDI	%GR7, %GR7, 96
	RET
.Lfunc_end41 NOP 
	.size	re_compile_fastmap, .Lfunc_end41-re_compile_fastmap
                                        ; -- End function
	.globl	re_set_registers        ; -- Begin function re_set_registers
	.type	re_set_registers,@function
re_set_registers NOP                    ; @re_set_registers
; %bb.0:
	SUBI	%GR7, %GR7, 24
	STORE	%GR1, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	STORE	%GR4, 4(%GR7)
	STORE	%GR5, 0(%GR7)
	LOAD	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB42_2
	JUMP	.LBB42_1
.LBB42_1 NOP 
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 249
	ORI	%GR1, %GR1, 2
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB42_3
.LBB42_2 NOP 
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 249
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB42_3
.LBB42_3 NOP 
	LOAD	%GR1, 20(%GR7)
	ADDI	%GR7, %GR7, 24
	RET
.Lfunc_end42 NOP 
	.size	re_set_registers, .Lfunc_end42-re_set_registers
                                        ; -- End function
	.globl	re_search_2             ; -- Begin function re_search_2
	.type	re_search_2,@function
re_search_2 NOP                         ; @re_search_2
; %bb.0:
	SUBI	%GR7, %GR7, 112
	STORE	%GR1, 108(%GR7)
	STORE	%GR2, 104(%GR7)
	STORE	%GR3, 100(%GR7)
	STORE	%GR4, 96(%GR7)
	STORE	%GR5, 92(%GR7)
	LOAD	%GR6, 124(%GR7)
	LOAD	%GR6, 120(%GR7)
	LOAD	%GR6, 116(%GR7)
	LOAD	%GR6, 112(%GR7)
	STORE	%GR1, 84(%GR7)
	STORE	%GR2, 80(%GR7)
	STORE	%GR3, 76(%GR7)
	STORE	%GR4, 72(%GR7)
	STORE	%GR5, 68(%GR7)
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 60(%GR7)
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 76(%GR7)
	LOAD	%GR1, 68(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 52(%GR7)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 116(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 112(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_2
	JUMP	.LBB43_1
.LBB43_1 NOP 
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 52(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_3
	JUMP	.LBB43_2
.LBB43_2 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_3 NOP 
	LOAD	%GR6, 48(%GR7)
	COPYI	%GR1, -2
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_5
	JUMP	.LBB43_4
.LBB43_4 NOP 
	LOAD	%GR6, 112(%GR7)
	XORI	%GR6, %GR6, -1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB43_8
.LBB43_5 NOP 
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 52(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_7
	JUMP	.LBB43_6
.LBB43_6 NOP 
	LOAD	%GR6, 52(%GR7)
	LOAD	%GR1, 112(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB43_7
.LBB43_7 NOP 
	JUMP	.LBB43_8
.LBB43_8 NOP 
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_15
	JUMP	.LBB43_9
.LBB43_9 NOP 
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_15
	JUMP	.LBB43_10
.LBB43_10 NOP 
	LOAD	%GR6, 116(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_15
	JUMP	.LBB43_11
.LBB43_11 NOP 
	LOAD	%GR6, 112(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_13
	JUMP	.LBB43_12
.LBB43_12 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_13 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB43_14
.LBB43_14 NOP 
	JUMP	.LBB43_15
.LBB43_15 NOP 
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_20
	JUMP	.LBB43_16
.LBB43_16 NOP 
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 3
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_20
	JUMP	.LBB43_17
.LBB43_17 NOP 
	LOAD	%GR1, 84(%GR7)
	CALL	re_compile_fastmap
	COPYR	%GR6, %RT0
	COPYI	%GR1, -2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_19
	JUMP	.LBB43_18
.LBB43_18 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_19 NOP 
	JUMP	.LBB43_20
.LBB43_20 NOP 
	JUMP	.LBB43_21
.LBB43_21 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB43_39 Depth 2
                                        ;     Child Loop BB43_33 Depth 2
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_56
	JUMP	.LBB43_22
.LBB43_22 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 52(%GR7)
	GTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_56
	JUMP	.LBB43_23
.LBB43_23 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_56
	JUMP	.LBB43_24
.LBB43_24 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_45
	JUMP	.LBB43_25
.LBB43_25 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 116(%GR7)
	STORE	%GR6, 36(%GR7)
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 76(%GR7)
	GTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_28
	JUMP	.LBB43_26
.LBB43_26 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 116(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 76(%GR7)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_28
	JUMP	.LBB43_27
.LBB43_27 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	LOAD	%GR1, 76(%GR7)
	LOAD	%GR2, 112(%GR7)
	SUB	%GR1, %GR2, %GR1
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 40(%GR7)
	JUMP	.LBB43_28
.LBB43_28 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 76(%GR7)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_30
	JUMP	.LBB43_29
.LBB43_29 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 76(%GR7)
	SUB	%GR6, %GR6, %GR1
	JUMP	.LBB43_31
.LBB43_30 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 80(%GR7)
	JUMP	.LBB43_31
.LBB43_31 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR1, 112(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_38
	JUMP	.LBB43_32
.LBB43_32 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_33
.LBB43_33 NOP                           ;   Parent Loop BB43_21 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 116(%GR7)
	LOAD	%GR1, 40(%GR7)
	LTE	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB43_35
	JUMP	.LBB43_34
.LBB43_34 NOP                           ;   in Loop: Header=BB43_33 Depth=2
	LOAD	%GR6, 60(%GR7)
	LOAD	%GR1, 56(%GR7)
	LOAD	%GR2, 44(%GR7)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 44(%GR7)
	ULOADB	%GR2, 0(%GR2)
	ADD	%GR1, %GR1, %GR2
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB43_35
.LBB43_35 NOP                           ;   in Loop: Header=BB43_33 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_37
	JUMP	.LBB43_36
.LBB43_36 NOP                           ;   in Loop: Header=BB43_33 Depth=2
	LOAD	%GR6, 116(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB43_33
.LBB43_37 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_44
.LBB43_38 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_39
.LBB43_39 NOP                           ;   Parent Loop BB43_21 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 116(%GR7)
	LOAD	%GR1, 40(%GR7)
	LTE	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB43_41
	JUMP	.LBB43_40
.LBB43_40 NOP                           ;   in Loop: Header=BB43_39 Depth=2
	LOAD	%GR6, 60(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 44(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB43_41
.LBB43_41 NOP                           ;   in Loop: Header=BB43_39 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_43
	JUMP	.LBB43_42
.LBB43_42 NOP                           ;   in Loop: Header=BB43_39 Depth=2
	LOAD	%GR6, 116(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB43_39
.LBB43_43 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_44
.LBB43_44 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 116(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 112(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB43_55
.LBB43_45 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 76(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_47
	JUMP	.LBB43_46
.LBB43_46 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 76(%GR7)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_48
	JUMP	.LBB43_47
.LBB43_47 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 112(%GR7)
	LOAD	%GR2, 76(%GR7)
	SUB	%GR1, %GR1, %GR2
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB43_49
.LBB43_48 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 112(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB43_49
.LBB43_49 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	STOREB	%GR6, 32(%GR7)
	LOAD	%GR6, 60(%GR7)
	LOAD	%GR1, 56(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB43_51
	JUMP	.LBB43_50
.LBB43_50 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR1, 56(%GR7)
	ULOADB	%GR2, 32(%GR7)
	ADD	%GR1, %GR1, %GR2
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB43_52
.LBB43_51 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOADB	%GR1, 32(%GR7)
	JUMP	.LBB43_52
.LBB43_52 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	ANDI	%GR1, %GR1, 255
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_54
	JUMP	.LBB43_53
.LBB43_53 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_66
.LBB43_54 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_55
.LBB43_55 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_56
.LBB43_56 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_61
	JUMP	.LBB43_57
.LBB43_57 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 112(%GR7)
	LOAD	%GR1, 52(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_61
	JUMP	.LBB43_58
.LBB43_58 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_61
	JUMP	.LBB43_59
.LBB43_59 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB43_61
	JUMP	.LBB43_60
.LBB43_60 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_61 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 84(%GR7)
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 80(%GR7)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 76(%GR7)
	STORE	%GR6, 20(%GR7)
	LOAD	%GR4, 72(%GR7)
	LOAD	%GR5, 68(%GR7)
	LOAD	%GR3, 112(%GR7)
	LOAD	%GR1, 120(%GR7)
	LOAD	%GR6, 124(%GR7)
	ADDI	%GR2, %GR7, 8
	STORE	%GR6, 0(%GR2)
	ADDI	%GR6, %GR7, 4
	STORE	%GR1, 0(%GR6)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR1, 28(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	CALL	re_match_2
	COPYR	%GR6, %RT0
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_63
	JUMP	.LBB43_62
.LBB43_62 NOP 
	LOAD	%GR6, 112(%GR7)
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_63 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, -2
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_65
	JUMP	.LBB43_64
.LBB43_64 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_65 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_66
.LBB43_66 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_68
	JUMP	.LBB43_67
.LBB43_67 NOP 
	JUMP	.LBB43_73
.LBB43_68 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB43_70
	JUMP	.LBB43_69
.LBB43_69 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 116(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB43_71
.LBB43_70 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	LOAD	%GR6, 116(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 116(%GR7)
	LOAD	%GR6, 112(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 112(%GR7)
	JUMP	.LBB43_71
.LBB43_71 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_72
.LBB43_72 NOP                           ;   in Loop: Header=BB43_21 Depth=1
	JUMP	.LBB43_21
.LBB43_73 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB43_74
.LBB43_74 NOP 
	LOAD	%GR6, 88(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 92(%GR7)
	LOAD	%GR4, 96(%GR7)
	LOAD	%GR3, 100(%GR7)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR1, 108(%GR7)
	ADDI	%GR7, %GR7, 112
	RET
.Lfunc_end43 NOP 
	.size	re_search_2, .Lfunc_end43-re_search_2
                                        ; -- End function
	.globl	re_match_2              ; -- Begin function re_match_2
	.type	re_match_2,@function
re_match_2 NOP                          ; @re_match_2
; %bb.0:
	SUBI	%GR7, %GR7, 304
	STORE	%GR1, 300(%GR7)
	STORE	%GR2, 296(%GR7)
	STORE	%GR3, 292(%GR7)
	STORE	%GR4, 288(%GR7)
	LOAD	%GR6, 312(%GR7)
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR6, 304(%GR7)
	STORE	%GR1, 280(%GR7)
	STORE	%GR2, 276(%GR7)
	STORE	%GR3, 272(%GR7)
	STORE	%GR4, 268(%GR7)
	STORE	%GR5, 264(%GR7)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 228(%GR7)
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 280(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 220(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 204(%GR7)
	COPYI	%GR6, 257
	STORE	%GR6, 200(%GR7)
	COPYI	%GR6, 256
	STORE	%GR6, 196(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 172(%GR7)
	STORE	%GR6, 160(%GR7)
	JUMP	.LBB44_1
.LBB44_1 NOP 
	ADDI	%GR6, %GR7, -32
	COPYR	%GR7, %GR6
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_3
	JUMP	.LBB44_2
.LBB44_2 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_3 NOP 
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	COPYI	%GR2, 5
	STORE	%GR2, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_4
.LBB44_4 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_16
	JUMP	.LBB44_5
.LBB44_5 NOP 
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 192(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 188(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 184(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 180(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 168(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 164(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 176(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 156(%GR7)
	LOAD	%GR6, 204(%GR7)
	SHLI	%GR6, %GR6, 2
	ADDI	%GR6, %GR6, 15
	ANDI	%GR6, %GR6, -16
	SUB	%GR6, %GR7, %GR6
	COPYR	%GR7, %GR6
	STORE	%GR6, 152(%GR7)
	LOAD	%GR6, 192(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_6
.LBB44_6 NOP 
	LOAD	%GR6, 188(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_7
.LBB44_7 NOP 
	LOAD	%GR6, 184(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_8
.LBB44_8 NOP 
	LOAD	%GR6, 180(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_9
.LBB44_9 NOP 
	LOAD	%GR6, 176(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_10
.LBB44_10 NOP 
	LOAD	%GR6, 168(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_11
.LBB44_11 NOP 
	LOAD	%GR6, 164(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_12
.LBB44_12 NOP 
	LOAD	%GR6, 156(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_14
	JUMP	.LBB44_13
.LBB44_13 NOP 
	LOAD	%GR6, 152(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_15
	JUMP	.LBB44_14
.LBB44_14 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_15 NOP 
	JUMP	.LBB44_16
.LBB44_16 NOP 
	LOAD	%GR6, 304(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_18
	JUMP	.LBB44_17
.LBB44_17 NOP 
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 272(%GR7)
	LOAD	%GR2, 264(%GR7)
	ADD	%GR1, %GR1, %GR2
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_19
	JUMP	.LBB44_18
.LBB44_18 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_19 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_20
.LBB44_20 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 204(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_23
	JUMP	.LBB44_21
.LBB44_21 NOP                           ;   in Loop: Header=BB44_20 Depth=1
	LOAD	%GR6, 180(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR1, %GR6, %GR1
	COPYI	%GR6, -1
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 184(%GR7)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR1, 192(%GR7)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 3
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 251
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 247
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 239
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_22
.LBB44_22 NOP                           ;   in Loop: Header=BB44_20 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_20
.LBB44_23 NOP 
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_26
	JUMP	.LBB44_24
.LBB44_24 NOP 
	LOAD	%GR6, 276(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_26
	JUMP	.LBB44_25
.LBB44_25 NOP 
	LOAD	%GR6, 276(%GR7)
	STORE	%GR6, 268(%GR7)
	LOAD	%GR6, 272(%GR7)
	STORE	%GR6, 264(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 276(%GR7)
	STORE	%GR6, 272(%GR7)
	JUMP	.LBB44_26
.LBB44_26 NOP 
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 252(%GR7)
	LOAD	%GR6, 268(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 248(%GR7)
	LOAD	%GR6, 312(%GR7)
	LOAD	%GR1, 272(%GR7)
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_28
	JUMP	.LBB44_27
.LBB44_27 NOP 
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 312(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 244(%GR7)
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 240(%GR7)
	JUMP	.LBB44_29
.LBB44_28 NOP 
	LOAD	%GR6, 252(%GR7)
	STORE	%GR6, 244(%GR7)
	LOAD	%GR6, 268(%GR7)
	LOAD	%GR1, 312(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 272(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 240(%GR7)
	JUMP	.LBB44_29
.LBB44_29 NOP 
	LOAD	%GR6, 272(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_32
	JUMP	.LBB44_30
.LBB44_30 NOP 
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 272(%GR7)
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_32
	JUMP	.LBB44_31
.LBB44_31 NOP 
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 304(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 244(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_33
.LBB44_32 NOP 
	LOAD	%GR6, 268(%GR7)
	LOAD	%GR1, 304(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 272(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_33
.LBB44_33 NOP 
	JUMP	.LBB44_34
.LBB44_34 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB44_644 Depth 2
                                        ;     Child Loop BB44_659 Depth 2
                                        ;     Child Loop BB44_624 Depth 2
                                        ;     Child Loop BB44_638 Depth 2
                                        ;     Child Loop BB44_492 Depth 2
                                        ;     Child Loop BB44_502 Depth 2
                                        ;     Child Loop BB44_475 Depth 2
                                        ;     Child Loop BB44_485 Depth 2
                                        ;     Child Loop BB44_428 Depth 2
                                        ;     Child Loop BB44_462 Depth 2
                                        ;     Child Loop BB44_376 Depth 2
                                        ;     Child Loop BB44_386 Depth 2
                                        ;     Child Loop BB44_397 Depth 2
                                        ;     Child Loop BB44_408 Depth 2
                                        ;     Child Loop BB44_418 Depth 2
                                        ;     Child Loop BB44_312 Depth 2
                                        ;       Child Loop BB44_313 Depth 3
                                        ;       Child Loop BB44_323 Depth 3
                                        ;     Child Loop BB44_241 Depth 2
                                        ;     Child Loop BB44_270 Depth 2
                                        ;     Child Loop BB44_282 Depth 2
                                        ;     Child Loop BB44_292 Depth 2
                                        ;     Child Loop BB44_202 Depth 2
                                        ;     Child Loop BB44_216 Depth 2
                                        ;     Child Loop BB44_179 Depth 2
                                        ;     Child Loop BB44_196 Depth 2
                                        ;     Child Loop BB44_161 Depth 2
                                        ;       Child Loop BB44_162 Depth 3
                                        ;     Child Loop BB44_150 Depth 2
                                        ;       Child Loop BB44_151 Depth 3
                                        ;     Child Loop BB44_173 Depth 2
                                        ;     Child Loop BB44_46 Depth 2
                                        ;     Child Loop BB44_667 Depth 2
                                        ;       Child Loop BB44_671 Depth 3
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 224(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_119
	JUMP	.LBB44_35
.LBB44_35 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_64
	JUMP	.LBB44_36
.LBB44_36 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_51
	JUMP	.LBB44_37
.LBB44_37 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB44_40
	JUMP	.LBB44_38
.LBB44_38 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 160(%GR7)
	UGT	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB44_40
	JUMP	.LBB44_39
.LBB44_39 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 160(%GR7)
	LOAD	%GR1, 276(%GR7)
	LOAD	%GR2, 272(%GR7)
	ADD	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	JUMP	.LBB44_40
.LBB44_40 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	ANDI	%GR6, %GR6, 1
	LOAD	%GR1, 232(%GR7)
	LOAD	%GR2, 244(%GR7)
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR1
	STOREB	%GR6, 148(%GR7)
	LOAD	%GR6, 172(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_45
	JUMP	.LBB44_41
.LBB44_41 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOADB	%GR6, 148(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_43
	JUMP	.LBB44_42
.LBB44_42 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 160(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_45
	JUMP	.LBB44_43
.LBB44_43 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	ULOADB	%GR6, 148(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_50
	JUMP	.LBB44_44
.LBB44_44 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 244(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_50
	JUMP	.LBB44_45
.LBB44_45 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 1
	STORE	%GR6, 172(%GR7)
	LOAD	%GR1, 236(%GR7)
	STORE	%GR1, 160(%GR7)
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_46
.LBB44_46 NOP                           ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 204(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_49
	JUMP	.LBB44_47
.LBB44_47 NOP                           ;   in Loop: Header=BB44_46 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 168(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 164(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_48
.LBB44_48 NOP                           ;   in Loop: Header=BB44_46 Depth=2
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_46
.LBB44_49 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_50
.LBB44_50 NOP                           ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_51 NOP 
	LOAD	%GR6, 172(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_62
	JUMP	.LBB44_52
.LBB44_52 NOP 
	JUMP	.LBB44_53
.LBB44_53 NOP 
	LOAD	%GR6, 160(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 276(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_56
	JUMP	.LBB44_54
.LBB44_54 NOP 
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_56
	JUMP	.LBB44_55
.LBB44_55 NOP 
	LOAD	%GR6, 244(%GR7)
	JUMP	.LBB44_57
.LBB44_56 NOP 
	LOAD	%GR6, 240(%GR7)
	JUMP	.LBB44_57
.LBB44_57 NOP 
	STORE	%GR6, 232(%GR7)
	COPYI	%GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_58
.LBB44_58 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 204(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_61
	JUMP	.LBB44_59
.LBB44_59 NOP                           ;   in Loop: Header=BB44_58 Depth=1
	LOAD	%GR6, 168(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 192(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 164(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 188(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_60
.LBB44_60 NOP                           ;   in Loop: Header=BB44_58 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_58
.LBB44_61 NOP 
	JUMP	.LBB44_62
.LBB44_62 NOP 
	JUMP	.LBB44_63
.LBB44_63 NOP 
	JUMP	.LBB44_65
.LBB44_64 NOP                           ; %.loopexit2
	JUMP	.LBB44_65
.LBB44_65 NOP 
	LOAD	%GR6, 308(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_115
	JUMP	.LBB44_66
.LBB44_66 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 4
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB44_115
	JUMP	.LBB44_67
.LBB44_67 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_75
	JUMP	.LBB44_68
.LBB44_68 NOP 
	LOAD	%GR6, 204(%GR7)
	ADDI	%GR6, %GR6, 1
	COPYI	%GR1, 29
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_70
	JUMP	.LBB44_69
.LBB44_69 NOP 
	COPYI	%GR6, 30
	JUMP	.LBB44_71
.LBB44_70 NOP 
	LOAD	%GR6, 204(%GR7)
	ADDI	%GR6, %GR6, 1
	JUMP	.LBB44_71
.LBB44_71 NOP 
	LOAD	%GR1, 308(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR1, %GR6, 2
	CALL	malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR1, %GR6, 2
	CALL	malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_73
	JUMP	.LBB44_72
.LBB44_72 NOP 
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_74
	JUMP	.LBB44_73
.LBB44_73 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_74 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 249
	ORI	%GR1, %GR1, 2
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_84
.LBB44_75 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 1
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_82
	JUMP	.LBB44_76
.LBB44_76 NOP 
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 204(%GR7)
	ADDI	%GR1, %GR1, 1
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_81
	JUMP	.LBB44_77
.LBB44_77 NOP 
	LOAD	%GR6, 204(%GR7)
	ADDI	%GR6, %GR6, 1
	LOAD	%GR1, 308(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR2, %GR6, 2
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR2, %GR6, 2
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_79
	JUMP	.LBB44_78
.LBB44_78 NOP 
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_80
	JUMP	.LBB44_79
.LBB44_79 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_80 NOP 
	JUMP	.LBB44_81
.LBB44_81 NOP 
	JUMP	.LBB44_83
.LBB44_82 NOP 
	JUMP	.LBB44_83
.LBB44_83 NOP 
	JUMP	.LBB44_84
.LBB44_84 NOP 
	LOAD	%GR6, 308(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_89
	JUMP	.LBB44_85
.LBB44_85 NOP 
	LOAD	%GR6, 304(%GR7)
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 244(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_87
	JUMP	.LBB44_86
.LBB44_86 NOP 
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	JUMP	.LBB44_88
.LBB44_87 NOP 
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	JUMP	.LBB44_88
.LBB44_88 NOP 
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_89
.LBB44_89 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_90
.LBB44_90 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 204(%GR7)
	LOAD	%GR2, 308(%GR7)
	LOAD	%GR2, 0(%GR2)
	UGTE	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_92
	JUMP	.LBB44_91
.LBB44_91 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR1, 204(%GR7)
	JUMP	.LBB44_93
.LBB44_92 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR1, 308(%GR7)
	LOAD	%GR1, 0(%GR1)
	JUMP	.LBB44_93
.LBB44_93 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_110
	JUMP	.LBB44_94
.LBB44_94 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_96
	JUMP	.LBB44_95
.LBB44_95 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_97
	JUMP	.LBB44_96
.LBB44_96 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR6, %GR6, %GR2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_108
.LBB44_97 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 272(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_101
	JUMP	.LBB44_98
.LBB44_98 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 192(%GR7)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_101
	JUMP	.LBB44_99
.LBB44_99 NOP                           ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 276(%GR7)
	LOAD	%GR2, 272(%GR7)
	ADD	%GR1, %GR1, %GR2
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_101
	JUMP	.LBB44_100
.LBB44_100 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	JUMP	.LBB44_102
.LBB44_101 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 268(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	JUMP	.LBB44_102
.LBB44_102 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 272(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_106
	JUMP	.LBB44_103
.LBB44_103 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_106
	JUMP	.LBB44_104
.LBB44_104 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 276(%GR7)
	LOAD	%GR2, 272(%GR7)
	ADD	%GR1, %GR1, %GR2
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_106
	JUMP	.LBB44_105
.LBB44_105 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 276(%GR7)
	SUB	%GR6, %GR6, %GR1
	JUMP	.LBB44_107
.LBB44_106 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 268(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	JUMP	.LBB44_107
.LBB44_107 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR1, 308(%GR7)
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_108
.LBB44_108 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	JUMP	.LBB44_109
.LBB44_109 NOP                          ;   in Loop: Header=BB44_90 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_90
.LBB44_110 NOP 
	LOAD	%GR6, 204(%GR7)
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_111
.LBB44_111 NOP                          ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 308(%GR7)
	LOAD	%GR1, 0(%GR1)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_114
	JUMP	.LBB44_112
.LBB44_112 NOP                          ;   in Loop: Header=BB44_111 Depth=1
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 260(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 308(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 260(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR6, %GR6, %GR2
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_113
.LBB44_113 NOP                          ;   in Loop: Header=BB44_111 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_111
.LBB44_114 NOP 
	JUMP	.LBB44_115
.LBB44_115 NOP 
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 304(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 232(%GR7)
	LOAD	%GR2, 244(%GR7)
	NEQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_117
	JUMP	.LBB44_116
.LBB44_116 NOP 
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_118
.LBB44_117 NOP 
	LOAD	%GR1, 268(%GR7)
	LOAD	%GR2, 272(%GR7)
	SUB	%GR1, %GR1, %GR2
	JUMP	.LBB44_118
.LBB44_118 NOP 
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 260(%GR7)
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_119 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_147
	JUMP	.LBB44_120
.LBB44_120 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 1
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_148
	JUMP	.LBB44_121
.LBB44_121 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 2
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_178
	JUMP	.LBB44_122
.LBB44_122 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ADDI	%GR1, %GR6, -3
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_201
	JUMP	.LBB44_123
.LBB44_123 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 5
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_221
	JUMP	.LBB44_124
.LBB44_124 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 6
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_232
	JUMP	.LBB44_125
.LBB44_125 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 7
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_299
	JUMP	.LBB44_126
.LBB44_126 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 8
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_335
	JUMP	.LBB44_127
.LBB44_127 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 9
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_348
	JUMP	.LBB44_128
.LBB44_128 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_360
	JUMP	.LBB44_129
.LBB44_129 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 11
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_367
	JUMP	.LBB44_130
.LBB44_130 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 12
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_466
	JUMP	.LBB44_131
.LBB44_131 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 13
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_472
	JUMP	.LBB44_132
.LBB44_132 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 14
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_391
	JUMP	.LBB44_133
.LBB44_133 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 15
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_370
	JUMP	.LBB44_134
.LBB44_134 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 16
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_459
	JUMP	.LBB44_135
.LBB44_135 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 17
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_423
	JUMP	.LBB44_136
.LBB44_136 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 18
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_473
	JUMP	.LBB44_137
.LBB44_137 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 19
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_490
	JUMP	.LBB44_138
.LBB44_138 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 20
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_507
	JUMP	.LBB44_139
.LBB44_139 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 21
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_519
	JUMP	.LBB44_140
.LBB44_140 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 22
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_527
	JUMP	.LBB44_141
.LBB44_141 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 23
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_623
	JUMP	.LBB44_142
.LBB44_142 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 24
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_643
	JUMP	.LBB44_143
.LBB44_143 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 25
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_580
	JUMP	.LBB44_144
.LBB44_144 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 26
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_601
	JUMP	.LBB44_145
.LBB44_145 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 27
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_538
	JUMP	.LBB44_146
.LBB44_146 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 28
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_559
	JUMP	.LBB44_664
.LBB44_147 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_148 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 220(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_160
	JUMP	.LBB44_149
.LBB44_149 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_150
.LBB44_150 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB44_151 Depth 3
	JUMP	.LBB44_151
.LBB44_151 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ;     Parent Loop BB44_150 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_155
	JUMP	.LBB44_152
.LBB44_152 NOP                          ;   in Loop: Header=BB44_151 Depth=3
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_154
	JUMP	.LBB44_153
.LBB44_153 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_154 NOP                          ;   in Loop: Header=BB44_151 Depth=3
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_151
.LBB44_155 NOP                          ;   in Loop: Header=BB44_150 Depth=2
	LOAD	%GR6, 220(%GR7)
	LOAD	%GR1, 236(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 236(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 228(%GR7)
	LOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_157
	JUMP	.LBB44_156
.LBB44_156 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_157 NOP                          ;   in Loop: Header=BB44_150 Depth=2
	JUMP	.LBB44_158
.LBB44_158 NOP                          ;   in Loop: Header=BB44_150 Depth=2
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 260(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_150
	JUMP	.LBB44_159
.LBB44_159 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_171
.LBB44_160 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_161
.LBB44_161 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB44_162 Depth 3
	JUMP	.LBB44_162
.LBB44_162 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ;     Parent Loop BB44_161 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_166
	JUMP	.LBB44_163
.LBB44_163 NOP                          ;   in Loop: Header=BB44_162 Depth=3
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_165
	JUMP	.LBB44_164
.LBB44_164 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_165 NOP                          ;   in Loop: Header=BB44_162 Depth=3
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_162
.LBB44_166 NOP                          ;   in Loop: Header=BB44_161 Depth=2
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 228(%GR7)
	LOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_168
	JUMP	.LBB44_167
.LBB44_167 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_168 NOP                          ;   in Loop: Header=BB44_161 Depth=2
	JUMP	.LBB44_169
.LBB44_169 NOP                          ;   in Loop: Header=BB44_161 Depth=2
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 260(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_161
	JUMP	.LBB44_170
.LBB44_170 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_171
.LBB44_171 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_172
.LBB44_172 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB44_173
.LBB44_173 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 144(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_176
	JUMP	.LBB44_174
.LBB44_174 NOP                          ;   in Loop: Header=BB44_173 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 144(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 16
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 144(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_175
.LBB44_175 NOP                          ;   in Loop: Header=BB44_173 Depth=2
	LOAD	%GR6, 144(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 144(%GR7)
	JUMP	.LBB44_173
.LBB44_176 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_177
.LBB44_177 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_178 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_179
.LBB44_179 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_183
	JUMP	.LBB44_180
.LBB44_180 NOP                          ;   in Loop: Header=BB44_179 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_182
	JUMP	.LBB44_181
.LBB44_181 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_182 NOP                          ;   in Loop: Header=BB44_179 Depth=2
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_179
.LBB44_183 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_188
	JUMP	.LBB44_184
.LBB44_184 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_186
	JUMP	.LBB44_185
.LBB44_185 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	LOAD	%GR1, 236(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_187
.LBB44_186 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_187
.LBB44_187 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 10
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_193
	JUMP	.LBB44_188
.LBB44_188 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 12
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_194
	JUMP	.LBB44_189
.LBB44_189 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_191
	JUMP	.LBB44_190
.LBB44_190 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	LOAD	%GR1, 236(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_192
.LBB44_191 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_192
.LBB44_192 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_194
	JUMP	.LBB44_193
.LBB44_193 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_194 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_195
.LBB44_195 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 140(%GR7)
	JUMP	.LBB44_196
.LBB44_196 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 140(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_199
	JUMP	.LBB44_197
.LBB44_197 NOP                          ;   in Loop: Header=BB44_196 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 16
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_198
.LBB44_198 NOP                          ;   in Loop: Header=BB44_196 Depth=2
	LOAD	%GR6, 140(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 140(%GR7)
	JUMP	.LBB44_196
.LBB44_199 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_200
.LBB44_200 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 236(%GR7)
	JUMP	.LBB44_665
.LBB44_201 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	STOREB	%GR6, 132(%GR7)
	JUMP	.LBB44_202
.LBB44_202 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_206
	JUMP	.LBB44_203
.LBB44_203 NOP                          ;   in Loop: Header=BB44_202 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_205
	JUMP	.LBB44_204
.LBB44_204 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_205 NOP                          ;   in Loop: Header=BB44_202 Depth=2
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_202
.LBB44_206 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_208
	JUMP	.LBB44_207
.LBB44_207 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 220(%GR7)
	LOAD	%GR1, 236(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_209
.LBB44_208 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_209
.LBB44_209 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	STOREB	%GR6, 136(%GR7)
	ULOADB	%GR6, 136(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 3
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_212
	JUMP	.LBB44_210
.LBB44_210 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR1, 136(%GR7)
	SRLI	%GR2, %GR1, 3
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR1, %GR1, 7
	SRL	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_212
	JUMP	.LBB44_211
.LBB44_211 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ULOADB	%GR6, 132(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	STOREB	%GR6, 132(%GR7)
	JUMP	.LBB44_212
.LBB44_212 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR1, 0(%GR6)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 228(%GR7)
	ULOADB	%GR6, 132(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_214
	JUMP	.LBB44_213
.LBB44_213 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_214 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_215
.LBB44_215 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 128(%GR7)
	JUMP	.LBB44_216
.LBB44_216 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 128(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_219
	JUMP	.LBB44_217
.LBB44_217 NOP                          ;   in Loop: Header=BB44_216 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 128(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 16
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 128(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_218
.LBB44_218 NOP                          ;   in Loop: Header=BB44_216 Depth=2
	LOAD	%GR6, 128(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 128(%GR7)
	JUMP	.LBB44_216
.LBB44_219 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_220
.LBB44_220 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 236(%GR7)
	JUMP	.LBB44_665
.LBB44_221 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	STORE	%GR6, 256(%GR7)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_223
	JUMP	.LBB44_222
.LBB44_222 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR2, 224(%GR7)
	LOAD	%GR3, 176(%GR7)
	ADDI	%GR1, %GR7, 256
	CALL	group_match_null_string_p
	COPYR	%GR6, %RT0
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 228(%GR7)
	ULOADB	%GR2, 0(%GR2)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	ULOADB	%GR2, 0(%GR1)
	ANDI	%GR6, %GR6, 3
	ANDI	%GR2, %GR2, 252
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB44_223
.LBB44_223 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_228
	JUMP	.LBB44_224
.LBB44_224 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_226
	JUMP	.LBB44_225
.LBB44_225 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	JUMP	.LBB44_227
.LBB44_226 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB44_227
.LBB44_227 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_229
.LBB44_228 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB44_229
.LBB44_229 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 184(%GR7)
	LOAD	%GR2, 228(%GR7)
	ULOADB	%GR2, 0(%GR2)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 192(%GR7)
	LOAD	%GR2, 228(%GR7)
	ULOADB	%GR2, 0(%GR2)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 247
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 196(%GR7)
	LOAD	%GR6, 200(%GR7)
	COPYI	%GR1, 257
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_231
	JUMP	.LBB44_230
.LBB44_230 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 200(%GR7)
	JUMP	.LBB44_231
.LBB44_231 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_665
.LBB44_232 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_237
	JUMP	.LBB44_233
.LBB44_233 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_235
	JUMP	.LBB44_234
.LBB44_234 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	JUMP	.LBB44_236
.LBB44_235 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB44_236
.LBB44_236 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_238
.LBB44_237 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB44_238
.LBB44_238 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 180(%GR7)
	LOAD	%GR2, 228(%GR7)
	ULOADB	%GR2, 0(%GR2)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 228(%GR7)
	ULOADB	%GR2, 0(%GR2)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 251
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 200(%GR7)
	LOAD	%GR1, 196(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_240
	JUMP	.LBB44_239
.LBB44_239 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 257
	STORE	%GR6, 200(%GR7)
	COPYI	%GR6, 256
	STORE	%GR6, 196(%GR7)
	JUMP	.LBB44_249
.LBB44_240 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	STOREB	%GR6, 124(%GR7)
	JUMP	.LBB44_241
.LBB44_241 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 124(%GR7)
	COPYI	%GR1, 1
	LT	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB44_243
	JUMP	.LBB44_242
.LBB44_242 NOP                          ;   in Loop: Header=BB44_241 Depth=2
	LOAD	%GR6, 176(%GR7)
	ULOADB	%GR1, 124(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB44_243
.LBB44_243 NOP                          ;   in Loop: Header=BB44_241 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_245
	JUMP	.LBB44_244
.LBB44_244 NOP                          ;   in Loop: Header=BB44_241 Depth=2
	ULOADB	%GR6, 124(%GR7)
	ADDI	%GR6, %GR6, -1
	STOREB	%GR6, 124(%GR7)
	JUMP	.LBB44_241
.LBB44_245 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ULOADB	%GR6, 124(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_247
	JUMP	.LBB44_246
.LBB44_246 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 257
	STORE	%GR6, 200(%GR7)
	COPYI	%GR6, 256
	STORE	%GR6, 196(%GR7)
	JUMP	.LBB44_248
.LBB44_247 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ULOADB	%GR6, 124(%GR7)
	STORE	%GR6, 196(%GR7)
	JUMP	.LBB44_248
.LBB44_248 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_249
.LBB44_249 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 3
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_251
	JUMP	.LBB44_250
.LBB44_250 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 5
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_298
	JUMP	.LBB44_251
.LBB44_251 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	LOAD	%GR1, 224(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_298
	JUMP	.LBB44_252
.LBB44_252 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 120(%GR7)
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR1, %GR1, 2
	STORE	%GR1, 256(%GR7)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 12
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_256
	JUMP	.LBB44_253
.LBB44_253 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ADDI	%GR1, %GR6, -16
	COPYI	%GR2, 3
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_256
	JUMP	.LBB44_254
.LBB44_254 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 21
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_263
	JUMP	.LBB44_255
.LBB44_255 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 1
	STOREB	%GR6, 120(%GR7)
	JUMP	.LBB44_256
.LBB44_256 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_257
.LBB44_257 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_258
.LBB44_258 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_259
.LBB44_259 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_260
.LBB44_260 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ULOADB	%GR6, 120(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_262
	JUMP	.LBB44_261
.LBB44_261 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_262
.LBB44_262 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_264
.LBB44_263 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_264
.LBB44_264 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 256(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 256(%GR7)
	LOAD	%GR6, 260(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_297
	JUMP	.LBB44_265
.LBB44_265 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 14
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_297
	JUMP	.LBB44_266
.LBB44_266 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 5
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_297
	JUMP	.LBB44_267
.LBB44_267 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 4
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_297
	JUMP	.LBB44_268
.LBB44_268 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 4
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_276
	JUMP	.LBB44_269
.LBB44_269 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 239
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB44_270
.LBB44_270 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 116(%GR7)
	LOAD	%GR1, 228(%GR7)
	ULOADB	%GR2, 0(%GR1)
	ADDI	%GR1, %GR1, 1
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR1, %GR2, %GR1
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_275
	JUMP	.LBB44_271
.LBB44_271 NOP                          ;   in Loop: Header=BB44_270 Depth=2
	LOAD	%GR6, 184(%GR7)
	LOAD	%GR1, 116(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 192(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 180(%GR7)
	LOAD	%GR1, 116(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 192(%GR7)
	ADD	%GR1, %GR2, %GR1
	LOAD	%GR1, 0(%GR1)
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_273
	JUMP	.LBB44_272
.LBB44_272 NOP                          ;   in Loop: Header=BB44_270 Depth=2
	LOAD	%GR6, 180(%GR7)
	LOAD	%GR1, 116(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 188(%GR7)
	ADD	%GR1, %GR2, %GR1
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_273
.LBB44_273 NOP                          ;   in Loop: Header=BB44_270 Depth=2
	JUMP	.LBB44_274
.LBB44_274 NOP                          ;   in Loop: Header=BB44_270 Depth=2
	LOAD	%GR6, 116(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 116(%GR7)
	JUMP	.LBB44_270
.LBB44_275 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_276
.LBB44_276 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_277
.LBB44_277 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_278
.LBB44_278 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_279
.LBB44_279 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_280
.LBB44_280 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_281
.LBB44_281 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_282
.LBB44_282 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 200(%GR7)
	SUB	%GR1, %GR1, %GR2
	MULI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 7
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_291
	JUMP	.LBB44_283
.LBB44_283 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 204(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_285
	JUMP	.LBB44_284
.LBB44_284 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB44_290
	JUMP	.LBB44_289
.LBB44_285 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 112(%GR7)
	LOAD	%GR1, 112(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 112(%GR7)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_287
	JUMP	.LBB44_286
.LBB44_286 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	COPYI	%GR6, 0
	JUMP	.LBB44_288
.LBB44_287 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB44_288
.LBB44_288 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_290
	JUMP	.LBB44_289
.LBB44_289 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_290 NOP                          ;   in Loop: Header=BB44_282 Depth=2
	JUMP	.LBB44_282
.LBB44_291 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 108(%GR7)
	JUMP	.LBB44_292
.LBB44_292 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 108(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_295
	JUMP	.LBB44_293
.LBB44_293 NOP                          ;   in Loop: Header=BB44_292 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 108(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 108(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 108(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_294
.LBB44_294 NOP                          ;   in Loop: Header=BB44_292 Depth=2
	LOAD	%GR6, 108(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 108(%GR7)
	JUMP	.LBB44_292
.LBB44_295 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 200(%GR7)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 256(%GR7)
	LOAD	%GR2, 260(%GR7)
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_296
.LBB44_296 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_297 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_298
.LBB44_298 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_665
.LBB44_299 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 96(%GR7)
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_301
	JUMP	.LBB44_300
.LBB44_300 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_302
	JUMP	.LBB44_301
.LBB44_301 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_302 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 104(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB44_305
	JUMP	.LBB44_303
.LBB44_303 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 276(%GR7)
	LOAD	%GR1, 192(%GR7)
	LOAD	%GR2, 96(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	UGT	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB44_305
	JUMP	.LBB44_304
.LBB44_304 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 276(%GR7)
	LOAD	%GR2, 272(%GR7)
	ADD	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	JUMP	.LBB44_305
.LBB44_305 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ANDI	%GR6, %GR6, 1
	LOAD	%GR2, 272(%GR7)
	COPYI	%GR1, 0
	EQ	%GR2, %GR2, %GR1
	BNEQZ	%GR2, .LBB44_308
	JUMP	.LBB44_306
.LBB44_306 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	LOAD	%GR2, 188(%GR7)
	LOAD	%GR3, 96(%GR7)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	LOAD	%GR2, 0(%GR2)
	UGT	%GR2, %GR1, %GR2
	COPYI	%GR1, 0
	BNEQZ	%GR2, .LBB44_308
	JUMP	.LBB44_307
.LBB44_307 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 96(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 276(%GR7)
	LOAD	%GR3, 272(%GR7)
	ADD	%GR2, %GR2, %GR3
	ULTE	%GR1, %GR1, %GR2
	JUMP	.LBB44_308
.LBB44_308 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	ANDI	%GR1, %GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_310
	JUMP	.LBB44_309
.LBB44_309 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	JUMP	.LBB44_311
.LBB44_310 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 244(%GR7)
	JUMP	.LBB44_311
.LBB44_311 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB44_312
.LBB44_312 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB44_313 Depth 3
                                        ;       Child Loop BB44_323 Depth 3
	JUMP	.LBB44_313
.LBB44_313 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ;     Parent Loop BB44_312 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 104(%GR7)
	LOAD	%GR1, 100(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_319
	JUMP	.LBB44_314
.LBB44_314 NOP                          ;   in Loop: Header=BB44_313 Depth=3
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_316
	JUMP	.LBB44_315
.LBB44_315 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	JUMP	.LBB44_320
.LBB44_316 NOP                          ;   in Loop: Header=BB44_313 Depth=3
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 96(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_318
	JUMP	.LBB44_317
.LBB44_317 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	JUMP	.LBB44_320
.LBB44_318 NOP                          ;   in Loop: Header=BB44_313 Depth=3
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 104(%GR7)
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 96(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 100(%GR7)
	JUMP	.LBB44_313
.LBB44_319 NOP                          ; %.loopexit
                                        ;   in Loop: Header=BB44_312 Depth=2
	JUMP	.LBB44_320
.LBB44_320 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR6, 104(%GR7)
	LOAD	%GR1, 100(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_322
	JUMP	.LBB44_321
.LBB44_321 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_334
.LBB44_322 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	JUMP	.LBB44_323
.LBB44_323 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ;     Parent Loop BB44_312 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_327
	JUMP	.LBB44_324
.LBB44_324 NOP                          ;   in Loop: Header=BB44_323 Depth=3
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_326
	JUMP	.LBB44_325
.LBB44_325 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_326 NOP                          ;   in Loop: Header=BB44_323 Depth=3
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_323
.LBB44_327 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 236(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 100(%GR7)
	LOAD	%GR2, 104(%GR7)
	SUB	%GR1, %GR1, %GR2
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_329
	JUMP	.LBB44_328
.LBB44_328 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR6, 100(%GR7)
	LOAD	%GR1, 104(%GR7)
	SUB	%GR6, %GR6, %GR1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_329
.LBB44_329 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR6, 220(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_331
	JUMP	.LBB44_330
.LBB44_330 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR3, 260(%GR7)
	LOAD	%GR4, 220(%GR7)
	CALL	bcmp_translate
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_332
	JUMP	.LBB44_333
.LBB44_331 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR3, 260(%GR7)
	CALL	memcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_333
	JUMP	.LBB44_332
.LBB44_332 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_333 NOP                          ;   in Loop: Header=BB44_312 Depth=2
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 236(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 104(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 104(%GR7)
	JUMP	.LBB44_312
.LBB44_334 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_335 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_337
	JUMP	.LBB44_336
.LBB44_336 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_338
.LBB44_337 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_338
.LBB44_338 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_340
	JUMP	.LBB44_339
.LBB44_339 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_343
	JUMP	.LBB44_340
.LBB44_340 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 5
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB44_342
	JUMP	.LBB44_341
.LBB44_341 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_342 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_347
.LBB44_343 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_346
	JUMP	.LBB44_344
.LBB44_344 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_346
	JUMP	.LBB44_345
.LBB44_345 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_346 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_347
.LBB44_347 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_348 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 248(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_352
	JUMP	.LBB44_349
.LBB44_349 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 6
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB44_351
	JUMP	.LBB44_350
.LBB44_350 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_351 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_359
.LBB44_352 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_354
	JUMP	.LBB44_353
.LBB44_353 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_355
.LBB44_354 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_355
.LBB44_355 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, 10
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_358
	JUMP	.LBB44_356
.LBB44_356 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_358
	JUMP	.LBB44_357
.LBB44_357 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_358 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_359
.LBB44_359 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_360 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_362
	JUMP	.LBB44_361
.LBB44_361 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_363
.LBB44_362 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_363
.LBB44_363 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_365
	JUMP	.LBB44_364
.LBB44_364 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_366
	JUMP	.LBB44_365
.LBB44_365 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_366 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_367 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 248(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_369
	JUMP	.LBB44_368
.LBB44_368 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_369 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_370 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_371
.LBB44_371 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_372
.LBB44_372 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_373
.LBB44_373 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_374
.LBB44_374 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_375
.LBB44_375 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_376
.LBB44_376 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 200(%GR7)
	SUB	%GR1, %GR1, %GR2
	MULI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 7
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_385
	JUMP	.LBB44_377
.LBB44_377 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 204(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_379
	JUMP	.LBB44_378
.LBB44_378 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB44_384
	JUMP	.LBB44_383
.LBB44_379 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 92(%GR7)
	LOAD	%GR1, 92(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 92(%GR7)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_381
	JUMP	.LBB44_380
.LBB44_380 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	COPYI	%GR6, 0
	JUMP	.LBB44_382
.LBB44_381 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB44_382
.LBB44_382 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_384
	JUMP	.LBB44_383
.LBB44_383 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_384 NOP                          ;   in Loop: Header=BB44_376 Depth=2
	JUMP	.LBB44_376
.LBB44_385 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB44_386
.LBB44_386 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_389
	JUMP	.LBB44_387
.LBB44_387 NOP                          ;   in Loop: Header=BB44_386 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 88(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 88(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 88(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_388
.LBB44_388 NOP                          ;   in Loop: Header=BB44_386 Depth=2
	LOAD	%GR6, 88(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB44_386
.LBB44_389 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 200(%GR7)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 228(%GR7)
	LOAD	%GR2, 260(%GR7)
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR6)
	SHLI	%GR6, %GR2, 2
	ADD	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_390
.LBB44_390 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_391 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_392
.LBB44_392 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_393
.LBB44_393 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_394
.LBB44_394 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_395
.LBB44_395 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_396
.LBB44_396 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_397
.LBB44_397 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 256(%GR7)
	LOAD	%GR1, 224(%GR7)
	UGTE	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB44_399
	JUMP	.LBB44_398
.LBB44_398 NOP                          ;   in Loop: Header=BB44_397 Depth=2
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB44_399
.LBB44_399 NOP                          ;   in Loop: Header=BB44_397 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_401
	JUMP	.LBB44_400
.LBB44_400 NOP                          ;   in Loop: Header=BB44_397 Depth=2
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_397
.LBB44_401 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	LOAD	%GR1, 224(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_406
	JUMP	.LBB44_402
.LBB44_402 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 5
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_406
	JUMP	.LBB44_403
.LBB44_403 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR1, %GR6, 1
	ULOADB	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 196(%GR7)
	LOAD	%GR6, 200(%GR7)
	COPYI	%GR1, 257
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_405
	JUMP	.LBB44_404
.LBB44_404 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 200(%GR7)
	JUMP	.LBB44_405
.LBB44_405 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_406
.LBB44_406 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_407
.LBB44_407 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_408
.LBB44_408 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 200(%GR7)
	SUB	%GR1, %GR1, %GR2
	MULI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 7
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_417
	JUMP	.LBB44_409
.LBB44_409 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 204(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_411
	JUMP	.LBB44_410
.LBB44_410 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB44_416
	JUMP	.LBB44_415
.LBB44_411 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 84(%GR7)
	LOAD	%GR1, 84(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 84(%GR7)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_413
	JUMP	.LBB44_412
.LBB44_412 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	COPYI	%GR6, 0
	JUMP	.LBB44_414
.LBB44_413 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB44_414
.LBB44_414 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_416
	JUMP	.LBB44_415
.LBB44_415 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_416 NOP                          ;   in Loop: Header=BB44_408 Depth=2
	JUMP	.LBB44_408
.LBB44_417 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 80(%GR7)
	JUMP	.LBB44_418
.LBB44_418 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_421
	JUMP	.LBB44_419
.LBB44_419 NOP                          ;   in Loop: Header=BB44_418 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 80(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 80(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 80(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_420
.LBB44_420 NOP                          ;   in Loop: Header=BB44_418 Depth=2
	LOAD	%GR6, 80(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 80(%GR7)
	JUMP	.LBB44_418
.LBB44_421 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 200(%GR7)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 228(%GR7)
	LOAD	%GR2, 260(%GR7)
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_422
.LBB44_422 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_423 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_424
.LBB44_424 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_425
.LBB44_425 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_426
.LBB44_426 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_427
.LBB44_427 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB44_428
.LBB44_428 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 76(%GR7)
	ADDI	%GR6, %GR6, 2
	LOAD	%GR1, 224(%GR7)
	UGTE	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB44_432
	JUMP	.LBB44_429
.LBB44_429 NOP                          ;   in Loop: Header=BB44_428 Depth=2
	LOAD	%GR6, 76(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 6
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB44_431
	JUMP	.LBB44_430
.LBB44_430 NOP                          ;   in Loop: Header=BB44_428 Depth=2
	LOAD	%GR6, 76(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 5
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB44_431
.LBB44_431 NOP                          ;   in Loop: Header=BB44_428 Depth=2
	JUMP	.LBB44_432
.LBB44_432 NOP                          ;   in Loop: Header=BB44_428 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_434
	JUMP	.LBB44_433
.LBB44_433 NOP                          ;   in Loop: Header=BB44_428 Depth=2
	LOAD	%GR6, 76(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 76(%GR7)
	JUMP	.LBB44_428
.LBB44_434 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 76(%GR7)
	LOAD	%GR1, 224(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_436
	JUMP	.LBB44_435
.LBB44_435 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -3
	COPYI	%GR1, 16
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_456
.LBB44_436 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 76(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_439
	JUMP	.LBB44_437
.LBB44_437 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 7
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_455
	JUMP	.LBB44_438
.LBB44_438 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 76(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 9
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_455
	JUMP	.LBB44_439
.LBB44_439 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 76(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 9
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_441
	JUMP	.LBB44_440
.LBB44_440 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR6, 10
	JUMP	.LBB44_442
.LBB44_441 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 76(%GR7)
	ADDI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_442
.LBB44_442 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	STOREB	%GR6, 72(%GR7)
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 256(%GR7)
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_445
	JUMP	.LBB44_443
.LBB44_443 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 5
	ULOADB	%GR6, 0(%GR6)
	ULOADB	%GR1, 72(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_445
	JUMP	.LBB44_444
.LBB44_444 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -3
	COPYI	%GR1, 16
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_454
.LBB44_445 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 3
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_447
	JUMP	.LBB44_446
.LBB44_446 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 4
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_453
	JUMP	.LBB44_447
.LBB44_447 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 4
	EQ	%GR6, %GR6, %GR1
	STORE	%GR6, 68(%GR7)
	ULOADB	%GR6, 72(%GR7)
	LOAD	%GR1, 256(%GR7)
	ADDI	%GR1, %GR1, 4
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 3
	ANDI	%GR1, %GR1, 248
	GTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_450
	JUMP	.LBB44_448
.LBB44_448 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR1, 72(%GR7)
	SRLI	%GR2, %GR1, 3
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR6, %GR6, 5
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR1, %GR1, 7
	SRL	%GR6, %GR6, %GR1
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_450
	JUMP	.LBB44_449
.LBB44_449 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	STORE	%GR6, 68(%GR7)
	JUMP	.LBB44_450
.LBB44_450 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 68(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_452
	JUMP	.LBB44_451
.LBB44_451 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -3
	COPYI	%GR1, 16
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_452
.LBB44_452 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_453
.LBB44_453 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_454
.LBB44_454 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_455
.LBB44_455 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_456
.LBB44_456 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -2
	STORE	%GR6, 228(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 16
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_458
	JUMP	.LBB44_457
.LBB44_457 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, -1
	COPYI	%GR1, 12
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_467
.LBB44_458 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_459
.LBB44_459 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR1, %GR7, 208
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR1)
	SHLI	%GR1, %GR2, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 44(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_461
	JUMP	.LBB44_460
.LBB44_460 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 44(%GR7)
	STORE	%GR6, 52(%GR7)
	JUMP	.LBB44_461
.LBB44_461 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 56(%GR7)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 60(%GR7)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR6, %GR2, 2
	ADD	%GR6, %GR1, %GR6
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 60(%GR7)
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB44_462
.LBB44_462 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 48(%GR7)
	LOAD	%GR1, 64(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_465
	JUMP	.LBB44_463
.LBB44_463 NOP                          ;   in Loop: Header=BB44_462 Depth=2
	LOAD	%GR1, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 152(%GR7)
	LOAD	%GR3, 48(%GR7)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 156(%GR7)
	LOAD	%GR3, 48(%GR7)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR6, %GR2, 2
	ADD	%GR6, %GR1, %GR6
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 156(%GR7)
	LOAD	%GR2, 48(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_464
.LBB44_464 NOP                          ;   in Loop: Header=BB44_462 Depth=2
	LOAD	%GR6, 48(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB44_462
.LBB44_465 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_466
.LBB44_466 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_467
.LBB44_467 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_468
.LBB44_468 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_469
.LBB44_469 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_470
.LBB44_470 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_471
.LBB44_471 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 228(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_665
.LBB44_472 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_467
.LBB44_473 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_474
.LBB44_474 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_475
.LBB44_475 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 200(%GR7)
	SUB	%GR1, %GR1, %GR2
	MULI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 7
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_484
	JUMP	.LBB44_476
.LBB44_476 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 204(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_478
	JUMP	.LBB44_477
.LBB44_477 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB44_483
	JUMP	.LBB44_482
.LBB44_478 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 40(%GR7)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 40(%GR7)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_480
	JUMP	.LBB44_479
.LBB44_479 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	COPYI	%GR6, 0
	JUMP	.LBB44_481
.LBB44_480 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB44_481
.LBB44_481 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_483
	JUMP	.LBB44_482
.LBB44_482 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_483 NOP                          ;   in Loop: Header=BB44_475 Depth=2
	JUMP	.LBB44_475
.LBB44_484 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 36(%GR7)
	JUMP	.LBB44_485
.LBB44_485 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_488
	JUMP	.LBB44_486
.LBB44_486 NOP                          ;   in Loop: Header=BB44_485 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 36(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 36(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 36(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_487
.LBB44_487 NOP                          ;   in Loop: Header=BB44_485 Depth=2
	LOAD	%GR6, 36(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 36(%GR7)
	JUMP	.LBB44_485
.LBB44_488 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 200(%GR7)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR1, %GR6
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB44_489
.LBB44_489 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_467
.LBB44_490 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_491
.LBB44_491 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_492
.LBB44_492 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	SUB	%GR6, %GR1, %GR6
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 200(%GR7)
	SUB	%GR1, %GR1, %GR2
	MULI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 7
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_501
	JUMP	.LBB44_493
.LBB44_493 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, re_max_failures
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 204(%GR7)
	MULI	%GR2, %GR2, 3
	ADDI	%GR2, %GR2, 1
	MUL	%GR1, %GR1, %GR2
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_495
	JUMP	.LBB44_494
.LBB44_494 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	COPYI	%GR6, 0
	BNEQZ	%GR6, .LBB44_500
	JUMP	.LBB44_499
.LBB44_495 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 3
	ADDI	%GR1, %GR1, 15
	ANDI	%GR1, %GR1, -16
	SUB	%GR1, %GR7, %GR1
	COPYR	%GR7, %GR1
	STORE	%GR1, 32(%GR7)
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR6, 0(%GR6)
	SHLI	%GR3, %GR6, 2
	CALL	memcpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 32(%GR7)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 208(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_497
	JUMP	.LBB44_496
.LBB44_496 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	COPYI	%GR6, 0
	JUMP	.LBB44_498
.LBB44_497 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	ADDI	%GR6, %GR7, 208
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 1
	JUMP	.LBB44_498
.LBB44_498 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_500
	JUMP	.LBB44_499
.LBB44_499 NOP 
	COPYI	%GR6, -2
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_500 NOP                          ;   in Loop: Header=BB44_492 Depth=2
	JUMP	.LBB44_492
.LBB44_501 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB44_502
.LBB44_502 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_505
	JUMP	.LBB44_503
.LBB44_503 NOP                          ;   in Loop: Header=BB44_502 Depth=2
	LOAD	%GR6, 192(%GR7)
	LOAD	%GR1, 28(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR1, 0(%GR6)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 188(%GR7)
	LOAD	%GR2, 28(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 176(%GR7)
	LOAD	%GR2, 28(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR2, %GR6
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB44_504
.LBB44_504 NOP                          ;   in Loop: Header=BB44_502 Depth=2
	LOAD	%GR6, 28(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB44_502
.LBB44_505 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 200(%GR7)
	LOAD	%GR2, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 196(%GR7)
	LOAD	%GR2, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	COPYI	%GR2, 0
	STORE	%GR2, 0(%GR1)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR3, 0(%GR6)
	ADDI	%GR4, %GR3, 1
	STORE	%GR4, 0(%GR6)
	SHLI	%GR6, %GR3, 2
	ADD	%GR6, %GR1, %GR6
	STORE	%GR2, 0(%GR6)
	JUMP	.LBB44_506
.LBB44_506 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_507 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_508
.LBB44_508 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 3
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_509
.LBB44_509 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	COPYI	%GR1, 1
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_515
	JUMP	.LBB44_510
.LBB44_510 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_511
.LBB44_511 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_512
.LBB44_512 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 228(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 260(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB44_513
.LBB44_513 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_514
.LBB44_514 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_518
.LBB44_515 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_517
	JUMP	.LBB44_516
.LBB44_516 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 3
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_392
.LBB44_517 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_518
.LBB44_518 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_519 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_520
.LBB44_520 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 3
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_521
.LBB44_521 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_525
	JUMP	.LBB44_522
.LBB44_522 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_523
.LBB44_523 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR1, %GR1, 2
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 260(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 228(%GR7)
	ADDI	%GR1, %GR1, 3
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB44_524
.LBB44_524 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_467
.LBB44_525 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_526
.LBB44_526 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_527 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_528
.LBB44_528 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_529
.LBB44_529 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_530
.LBB44_530 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_531
.LBB44_531 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_532
.LBB44_532 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_533
.LBB44_533 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_534
.LBB44_534 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB44_535
.LBB44_535 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_536
.LBB44_536 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 256(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 260(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 256(%GR7)
	ADDI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB44_537
.LBB44_537 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_538 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_540
	JUMP	.LBB44_539
.LBB44_539 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_541
.LBB44_540 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_541
.LBB44_541 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_557
	JUMP	.LBB44_542
.LBB44_542 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_557
	JUMP	.LBB44_543
.LBB44_543 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 248(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_557
	JUMP	.LBB44_544
.LBB44_544 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_546
	JUMP	.LBB44_545
.LBB44_545 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_550
.LBB44_546 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_548
	JUMP	.LBB44_547
.LBB44_547 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_549
.LBB44_548 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_549
.LBB44_549 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_550
.LBB44_550 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 252(%GR7)
	NEQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_552
	JUMP	.LBB44_551
.LBB44_551 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_556
.LBB44_552 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 268(%GR7)
	ADDI	%GR2, %GR2, -1
	NEQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_554
	JUMP	.LBB44_553
.LBB44_553 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 252(%GR7)
	ADDI	%GR1, %GR1, -1
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_555
.LBB44_554 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 236(%GR7)
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_555
.LBB44_555 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_556
.LBB44_556 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR2, re_syntax_table
	ADD	%GR1, %GR1, %GR2
	LOADB	%GR1, 0(%GR1)
	COPYI	%GR2, 1
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_558
	JUMP	.LBB44_557
.LBB44_557 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_558 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_559 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_561
	JUMP	.LBB44_560
.LBB44_560 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_562
.LBB44_561 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_562
.LBB44_562 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_578
	JUMP	.LBB44_563
.LBB44_563 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_578
	JUMP	.LBB44_564
.LBB44_564 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 248(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_578
	JUMP	.LBB44_565
.LBB44_565 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_567
	JUMP	.LBB44_566
.LBB44_566 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_571
.LBB44_567 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_569
	JUMP	.LBB44_568
.LBB44_568 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_570
.LBB44_569 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_570
.LBB44_570 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_571
.LBB44_571 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 252(%GR7)
	NEQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_573
	JUMP	.LBB44_572
.LBB44_572 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_577
.LBB44_573 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 236(%GR7)
	LOAD	%GR2, 268(%GR7)
	ADDI	%GR2, %GR2, -1
	NEQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_575
	JUMP	.LBB44_574
.LBB44_574 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 252(%GR7)
	ADDI	%GR1, %GR1, -1
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_576
.LBB44_575 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 236(%GR7)
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB44_576
.LBB44_576 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_577
.LBB44_577 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR2, re_syntax_table
	ADD	%GR1, %GR1, %GR2
	LOADB	%GR1, 0(%GR1)
	COPYI	%GR2, 1
	EQ	%GR1, %GR1, %GR2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_579
	JUMP	.LBB44_578
.LBB44_578 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_579 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_580 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_582
	JUMP	.LBB44_581
.LBB44_581 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_586
.LBB44_582 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_584
	JUMP	.LBB44_583
.LBB44_583 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_585
.LBB44_584 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_585
.LBB44_585 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_586
.LBB44_586 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_600
	JUMP	.LBB44_587
.LBB44_587 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_589
	JUMP	.LBB44_588
.LBB44_588 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_590
.LBB44_589 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_590
.LBB44_590 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_599
	JUMP	.LBB44_591
.LBB44_591 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_599
	JUMP	.LBB44_592
.LBB44_592 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_594
	JUMP	.LBB44_593
.LBB44_593 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_598
.LBB44_594 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_596
	JUMP	.LBB44_595
.LBB44_595 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_597
.LBB44_596 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_597
.LBB44_597 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_598
.LBB44_598 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_600
	JUMP	.LBB44_599
.LBB44_599 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_600 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_601 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 272(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_603
	JUMP	.LBB44_602
.LBB44_602 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 276(%GR7)
	JUMP	.LBB44_604
.LBB44_603 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR1, 268(%GR7)
	JUMP	.LBB44_604
.LBB44_604 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_622
	JUMP	.LBB44_605
.LBB44_605 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 264(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_622
	JUMP	.LBB44_606
.LBB44_606 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_608
	JUMP	.LBB44_607
.LBB44_607 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_612
.LBB44_608 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_610
	JUMP	.LBB44_609
.LBB44_609 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_611
.LBB44_610 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_611
.LBB44_611 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_612
.LBB44_612 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_622
	JUMP	.LBB44_613
.LBB44_613 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_615
	JUMP	.LBB44_614
.LBB44_614 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_619
.LBB44_615 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_617
	JUMP	.LBB44_616
.LBB44_616 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_618
.LBB44_617 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_618
.LBB44_618 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_619
.LBB44_619 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_621
	JUMP	.LBB44_620
.LBB44_620 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 248(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_622
	JUMP	.LBB44_621
.LBB44_621 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_665
.LBB44_622 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_623 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_624
.LBB44_624 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_628
	JUMP	.LBB44_625
.LBB44_625 NOP                          ;   in Loop: Header=BB44_624 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_627
	JUMP	.LBB44_626
.LBB44_626 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_627 NOP                          ;   in Loop: Header=BB44_624 Depth=2
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_624
.LBB44_628 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_630
	JUMP	.LBB44_629
.LBB44_629 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_634
.LBB44_630 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_632
	JUMP	.LBB44_631
.LBB44_631 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_633
.LBB44_632 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_633
.LBB44_633 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_634
.LBB44_634 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_636
	JUMP	.LBB44_635
.LBB44_635 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_636 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_637
.LBB44_637 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB44_638
.LBB44_638 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_641
	JUMP	.LBB44_639
.LBB44_639 NOP                          ;   in Loop: Header=BB44_638 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 24(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 16
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 24(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_640
.LBB44_640 NOP                          ;   in Loop: Header=BB44_638 Depth=2
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB44_638
.LBB44_641 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_642
.LBB44_642 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 236(%GR7)
	JUMP	.LBB44_665
.LBB44_643 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_644
.LBB44_644 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 232(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_648
	JUMP	.LBB44_645
.LBB44_645 NOP                          ;   in Loop: Header=BB44_644 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_647
	JUMP	.LBB44_646
.LBB44_646 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_647 NOP                          ;   in Loop: Header=BB44_644 Depth=2
	LOAD	%GR6, 268(%GR7)
	STORE	%GR6, 236(%GR7)
	LOAD	%GR6, 240(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_644
.LBB44_648 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_650
	JUMP	.LBB44_649
.LBB44_649 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 268(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_654
.LBB44_650 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR1, %GR1, -1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_652
	JUMP	.LBB44_651
.LBB44_651 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 252(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_653
.LBB44_652 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB44_653
.LBB44_653 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_654
.LBB44_654 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_657
	JUMP	.LBB44_655
.LBB44_655 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_656
.LBB44_656 NOP                          ; %.preheader
                                        ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_667
.LBB44_657 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_658
.LBB44_658 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 200(%GR7)
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB44_659
.LBB44_659 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 196(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_662
	JUMP	.LBB44_660
.LBB44_660 NOP                          ;   in Loop: Header=BB44_659 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 20(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 16
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 20(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB44_661
.LBB44_661 NOP                          ;   in Loop: Header=BB44_659 Depth=2
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 20(%GR7)
	JUMP	.LBB44_659
.LBB44_662 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_663
.LBB44_663 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 236(%GR7)
	JUMP	.LBB44_665
.LBB44_664 NOP 
	CALL	abort
.LBB44_665 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_666
.LBB44_666 NOP                          ; %.backedge3
                                        ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_34
.LBB44_667 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB44_671 Depth 3
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_699
	JUMP	.LBB44_668
.LBB44_668 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 208(%GR7)
	ADDI	%GR1, %GR7, 208
	ADDI	%GR1, %GR1, 8
	LOAD	%GR2, 0(%GR1)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR1)
	SHLI	%GR1, %GR2, 2
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_670
	JUMP	.LBB44_669
.LBB44_669 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 236(%GR7)
	JUMP	.LBB44_670
.LBB44_670 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR1, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 228(%GR7)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 196(%GR7)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR6, %GR2, 2
	ADD	%GR6, %GR1, %GR6
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 200(%GR7)
	LOAD	%GR6, 196(%GR7)
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB44_671
.LBB44_671 NOP                          ;   Parent Loop BB44_34 Depth=1
                                        ;     Parent Loop BB44_667 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 200(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_674
	JUMP	.LBB44_672
.LBB44_672 NOP                          ;   in Loop: Header=BB44_671 Depth=3
	LOAD	%GR1, 208(%GR7)
	ADDI	%GR6, %GR7, 208
	ADDI	%GR6, %GR6, 8
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 176(%GR7)
	LOAD	%GR3, 16(%GR7)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 188(%GR7)
	LOAD	%GR3, 16(%GR7)
	SHLI	%GR3, %GR3, 2
	ADD	%GR2, %GR2, %GR3
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 208(%GR7)
	LOAD	%GR2, 0(%GR6)
	ADDI	%GR2, %GR2, -1
	STORE	%GR2, 0(%GR6)
	SHLI	%GR6, %GR2, 2
	ADD	%GR6, %GR1, %GR6
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 192(%GR7)
	LOAD	%GR2, 16(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB44_673
.LBB44_673 NOP                          ;   in Loop: Header=BB44_671 Depth=3
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB44_671
.LBB44_674 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_677
	JUMP	.LBB44_675
.LBB44_675 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	JUMP	.LBB44_676
.LBB44_676 NOP                          ; %.backedge
                                        ;   in Loop: Header=BB44_667 Depth=2
	JUMP	.LBB44_667
.LBB44_677 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 224(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_694
	JUMP	.LBB44_678
.LBB44_678 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	COPYI	%GR6, 0
	STOREB	%GR6, 8(%GR7)
	LOAD	%GR6, 228(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 12
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB44_682
	JUMP	.LBB44_679
.LBB44_679 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	ADDI	%GR1, %GR6, -16
	COPYI	%GR2, 2
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB44_682
	JUMP	.LBB44_680
.LBB44_680 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	COPYI	%GR1, 21
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_692
	JUMP	.LBB44_681
.LBB44_681 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	COPYI	%GR6, 1
	STOREB	%GR6, 8(%GR7)
	JUMP	.LBB44_682
.LBB44_682 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 228(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_683
.LBB44_683 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	JUMP	.LBB44_684
.LBB44_684 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 260(%GR7)
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 260(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 260(%GR7)
	JUMP	.LBB44_685
.LBB44_685 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 256(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 256(%GR7)
	JUMP	.LBB44_686
.LBB44_686 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 260(%GR7)
	LOAD	%GR1, 256(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 256(%GR7)
	LOADB	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_688
	JUMP	.LBB44_687
.LBB44_687 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 20
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_690
	JUMP	.LBB44_688
.LBB44_688 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	ULOADB	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_691
	JUMP	.LBB44_689
.LBB44_689 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	LOAD	%GR6, 256(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 14
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_691
	JUMP	.LBB44_690
.LBB44_690 NOP                          ;   in Loop: Header=BB44_667 Depth=2
	JUMP	.LBB44_676
.LBB44_691 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_693
.LBB44_692 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_693
.LBB44_693 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_695
.LBB44_694 NOP                          ; %.loopexit1
                                        ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_695
.LBB44_695 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 276(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_698
	JUMP	.LBB44_696
.LBB44_696 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 252(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_698
	JUMP	.LBB44_697
.LBB44_697 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	LOAD	%GR6, 244(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB44_698
.LBB44_698 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_700
.LBB44_699 NOP 
	JUMP	.LBB44_701
.LBB44_700 NOP                          ;   in Loop: Header=BB44_34 Depth=1
	JUMP	.LBB44_666
.LBB44_701 NOP 
	LOAD	%GR6, 172(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB44_703
	JUMP	.LBB44_702
.LBB44_702 NOP 
	JUMP	.LBB44_53
.LBB44_703 NOP 
	COPYI	%GR6, -1
	STORE	%GR6, 284(%GR7)
	JUMP	.LBB44_704
.LBB44_704 NOP 
	LOAD	%GR6, 284(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 288(%GR7)
	LOAD	%GR3, 292(%GR7)
	LOAD	%GR2, 296(%GR7)
	LOAD	%GR1, 300(%GR7)
	ADDI	%GR7, %GR7, 304
	RET
.Lfunc_end44 NOP 
	.size	re_match_2, .Lfunc_end44-re_match_2
                                        ; -- End function
	.globl	re_match                ; -- Begin function re_match
	.type	re_match,@function
re_match NOP                            ; @re_match
; %bb.0:
	SUBI	%GR7, %GR7, 64
	STORE	%GR1, 60(%GR7)
	STORE	%GR2, 56(%GR7)
	STORE	%GR3, 52(%GR7)
	STORE	%GR4, 48(%GR7)
	STORE	%GR5, 44(%GR7)
	STORE	%GR1, 40(%GR7)
	STORE	%GR2, 36(%GR7)
	STORE	%GR3, 32(%GR7)
	STORE	%GR4, 28(%GR7)
	STORE	%GR5, 24(%GR7)
	LOAD	%GR1, 40(%GR7)
	LOAD	%GR4, 36(%GR7)
	LOAD	%GR5, 32(%GR7)
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR2, 24(%GR7)
	ADDI	%GR3, %GR7, 8
	STORE	%GR5, 0(%GR3)
	ADDI	%GR3, %GR7, 4
	STORE	%GR2, 0(%GR3)
	STORE	%GR6, 0(%GR7)
	COPYI	%GR2, 0
	COPYR	%GR3, %GR2
	CALL	re_match_2
	COPYR	%GR6, %RT0
	COPYR	%RT0, %GR6
	LOAD	%GR5, 44(%GR7)
	LOAD	%GR4, 48(%GR7)
	LOAD	%GR3, 52(%GR7)
	LOAD	%GR2, 56(%GR7)
	LOAD	%GR1, 60(%GR7)
	ADDI	%GR7, %GR7, 64
	RET
.Lfunc_end45 NOP 
	.size	re_match, .Lfunc_end45-re_match
                                        ; -- End function
	.type	regex_compile,@function ; -- Begin function regex_compile
regex_compile NOP                       ; @regex_compile
; %bb.0:
	SUBI	%GR7, %GR7, 320
	STORE	%GR1, 316(%GR7)
	STORE	%GR2, 312(%GR7)
	STORE	%GR3, 308(%GR7)
	STORE	%GR4, 304(%GR7)
	STORE	%GR5, 300(%GR7)
	STORE	%GR1, 292(%GR7)
	STORE	%GR2, 288(%GR7)
	STORE	%GR3, 284(%GR7)
	STORE	%GR4, 280(%GR7)
	LOAD	%GR6, 292(%GR7)
	STORE	%GR6, 244(%GR7)
	LOAD	%GR6, 292(%GR7)
	LOAD	%GR1, 288(%GR7)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 240(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 236(%GR7)
	COPYI	%GR2, 0
	STORE	%GR2, 232(%GR7)
	STORE	%GR2, 228(%GR7)
	STORE	%GR2, 216(%GR7)
	STORE	%GR2, 212(%GR7)
	COPYI	%GR1, 640
	CALL	malloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 248(%GR7)
	LOAD	%GR6, 248(%GR7)
	NEQ	%GR6, %GR6, %GR2
	BNEQZ	%GR6, .LBB46_2
	JUMP	.LBB46_1
.LBB46_1 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_2 NOP 
	ADDI	%GR6, %GR7, 248
	ORI	%GR1, %GR6, 4
	COPYI	%GR2, 32
	STORE	%GR2, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 284(%GR7)
	LOAD	%GR2, 280(%GR7)
	ADDI	%GR2, %GR2, 12
	STORE	%GR6, 0(%GR2)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR2, 0(%GR6)
	ANDI	%GR2, %GR2, 247
	STOREB	%GR2, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR2, 0(%GR6)
	ANDI	%GR2, %GR2, 191
	STOREB	%GR2, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR2, 0(%GR6)
	ANDI	%GR2, %GR2, 223
	STOREB	%GR2, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 24
	STORE	%GR1, 0(%GR6)
	CALL	init_syntax_once
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_9
	JUMP	.LBB46_3
.LBB46_3 NOP 
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_5
	JUMP	.LBB46_4
.LBB46_4 NOP 
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	COPYI	%GR2, 32
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB46_6
.LBB46_5 NOP 
	COPYI	%GR1, 32
	CALL	malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB46_6
.LBB46_6 NOP 
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_8
	JUMP	.LBB46_7
.LBB46_7 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_8 NOP 
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 32
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_9
.LBB46_9 NOP 
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 264(%GR7)
	STORE	%GR6, 224(%GR7)
	JUMP	.LBB46_10
.LBB46_10 NOP                           ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB46_35 Depth 2
                                        ;     Child Loop BB46_651 Depth 2
                                        ;     Child Loop BB46_676 Depth 2
                                        ;     Child Loop BB46_746 Depth 2
                                        ;     Child Loop BB46_726 Depth 2
                                        ;     Child Loop BB46_782 Depth 2
                                        ;     Child Loop BB46_870 Depth 2
                                        ;     Child Loop BB46_914 Depth 2
                                        ;     Child Loop BB46_804 Depth 2
                                        ;     Child Loop BB46_892 Depth 2
                                        ;     Child Loop BB46_848 Depth 2
                                        ;     Child Loop BB46_826 Depth 2
                                        ;     Child Loop BB46_964 Depth 2
                                        ;     Child Loop BB46_936 Depth 2
                                        ;     Child Loop BB46_235 Depth 2
                                        ;     Child Loop BB46_255 Depth 2
                                        ;     Child Loop BB46_278 Depth 2
                                        ;     Child Loop BB46_301 Depth 2
                                        ;       Child Loop BB46_361 Depth 3
                                        ;       Child Loop BB46_439 Depth 3
                                        ;       Child Loop BB46_397 Depth 3
                                        ;     Child Loop BB46_448 Depth 2
                                        ;     Child Loop BB46_212 Depth 2
                                        ;     Child Loop BB46_97 Depth 2
                                        ;     Child Loop BB46_131 Depth 2
                                        ;     Child Loop BB46_170 Depth 2
                                        ;     Child Loop BB46_190 Depth 2
                                        ;     Child Loop BB46_534 Depth 2
                                        ;     Child Loop BB46_564 Depth 2
                                        ;     Child Loop BB46_503 Depth 2
                                        ;     Child Loop BB46_62 Depth 2
                                        ;     Child Loop BB46_592 Depth 2
                                        ;     Child Loop BB46_613 Depth 2
                                        ;     Child Loop BB46_1012 Depth 2
                                        ;     Child Loop BB46_1034 Depth 2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1055
	JUMP	.LBB46_11
.LBB46_11 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_12
.LBB46_12 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_14
	JUMP	.LBB46_13
.LBB46_13 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_14 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_16
	JUMP	.LBB46_15
.LBB46_15 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_16
.LBB46_16 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_17
.LBB46_17 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 10
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_459
	JUMP	.LBB46_18
.LBB46_18 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 36
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_57
	JUMP	.LBB46_19
.LBB46_19 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 40
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_453
	JUMP	.LBB46_20
.LBB46_20 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 41
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_456
	JUMP	.LBB46_21
.LBB46_21 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 42
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_89
	JUMP	.LBB46_22
.LBB46_22 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 43
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_84
	JUMP	.LBB46_23
.LBB46_23 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 46
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_210
	JUMP	.LBB46_24
.LBB46_24 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 63
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_84
	JUMP	.LBB46_25
.LBB46_25 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 91
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_232
	JUMP	.LBB46_26
.LBB46_26 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 92
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_469
	JUMP	.LBB46_27
.LBB46_27 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 94
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_30
	JUMP	.LBB46_28
.LBB46_28 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 123
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_465
	JUMP	.LBB46_29
.LBB46_29 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 124
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_462
	JUMP	.LBB46_993
.LBB46_30 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 292(%GR7)
	ADDI	%GR1, %GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_33
	JUMP	.LBB46_31
.LBB46_31 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_33
	JUMP	.LBB46_32
.LBB46_32 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 292(%GR7)
	LOAD	%GR2, 244(%GR7)
	LOAD	%GR3, 284(%GR7)
	CALL	at_begline_loc_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_55
	JUMP	.LBB46_33
.LBB46_33 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_34
.LBB46_34 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_35
.LBB46_35 NOP                           ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_53
	JUMP	.LBB46_36
.LBB46_36 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	JUMP	.LBB46_37
.LBB46_37 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 208(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_39
	JUMP	.LBB46_38
.LBB46_38 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_39 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_41
	JUMP	.LBB46_40
.LBB46_40 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_41
.LBB46_41 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_43
	JUMP	.LBB46_42
.LBB46_42 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_43 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 208(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_51
	JUMP	.LBB46_44
.LBB46_44 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 208(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 208(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_46
	JUMP	.LBB46_45
.LBB46_45 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 208(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_46
.LBB46_46 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_48
	JUMP	.LBB46_47
.LBB46_47 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 208(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_48
.LBB46_48 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_50
	JUMP	.LBB46_49
.LBB46_49 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 208(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_50
.LBB46_50 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	JUMP	.LBB46_51
.LBB46_51 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	JUMP	.LBB46_52
.LBB46_52 NOP                           ;   in Loop: Header=BB46_35 Depth=2
	JUMP	.LBB46_35
.LBB46_53 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 8
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_54
.LBB46_54 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_56
.LBB46_55 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_56 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_57 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_60
	JUMP	.LBB46_58
.LBB46_58 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_60
	JUMP	.LBB46_59
.LBB46_59 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 244(%GR7)
	LOAD	%GR2, 240(%GR7)
	LOAD	%GR3, 284(%GR7)
	CALL	at_endline_loc_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_82
	JUMP	.LBB46_60
.LBB46_60 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_61
.LBB46_61 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_62
.LBB46_62 NOP                           ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_80
	JUMP	.LBB46_63
.LBB46_63 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	JUMP	.LBB46_64
.LBB46_64 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 204(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_66
	JUMP	.LBB46_65
.LBB46_65 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_66 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_68
	JUMP	.LBB46_67
.LBB46_67 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_68
.LBB46_68 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_70
	JUMP	.LBB46_69
.LBB46_69 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_70 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 204(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_78
	JUMP	.LBB46_71
.LBB46_71 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 204(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 204(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_73
	JUMP	.LBB46_72
.LBB46_72 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 204(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_73
.LBB46_73 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_75
	JUMP	.LBB46_74
.LBB46_74 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 204(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_75
.LBB46_75 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_77
	JUMP	.LBB46_76
.LBB46_76 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 204(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_77
.LBB46_77 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	JUMP	.LBB46_78
.LBB46_78 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	JUMP	.LBB46_79
.LBB46_79 NOP                           ;   in Loop: Header=BB46_62 Depth=2
	JUMP	.LBB46_62
.LBB46_80 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 9
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_81
.LBB46_81 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_83
.LBB46_82 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_83 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_84 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_86
	JUMP	.LBB46_85
.LBB46_85 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_87
	JUMP	.LBB46_86
.LBB46_86 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_87 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_88
.LBB46_88 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_89
.LBB46_89 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_96
	JUMP	.LBB46_90
.LBB46_90 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_92
	JUMP	.LBB46_91
.LBB46_91 NOP 
	COPYI	%GR6, 13
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_92 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_94
	JUMP	.LBB46_93
.LBB46_93 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_94 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_95
.LBB46_95 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_96
.LBB46_96 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 200(%GR7)
	STOREB	%GR6, 196(%GR7)
	STOREB	%GR6, 192(%GR7)
	JUMP	.LBB46_97
.LBB46_97 NOP                           ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 43
	NEQ	%GR6, %GR6, %GR1
	ULOADB	%GR1, 196(%GR7)
	OR	%GR6, %GR1, %GR6
	STOREB	%GR6, 196(%GR7)
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 63
	NEQ	%GR6, %GR6, %GR1
	ULOADB	%GR1, 192(%GR7)
	OR	%GR6, %GR1, %GR6
	STOREB	%GR6, 192(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_99
	JUMP	.LBB46_98
.LBB46_98 NOP                           ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_127
.LBB46_99 NOP                           ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_100
.LBB46_100 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_102
	JUMP	.LBB46_101
.LBB46_101 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_102 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_104
	JUMP	.LBB46_103
.LBB46_103 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_104
.LBB46_104 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_105
.LBB46_105 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 42
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_109
	JUMP	.LBB46_106
.LBB46_106 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_110
	JUMP	.LBB46_107
.LBB46_107 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 43
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_109
	JUMP	.LBB46_108
.LBB46_108 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 63
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_110
	JUMP	.LBB46_109
.LBB46_109 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_126
.LBB46_110 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_124
	JUMP	.LBB46_111
.LBB46_111 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_124
	JUMP	.LBB46_112
.LBB46_112 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_114
	JUMP	.LBB46_113
.LBB46_113 NOP 
	COPYI	%GR6, 5
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_114 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_115
.LBB46_115 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_117
	JUMP	.LBB46_116
.LBB46_116 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_117 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_119
	JUMP	.LBB46_118
.LBB46_118 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	JUMP	.LBB46_119
.LBB46_119 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_120
.LBB46_120 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 272(%GR7)
	COPYI	%GR1, 43
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_123
	JUMP	.LBB46_121
.LBB46_121 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 272(%GR7)
	COPYI	%GR1, 63
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_123
	JUMP	.LBB46_122
.LBB46_122 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 244(%GR7)
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 244(%GR7)
	JUMP	.LBB46_127
.LBB46_123 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	ULOADB	%GR6, 272(%GR7)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_125
.LBB46_124 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 244(%GR7)
	JUMP	.LBB46_127
.LBB46_125 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_126
.LBB46_126 NOP                          ;   in Loop: Header=BB46_97 Depth=2
	JUMP	.LBB46_97
.LBB46_127 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_129
	JUMP	.LBB46_128
.LBB46_128 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_129 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 192(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_169
	JUMP	.LBB46_130
.LBB46_130 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_131
.LBB46_131 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_149
	JUMP	.LBB46_132
.LBB46_132 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	JUMP	.LBB46_133
.LBB46_133 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 188(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_135
	JUMP	.LBB46_134
.LBB46_134 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_135 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_137
	JUMP	.LBB46_136
.LBB46_136 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_137
.LBB46_137 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_139
	JUMP	.LBB46_138
.LBB46_138 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_139 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 188(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_147
	JUMP	.LBB46_140
.LBB46_140 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 188(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 188(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_142
	JUMP	.LBB46_141
.LBB46_141 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 188(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_142
.LBB46_142 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_144
	JUMP	.LBB46_143
.LBB46_143 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 188(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_144
.LBB46_144 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_146
	JUMP	.LBB46_145
.LBB46_145 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 188(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_146
.LBB46_146 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	JUMP	.LBB46_147
.LBB46_147 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	JUMP	.LBB46_148
.LBB46_148 NOP                          ;   in Loop: Header=BB46_131 Depth=2
	JUMP	.LBB46_131
.LBB46_149 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_151
	JUMP	.LBB46_150
.LBB46_150 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 244(%GR7)
	ADDI	%GR1, %GR1, -2
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB46_152
.LBB46_151 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -2
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB46_152
.LBB46_152 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 236(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB46_154
	JUMP	.LBB46_153
.LBB46_153 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 236(%GR7)
	ADDI	%GR1, %GR1, 46
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB46_155
.LBB46_154 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 46
	JUMP	.LBB46_155
.LBB46_155 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_167
	JUMP	.LBB46_156
.LBB46_156 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOADB	%GR6, 196(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_167
	JUMP	.LBB46_157
.LBB46_157 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_167
	JUMP	.LBB46_158
.LBB46_158 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_160
	JUMP	.LBB46_159
.LBB46_159 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	LOAD	%GR1, 244(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB46_161
.LBB46_160 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB46_161
.LBB46_161 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 236(%GR7)
	COPYI	%GR2, 0
	EQ	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB46_163
	JUMP	.LBB46_162
.LBB46_162 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 236(%GR7)
	ADDI	%GR1, %GR1, 10
	LOADB	%GR1, 0(%GR1)
	JUMP	.LBB46_164
.LBB46_163 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 10
	JUMP	.LBB46_164
.LBB46_164 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_167
	JUMP	.LBB46_165
.LBB46_165 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_167
	JUMP	.LBB46_166
.LBB46_166 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 264(%GR7)
	LOAD	%GR6, 228(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, -3
	COPYI	%GR1, 12
	CALL	store_op1
	COPYI	%GR6, 1
	STOREB	%GR6, 200(%GR7)
	JUMP	.LBB46_168
.LBB46_167 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 264(%GR7)
	LOAD	%GR6, 228(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, -6
	COPYI	%GR1, 17
	CALL	store_op1
	JUMP	.LBB46_168
.LBB46_168 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB46_169
.LBB46_169 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_170
.LBB46_170 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_188
	JUMP	.LBB46_171
.LBB46_171 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	JUMP	.LBB46_172
.LBB46_172 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 184(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_174
	JUMP	.LBB46_173
.LBB46_173 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_174 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_176
	JUMP	.LBB46_175
.LBB46_175 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_176
.LBB46_176 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_178
	JUMP	.LBB46_177
.LBB46_177 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_178 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 184(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_186
	JUMP	.LBB46_179
.LBB46_179 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 184(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 184(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_181
	JUMP	.LBB46_180
.LBB46_180 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 184(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_181
.LBB46_181 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_183
	JUMP	.LBB46_182
.LBB46_182 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 184(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_183
.LBB46_183 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_185
	JUMP	.LBB46_184
.LBB46_184 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 184(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_185
.LBB46_185 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	JUMP	.LBB46_186
.LBB46_186 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	JUMP	.LBB46_187
.LBB46_187 NOP                          ;   in Loop: Header=BB46_170 Depth=2
	JUMP	.LBB46_170
.LBB46_188 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOADB	%GR6, 200(%GR7)
	COPYI	%GR5, 0
	NEQ	%GR6, %GR6, %GR5
	COPYI	%GR1, 14
	COPYI	%GR2, 15
	CMOV	%GR1, %GR6, %GR2
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR4, 264(%GR7)
	SUB	%GR3, %GR4, %GR2
	CALL	insert_op1
	STORE	%GR5, 232(%GR7)
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 264(%GR7)
	ULOADB	%GR6, 196(%GR7)
	NEQ	%GR6, %GR6, %GR5
	BNEQZ	%GR6, .LBB46_209
	JUMP	.LBB46_189
.LBB46_189 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_190
.LBB46_190 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_208
	JUMP	.LBB46_191
.LBB46_191 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	JUMP	.LBB46_192
.LBB46_192 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 180(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_194
	JUMP	.LBB46_193
.LBB46_193 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_194 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_196
	JUMP	.LBB46_195
.LBB46_195 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_196
.LBB46_196 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_198
	JUMP	.LBB46_197
.LBB46_197 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_198 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 180(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_206
	JUMP	.LBB46_199
.LBB46_199 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 180(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 180(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_201
	JUMP	.LBB46_200
.LBB46_200 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 180(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_201
.LBB46_201 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_203
	JUMP	.LBB46_202
.LBB46_202 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 180(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_203
.LBB46_203 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_205
	JUMP	.LBB46_204
.LBB46_204 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 180(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_205
.LBB46_205 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	JUMP	.LBB46_206
.LBB46_206 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	JUMP	.LBB46_207
.LBB46_207 NOP                          ;   in Loop: Header=BB46_190 Depth=2
	JUMP	.LBB46_190
.LBB46_208 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR4, 264(%GR7)
	COPYI	%GR1, 18
	COPYI	%GR3, 3
	CALL	insert_op1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB46_209
.LBB46_209 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_210 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_211
.LBB46_211 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_212
.LBB46_212 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_230
	JUMP	.LBB46_213
.LBB46_213 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	JUMP	.LBB46_214
.LBB46_214 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 176(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_216
	JUMP	.LBB46_215
.LBB46_215 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_216 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_218
	JUMP	.LBB46_217
.LBB46_217 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_218
.LBB46_218 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_220
	JUMP	.LBB46_219
.LBB46_219 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_220 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 176(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_228
	JUMP	.LBB46_221
.LBB46_221 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 176(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 176(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_223
	JUMP	.LBB46_222
.LBB46_222 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 176(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_223
.LBB46_223 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_225
	JUMP	.LBB46_224
.LBB46_224 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 176(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_225
.LBB46_225 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_227
	JUMP	.LBB46_226
.LBB46_226 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 176(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_227
.LBB46_227 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	JUMP	.LBB46_228
.LBB46_228 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	JUMP	.LBB46_229
.LBB46_229 NOP                          ;   in Loop: Header=BB46_212 Depth=2
	JUMP	.LBB46_212
.LBB46_230 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 2
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_231
.LBB46_231 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_232 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, 0
	STOREB	%GR6, 172(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_234
	JUMP	.LBB46_233
.LBB46_233 NOP 
	COPYI	%GR6, 7
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_234 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_235
.LBB46_235 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 34
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_253
	JUMP	.LBB46_236
.LBB46_236 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	JUMP	.LBB46_237
.LBB46_237 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 168(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_239
	JUMP	.LBB46_238
.LBB46_238 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_239 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_241
	JUMP	.LBB46_240
.LBB46_240 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_241
.LBB46_241 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_243
	JUMP	.LBB46_242
.LBB46_242 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_243 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 168(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_251
	JUMP	.LBB46_244
.LBB46_244 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 168(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 168(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_246
	JUMP	.LBB46_245
.LBB46_245 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 168(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_246
.LBB46_246 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_248
	JUMP	.LBB46_247
.LBB46_247 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 168(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_248
.LBB46_248 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_250
	JUMP	.LBB46_249
.LBB46_249 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 168(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_250
.LBB46_250 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	JUMP	.LBB46_251
.LBB46_251 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	JUMP	.LBB46_252
.LBB46_252 NOP                          ;   in Loop: Header=BB46_235 Depth=2
	JUMP	.LBB46_235
.LBB46_253 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_254
.LBB46_254 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_255
.LBB46_255 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_273
	JUMP	.LBB46_256
.LBB46_256 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	JUMP	.LBB46_257
.LBB46_257 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 164(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_259
	JUMP	.LBB46_258
.LBB46_258 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_259 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_261
	JUMP	.LBB46_260
.LBB46_260 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_261
.LBB46_261 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_263
	JUMP	.LBB46_262
.LBB46_262 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_263 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 164(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_271
	JUMP	.LBB46_264
.LBB46_264 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 164(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 164(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_266
	JUMP	.LBB46_265
.LBB46_265 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 164(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_266
.LBB46_266 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_268
	JUMP	.LBB46_267
.LBB46_267 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 164(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_268
.LBB46_268 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_270
	JUMP	.LBB46_269
.LBB46_269 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 164(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_270
.LBB46_270 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	JUMP	.LBB46_271
.LBB46_271 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	JUMP	.LBB46_272
.LBB46_272 NOP                          ;   in Loop: Header=BB46_255 Depth=2
	JUMP	.LBB46_255
.LBB46_273 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 94
	EQ	%GR6, %GR6, %GR1
	COPYI	%GR1, 3
	COPYI	%GR2, 4
	CMOV	%GR1, %GR6, %GR2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR2, %GR6, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_274
.LBB46_274 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 94
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_276
	JUMP	.LBB46_275
.LBB46_275 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 244(%GR7)
	JUMP	.LBB46_276
.LBB46_276 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	STORE	%GR6, 268(%GR7)
	JUMP	.LBB46_277
.LBB46_277 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_278
.LBB46_278 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_296
	JUMP	.LBB46_279
.LBB46_279 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	JUMP	.LBB46_280
.LBB46_280 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 160(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_282
	JUMP	.LBB46_281
.LBB46_281 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_282 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_284
	JUMP	.LBB46_283
.LBB46_283 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_284
.LBB46_284 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_286
	JUMP	.LBB46_285
.LBB46_285 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_286 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 160(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_294
	JUMP	.LBB46_287
.LBB46_287 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 160(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 160(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_289
	JUMP	.LBB46_288
.LBB46_288 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 160(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_289
.LBB46_289 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_291
	JUMP	.LBB46_290
.LBB46_290 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 160(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_291
.LBB46_291 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_293
	JUMP	.LBB46_292
.LBB46_292 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 160(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_293
.LBB46_293 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	JUMP	.LBB46_294
.LBB46_294 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	JUMP	.LBB46_295
.LBB46_295 NOP                          ;   in Loop: Header=BB46_278 Depth=2
	JUMP	.LBB46_278
.LBB46_296 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 32
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_297
.LBB46_297 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 264(%GR7)
	COPYI	%GR2, 0
	COPYI	%GR3, 32
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, -2
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 4
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_300
	JUMP	.LBB46_298
.LBB46_298 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_300
	JUMP	.LBB46_299
.LBB46_299 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 1
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_300
.LBB46_300 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_301
.LBB46_301 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB46_361 Depth 3
                                        ;       Child Loop BB46_439 Depth 3
                                        ;       Child Loop BB46_397 Depth 3
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_303
	JUMP	.LBB46_302
.LBB46_302 NOP 
	COPYI	%GR6, 7
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_303 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_304
.LBB46_304 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_306
	JUMP	.LBB46_305
.LBB46_305 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_306 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_308
	JUMP	.LBB46_307
.LBB46_307 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_308
.LBB46_308 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_309
.LBB46_309 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_321
	JUMP	.LBB46_310
.LBB46_310 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_321
	JUMP	.LBB46_311
.LBB46_311 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_313
	JUMP	.LBB46_312
.LBB46_312 NOP 
	COPYI	%GR6, 5
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_313 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_314
.LBB46_314 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_316
	JUMP	.LBB46_315
.LBB46_315 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_316 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_318
	JUMP	.LBB46_317
.LBB46_317 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	JUMP	.LBB46_318
.LBB46_318 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_319
.LBB46_319 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 272(%GR7)
	ANDI	%GR1, %GR6, 7
	COPYI	%GR2, 1
	SHL	%GR1, %GR2, %GR1
	LOAD	%GR2, 264(%GR7)
	SRLI	%GR6, %GR6, 3
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	OR	%GR1, %GR2, %GR1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_320
.LBB46_320 NOP                          ; %.backedge
                                        ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_301
.LBB46_321 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 93
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_324
	JUMP	.LBB46_322
.LBB46_322 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 268(%GR7)
	ADDI	%GR1, %GR1, 1
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_324
	JUMP	.LBB46_323
.LBB46_323 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_447
.LBB46_324 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOADB	%GR6, 172(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_328
	JUMP	.LBB46_325
.LBB46_325 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_328
	JUMP	.LBB46_326
.LBB46_326 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_328
	JUMP	.LBB46_327
.LBB46_327 NOP 
	COPYI	%GR6, 11
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_328 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_338
	JUMP	.LBB46_329
.LBB46_329 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -2
	LOAD	%GR1, 292(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_331
	JUMP	.LBB46_330
.LBB46_330 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -2
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 91
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_338
	JUMP	.LBB46_331
.LBB46_331 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -3
	LOAD	%GR1, 292(%GR7)
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_334
	JUMP	.LBB46_332
.LBB46_332 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -3
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 91
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_334
	JUMP	.LBB46_333
.LBB46_333 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -2
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 94
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_338
	JUMP	.LBB46_334
.LBB46_334 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_338
	JUMP	.LBB46_335
.LBB46_335 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR2, 240(%GR7)
	LOAD	%GR3, 236(%GR7)
	LOAD	%GR4, 284(%GR7)
	LOAD	%GR5, 264(%GR7)
	ADDI	%GR1, %GR7, 244
	CALL	compile_range
	COPYR	%GR6, %RT0
	STORE	%GR6, 156(%GR7)
	LOAD	%GR6, 156(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_337
	JUMP	.LBB46_336
.LBB46_336 NOP 
	LOAD	%GR6, 156(%GR7)
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_337 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_446
.LBB46_338 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 45
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_349
	JUMP	.LBB46_339
.LBB46_339 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_349
	JUMP	.LBB46_340
.LBB46_340 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_341
.LBB46_341 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_343
	JUMP	.LBB46_342
.LBB46_342 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_343 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_345
	JUMP	.LBB46_344
.LBB46_344 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 272(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 272(%GR7)
	JUMP	.LBB46_345
.LBB46_345 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_346
.LBB46_346 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR2, 240(%GR7)
	LOAD	%GR3, 236(%GR7)
	LOAD	%GR4, 284(%GR7)
	LOAD	%GR5, 264(%GR7)
	ADDI	%GR1, %GR7, 244
	CALL	compile_range
	COPYR	%GR6, %RT0
	STORE	%GR6, 152(%GR7)
	LOAD	%GR6, 152(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_348
	JUMP	.LBB46_347
.LBB46_347 NOP 
	LOAD	%GR6, 152(%GR7)
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_348 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_445
.LBB46_349 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_443
	JUMP	.LBB46_350
.LBB46_350 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 91
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_443
	JUMP	.LBB46_351
.LBB46_351 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 58
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_443
	JUMP	.LBB46_352
.LBB46_352 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_353
.LBB46_353 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_355
	JUMP	.LBB46_354
.LBB46_354 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_355 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_357
	JUMP	.LBB46_356
.LBB46_356 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_357
.LBB46_357 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_358
.LBB46_358 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR6, 0
	STOREB	%GR6, 272(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_360
	JUMP	.LBB46_359
.LBB46_359 NOP 
	COPYI	%GR6, 7
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_360 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_361
.LBB46_361 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ;     Parent Loop BB46_301 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	JUMP	.LBB46_362
.LBB46_362 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_364
	JUMP	.LBB46_363
.LBB46_363 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_364 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_366
	JUMP	.LBB46_365
.LBB46_365 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_366
.LBB46_366 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	JUMP	.LBB46_367
.LBB46_367 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 58
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_371
	JUMP	.LBB46_368
.LBB46_368 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 93
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_371
	JUMP	.LBB46_369
.LBB46_369 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_371
	JUMP	.LBB46_370
.LBB46_370 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	ULOADB	%GR6, 272(%GR7)
	COPYI	%GR1, 6
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_372
	JUMP	.LBB46_371
.LBB46_371 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_373
.LBB46_372 NOP                          ;   in Loop: Header=BB46_361 Depth=3
	ULOADB	%GR6, 276(%GR7)
	ULOADB	%GR1, 272(%GR7)
	ADDI	%GR2, %GR1, 1
	STOREB	%GR2, 272(%GR7)
	ADDI	%GR2, %GR7, 144
	ADD	%GR1, %GR2, %GR1
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB46_361
.LBB46_373 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 272(%GR7)
	ADDI	%GR1, %GR7, 144
	ADD	%GR6, %GR1, %GR6
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 58
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_438
	JUMP	.LBB46_374
.LBB46_374 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 93
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_438
	JUMP	.LBB46_375
.LBB46_375 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.57
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR4, 0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 136(%GR7)
	COPYI	%GR3, .L.str.58
	COPYR	%GR2, %GR3
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 132(%GR7)
	COPYI	%GR2, .L.str.59
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 128(%GR7)
	COPYI	%GR2, .L.str.60
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 124(%GR7)
	COPYI	%GR2, .L.str.61
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 120(%GR7)
	COPYI	%GR2, .L.str.62
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 116(%GR7)
	COPYI	%GR2, .L.str.63
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 112(%GR7)
	COPYI	%GR2, .L.str.64
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 108(%GR7)
	COPYI	%GR2, .L.str.65
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 104(%GR7)
	COPYI	%GR2, .L.str.66
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 100(%GR7)
	COPYI	%GR2, .L.str.67
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 96(%GR7)
	COPYI	%GR2, .L.str.68
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	STOREB	%GR6, 92(%GR7)
	COPYR	%GR2, %GR3
	CALL	strcmp
	COPYR	%GR6, %RT0
	EQ	%GR6, %GR6, %GR4
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_376
.LBB46_376 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.67
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_377
.LBB46_377 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.63
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_378
.LBB46_378 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.61
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_379
.LBB46_379 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.57
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_380
.LBB46_380 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.68
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_381
.LBB46_381 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.66
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_382
.LBB46_382 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.64
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_383
.LBB46_383 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.65
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_384
.LBB46_384 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.62
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_385
.LBB46_385 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.60
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_386
.LBB46_386 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR2, .L.str.59
	ADDI	%GR1, %GR7, 144
	CALL	strcmp
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_388
	JUMP	.LBB46_387
.LBB46_387 NOP 
	COPYI	%GR6, 4
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_388 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_389
.LBB46_389 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_391
	JUMP	.LBB46_390
.LBB46_390 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_391 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_393
	JUMP	.LBB46_392
.LBB46_392 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_393
.LBB46_393 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_394
.LBB46_394 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_396
	JUMP	.LBB46_395
.LBB46_395 NOP 
	COPYI	%GR6, 7
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_396 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 140(%GR7)
	JUMP	.LBB46_397
.LBB46_397 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ;     Parent Loop BB46_301 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	LOAD	%GR6, 140(%GR7)
	COPYI	%GR1, 255
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_437
	JUMP	.LBB46_398
.LBB46_398 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 136(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_401
	JUMP	.LBB46_399
.LBB46_399 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_401
	JUMP	.LBB46_400
.LBB46_400 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_401
.LBB46_401 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 132(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_404
	JUMP	.LBB46_402
.LBB46_402 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_404
	JUMP	.LBB46_403
.LBB46_403 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1024
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_404
.LBB46_404 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 128(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_407
	JUMP	.LBB46_405
.LBB46_405 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_407
	JUMP	.LBB46_406
.LBB46_406 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_407
.LBB46_407 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 124(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_410
	JUMP	.LBB46_408
.LBB46_408 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_410
	JUMP	.LBB46_409
.LBB46_409 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_410
.LBB46_410 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 120(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_413
	JUMP	.LBB46_411
.LBB46_411 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_413
	JUMP	.LBB46_412
.LBB46_412 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_413
.LBB46_413 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 116(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_416
	JUMP	.LBB46_414
.LBB46_414 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_416
	JUMP	.LBB46_415
.LBB46_415 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32768
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_416
.LBB46_416 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 112(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_419
	JUMP	.LBB46_417
.LBB46_417 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_419
	JUMP	.LBB46_418
.LBB46_418 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 512
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_419
.LBB46_419 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 108(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_422
	JUMP	.LBB46_420
.LBB46_420 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_422
	JUMP	.LBB46_421
.LBB46_421 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16384
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_422
.LBB46_422 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 104(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_425
	JUMP	.LBB46_423
.LBB46_423 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_425
	JUMP	.LBB46_424
.LBB46_424 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_425
.LBB46_425 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 100(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_428
	JUMP	.LBB46_426
.LBB46_426 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_428
	JUMP	.LBB46_427
.LBB46_427 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8192
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_428
.LBB46_428 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 96(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_431
	JUMP	.LBB46_429
.LBB46_429 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_431
	JUMP	.LBB46_430
.LBB46_430 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 256
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_434
	JUMP	.LBB46_431
.LBB46_431 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOADB	%GR6, 92(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_435
	JUMP	.LBB46_432
.LBB46_432 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_435
	JUMP	.LBB46_433
.LBB46_433 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 140(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4096
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_435
	JUMP	.LBB46_434
.LBB46_434 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	ULOADB	%GR6, 140(%GR7)
	ANDI	%GR1, %GR6, 7
	COPYI	%GR2, 1
	SHL	%GR1, %GR2, %GR1
	LOAD	%GR2, 264(%GR7)
	SRLI	%GR6, %GR6, 3
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	OR	%GR1, %GR2, %GR1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_435
.LBB46_435 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	JUMP	.LBB46_436
.LBB46_436 NOP                          ;   in Loop: Header=BB46_397 Depth=3
	LOAD	%GR6, 140(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 140(%GR7)
	JUMP	.LBB46_397
.LBB46_437 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR6, 1
	STOREB	%GR6, 172(%GR7)
	JUMP	.LBB46_442
.LBB46_438 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	ULOADB	%GR6, 272(%GR7)
	ADDI	%GR6, %GR6, 1
	STOREB	%GR6, 272(%GR7)
	JUMP	.LBB46_439
.LBB46_439 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ;     Parent Loop BB46_301 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ULOADB	%GR6, 272(%GR7)
	ADDI	%GR1, %GR6, -1
	STOREB	%GR1, 272(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_441
	JUMP	.LBB46_440
.LBB46_440 NOP                          ;   in Loop: Header=BB46_439 Depth=3
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 244(%GR7)
	JUMP	.LBB46_439
.LBB46_441 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 11
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 8
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 7
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 4
	STOREB	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STOREB	%GR6, 172(%GR7)
	JUMP	.LBB46_442
.LBB46_442 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_444
.LBB46_443 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	COPYI	%GR6, 0
	STOREB	%GR6, 172(%GR7)
	ULOADB	%GR6, 276(%GR7)
	ANDI	%GR1, %GR6, 7
	COPYI	%GR2, 1
	SHL	%GR1, %GR2, %GR1
	LOAD	%GR2, 264(%GR7)
	SRLI	%GR6, %GR6, 3
	ADD	%GR6, %GR2, %GR6
	ULOADB	%GR2, 0(%GR6)
	OR	%GR1, %GR2, %GR1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_444
.LBB46_444 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_445
.LBB46_445 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_446
.LBB46_446 NOP                          ;   in Loop: Header=BB46_301 Depth=2
	JUMP	.LBB46_320
.LBB46_447 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_448
.LBB46_448 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 1
	LT	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB46_450
	JUMP	.LBB46_449
.LBB46_449 NOP                          ;   in Loop: Header=BB46_448 Depth=2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, -1
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB46_450
.LBB46_450 NOP                          ;   in Loop: Header=BB46_448 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_452
	JUMP	.LBB46_451
.LBB46_451 NOP                          ;   in Loop: Header=BB46_448 Depth=2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, -1
	ULOADB	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_448
.LBB46_452 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, -1
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB46_1054
.LBB46_453 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_455
	JUMP	.LBB46_454
.LBB46_454 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_493
.LBB46_455 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_456 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_458
	JUMP	.LBB46_457
.LBB46_457 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_531
.LBB46_458 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_459 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 8
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_461
	JUMP	.LBB46_460
.LBB46_460 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_589
.LBB46_461 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_462 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_464
	JUMP	.LBB46_463
.LBB46_463 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_589
.LBB46_464 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_465 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_468
	JUMP	.LBB46_466
.LBB46_466 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_468
	JUMP	.LBB46_467
.LBB46_467 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_639
.LBB46_468 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_469 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_471
	JUMP	.LBB46_470
.LBB46_470 NOP 
	COPYI	%GR6, 5
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_471 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_472
.LBB46_472 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_474
	JUMP	.LBB46_473
.LBB46_473 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_474 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_475
.LBB46_475 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 39
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_934
	JUMP	.LBB46_476
.LBB46_476 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 40
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_490
	JUMP	.LBB46_477
.LBB46_477 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 41
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_524
	JUMP	.LBB46_478
.LBB46_478 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 43
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_984
	JUMP	.LBB46_479
.LBB46_479 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR1, %GR6, -49
	COPYI	%GR2, 9
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB46_956
	JUMP	.LBB46_480
.LBB46_480 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 60
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_824
	JUMP	.LBB46_481
.LBB46_481 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 62
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_846
	JUMP	.LBB46_482
.LBB46_482 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 63
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_984
	JUMP	.LBB46_483
.LBB46_483 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 66
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_890
	JUMP	.LBB46_484
.LBB46_484 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 87
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_802
	JUMP	.LBB46_485
.LBB46_485 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 96
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_912
	JUMP	.LBB46_486
.LBB46_486 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 98
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_868
	JUMP	.LBB46_487
.LBB46_487 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 119
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_780
	JUMP	.LBB46_488
.LBB46_488 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 123
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB46_632
	JUMP	.LBB46_489
.LBB46_489 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 124
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_585
	JUMP	.LBB46_987
.LBB46_490 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_492
	JUMP	.LBB46_491
.LBB46_491 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_492 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_493
.LBB46_493 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 24
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 212(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 212(%GR7)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR1, %GR6, 8
	LOAD	%GR1, 0(%GR1)
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	NEQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB46_497
	JUMP	.LBB46_494
.LBB46_494 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR6, %GR7, 248
	ORI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	MULI	%GR2, %GR6, 40
	CALL	realloc
	COPYR	%GR6, %RT0
	STORE	%GR6, 248(%GR7)
	LOAD	%GR6, 248(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_496
	JUMP	.LBB46_495
.LBB46_495 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_496 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 248
	ORI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_497
.LBB46_497 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR2, %GR2, 8
	LOAD	%GR2, 0(%GR2)
	MULI	%GR2, %GR2, 20
	ADD	%GR1, %GR1, %GR2
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_499
	JUMP	.LBB46_498
.LBB46_498 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	ADDI	%GR1, %GR6, 1
	JUMP	.LBB46_500
.LBB46_499 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR1, 0
	JUMP	.LBB46_500
.LBB46_500 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 248(%GR7)
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	MULI	%GR3, %GR3, 20
	ADD	%GR2, %GR2, %GR3
	ADDI	%GR2, %GR2, 4
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 264(%GR7)
	LOAD	%GR2, 280(%GR7)
	LOAD	%GR2, 0(%GR2)
	SUB	%GR1, %GR1, %GR2
	LOAD	%GR2, 248(%GR7)
	LOAD	%GR3, 0(%GR6)
	MULI	%GR3, %GR3, 20
	ADD	%GR2, %GR2, %GR3
	ADDI	%GR2, %GR2, 12
	STORE	%GR1, 0(%GR2)
	LOAD	%GR1, 212(%GR7)
	LOAD	%GR2, 248(%GR7)
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 20
	ADD	%GR6, %GR2, %GR6
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 212(%GR7)
	COPYI	%GR1, 255
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_523
	JUMP	.LBB46_501
.LBB46_501 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	SUB	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 2
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR2, %GR2, 8
	LOAD	%GR2, 0(%GR2)
	MULI	%GR2, %GR2, 20
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB46_502
.LBB46_502 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_503
.LBB46_503 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_521
	JUMP	.LBB46_504
.LBB46_504 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	JUMP	.LBB46_505
.LBB46_505 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 88(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_507
	JUMP	.LBB46_506
.LBB46_506 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_507 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_509
	JUMP	.LBB46_508
.LBB46_508 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_509
.LBB46_509 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_511
	JUMP	.LBB46_510
.LBB46_510 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_511 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 88(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_519
	JUMP	.LBB46_512
.LBB46_512 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 88(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 88(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_514
	JUMP	.LBB46_513
.LBB46_513 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 88(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_514
.LBB46_514 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_516
	JUMP	.LBB46_515
.LBB46_515 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 88(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_516
.LBB46_516 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_518
	JUMP	.LBB46_517
.LBB46_517 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 88(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_518
.LBB46_518 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	JUMP	.LBB46_519
.LBB46_519 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	JUMP	.LBB46_520
.LBB46_520 NOP                          ;   in Loop: Header=BB46_503 Depth=2
	JUMP	.LBB46_503
.LBB46_521 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 5
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 212(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_522
.LBB46_522 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_523
.LBB46_523 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	COPYI	%GR6, 0
	STORE	%GR6, 216(%GR7)
	STORE	%GR6, 228(%GR7)
	LOAD	%GR1, 264(%GR7)
	STORE	%GR1, 224(%GR7)
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_992
.LBB46_524 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_526
	JUMP	.LBB46_525
.LBB46_525 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_526 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_530
	JUMP	.LBB46_527
.LBB46_527 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_529
	JUMP	.LBB46_528
.LBB46_528 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_529 NOP 
	COPYI	%GR6, 16
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_530 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_531
.LBB46_531 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_554
	JUMP	.LBB46_532
.LBB46_532 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_533
.LBB46_533 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_534
.LBB46_534 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_552
	JUMP	.LBB46_535
.LBB46_535 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	JUMP	.LBB46_536
.LBB46_536 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 84(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_538
	JUMP	.LBB46_537
.LBB46_537 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_538 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_540
	JUMP	.LBB46_539
.LBB46_539 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_540
.LBB46_540 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_542
	JUMP	.LBB46_541
.LBB46_541 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_542 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 84(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_550
	JUMP	.LBB46_543
.LBB46_543 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 84(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 84(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_545
	JUMP	.LBB46_544
.LBB46_544 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 84(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_545
.LBB46_545 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_547
	JUMP	.LBB46_546
.LBB46_546 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 84(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_547
.LBB46_547 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_549
	JUMP	.LBB46_548
.LBB46_548 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 84(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_549
.LBB46_549 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	JUMP	.LBB46_550
.LBB46_550 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	JUMP	.LBB46_551
.LBB46_551 NOP                          ;   in Loop: Header=BB46_534 Depth=2
	JUMP	.LBB46_534
.LBB46_552 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 19
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_553
.LBB46_553 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 216(%GR7)
	LOAD	%GR6, 264(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, -4
	COPYI	%GR1, 13
	CALL	store_op1
	JUMP	.LBB46_554
.LBB46_554 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_558
	JUMP	.LBB46_555
.LBB46_555 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 2
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_557
	JUMP	.LBB46_556
.LBB46_556 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_557 NOP 
	COPYI	%GR6, 16
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_558 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 248(%GR7)
	LOAD	%GR3, 0(%GR6)
	MULI	%GR3, %GR3, 20
	ADD	%GR2, %GR2, %GR3
	LOAD	%GR2, 0(%GR2)
	ADD	%GR1, %GR1, %GR2
	STORE	%GR1, 224(%GR7)
	LOAD	%GR1, 248(%GR7)
	LOAD	%GR6, 0(%GR6)
	MULI	%GR6, %GR6, 20
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_560
	JUMP	.LBB46_559
.LBB46_559 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR2, %GR2, 8
	LOAD	%GR2, 0(%GR2)
	MULI	%GR2, %GR2, 20
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -1
	JUMP	.LBB46_561
.LBB46_560 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, 0
	JUMP	.LBB46_561
.LBB46_561 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	STORE	%GR6, 216(%GR7)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR2, %GR2, 8
	LOAD	%GR3, 0(%GR2)
	MULI	%GR3, %GR3, 20
	ADD	%GR1, %GR1, %GR3
	ADDI	%GR1, %GR1, 12
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 228(%GR7)
	LOAD	%GR6, 248(%GR7)
	LOAD	%GR1, 0(%GR2)
	MULI	%GR1, %GR1, 20
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 80(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 232(%GR7)
	LOAD	%GR6, 80(%GR7)
	COPYI	%GR1, 255
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_584
	JUMP	.LBB46_562
.LBB46_562 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR2, %GR7, 248
	ADDI	%GR2, %GR2, 8
	LOAD	%GR2, 0(%GR2)
	MULI	%GR2, %GR2, 20
	ADD	%GR1, %GR1, %GR2
	ADDI	%GR1, %GR1, 8
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	STORE	%GR6, 76(%GR7)
	LOAD	%GR6, 212(%GR7)
	LOAD	%GR1, 80(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 76(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB46_563
.LBB46_563 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_564
.LBB46_564 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_582
	JUMP	.LBB46_565
.LBB46_565 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	JUMP	.LBB46_566
.LBB46_566 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 72(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_568
	JUMP	.LBB46_567
.LBB46_567 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_568 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_570
	JUMP	.LBB46_569
.LBB46_569 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_570
.LBB46_570 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_572
	JUMP	.LBB46_571
.LBB46_571 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_572 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 72(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_580
	JUMP	.LBB46_573
.LBB46_573 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 72(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 72(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_575
	JUMP	.LBB46_574
.LBB46_574 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 72(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_575
.LBB46_575 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_577
	JUMP	.LBB46_576
.LBB46_576 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 72(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_577
.LBB46_577 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_579
	JUMP	.LBB46_578
.LBB46_578 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 72(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_579
.LBB46_579 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	JUMP	.LBB46_580
.LBB46_580 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	JUMP	.LBB46_581
.LBB46_581 NOP                          ;   in Loop: Header=BB46_564 Depth=2
	JUMP	.LBB46_564
.LBB46_582 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 6
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 80(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 212(%GR7)
	LOAD	%GR1, 80(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB46_583
.LBB46_583 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_584
.LBB46_584 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_585 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_587
	JUMP	.LBB46_586
.LBB46_586 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_588
	JUMP	.LBB46_587
.LBB46_587 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_588 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_589
.LBB46_589 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_591
	JUMP	.LBB46_590
.LBB46_590 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_591 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_592
.LBB46_592 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_610
	JUMP	.LBB46_593
.LBB46_593 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	JUMP	.LBB46_594
.LBB46_594 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 68(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_596
	JUMP	.LBB46_595
.LBB46_595 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_596 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_598
	JUMP	.LBB46_597
.LBB46_597 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_598
.LBB46_598 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_600
	JUMP	.LBB46_599
.LBB46_599 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_600 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 68(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_608
	JUMP	.LBB46_601
.LBB46_601 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 68(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 68(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_603
	JUMP	.LBB46_602
.LBB46_602 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 68(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_603
.LBB46_603 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_605
	JUMP	.LBB46_604
.LBB46_604 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 68(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_605
.LBB46_605 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_607
	JUMP	.LBB46_606
.LBB46_606 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 68(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_607
.LBB46_607 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	JUMP	.LBB46_608
.LBB46_608 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	JUMP	.LBB46_609
.LBB46_609 NOP                          ;   in Loop: Header=BB46_592 Depth=2
	JUMP	.LBB46_592
.LBB46_610 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 224(%GR7)
	LOAD	%GR4, 264(%GR7)
	SUB	%GR6, %GR4, %GR2
	ADDI	%GR3, %GR6, 3
	COPYI	%GR1, 14
	CALL	insert_op1
	COPYI	%GR6, 0
	STORE	%GR6, 232(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR1, %GR1, 3
	STORE	%GR1, 264(%GR7)
	LOAD	%GR1, 216(%GR7)
	EQ	%GR6, %GR1, %GR6
	BNEQZ	%GR6, .LBB46_612
	JUMP	.LBB46_611
.LBB46_611 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 216(%GR7)
	LOAD	%GR6, 264(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, -3
	COPYI	%GR1, 13
	CALL	store_op1
	JUMP	.LBB46_612
.LBB46_612 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_613
.LBB46_613 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_631
	JUMP	.LBB46_614
.LBB46_614 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	JUMP	.LBB46_615
.LBB46_615 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 64(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_617
	JUMP	.LBB46_616
.LBB46_616 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_617 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_619
	JUMP	.LBB46_618
.LBB46_618 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_619
.LBB46_619 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_621
	JUMP	.LBB46_620
.LBB46_620 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_621 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 64(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_629
	JUMP	.LBB46_622
.LBB46_622 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_624
	JUMP	.LBB46_623
.LBB46_623 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_624
.LBB46_624 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_626
	JUMP	.LBB46_625
.LBB46_625 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_626
.LBB46_626 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_628
	JUMP	.LBB46_627
.LBB46_627 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 64(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_628
.LBB46_628 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	JUMP	.LBB46_629
.LBB46_629 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	JUMP	.LBB46_630
.LBB46_630 NOP                          ;   in Loop: Header=BB46_613 Depth=2
	JUMP	.LBB46_613
.LBB46_631 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 264(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 228(%GR7)
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 224(%GR7)
	JUMP	.LBB46_992
.LBB46_632 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_637
	JUMP	.LBB46_633
.LBB46_633 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_635
	JUMP	.LBB46_634
.LBB46_634 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_637
	JUMP	.LBB46_635
.LBB46_635 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -2
	LOAD	%GR1, 292(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_638
	JUMP	.LBB46_636
.LBB46_636 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_638
	JUMP	.LBB46_637
.LBB46_637 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_638 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_639
.LBB46_639 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, -1
	STORE	%GR6, 60(%GR7)
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 220(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_643
	JUMP	.LBB46_640
.LBB46_640 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_642
	JUMP	.LBB46_641
.LBB46_641 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_768
.LBB46_642 NOP 
	COPYI	%GR6, 9
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_643 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_667
	JUMP	.LBB46_644
.LBB46_644 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_645
.LBB46_645 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_647
	JUMP	.LBB46_646
.LBB46_646 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_647 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_649
	JUMP	.LBB46_648
.LBB46_648 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_649
.LBB46_649 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_650
.LBB46_650 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_651
.LBB46_651 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 276(%GR7)
	ANDI	%GR1, %GR6, 128
	COPYI	%GR6, 0
	NEQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB46_653
	JUMP	.LBB46_652
.LBB46_652 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR1, 276(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	SRLI	%GR6, %GR6, 11
	JUMP	.LBB46_653
.LBB46_653 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_665
	JUMP	.LBB46_654
.LBB46_654 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_656
	JUMP	.LBB46_655
.LBB46_655 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 60(%GR7)
	JUMP	.LBB46_656
.LBB46_656 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	LOAD	%GR6, 60(%GR7)
	MULI	%GR6, %GR6, 10
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 60(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_658
	JUMP	.LBB46_657
.LBB46_657 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_666
.LBB46_658 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	JUMP	.LBB46_659
.LBB46_659 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_661
	JUMP	.LBB46_660
.LBB46_660 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_661 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_663
	JUMP	.LBB46_662
.LBB46_662 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_663
.LBB46_663 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	JUMP	.LBB46_664
.LBB46_664 NOP                          ;   in Loop: Header=BB46_651 Depth=2
	JUMP	.LBB46_651
.LBB46_665 NOP                          ; %.loopexit1
                                        ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_666
.LBB46_666 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_667
.LBB46_667 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 44
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_695
	JUMP	.LBB46_668
.LBB46_668 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_692
	JUMP	.LBB46_669
.LBB46_669 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_670
.LBB46_670 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_672
	JUMP	.LBB46_671
.LBB46_671 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_672 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_674
	JUMP	.LBB46_673
.LBB46_673 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_674
.LBB46_674 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_675
.LBB46_675 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_676
.LBB46_676 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ULOADB	%GR6, 276(%GR7)
	ANDI	%GR1, %GR6, 128
	COPYI	%GR6, 0
	NEQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB46_678
	JUMP	.LBB46_677
.LBB46_677 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	ULOADB	%GR1, 276(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2048
	SRLI	%GR6, %GR6, 11
	JUMP	.LBB46_678
.LBB46_678 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_690
	JUMP	.LBB46_679
.LBB46_679 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_681
	JUMP	.LBB46_680
.LBB46_680 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	COPYI	%GR6, 0
	STORE	%GR6, 56(%GR7)
	JUMP	.LBB46_681
.LBB46_681 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	LOAD	%GR6, 56(%GR7)
	MULI	%GR6, %GR6, 10
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, -48
	STORE	%GR6, 56(%GR7)
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_683
	JUMP	.LBB46_682
.LBB46_682 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_691
.LBB46_683 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	JUMP	.LBB46_684
.LBB46_684 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_686
	JUMP	.LBB46_685
.LBB46_685 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_686 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_688
	JUMP	.LBB46_687
.LBB46_687 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_688
.LBB46_688 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	JUMP	.LBB46_689
.LBB46_689 NOP                          ;   in Loop: Header=BB46_676 Depth=2
	JUMP	.LBB46_676
.LBB46_690 NOP                          ; %.loopexit
                                        ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_691
.LBB46_691 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_692
.LBB46_692 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, -1
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_694
	JUMP	.LBB46_693
.LBB46_693 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, 32767
	STORE	%GR6, 56(%GR7)
	JUMP	.LBB46_694
.LBB46_694 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_696
.LBB46_695 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 60(%GR7)
	STORE	%GR6, 56(%GR7)
	JUMP	.LBB46_696
.LBB46_696 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 60(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_699
	JUMP	.LBB46_697
.LBB46_697 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 32767
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_699
	JUMP	.LBB46_698
.LBB46_698 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 60(%GR7)
	LOAD	%GR1, 56(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_702
	JUMP	.LBB46_699
.LBB46_699 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_701
	JUMP	.LBB46_700
.LBB46_700 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_768
.LBB46_701 NOP 
	COPYI	%GR6, 10
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_702 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_712
	JUMP	.LBB46_703
.LBB46_703 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 92
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_705
	JUMP	.LBB46_704
.LBB46_704 NOP 
	COPYI	%GR6, 9
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_705 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_706
.LBB46_706 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_708
	JUMP	.LBB46_707
.LBB46_707 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_708 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_710
	JUMP	.LBB46_709
.LBB46_709 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_710
.LBB46_710 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_711
.LBB46_711 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_712
.LBB46_712 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	COPYI	%GR1, 125
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_716
	JUMP	.LBB46_713
.LBB46_713 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_715
	JUMP	.LBB46_714
.LBB46_714 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_768
.LBB46_715 NOP 
	COPYI	%GR6, 10
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_716 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_724
	JUMP	.LBB46_717
.LBB46_717 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_719
	JUMP	.LBB46_718
.LBB46_718 NOP 
	COPYI	%GR6, 13
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_719 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_721
	JUMP	.LBB46_720
.LBB46_720 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_722
.LBB46_721 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_768
.LBB46_722 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_723
.LBB46_723 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_724
.LBB46_724 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_745
	JUMP	.LBB46_725
.LBB46_725 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_726
.LBB46_726 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 3
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_744
	JUMP	.LBB46_727
.LBB46_727 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	JUMP	.LBB46_728
.LBB46_728 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 52(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_730
	JUMP	.LBB46_729
.LBB46_729 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_730 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_732
	JUMP	.LBB46_731
.LBB46_731 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_732
.LBB46_732 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_734
	JUMP	.LBB46_733
.LBB46_733 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_734 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 52(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_742
	JUMP	.LBB46_735
.LBB46_735 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_737
	JUMP	.LBB46_736
.LBB46_736 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_737
.LBB46_737 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_739
	JUMP	.LBB46_738
.LBB46_738 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_739
.LBB46_739 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_741
	JUMP	.LBB46_740
.LBB46_740 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 52(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_741
.LBB46_741 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	JUMP	.LBB46_742
.LBB46_742 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	JUMP	.LBB46_743
.LBB46_743 NOP                          ;   in Loop: Header=BB46_726 Depth=2
	JUMP	.LBB46_726
.LBB46_744 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR4, 264(%GR7)
	SUB	%GR3, %GR4, %GR2
	COPYI	%GR1, 12
	CALL	insert_op1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB46_767
.LBB46_745 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 1
	GT	%GR6, %GR6, %GR1
	MULI	%GR6, %GR6, 10
	ADDI	%GR6, %GR6, 10
	STORE	%GR6, 48(%GR7)
	JUMP	.LBB46_746
.LBB46_746 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	LOAD	%GR2, 48(%GR7)
	ADD	%GR6, %GR6, %GR2
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_764
	JUMP	.LBB46_747
.LBB46_747 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	JUMP	.LBB46_748
.LBB46_748 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 44(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_750
	JUMP	.LBB46_749
.LBB46_749 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_750 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_752
	JUMP	.LBB46_751
.LBB46_751 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_752
.LBB46_752 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_754
	JUMP	.LBB46_753
.LBB46_753 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_754 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 44(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_762
	JUMP	.LBB46_755
.LBB46_755 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_757
	JUMP	.LBB46_756
.LBB46_756 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_757
.LBB46_757 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_759
	JUMP	.LBB46_758
.LBB46_758 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_759
.LBB46_759 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_761
	JUMP	.LBB46_760
.LBB46_760 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 44(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_761
.LBB46_761 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	JUMP	.LBB46_762
.LBB46_762 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	JUMP	.LBB46_763
.LBB46_763 NOP                          ;   in Loop: Header=BB46_746 Depth=2
	JUMP	.LBB46_746
.LBB46_764 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR5, 264(%GR7)
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 1
	GT	%GR6, %GR6, %GR1
	MULI	%GR6, %GR6, 5
	ADD	%GR6, %GR5, %GR6
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, 2
	LOAD	%GR4, 60(%GR7)
	COPYI	%GR1, 20
	CALL	insert_op2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 5
	STORE	%GR6, 264(%GR7)
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR4, 60(%GR7)
	LOAD	%GR5, 264(%GR7)
	COPYI	%GR1, 22
	COPYI	%GR3, 5
	CALL	insert_op2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 5
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 56(%GR7)
	COPYI	%GR1, 2
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_766
	JUMP	.LBB46_765
.LBB46_765 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR2, 264(%GR7)
	LOAD	%GR6, 228(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, 2
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR4, %GR6, -1
	COPYI	%GR1, 21
	CALL	store_op2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 5
	STORE	%GR6, 264(%GR7)
	LOAD	%GR2, 228(%GR7)
	LOAD	%GR5, 264(%GR7)
	SUB	%GR3, %GR5, %GR2
	LOAD	%GR6, 56(%GR7)
	ADDI	%GR4, %GR6, -1
	COPYI	%GR1, 22
	CALL	insert_op2
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, 5
	STORE	%GR6, 264(%GR7)
	JUMP	.LBB46_766
.LBB46_766 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_767
.LBB46_767 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	COPYI	%GR6, 0
	STORE	%GR6, 232(%GR7)
	STORE	%GR6, 220(%GR7)
	JUMP	.LBB46_992
.LBB46_768 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 220(%GR7)
	STORE	%GR6, 244(%GR7)
	COPYI	%GR6, 0
	STORE	%GR6, 220(%GR7)
	JUMP	.LBB46_769
.LBB46_769 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 240(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_771
	JUMP	.LBB46_770
.LBB46_770 NOP 
	COPYI	%GR6, 14
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_771 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 244(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_773
	JUMP	.LBB46_772
.LBB46_772 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_773
.LBB46_773 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_774
.LBB46_774 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_779
	JUMP	.LBB46_775
.LBB46_775 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOAD	%GR1, 292(%GR7)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_778
	JUMP	.LBB46_776
.LBB46_776 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_778
	JUMP	.LBB46_777
.LBB46_777 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_778 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_779
.LBB46_779 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_780 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_781
.LBB46_781 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_782
.LBB46_782 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_800
	JUMP	.LBB46_783
.LBB46_783 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	JUMP	.LBB46_784
.LBB46_784 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 40(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_786
	JUMP	.LBB46_785
.LBB46_785 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_786 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_788
	JUMP	.LBB46_787
.LBB46_787 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_788
.LBB46_788 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_790
	JUMP	.LBB46_789
.LBB46_789 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_790 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 40(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_798
	JUMP	.LBB46_791
.LBB46_791 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 40(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 40(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_793
	JUMP	.LBB46_792
.LBB46_792 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 40(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_793
.LBB46_793 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_795
	JUMP	.LBB46_794
.LBB46_794 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 40(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_795
.LBB46_795 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_797
	JUMP	.LBB46_796
.LBB46_796 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 40(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_797
.LBB46_797 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	JUMP	.LBB46_798
.LBB46_798 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	JUMP	.LBB46_799
.LBB46_799 NOP                          ;   in Loop: Header=BB46_782 Depth=2
	JUMP	.LBB46_782
.LBB46_800 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 23
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_801
.LBB46_801 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_802 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_803
.LBB46_803 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_804
.LBB46_804 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_822
	JUMP	.LBB46_805
.LBB46_805 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	JUMP	.LBB46_806
.LBB46_806 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 36(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_808
	JUMP	.LBB46_807
.LBB46_807 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_808 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_810
	JUMP	.LBB46_809
.LBB46_809 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_810
.LBB46_810 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_812
	JUMP	.LBB46_811
.LBB46_811 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_812 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 36(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_820
	JUMP	.LBB46_813
.LBB46_813 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 36(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 36(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_815
	JUMP	.LBB46_814
.LBB46_814 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 36(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_815
.LBB46_815 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_817
	JUMP	.LBB46_816
.LBB46_816 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 36(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_817
.LBB46_817 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_819
	JUMP	.LBB46_818
.LBB46_818 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 36(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_819
.LBB46_819 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	JUMP	.LBB46_820
.LBB46_820 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	JUMP	.LBB46_821
.LBB46_821 NOP                          ;   in Loop: Header=BB46_804 Depth=2
	JUMP	.LBB46_804
.LBB46_822 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 24
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_823
.LBB46_823 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_824 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_825
.LBB46_825 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_826
.LBB46_826 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_844
	JUMP	.LBB46_827
.LBB46_827 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	JUMP	.LBB46_828
.LBB46_828 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 32(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_830
	JUMP	.LBB46_829
.LBB46_829 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_830 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_832
	JUMP	.LBB46_831
.LBB46_831 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_832
.LBB46_832 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_834
	JUMP	.LBB46_833
.LBB46_833 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_834 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_842
	JUMP	.LBB46_835
.LBB46_835 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_837
	JUMP	.LBB46_836
.LBB46_836 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_837
.LBB46_837 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_839
	JUMP	.LBB46_838
.LBB46_838 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_839
.LBB46_839 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_841
	JUMP	.LBB46_840
.LBB46_840 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 32(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_841
.LBB46_841 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	JUMP	.LBB46_842
.LBB46_842 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	JUMP	.LBB46_843
.LBB46_843 NOP                          ;   in Loop: Header=BB46_826 Depth=2
	JUMP	.LBB46_826
.LBB46_844 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 25
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_845
.LBB46_845 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_846 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_847
.LBB46_847 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_848
.LBB46_848 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_866
	JUMP	.LBB46_849
.LBB46_849 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	JUMP	.LBB46_850
.LBB46_850 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 28(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_852
	JUMP	.LBB46_851
.LBB46_851 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_852 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_854
	JUMP	.LBB46_853
.LBB46_853 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_854
.LBB46_854 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_856
	JUMP	.LBB46_855
.LBB46_855 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_856 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_864
	JUMP	.LBB46_857
.LBB46_857 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 28(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 28(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_859
	JUMP	.LBB46_858
.LBB46_858 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 28(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_859
.LBB46_859 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_861
	JUMP	.LBB46_860
.LBB46_860 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 28(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_861
.LBB46_861 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_863
	JUMP	.LBB46_862
.LBB46_862 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 28(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_863
.LBB46_863 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	JUMP	.LBB46_864
.LBB46_864 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	JUMP	.LBB46_865
.LBB46_865 NOP                          ;   in Loop: Header=BB46_848 Depth=2
	JUMP	.LBB46_848
.LBB46_866 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 26
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_867
.LBB46_867 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_868 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_869
.LBB46_869 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_870
.LBB46_870 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_888
	JUMP	.LBB46_871
.LBB46_871 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	JUMP	.LBB46_872
.LBB46_872 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 24(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_874
	JUMP	.LBB46_873
.LBB46_873 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_874 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_876
	JUMP	.LBB46_875
.LBB46_875 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_876
.LBB46_876 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_878
	JUMP	.LBB46_877
.LBB46_877 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_878 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_886
	JUMP	.LBB46_879
.LBB46_879 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_881
	JUMP	.LBB46_880
.LBB46_880 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_881
.LBB46_881 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_883
	JUMP	.LBB46_882
.LBB46_882 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_883
.LBB46_883 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_885
	JUMP	.LBB46_884
.LBB46_884 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 24(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_885
.LBB46_885 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	JUMP	.LBB46_886
.LBB46_886 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	JUMP	.LBB46_887
.LBB46_887 NOP                          ;   in Loop: Header=BB46_870 Depth=2
	JUMP	.LBB46_870
.LBB46_888 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 27
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_889
.LBB46_889 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_890 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_891
.LBB46_891 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_892
.LBB46_892 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_910
	JUMP	.LBB46_893
.LBB46_893 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	JUMP	.LBB46_894
.LBB46_894 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 20(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_896
	JUMP	.LBB46_895
.LBB46_895 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_896 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_898
	JUMP	.LBB46_897
.LBB46_897 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_898
.LBB46_898 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_900
	JUMP	.LBB46_899
.LBB46_899 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_900 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_908
	JUMP	.LBB46_901
.LBB46_901 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_903
	JUMP	.LBB46_902
.LBB46_902 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_903
.LBB46_903 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_905
	JUMP	.LBB46_904
.LBB46_904 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_905
.LBB46_905 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_907
	JUMP	.LBB46_906
.LBB46_906 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 20(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_907
.LBB46_907 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	JUMP	.LBB46_908
.LBB46_908 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	JUMP	.LBB46_909
.LBB46_909 NOP                          ;   in Loop: Header=BB46_892 Depth=2
	JUMP	.LBB46_892
.LBB46_910 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 28
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_911
.LBB46_911 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_912 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_913
.LBB46_913 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_914
.LBB46_914 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_932
	JUMP	.LBB46_915
.LBB46_915 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	JUMP	.LBB46_916
.LBB46_916 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_918
	JUMP	.LBB46_917
.LBB46_917 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_918 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_920
	JUMP	.LBB46_919
.LBB46_919 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_920
.LBB46_920 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_922
	JUMP	.LBB46_921
.LBB46_921 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_922 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_930
	JUMP	.LBB46_923
.LBB46_923 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_925
	JUMP	.LBB46_924
.LBB46_924 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_925
.LBB46_925 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_927
	JUMP	.LBB46_926
.LBB46_926 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_927
.LBB46_927 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_929
	JUMP	.LBB46_928
.LBB46_928 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 16(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_929
.LBB46_929 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	JUMP	.LBB46_930
.LBB46_930 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	JUMP	.LBB46_931
.LBB46_931 NOP                          ;   in Loop: Header=BB46_914 Depth=2
	JUMP	.LBB46_914
.LBB46_932 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 10
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_933
.LBB46_933 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_934 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_935
.LBB46_935 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_936
.LBB46_936 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_954
	JUMP	.LBB46_937
.LBB46_937 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	JUMP	.LBB46_938
.LBB46_938 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_940
	JUMP	.LBB46_939
.LBB46_939 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_940 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_942
	JUMP	.LBB46_941
.LBB46_941 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_942
.LBB46_942 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_944
	JUMP	.LBB46_943
.LBB46_943 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_944 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_952
	JUMP	.LBB46_945
.LBB46_945 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 12(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 12(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_947
	JUMP	.LBB46_946
.LBB46_946 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 12(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_947
.LBB46_947 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_949
	JUMP	.LBB46_948
.LBB46_948 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 12(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_949
.LBB46_949 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_951
	JUMP	.LBB46_950
.LBB46_950 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 12(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_951
.LBB46_951 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	JUMP	.LBB46_952
.LBB46_952 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	JUMP	.LBB46_953
.LBB46_953 NOP                          ;   in Loop: Header=BB46_936 Depth=2
	JUMP	.LBB46_936
.LBB46_954 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 11
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_955
.LBB46_955 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_956 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 64
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_958
	JUMP	.LBB46_957
.LBB46_957 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_958 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	ADDI	%GR6, %GR6, -48
	STOREB	%GR6, 272(%GR7)
	ULOADB	%GR6, 272(%GR7)
	LOAD	%GR1, 212(%GR7)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_960
	JUMP	.LBB46_959
.LBB46_959 NOP 
	COPYI	%GR6, 6
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_960 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR4, 272(%GR7)
	LOAD	%GR1, 248(%GR7)
	ADDI	%GR6, %GR7, 248
	ORI	%GR2, %GR6, 4
	LOAD	%GR2, 0(%GR2)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR3, 0(%GR6)
	CALL	group_in_compile_stack
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_962
	JUMP	.LBB46_961
.LBB46_961 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_962 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_963
.LBB46_963 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_964
.LBB46_964 NOP                          ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 2
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_982
	JUMP	.LBB46_965
.LBB46_965 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	JUMP	.LBB46_966
.LBB46_966 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_968
	JUMP	.LBB46_967
.LBB46_967 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_968 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_970
	JUMP	.LBB46_969
.LBB46_969 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_970
.LBB46_970 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_972
	JUMP	.LBB46_971
.LBB46_971 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_972 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_980
	JUMP	.LBB46_973
.LBB46_973 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_975
	JUMP	.LBB46_974
.LBB46_974 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_975
.LBB46_975 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_977
	JUMP	.LBB46_976
.LBB46_976 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_977
.LBB46_977 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_979
	JUMP	.LBB46_978
.LBB46_978 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 8(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_979
.LBB46_979 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	JUMP	.LBB46_980
.LBB46_980 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	JUMP	.LBB46_981
.LBB46_981 NOP                          ;   in Loop: Header=BB46_964 Depth=2
	JUMP	.LBB46_964
.LBB46_982 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 7
	STOREB	%GR1, 0(%GR6)
	ULOADB	%GR6, 272(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB46_983
.LBB46_983 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_992
.LBB46_984 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_986
	JUMP	.LBB46_985
.LBB46_985 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_88
.LBB46_986 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_987 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_988
.LBB46_988 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_990
	JUMP	.LBB46_989
.LBB46_989 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 236(%GR7)
	ULOADB	%GR1, 276(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB46_991
.LBB46_990 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	JUMP	.LBB46_991
.LBB46_991 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	STOREB	%GR6, 276(%GR7)
	JUMP	.LBB46_994
.LBB46_992 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1054
.LBB46_993 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_994
.LBB46_994 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_995
.LBB46_995 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 232(%GR7)
	ULOADB	%GR1, 0(%GR6)
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 1
	LOAD	%GR1, 264(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_996
.LBB46_996 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 232(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 255
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_997
.LBB46_997 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 42
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_998
.LBB46_998 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 94
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_999
.LBB46_999 NOP                          ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 284(%GR7)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1003
	JUMP	.LBB46_1000
.LBB46_1000 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1005
	JUMP	.LBB46_1001
.LBB46_1001 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 43
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_1002
.LBB46_1002 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 63
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_1005
.LBB46_1003 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 43
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_1004
.LBB46_1004 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 63
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_1005
.LBB46_1005 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 2
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1032
	JUMP	.LBB46_1006
.LBB46_1006 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	ADDI	%GR6, %GR7, 284
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1008
	JUMP	.LBB46_1007
.LBB46_1007 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 123
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1010
	JUMP	.LBB46_1032
.LBB46_1008 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1032
	JUMP	.LBB46_1009
.LBB46_1009 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 244(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 123
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1032
	JUMP	.LBB46_1010
.LBB46_1010 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_1011
.LBB46_1011 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1012
.LBB46_1012 NOP                         ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 2
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1030
	JUMP	.LBB46_1013
.LBB46_1013 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	JUMP	.LBB46_1014
.LBB46_1014 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1016
	JUMP	.LBB46_1015
.LBB46_1015 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1016 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1018
	JUMP	.LBB46_1017
.LBB46_1017 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_1018
.LBB46_1018 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1020
	JUMP	.LBB46_1019
.LBB46_1019 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1020 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1028
	JUMP	.LBB46_1021
.LBB46_1021 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 4(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 4(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1023
	JUMP	.LBB46_1022
.LBB46_1022 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 4(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_1023
.LBB46_1023 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1025
	JUMP	.LBB46_1024
.LBB46_1024 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 4(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_1025
.LBB46_1025 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1027
	JUMP	.LBB46_1026
.LBB46_1026 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 4(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_1027
.LBB46_1027 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	JUMP	.LBB46_1028
.LBB46_1028 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	JUMP	.LBB46_1029
.LBB46_1029 NOP                         ;   in Loop: Header=BB46_1012 Depth=2
	JUMP	.LBB46_1012
.LBB46_1030 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 264(%GR7)
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_1031
.LBB46_1031 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 264(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_1032
.LBB46_1032 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1033
.LBB46_1033 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_1034
.LBB46_1034 NOP                         ;   Parent Loop BB46_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR6, %GR6, 1
	ADDI	%GR1, %GR1, 4
	LOAD	%GR1, 0(%GR1)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1052
	JUMP	.LBB46_1035
.LBB46_1035 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	JUMP	.LBB46_1036
.LBB46_1036 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65536
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1038
	JUMP	.LBB46_1037
.LBB46_1037 NOP 
	COPYI	%GR6, 15
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1038 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR1, 0(%GR6)
	SHLI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 65537
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1040
	JUMP	.LBB46_1039
.LBB46_1039 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 280(%GR7)
	ADDI	%GR6, %GR6, 4
	COPYI	%GR1, 65536
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB46_1040
.LBB46_1040 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR6, %GR6, 4
	LOAD	%GR2, 0(%GR6)
	CALL	realloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 280(%GR7)
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 280(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1042
	JUMP	.LBB46_1041
.LBB46_1041 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1042 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1050
	JUMP	.LBB46_1043
.LBB46_1043 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 0(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 264(%GR7)
	LOAD	%GR6, 224(%GR7)
	LOAD	%GR1, 0(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 224(%GR7)
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1045
	JUMP	.LBB46_1044
.LBB46_1044 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 216(%GR7)
	LOAD	%GR1, 0(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 216(%GR7)
	JUMP	.LBB46_1045
.LBB46_1045 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 228(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1047
	JUMP	.LBB46_1046
.LBB46_1046 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 228(%GR7)
	LOAD	%GR1, 0(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 228(%GR7)
	JUMP	.LBB46_1047
.LBB46_1047 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 232(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1049
	JUMP	.LBB46_1048
.LBB46_1048 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	LOAD	%GR6, 232(%GR7)
	LOAD	%GR1, 0(%GR7)
	SUB	%GR6, %GR6, %GR1
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR1, 0(%GR1)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 232(%GR7)
	JUMP	.LBB46_1049
.LBB46_1049 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	JUMP	.LBB46_1050
.LBB46_1050 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	JUMP	.LBB46_1051
.LBB46_1051 NOP                         ;   in Loop: Header=BB46_1034 Depth=2
	JUMP	.LBB46_1034
.LBB46_1052 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	ULOADB	%GR6, 276(%GR7)
	LOAD	%GR1, 264(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 264(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB46_1053
.LBB46_1053 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	LOAD	%GR6, 232(%GR7)
	ULOADB	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB46_1054
.LBB46_1054 NOP                         ;   in Loop: Header=BB46_10 Depth=1
	JUMP	.LBB46_10
.LBB46_1055 NOP 
	LOAD	%GR6, 216(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1057
	JUMP	.LBB46_1056
.LBB46_1056 NOP 
	LOAD	%GR2, 216(%GR7)
	LOAD	%GR6, 264(%GR7)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR3, %GR6, -3
	COPYI	%GR1, 13
	CALL	store_op1
	JUMP	.LBB46_1057
.LBB46_1057 NOP 
	ADDI	%GR6, %GR7, 248
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB46_1059
	JUMP	.LBB46_1058
.LBB46_1058 NOP 
	COPYI	%GR6, 8
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1059 NOP 
	LOAD	%GR1, 248(%GR7)
	CALL	free
	LOAD	%GR6, 264(%GR7)
	LOAD	%GR1, 280(%GR7)
	LOAD	%GR2, 0(%GR1)
	SUB	%GR6, %GR6, %GR2
	ADDI	%GR1, %GR1, 8
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 0
	STORE	%GR6, 296(%GR7)
	JUMP	.LBB46_1060
.LBB46_1060 NOP 
	LOAD	%GR6, 296(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 300(%GR7)
	LOAD	%GR4, 304(%GR7)
	LOAD	%GR3, 308(%GR7)
	LOAD	%GR2, 312(%GR7)
	LOAD	%GR1, 316(%GR7)
	ADDI	%GR7, %GR7, 320
	RET
.Lfunc_end46 NOP 
	.size	regex_compile, .Lfunc_end46-regex_compile
                                        ; -- End function
	.globl	regcomp                 ; -- Begin function regcomp
	.type	regcomp,@function
regcomp NOP                             ; @regcomp
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 24(%GR7)
	STORE	%GR2, 20(%GR7)
	STORE	%GR3, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	ANDI	%GR6, %GR6, 1
	COPYI	%GR1, 66246
	COPYI	%GR2, 242396
	CMOV	%GR1, %GR6, %GR2
	STORE	%GR1, 8(%GR7)
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 16
	STORE	%GR1, 0(%GR6)
	ULOADB	%GR6, 16(%GR7)
	ANDI	%GR6, %GR6, 2
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_12
	JUMP	.LBB47_1
.LBB47_1 NOP 
	COPYI	%GR1, 256
	CALL	malloc
	COPYR	%GR6, %RT0
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 20
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_3
	JUMP	.LBB47_2
.LBB47_2 NOP 
	COPYI	%GR6, 12
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB47_19
.LBB47_3 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB47_4
.LBB47_4 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 255
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_11
	JUMP	.LBB47_5
.LBB47_5 NOP                            ;   in Loop: Header=BB47_4 Depth=1
	LOAD	%GR6, 4(%GR7)
	ANDI	%GR6, %GR6, -128
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_8
	JUMP	.LBB47_6
.LBB47_6 NOP                            ;   in Loop: Header=BB47_4 Depth=1
	CALL	__ctype_b_loc
	COPYR	%GR6, %RT0
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	SHLI	%GR1, %GR1, 1
	ADD	%GR6, %GR6, %GR1
	ULOADH	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 256
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_8
	JUMP	.LBB47_7
.LBB47_7 NOP                            ;   in Loop: Header=BB47_4 Depth=1
	LOAD	%GR1, 4(%GR7)
	CALL	tolower
	COPYR	%GR6, %RT0
	JUMP	.LBB47_9
.LBB47_8 NOP                            ;   in Loop: Header=BB47_4 Depth=1
	LOAD	%GR6, 4(%GR7)
	JUMP	.LBB47_9
.LBB47_9 NOP                            ;   in Loop: Header=BB47_4 Depth=1
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 20
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 4(%GR7)
	ADD	%GR1, %GR1, %GR2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB47_10
.LBB47_10 NOP                           ;   in Loop: Header=BB47_4 Depth=1
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB47_4
.LBB47_11 NOP 
	JUMP	.LBB47_13
.LBB47_12 NOP 
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB47_13
.LBB47_13 NOP 
	ULOADB	%GR6, 16(%GR7)
	ANDI	%GR6, %GR6, 4
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_15
	JUMP	.LBB47_14
.LBB47_14 NOP 
	LOAD	%GR6, 8(%GR7)
	ANDI	%GR6, %GR6, -65
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	ORI	%GR6, %GR6, 256
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ORI	%GR1, %GR1, 128
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB47_16
.LBB47_15 NOP 
	LOAD	%GR6, 24(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 127
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB47_16
.LBB47_16 NOP 
	LOAD	%GR6, 16(%GR7)
	ANDI	%GR6, %GR6, 8
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR1, %GR1, 28
	ULOADB	%GR2, 0(%GR1)
	SHLI	%GR6, %GR6, 1
	ANDI	%GR2, %GR2, 239
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR1, 20(%GR7)
	CALL	strlen
	COPYR	%GR2, %RT0
	LOAD	%GR3, 8(%GR7)
	LOAD	%GR4, 24(%GR7)
	CALL	regex_compile
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 16
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB47_18
	JUMP	.LBB47_17
.LBB47_17 NOP 
	COPYI	%GR6, 8
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB47_18
.LBB47_18 NOP 
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 28(%GR7)
	JUMP	.LBB47_19
.LBB47_19 NOP 
	LOAD	%GR6, 28(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end47 NOP 
	.size	regcomp, .Lfunc_end47-regcomp
                                        ; -- End function
	.globl	regexec                 ; -- Begin function regexec
	.type	regexec,@function
regexec NOP                             ; @regexec
; %bb.0:
	SUBI	%GR7, %GR7, 112
	STORE	%GR1, 108(%GR7)
	STORE	%GR2, 104(%GR7)
	STORE	%GR3, 100(%GR7)
	STORE	%GR4, 96(%GR7)
	STORE	%GR5, 92(%GR7)
	STORE	%GR1, 84(%GR7)
	STORE	%GR2, 80(%GR7)
	STORE	%GR3, 76(%GR7)
	STORE	%GR4, 72(%GR7)
	STORE	%GR5, 68(%GR7)
	LOAD	%GR1, 80(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 84(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR6, 0(%GR6)
	SRLI	%GR6, %GR6, 4
	ANDI	%GR1, %GR6, 1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB48_2
	JUMP	.LBB48_1
.LBB48_1 NOP 
	LOAD	%GR6, 76(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB48_2
.LBB48_2 NOP 
	ANDI	%GR6, %GR6, 1
	STOREB	%GR6, 8(%GR7)
	LOAD	%GR1, 84(%GR7)
	ADDI	%GR2, %GR7, 16
	ADDI	%GR6, %GR2, 28
	ADDI	%GR3, %GR1, 28
	LOAD	%GR3, 0(%GR3)
	STORE	%GR3, 0(%GR6)
	ADDI	%GR3, %GR2, 24
	ADDI	%GR4, %GR1, 24
	LOAD	%GR4, 0(%GR4)
	STORE	%GR4, 0(%GR3)
	ADDI	%GR3, %GR2, 20
	ADDI	%GR4, %GR1, 20
	LOAD	%GR4, 0(%GR4)
	STORE	%GR4, 0(%GR3)
	ADDI	%GR3, %GR2, 16
	ADDI	%GR4, %GR1, 16
	LOAD	%GR4, 0(%GR4)
	STORE	%GR4, 0(%GR3)
	ADDI	%GR3, %GR2, 12
	ADDI	%GR4, %GR1, 12
	LOAD	%GR4, 0(%GR4)
	STORE	%GR4, 0(%GR3)
	ADDI	%GR3, %GR2, 8
	ADDI	%GR4, %GR1, 8
	LOAD	%GR4, 0(%GR4)
	STORE	%GR4, 0(%GR3)
	ORI	%GR2, %GR2, 4
	ADDI	%GR3, %GR1, 4
	LOAD	%GR3, 0(%GR3)
	STORE	%GR3, 0(%GR2)
	LOAD	%GR1, 0(%GR1)
	STORE	%GR1, 16(%GR7)
	ULOADB	%GR1, 68(%GR7)
	ANDI	%GR1, %GR1, 1
	ULOADB	%GR2, 0(%GR6)
	SHLI	%GR1, %GR1, 5
	ANDI	%GR2, %GR2, 223
	OR	%GR1, %GR2, %GR1
	STOREB	%GR1, 0(%GR6)
	LOAD	%GR1, 68(%GR7)
	ANDI	%GR1, %GR1, 2
	ULOADB	%GR2, 0(%GR6)
	SHLI	%GR1, %GR1, 5
	ANDI	%GR2, %GR2, 191
	OR	%GR1, %GR2, %GR1
	STOREB	%GR1, 0(%GR6)
	ULOADB	%GR1, 0(%GR6)
	ANDI	%GR1, %GR1, 249
	ORI	%GR1, %GR1, 4
	STOREB	%GR1, 0(%GR6)
	ULOADB	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_7
	JUMP	.LBB48_3
.LBB48_3 NOP 
	LOAD	%GR6, 76(%GR7)
	STORE	%GR6, 48(%GR7)
	LOAD	%GR6, 76(%GR7)
	SHLI	%GR1, %GR6, 2
	CALL	malloc
	COPYR	%GR6, %RT0
	ADDI	%GR2, %GR7, 48
	ORI	%GR3, %GR2, 4
	STORE	%GR6, 0(%GR3)
	LOAD	%GR6, 76(%GR7)
	SHLI	%GR1, %GR6, 2
	CALL	malloc
	COPYR	%GR6, %RT0
	ADDI	%GR1, %GR2, 8
	STORE	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR3)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_5
	JUMP	.LBB48_4
.LBB48_4 NOP 
	ADDI	%GR6, %GR7, 48
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_6
	JUMP	.LBB48_5
.LBB48_5 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB48_19
.LBB48_6 NOP 
	JUMP	.LBB48_7
.LBB48_7 NOP 
	LOAD	%GR2, 80(%GR7)
	LOAD	%GR3, 12(%GR7)
	LOADB	%GR6, 8(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_9
	JUMP	.LBB48_8
.LBB48_8 NOP 
	ADDI	%GR6, %GR7, 48
	JUMP	.LBB48_10
.LBB48_9 NOP 
	COPYI	%GR6, 0
	JUMP	.LBB48_10
.LBB48_10 NOP 
	STORE	%GR6, 0(%GR7)
	ADDI	%GR1, %GR7, 16
	COPYI	%GR4, 0
	COPYR	%GR5, %GR3
	CALL	re_search
	COPYR	%GR6, %RT0
	STORE	%GR6, 64(%GR7)
	ULOADB	%GR6, 8(%GR7)
	EQ	%GR6, %GR6, %GR4
	BNEQZ	%GR6, .LBB48_18
	JUMP	.LBB48_11
.LBB48_11 NOP 
	LOAD	%GR6, 64(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_17
	JUMP	.LBB48_12
.LBB48_12 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB48_13
.LBB48_13 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 76(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB48_16
	JUMP	.LBB48_14
.LBB48_14 NOP                           ;   in Loop: Header=BB48_13 Depth=1
	ADDI	%GR6, %GR7, 48
	ORI	%GR1, %GR6, 4
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR2, 4(%GR7)
	SHLI	%GR3, %GR2, 2
	ADD	%GR1, %GR1, %GR3
	LOAD	%GR1, 0(%GR1)
	LOAD	%GR3, 72(%GR7)
	SHLI	%GR2, %GR2, 3
	ADD	%GR2, %GR3, %GR2
	STORE	%GR1, 0(%GR2)
	ADDI	%GR6, %GR6, 8
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	SHLI	%GR2, %GR1, 2
	ADD	%GR6, %GR6, %GR2
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR2, 72(%GR7)
	SHLI	%GR1, %GR1, 3
	ADD	%GR1, %GR2, %GR1
	ADDI	%GR1, %GR1, 4
	STORE	%GR6, 0(%GR1)
	JUMP	.LBB48_15
.LBB48_15 NOP                           ;   in Loop: Header=BB48_13 Depth=1
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB48_13
.LBB48_16 NOP 
	JUMP	.LBB48_17
.LBB48_17 NOP 
	ADDI	%GR2, %GR7, 48
	ORI	%GR6, %GR2, 4
	LOAD	%GR1, 0(%GR6)
	CALL	free
	ADDI	%GR6, %GR2, 8
	LOAD	%GR1, 0(%GR6)
	CALL	free
	JUMP	.LBB48_18
.LBB48_18 NOP 
	LOAD	%GR6, 64(%GR7)
	SRLI	%GR6, %GR6, 31
	STORE	%GR6, 88(%GR7)
	JUMP	.LBB48_19
.LBB48_19 NOP 
	LOAD	%GR6, 88(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR5, 92(%GR7)
	LOAD	%GR4, 96(%GR7)
	LOAD	%GR3, 100(%GR7)
	LOAD	%GR2, 104(%GR7)
	LOAD	%GR1, 108(%GR7)
	ADDI	%GR7, %GR7, 112
	RET
.Lfunc_end48 NOP 
	.size	regexec, .Lfunc_end48-regexec
                                        ; -- End function
	.globl	regerror                ; -- Begin function regerror
	.type	regerror,@function
regerror NOP                            ; @regerror
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 28(%GR7)
	STORE	%GR3, 24(%GR7)
	STORE	%GR4, 20(%GR7)
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_2
	JUMP	.LBB49_1
.LBB49_1 NOP 
	LOAD	%GR6, 32(%GR7)
	COPYI	%GR1, 17
	ULT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_3
	JUMP	.LBB49_2
.LBB49_2 NOP 
	CALL	abort
.LBB49_3 NOP 
	LOAD	%GR6, 32(%GR7)
	SHLI	%GR6, %GR6, 2
	COPYI	%GR1, re_error_msg
	ADD	%GR6, %GR6, %GR1
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_5
	JUMP	.LBB49_4
.LBB49_4 NOP 
	COPYI	%GR6, .L.str.50
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB49_5
.LBB49_5 NOP 
	LOAD	%GR1, 16(%GR7)
	CALL	strlen
	COPYR	%GR6, %RT0
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 20(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_10
	JUMP	.LBB49_6
.LBB49_6 NOP 
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 20(%GR7)
	ULTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB49_8
	JUMP	.LBB49_7
.LBB49_7 NOP 
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR3, %GR6, -1
	CALL	strncpy
                                        ; kill: def $gr6 killed $rt0
	LOAD	%GR6, 24(%GR7)
	LOAD	%GR1, 20(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -1
	COPYI	%GR1, 0
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB49_9
.LBB49_8 NOP 
	LOAD	%GR1, 24(%GR7)
	LOAD	%GR2, 16(%GR7)
	CALL	strcpy
                                        ; kill: def $gr6 killed $rt0
	JUMP	.LBB49_9
.LBB49_9 NOP 
	JUMP	.LBB49_10
.LBB49_10 NOP 
	LOAD	%GR6, 12(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end49 NOP 
	.size	regerror, .Lfunc_end49-regerror
                                        ; -- End function
	.globl	regfree                 ; -- Begin function regfree
	.type	regfree,@function
regfree NOP                             ; @regfree
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR1, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB50_2
	JUMP	.LBB50_1
.LBB50_1 NOP 
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 0(%GR6)
	CALL	free
	JUMP	.LBB50_2
.LBB50_2 NOP 
	LOAD	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 8
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB50_4
	JUMP	.LBB50_3
.LBB50_3 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 16
	LOAD	%GR1, 0(%GR6)
	CALL	free
	JUMP	.LBB50_4
.LBB50_4 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 28
	ULOADB	%GR2, 0(%GR6)
	ANDI	%GR2, %GR2, 247
	STOREB	%GR2, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR6, 0(%GR6)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB50_6
	JUMP	.LBB50_5
.LBB50_5 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 20
	LOAD	%GR1, 0(%GR6)
	CALL	free
	JUMP	.LBB50_6
.LBB50_6 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 20
	COPYI	%GR1, 0
	STORE	%GR1, 0(%GR6)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end50 NOP 
	.size	regfree, .Lfunc_end50-regfree
                                        ; -- End function
	.type	group_match_null_string_p,@function ; -- Begin function group_match_null_string_p
group_match_null_string_p NOP           ; @group_match_null_string_p
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_1
.LBB51_1 NOP                            ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB51_10 Depth 2
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 24(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_34
	JUMP	.LBB51_2
.LBB51_2 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 6
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB51_29
	JUMP	.LBB51_3
.LBB51_3 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	COPYI	%GR1, 14
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_30
	JUMP	.LBB51_4
.LBB51_4 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_5
.LBB51_5 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_6
.LBB51_6 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB51_7
.LBB51_7 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_8
.LBB51_8 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_28
	JUMP	.LBB51_9
.LBB51_9 NOP                            ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_10
.LBB51_10 NOP                           ;   Parent Loop BB51_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 13
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_22
	JUMP	.LBB51_11
.LBB51_11 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR2, %GR6, -3
	LOAD	%GR3, 20(%GR7)
	CALL	alt_match_null_string_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_13
	JUMP	.LBB51_12
.LBB51_12 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB51_35
.LBB51_13 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 14
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_15
	JUMP	.LBB51_14
.LBB51_14 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_23
.LBB51_15 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_16
.LBB51_16 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	JUMP	.LBB51_17
.LBB51_17 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB51_18
.LBB51_18 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_19
.LBB51_19 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	ADDI	%GR6, %GR6, -3
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 13
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_21
	JUMP	.LBB51_20
.LBB51_20 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -3
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_23
.LBB51_21 NOP                           ;   in Loop: Header=BB51_10 Depth=2
	JUMP	.LBB51_10
.LBB51_22 NOP                           ; %.loopexit
                                        ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_23
.LBB51_23 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_24
.LBB51_24 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -2
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB51_25
.LBB51_25 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR1, 12(%GR7)
	LOAD	%GR6, 16(%GR7)
	ADD	%GR2, %GR1, %GR6
	LOAD	%GR3, 20(%GR7)
	CALL	alt_match_null_string_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_27
	JUMP	.LBB51_26
.LBB51_26 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB51_35
.LBB51_27 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB51_28
.LBB51_28 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_33
.LBB51_29 NOP 
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 2
	LOAD	%GR1, 28(%GR7)
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB51_35
.LBB51_30 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	ADDI	%GR1, %GR7, 12
	CALL	common_op_match_null_string_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB51_32
	JUMP	.LBB51_31
.LBB51_31 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB51_35
.LBB51_32 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_33
.LBB51_33 NOP                           ;   in Loop: Header=BB51_1 Depth=1
	JUMP	.LBB51_1
.LBB51_34 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB51_35
.LBB51_35 NOP 
	LOADB	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end51 NOP 
	.size	group_match_null_string_p, .Lfunc_end51-group_match_null_string_p
                                        ; -- End function
	.type	alt_match_null_string_p,@function ; -- Begin function alt_match_null_string_p
alt_match_null_string_p NOP             ; @alt_match_null_string_p
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	LOAD	%GR6, 28(%GR7)
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB52_1
.LBB52_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 24(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB52_12
	JUMP	.LBB52_2
.LBB52_2 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 14
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB52_8
	JUMP	.LBB52_3
.LBB52_3 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB52_4
.LBB52_4 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	JUMP	.LBB52_5
.LBB52_5 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB52_6
.LBB52_6 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB52_7
.LBB52_7 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB52_11
.LBB52_8 NOP                            ;   in Loop: Header=BB52_1 Depth=1
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	ADDI	%GR1, %GR7, 12
	CALL	common_op_match_null_string_p
	COPYR	%GR6, %RT0
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB52_10
	JUMP	.LBB52_9
.LBB52_9 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB52_13
.LBB52_10 NOP                           ;   in Loop: Header=BB52_1 Depth=1
	JUMP	.LBB52_11
.LBB52_11 NOP                           ;   in Loop: Header=BB52_1 Depth=1
	JUMP	.LBB52_1
.LBB52_12 NOP 
	COPYI	%GR6, 1
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB52_13
.LBB52_13 NOP 
	LOADB	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end52 NOP 
	.size	alt_match_null_string_p, .Lfunc_end52-alt_match_null_string_p
                                        ; -- End function
	.type	common_op_match_null_string_p,@function ; -- Begin function common_op_match_null_string_p
common_op_match_null_string_p NOP       ; @common_op_match_null_string_p
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	LOAD	%GR6, 28(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR1, %GR6, 1
	STORE	%GR1, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_8
	JUMP	.LBB53_1
.LBB53_1 NOP 
	COPYI	%GR1, 5
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_9
	JUMP	.LBB53_2
.LBB53_2 NOP 
	COPYI	%GR1, 7
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_34
	JUMP	.LBB53_3
.LBB53_3 NOP 
	ADDI	%GR1, %GR6, -8
	COPYI	%GR2, 4
	ULT	%GR1, %GR1, %GR2
	BNEQZ	%GR1, .LBB53_8
	JUMP	.LBB53_4
.LBB53_4 NOP 
	COPYI	%GR1, 12
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_14
	JUMP	.LBB53_5
.LBB53_5 NOP 
	COPYI	%GR1, 20
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_22
	JUMP	.LBB53_6
.LBB53_6 NOP 
	COPYI	%GR1, 22
	EQ	%GR1, %GR6, %GR1
	BNEQZ	%GR1, .LBB53_37
	JUMP	.LBB53_7
.LBB53_7 NOP 
	ADDI	%GR6, %GR6, -25
	COPYI	%GR1, 3
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_38
	JUMP	.LBB53_8
.LBB53_8 NOP 
	JUMP	.LBB53_39
.LBB53_9 NOP 
	LOAD	%GR6, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	ADDI	%GR1, %GR7, 4
	CALL	group_match_null_string_p
	COPYR	%GR6, %RT0
	STOREB	%GR6, 12(%GR7)
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 8(%GR7)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 3
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_11
	JUMP	.LBB53_10
.LBB53_10 NOP 
	ULOADB	%GR6, 12(%GR7)
	LOAD	%GR1, 20(%GR7)
	LOAD	%GR2, 8(%GR7)
	SHLI	%GR2, %GR2, 2
	ADD	%GR1, %GR1, %GR2
	ULOADB	%GR2, 0(%GR1)
	ANDI	%GR6, %GR6, 3
	ANDI	%GR2, %GR2, 252
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB53_11
.LBB53_11 NOP 
	ULOADB	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_13
	JUMP	.LBB53_12
.LBB53_12 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_13 NOP 
	JUMP	.LBB53_39
.LBB53_14 NOP 
	JUMP	.LBB53_15
.LBB53_15 NOP 
	JUMP	.LBB53_16
.LBB53_16 NOP 
	LOAD	%GR6, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB53_17
.LBB53_17 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_18
.LBB53_18 NOP 
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_20
	JUMP	.LBB53_19
.LBB53_19 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 4(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_21
.LBB53_20 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_21 NOP 
	JUMP	.LBB53_39
.LBB53_22 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_23
.LBB53_23 NOP 
	JUMP	.LBB53_24
.LBB53_24 NOP 
	LOAD	%GR6, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB53_25
.LBB53_25 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_26
.LBB53_26 NOP 
	LOAD	%GR6, 16(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_32
	JUMP	.LBB53_27
.LBB53_27 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, -4
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_28
.LBB53_28 NOP 
	JUMP	.LBB53_29
.LBB53_29 NOP 
	LOAD	%GR6, 4(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 1
	LOADB	%GR6, 0(%GR6)
	SHLI	%GR6, %GR6, 8
	LOAD	%GR1, 16(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 16(%GR7)
	JUMP	.LBB53_30
.LBB53_30 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 2
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_31
.LBB53_31 NOP 
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 4(%GR7)
	ADD	%GR6, %GR1, %GR6
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_33
.LBB53_32 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_33 NOP 
	JUMP	.LBB53_39
.LBB53_34 NOP 
	LOAD	%GR6, 20(%GR7)
	LOAD	%GR1, 4(%GR7)
	ULOADB	%GR1, 0(%GR1)
	SHLI	%GR1, %GR1, 2
	ADD	%GR6, %GR6, %GR1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 3
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB53_36
	JUMP	.LBB53_35
.LBB53_35 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_36 NOP 
	JUMP	.LBB53_39
.LBB53_37 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, 4
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB53_38
.LBB53_38 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_39 NOP 
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 28(%GR7)
	STORE	%GR6, 0(%GR1)
	COPYI	%GR6, 1
	STOREB	%GR6, 32(%GR7)
	JUMP	.LBB53_40
.LBB53_40 NOP 
	LOADB	%GR6, 32(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end53 NOP 
	.size	common_op_match_null_string_p, .Lfunc_end53-common_op_match_null_string_p
                                        ; -- End function
	.type	bcmp_translate,@function ; -- Begin function bcmp_translate
bcmp_translate NOP                      ; @bcmp_translate
; %bb.0:
	SUBI	%GR7, %GR7, 40
	STORE	%GR1, 36(%GR7)
	STORE	%GR2, 32(%GR7)
	STORE	%GR3, 28(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 12(%GR7)
	STORE	%GR4, 8(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 16(%GR7)
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB54_1
.LBB54_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_5
	JUMP	.LBB54_2
.LBB54_2 NOP                            ;   in Loop: Header=BB54_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 4(%GR7)
	ADDI	%GR2, %GR1, 1
	STORE	%GR2, 4(%GR7)
	ULOADB	%GR1, 0(%GR1)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 8(%GR7)
	LOAD	%GR2, 0(%GR7)
	ADDI	%GR3, %GR2, 1
	STORE	%GR3, 0(%GR7)
	ULOADB	%GR2, 0(%GR2)
	ADD	%GR1, %GR1, %GR2
	LOADB	%GR1, 0(%GR1)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB54_4
	JUMP	.LBB54_3
.LBB54_3 NOP 
	COPYI	%GR6, 1
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB54_6
.LBB54_4 NOP                            ;   in Loop: Header=BB54_1 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB54_1
.LBB54_5 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 24(%GR7)
	JUMP	.LBB54_6
.LBB54_6 NOP 
	LOAD	%GR6, 24(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 28(%GR7)
	LOAD	%GR2, 32(%GR7)
	LOAD	%GR1, 36(%GR7)
	ADDI	%GR7, %GR7, 40
	RET
.Lfunc_end54 NOP 
	.size	bcmp_translate, .Lfunc_end54-bcmp_translate
                                        ; -- End function
	.type	init_syntax_once,@function ; -- Begin function init_syntax_once
init_syntax_once NOP                    ; @init_syntax_once
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	COPYI	%GR6, init_syntax_once.done
	LOAD	%GR6, 0(%GR6)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_2
	JUMP	.LBB55_1
.LBB55_1 NOP 
	JUMP	.LBB55_15
.LBB55_2 NOP 
	COPYI	%GR1, re_syntax_table
	COPYI	%GR2, 0
	COPYI	%GR3, 256
	CALL	memset
                                        ; kill: def $gr6 killed $rt0
	COPYI	%GR6, 97
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_3
.LBB55_3 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 122
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_6
	JUMP	.LBB55_4
.LBB55_4 NOP                            ;   in Loop: Header=BB55_3 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB55_5
.LBB55_5 NOP                            ;   in Loop: Header=BB55_3 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_3
.LBB55_6 NOP 
	COPYI	%GR6, 65
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_7
.LBB55_7 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 90
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_10
	JUMP	.LBB55_8
.LBB55_8 NOP                            ;   in Loop: Header=BB55_7 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB55_9
.LBB55_9 NOP                            ;   in Loop: Header=BB55_7 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_7
.LBB55_10 NOP 
	COPYI	%GR6, 48
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_11
.LBB55_11 NOP                           ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 57
	GT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB55_14
	JUMP	.LBB55_12
.LBB55_12 NOP                           ;   in Loop: Header=BB55_11 Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, re_syntax_table
	ADD	%GR6, %GR6, %GR1
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	JUMP	.LBB55_13
.LBB55_13 NOP                           ;   in Loop: Header=BB55_11 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB55_11
.LBB55_14 NOP 
	COPYI	%GR6, re_syntax_table
	COPYI	%GR1, 1
	STOREB	%GR1, 0(%GR6)
	COPYI	%GR6, init_syntax_once.done
	STORE	%GR1, 0(%GR6)
	JUMP	.LBB55_15
.LBB55_15 NOP 
	LOAD	%GR3, 4(%GR7)
	LOAD	%GR2, 8(%GR7)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end55 NOP 
	.size	init_syntax_once, .Lfunc_end55-init_syntax_once
                                        ; -- End function
	.type	at_begline_loc_p,@function ; -- Begin function at_begline_loc_p
at_begline_loc_p NOP                    ; @at_begline_loc_p
; %bb.0:
	SUBI	%GR7, %GR7, 24
	STORE	%GR1, 20(%GR7)
	STORE	%GR1, 16(%GR7)
	STORE	%GR2, 12(%GR7)
	STORE	%GR3, 8(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, -2
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 16(%GR7)
	ULTE	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB56_2
	JUMP	.LBB56_1
.LBB56_1 NOP 
	LOAD	%GR6, 4(%GR7)
	ADDI	%GR6, %GR6, -1
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB56_2
.LBB56_2 NOP 
	ANDI	%GR6, %GR6, 1
	STOREB	%GR6, 0(%GR7)
	LOAD	%GR6, 4(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 40
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB56_5
	JUMP	.LBB56_3
.LBB56_3 NOP 
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB56_10
	JUMP	.LBB56_4
.LBB56_4 NOP 
	LOADB	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB56_10
	JUMP	.LBB56_5
.LBB56_5 NOP 
	LOAD	%GR6, 4(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 124
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 0
	BNEQZ	%GR1, .LBB56_9
	JUMP	.LBB56_6
.LBB56_6 NOP 
	ADDI	%GR6, %GR7, 8
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	NEQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB56_8
	JUMP	.LBB56_7
.LBB56_7 NOP 
	LOADB	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB56_8
.LBB56_8 NOP 
	JUMP	.LBB56_9
.LBB56_9 NOP 
	JUMP	.LBB56_10
.LBB56_10 NOP 
	ANDI	%GR6, %GR6, 1
	COPYR	%RT0, %GR6
	LOAD	%GR1, 20(%GR7)
	ADDI	%GR7, %GR7, 24
	RET
.Lfunc_end56 NOP 
	.size	at_begline_loc_p, .Lfunc_end56-at_begline_loc_p
                                        ; -- End function
	.type	at_endline_loc_p,@function ; -- Begin function at_endline_loc_p
at_endline_loc_p NOP                    ; @at_endline_loc_p
; %bb.0:
	SUBI	%GR7, %GR7, 28
	STORE	%GR1, 24(%GR7)
	STORE	%GR1, 20(%GR7)
	STORE	%GR2, 16(%GR7)
	STORE	%GR3, 12(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 92
	EQ	%GR6, %GR6, %GR1
	STOREB	%GR6, 4(%GR7)
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR6, %GR6, 1
	LOAD	%GR1, 16(%GR7)
	UGTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_2
	JUMP	.LBB57_1
.LBB57_1 NOP 
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR6, %GR6, 1
	JUMP	.LBB57_3
.LBB57_2 NOP 
	COPYI	%GR6, 0
	JUMP	.LBB57_3
.LBB57_3 NOP 
	STORE	%GR6, 0(%GR7)
	ADDI	%GR6, %GR7, 12
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 32
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_5
	JUMP	.LBB57_4
.LBB57_4 NOP 
	LOAD	%GR6, 8(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 41
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB57_15
	JUMP	.LBB57_8
.LBB57_5 NOP 
	LOADB	%GR6, 4(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_8
	JUMP	.LBB57_6
.LBB57_6 NOP 
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_8
	JUMP	.LBB57_7
.LBB57_7 NOP 
	LOAD	%GR6, 0(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 41
	EQ	%GR1, %GR6, %GR1
	COPYI	%GR6, 1
	BNEQZ	%GR1, .LBB57_15
	JUMP	.LBB57_8
.LBB57_8 NOP 
	ADDI	%GR6, %GR7, 12
	ORI	%GR6, %GR6, 1
	ULOADB	%GR6, 0(%GR6)
	ANDI	%GR6, %GR6, 128
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB57_10
	JUMP	.LBB57_9
.LBB57_9 NOP 
	LOAD	%GR6, 8(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 124
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB57_14
.LBB57_10 NOP 
	LOADB	%GR1, 4(%GR7)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB57_13
	JUMP	.LBB57_11
.LBB57_11 NOP 
	LOAD	%GR1, 0(%GR7)
	COPYI	%GR6, 0
	EQ	%GR1, %GR1, %GR6
	BNEQZ	%GR1, .LBB57_13
	JUMP	.LBB57_12
.LBB57_12 NOP 
	LOAD	%GR6, 0(%GR7)
	LOADB	%GR6, 0(%GR6)
	COPYI	%GR1, 124
	EQ	%GR6, %GR6, %GR1
	JUMP	.LBB57_13
.LBB57_13 NOP 
	ANDI	%GR6, %GR6, 1
	JUMP	.LBB57_14
.LBB57_14 NOP 
	COPYI	%GR1, 0
	NEQ	%GR6, %GR6, %GR1
	JUMP	.LBB57_15
.LBB57_15 NOP 
	ANDI	%GR6, %GR6, 1
	COPYR	%RT0, %GR6
	LOAD	%GR1, 24(%GR7)
	ADDI	%GR7, %GR7, 28
	RET
.Lfunc_end57 NOP 
	.size	at_endline_loc_p, .Lfunc_end57-at_endline_loc_p
                                        ; -- End function
	.type	store_op1,@function     ; -- Begin function store_op1
store_op1 NOP                           ; @store_op1
; %bb.0:
	SUBI	%GR7, %GR7, 16
	STORE	%GR1, 12(%GR7)
	STORE	%GR1, 8(%GR7)
	STORE	%GR2, 4(%GR7)
	STORE	%GR3, 0(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 4(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB58_1
.LBB58_1 NOP 
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 4(%GR7)
	ADDI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 4(%GR7)
	ADDI	%GR1, %GR1, 2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB58_2
.LBB58_2 NOP 
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR7, %GR7, 16
	RET
.Lfunc_end58 NOP 
	.size	store_op1, .Lfunc_end58-store_op1
                                        ; -- End function
	.type	insert_op1,@function    ; -- Begin function insert_op1
insert_op1 NOP                          ; @insert_op1
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 28(%GR7)
	STORE	%GR3, 24(%GR7)
	STORE	%GR4, 20(%GR7)
	LOAD	%GR6, 20(%GR7)
	STORE	%GR6, 16(%GR7)
	LOAD	%GR6, 20(%GR7)
	ADDI	%GR6, %GR6, 3
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB59_1
.LBB59_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 16(%GR7)
	LOAD	%GR1, 28(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB59_3
	JUMP	.LBB59_2
.LBB59_2 NOP                            ;   in Loop: Header=BB59_1 Depth=1
	LOAD	%GR6, 16(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 16(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 12(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 12(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB59_1
.LBB59_3 NOP 
	LOAD	%GR1, 32(%GR7)
	LOAD	%GR2, 28(%GR7)
	LOAD	%GR3, 24(%GR7)
	CALL	store_op1
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end59 NOP 
	.size	insert_op1, .Lfunc_end59-insert_op1
                                        ; -- End function
	.type	compile_range,@function ; -- Begin function compile_range
compile_range NOP                       ; @compile_range
; %bb.0:
	SUBI	%GR7, %GR7, 52
	STORE	%GR1, 48(%GR7)
	STORE	%GR2, 44(%GR7)
	STORE	%GR3, 40(%GR7)
	STORE	%GR1, 32(%GR7)
	STORE	%GR2, 28(%GR7)
	STORE	%GR3, 24(%GR7)
	STORE	%GR4, 20(%GR7)
	STORE	%GR5, 16(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR6, 0(%GR6)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 28(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_2
	JUMP	.LBB60_1
.LBB60_1 NOP 
	COPYI	%GR6, 11
	STORE	%GR6, 36(%GR7)
	JUMP	.LBB60_15
.LBB60_2 NOP 
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, -2
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 4(%GR7)
	LOAD	%GR6, 8(%GR7)
	ULOADB	%GR6, 0(%GR6)
	STORE	%GR6, 0(%GR7)
	LOAD	%GR6, 32(%GR7)
	LOAD	%GR1, 0(%GR6)
	ADDI	%GR1, %GR1, 1
	STORE	%GR1, 0(%GR6)
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 0(%GR7)
	LTE	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_4
	JUMP	.LBB60_3
.LBB60_3 NOP 
	LOAD	%GR6, 20(%GR7)
	ANDI	%GR6, %GR6, 65536
	SRLI	%GR6, %GR6, 16
	COPYI	%GR1, 0
	COPYI	%GR2, 11
	CMOV	%GR1, %GR6, %GR2
	STORE	%GR1, 36(%GR7)
	JUMP	.LBB60_15
.LBB60_4 NOP 
	LOAD	%GR6, 4(%GR7)
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB60_5
.LBB60_5 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 0(%GR7)
	UGT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_14
	JUMP	.LBB60_6
.LBB60_6 NOP                            ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	COPYI	%GR1, 0
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB60_8
	JUMP	.LBB60_7
.LBB60_7 NOP                            ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR6, 24(%GR7)
	ULOADB	%GR1, 12(%GR7)
	ADD	%GR6, %GR6, %GR1
	LOADB	%GR6, 0(%GR6)
	JUMP	.LBB60_9
.LBB60_8 NOP                            ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR6, 12(%GR7)
	JUMP	.LBB60_9
.LBB60_9 NOP                            ;   in Loop: Header=BB60_5 Depth=1
	ANDI	%GR6, %GR6, 7
	COPYI	%GR1, 1
	SHL	%GR6, %GR1, %GR6
	LOAD	%GR1, 16(%GR7)
	LOAD	%GR2, 24(%GR7)
	COPYI	%GR3, 0
	EQ	%GR2, %GR2, %GR3
	BNEQZ	%GR2, .LBB60_11
	JUMP	.LBB60_10
.LBB60_10 NOP                           ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR2, 24(%GR7)
	ULOADB	%GR3, 12(%GR7)
	ADD	%GR2, %GR2, %GR3
	LOADB	%GR2, 0(%GR2)
	JUMP	.LBB60_12
.LBB60_11 NOP                           ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR2, 12(%GR7)
	JUMP	.LBB60_12
.LBB60_12 NOP                           ;   in Loop: Header=BB60_5 Depth=1
	ANDI	%GR2, %GR2, 248
	SRLI	%GR2, %GR2, 3
	ADD	%GR1, %GR1, %GR2
	ULOADB	%GR2, 0(%GR1)
	OR	%GR6, %GR2, %GR6
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB60_13
.LBB60_13 NOP                           ;   in Loop: Header=BB60_5 Depth=1
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 1
	STORE	%GR6, 12(%GR7)
	JUMP	.LBB60_5
.LBB60_14 NOP 
	COPYI	%GR6, 0
	STORE	%GR6, 36(%GR7)
	JUMP	.LBB60_15
.LBB60_15 NOP 
	LOAD	%GR6, 36(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR3, 40(%GR7)
	LOAD	%GR2, 44(%GR7)
	LOAD	%GR1, 48(%GR7)
	ADDI	%GR7, %GR7, 52
	RET
.Lfunc_end60 NOP 
	.size	compile_range, .Lfunc_end60-compile_range
                                        ; -- End function
	.type	insert_op2,@function    ; -- Begin function insert_op2
insert_op2 NOP                          ; @insert_op2
; %bb.0:
	SUBI	%GR7, %GR7, 48
	STORE	%GR1, 44(%GR7)
	STORE	%GR2, 40(%GR7)
	STORE	%GR3, 36(%GR7)
	STORE	%GR4, 32(%GR7)
	STORE	%GR1, 28(%GR7)
	STORE	%GR2, 24(%GR7)
	STORE	%GR3, 20(%GR7)
	STORE	%GR4, 16(%GR7)
	STORE	%GR5, 12(%GR7)
	LOAD	%GR6, 12(%GR7)
	STORE	%GR6, 8(%GR7)
	LOAD	%GR6, 12(%GR7)
	ADDI	%GR6, %GR6, 5
	STORE	%GR6, 4(%GR7)
	JUMP	.LBB61_1
.LBB61_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 24(%GR7)
	EQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB61_3
	JUMP	.LBB61_2
.LBB61_2 NOP                            ;   in Loop: Header=BB61_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 8(%GR7)
	ULOADB	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	ADDI	%GR1, %GR1, -1
	STORE	%GR1, 4(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB61_1
.LBB61_3 NOP 
	LOAD	%GR1, 28(%GR7)
	LOAD	%GR2, 24(%GR7)
	LOAD	%GR3, 20(%GR7)
	LOAD	%GR4, 16(%GR7)
	CALL	store_op2
	LOAD	%GR4, 32(%GR7)
	LOAD	%GR3, 36(%GR7)
	LOAD	%GR2, 40(%GR7)
	LOAD	%GR1, 44(%GR7)
	ADDI	%GR7, %GR7, 48
	RET
.Lfunc_end61 NOP 
	.size	insert_op2, .Lfunc_end61-insert_op2
                                        ; -- End function
	.type	store_op2,@function     ; -- Begin function store_op2
store_op2 NOP                           ; @store_op2
; %bb.0:
	SUBI	%GR7, %GR7, 20
	STORE	%GR1, 16(%GR7)
	STORE	%GR1, 12(%GR7)
	STORE	%GR2, 8(%GR7)
	STORE	%GR3, 4(%GR7)
	STORE	%GR4, 0(%GR7)
	LOAD	%GR6, 12(%GR7)
	LOAD	%GR1, 8(%GR7)
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_1
.LBB62_1 NOP 
	LOAD	%GR6, 4(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 1
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 4(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 2
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_2
.LBB62_2 NOP 
	JUMP	.LBB62_3
.LBB62_3 NOP 
	LOAD	%GR6, 0(%GR7)
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 3
	STOREB	%GR6, 0(%GR1)
	LOAD	%GR6, 0(%GR7)
	SRLI	%GR6, %GR6, 8
	LOAD	%GR1, 8(%GR7)
	ADDI	%GR1, %GR1, 4
	STOREB	%GR6, 0(%GR1)
	JUMP	.LBB62_4
.LBB62_4 NOP 
	LOAD	%GR1, 16(%GR7)
	ADDI	%GR7, %GR7, 20
	RET
.Lfunc_end62 NOP 
	.size	store_op2, .Lfunc_end62-store_op2
                                        ; -- End function
	.type	group_in_compile_stack,@function ; -- Begin function group_in_compile_stack
group_in_compile_stack NOP              ; @group_in_compile_stack
; %bb.0:
	SUBI	%GR7, %GR7, 32
	STORE	%GR1, 28(%GR7)
	STORE	%GR1, 8(%GR7)
	ADDI	%GR6, %GR7, 8
	ORI	%GR1, %GR6, 4
	STORE	%GR2, 0(%GR1)
	ADDI	%GR6, %GR6, 8
	STORE	%GR3, 0(%GR6)
	STORE	%GR4, 4(%GR7)
	LOAD	%GR6, 0(%GR6)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB63_1
.LBB63_1 NOP                            ; =>This Inner Loop Header: Depth=1
	LOAD	%GR6, 0(%GR7)
	COPYI	%GR1, 0
	LT	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB63_6
	JUMP	.LBB63_2
.LBB63_2 NOP                            ;   in Loop: Header=BB63_1 Depth=1
	LOAD	%GR6, 8(%GR7)
	LOAD	%GR1, 0(%GR7)
	MULI	%GR1, %GR1, 20
	ADD	%GR6, %GR6, %GR1
	ADDI	%GR6, %GR6, 16
	LOAD	%GR6, 0(%GR6)
	LOAD	%GR1, 4(%GR7)
	NEQ	%GR6, %GR6, %GR1
	BNEQZ	%GR6, .LBB63_4
	JUMP	.LBB63_3
.LBB63_3 NOP 
	COPYI	%GR6, 1
	STOREB	%GR6, 24(%GR7)
	JUMP	.LBB63_7
.LBB63_4 NOP                            ;   in Loop: Header=BB63_1 Depth=1
	JUMP	.LBB63_5
.LBB63_5 NOP                            ;   in Loop: Header=BB63_1 Depth=1
	LOAD	%GR6, 0(%GR7)
	ADDI	%GR6, %GR6, -1
	STORE	%GR6, 0(%GR7)
	JUMP	.LBB63_1
.LBB63_6 NOP 
	COPYI	%GR6, 0
	STOREB	%GR6, 24(%GR7)
	JUMP	.LBB63_7
.LBB63_7 NOP 
	LOADB	%GR6, 24(%GR7)
	COPYR	%RT0, %GR6
	LOAD	%GR1, 28(%GR7)
	ADDI	%GR7, %GR7, 32
	RET
.Lfunc_end63 NOP 
	.size	group_in_compile_stack, .Lfunc_end63-group_in_compile_stack
                                        ; -- End function
	.type	.L.str,@object          ; @.str
	.rodata.str1.1
.L.str NOP 
	.asciz	"GNU sed version 1.17"
	.size	.L.str, 21

	.type	version_string,@object  ; @version_string
	.data
	.globl	version_string
	.p2align	2
version_string NOP 
	.long	.L.str
	.size	version_string, 4

	.type	no_default_output,@object ; @no_default_output
	.bss
	.globl	no_default_output
	.p2align	2
no_default_output NOP 
	.long	0                       ; 0x0
	.size	no_default_output, 4

	.type	input_line_number,@object ; @input_line_number
	.globl	input_line_number
	.p2align	2
input_line_number NOP 
	.long	0                       ; 0x0
	.size	input_line_number, 4

	.type	last_input_file,@object ; @last_input_file
	.globl	last_input_file
	.p2align	2
last_input_file NOP 
	.long	0                       ; 0x0
	.size	last_input_file, 4

	.type	input_EOF,@object       ; @input_EOF
	.globl	input_EOF
	.p2align	2
input_EOF NOP 
	.long	0                       ; 0x0
	.size	input_EOF, 4

	.type	quit_cmd,@object        ; @quit_cmd
	.globl	quit_cmd
	.p2align	2
quit_cmd NOP 
	.long	0                       ; 0x0
	.size	quit_cmd, 4

	.type	replaced,@object        ; @replaced
	.globl	replaced
	.p2align	2
replaced NOP 
	.long	0                       ; 0x0
	.size	replaced, 4

	.type	program_depth,@object   ; @program_depth
	.globl	program_depth
	.p2align	2
program_depth NOP 
	.long	0                       ; 0x0
	.size	program_depth, 4

	.type	the_program,@object     ; @the_program
	.globl	the_program
	.p2align	2
the_program NOP 
	.long	0
	.size	the_program, 4

	.type	jumps,@object           ; @jumps
	.globl	jumps
	.p2align	2
jumps NOP 
	.long	0
	.size	jumps, 4

	.type	labels,@object          ; @labels
	.globl	labels
	.p2align	2
labels NOP 
	.long	0
	.size	labels, 4

	.type	prog_line,@object       ; @prog_line
	.data
	.globl	prog_line
	.p2align	2
prog_line NOP 
	.long	1                       ; 0x1
	.size	prog_line, 4

	.type	bad_input,@object       ; @bad_input
	.bss
	.globl	bad_input
	.p2align	2
bad_input NOP 
	.long	0                       ; 0x0
	.size	bad_input, 4

	.type	.L.str.1,@object        ; @.str.1
	.rodata.str1.1
.L.str.1 NOP 
	.asciz	"Executable"
	.size	.L.str.1, 11

	.type	myname,@object          ; @myname
	.comm	myname,4,4
	.type	.L.str.2,@object        ; @.str.2
.L.str.2 NOP 
	.asciz	"hne:f:V"
	.size	.L.str.2, 8

	.type	longopts,@object        ; @longopts
	.data
	.p2align	2
longopts NOP 
	.long	.L.str.51
	.long	1                       ; 0x1
	.long	0
	.long	101                     ; 0x65
	.long	.L.str.52
	.long	1                       ; 0x1
	.long	0
	.long	102                     ; 0x66
	.long	.L.str.53
	.long	0                       ; 0x0
	.long	0
	.long	110                     ; 0x6e
	.long	.L.str.54
	.long	0                       ; 0x0
	.long	0
	.long	110                     ; 0x6e
	.long	.L.str.55
	.long	0                       ; 0x0
	.long	0
	.long	86                      ; 0x56
	.long	.L.str.56
	.long	0                       ; 0x0
	.long	0
	.long	104                     ; 0x68
	.zero	16
	.size	longopts, 112

	.type	.L.str.3,@object        ; @.str.3
	.rodata.str1.1
.L.str.3 NOP 
	.asciz	"\n"
	.size	.L.str.3, 2

	.type	.L.str.4,@object        ; @.str.4
.L.str.4 NOP 
	.asciz	"%s\n"
	.size	.L.str.4, 4

	.type	.L.str.5,@object        ; @.str.5
.L.str.5 NOP 
	.asciz	"Can't find label for jump to '%s'"
	.size	.L.str.5, 34

	.type	line,@object            ; @line
	.comm	line,12,4
	.type	append,@object          ; @append
	.comm	append,12,4
	.type	hold,@object            ; @hold
	.comm	hold,12,4
	.type	.L.str.6,@object        ; @.str.6
.L.str.6 NOP 
	.asciz	"-"
	.size	.L.str.6, 2

	.type	file_ptrs,@object       ; @file_ptrs
	.comm	file_ptrs,384,4
	.type	prog_file,@object       ; @prog_file
	.comm	prog_file,4,4
	.type	prog_cur,@object        ; @prog_cur
	.comm	prog_cur,4,4
	.type	prog_start,@object      ; @prog_start
	.comm	prog_start,4,4
	.type	prog_end,@object        ; @prog_end
	.comm	prog_end,4,4
	.type	prog_name,@object       ; @prog_name
	.comm	prog_name,4,4
	.type	.L.str.7,@object        ; @.str.7
.L.str.7 NOP 
	.asciz	"r"
	.size	.L.str.7, 2

	.type	.L.str.8,@object        ; @.str.8
.L.str.8 NOP 
	.asciz	"Unexpected ','"
	.size	.L.str.8, 15

	.type	NO_COMMAND,@object      ; @NO_COMMAND
	.data
NO_COMMAND NOP 
	.asciz	"Missing command"
	.size	NO_COMMAND, 16

	.type	NO_ADDR,@object         ; @NO_ADDR
NO_ADDR NOP 
	.asciz	"Command doesn't take any addresses"
	.size	NO_ADDR, 35

	.type	.L.str.9,@object        ; @.str.9
	.rodata.str1.1
.L.str.9 NOP 
	.asciz	"Multiple '!'s"
	.size	.L.str.9, 14

	.type	ONE_ADDR,@object        ; @ONE_ADDR
	.data
ONE_ADDR NOP 
	.asciz	"Command only uses one address"
	.size	ONE_ADDR, 30

	.type	LINE_JUNK,@object       ; @LINE_JUNK
LINE_JUNK NOP 
	.asciz	"Extra characters after command"
	.size	LINE_JUNK, 31

	.type	.L.str.10,@object       ; @.str.10
	.rodata.str1.1
.L.str.10 NOP 
	.asciz	"Unexpected '}'"
	.size	.L.str.10, 15

	.type	.L.str.11,@object       ; @.str.11
.L.str.11 NOP 
	.asciz	"} doesn't want any addresses"
	.size	.L.str.11, 29

	.type	.L.str.12,@object       ; @.str.12
.L.str.12 NOP 
	.asciz	": doesn't want any addresses"
	.size	.L.str.12, 29

	.type	last_regex,@object      ; @last_regex
	.comm	last_regex,4,4
	.type	.L.str.13,@object       ; @.str.13
.L.str.13 NOP 
	.asciz	"Unterminated `s' command"
	.size	.L.str.13, 25

	.type	.L.str.14,@object       ; @.str.14
.L.str.14 NOP 
	.asciz	"multiple 'p' options to 's' command"
	.size	.L.str.14, 36

	.type	.L.str.15,@object       ; @.str.15
.L.str.15 NOP 
	.asciz	"multiple 'g' options to 's' command"
	.size	.L.str.15, 36

	.type	.L.str.16,@object       ; @.str.16
.L.str.16 NOP 
	.asciz	"multiple number options to 's' command"
	.size	.L.str.16, 39

	.type	.L.str.17,@object       ; @.str.17
.L.str.17 NOP 
	.asciz	"Unknown option to 's'"
	.size	.L.str.17, 22

	.type	BAD_EOF,@object         ; @BAD_EOF
	.data
BAD_EOF NOP 
	.asciz	"Unexpected End-of-file"
	.size	BAD_EOF, 23

	.type	.L.str.18,@object       ; @.str.18
	.rodata.str1.1
.L.str.18 NOP 
	.asciz	"strings for y command are different lengths"
	.size	.L.str.18, 44

	.type	.L.str.19,@object       ; @.str.19
.L.str.19 NOP 
	.asciz	"Unknown command"
	.size	.L.str.19, 16

	.type	.L.str.20,@object       ; @.str.20
.L.str.20 NOP 
	.asciz	"Unmatched `{'"
	.size	.L.str.20, 14

	.type	.L.str.21,@object       ; @.str.21
.L.str.21 NOP 
	.asciz	"%s: file %s line %d: %s\n"
	.size	.L.str.21, 25

	.type	.L.str.22,@object       ; @.str.22
.L.str.22 NOP 
	.asciz	"%s: %s\n"
	.size	.L.str.22, 8

	.type	NO_REGEX,@object        ; @NO_REGEX
	.data
NO_REGEX NOP 
	.asciz	"No previous regular expression"
	.size	NO_REGEX, 31

	.type	.L.str.23,@object       ; @.str.23
	.rodata.str1.1
.L.str.23 NOP 
	.asciz	"missing ' ' before filename"
	.size	.L.str.23, 28

	.type	.L.str.24,@object       ; @.str.24
.L.str.24 NOP 
	.asciz	"Can't open file for both reading and writing"
	.size	.L.str.24, 45

	.type	.L.str.25,@object       ; @.str.25
.L.str.25 NOP 
	.asciz	"w"
	.size	.L.str.25, 2

	.type	.L.str.26,@object       ; @.str.26
.L.str.26 NOP 
	.asciz	"Hopelessely evil compiled in limit on number of open files.  re-compile sed"
	.size	.L.str.26, 76

	.type	input_file,@object      ; @input_file
	.comm	input_file,4,4
	.type	.L.str.27,@object       ; @.str.27
.L.str.27 NOP 
	.asciz	"%s: can't read %s: %s\n"
	.size	.L.str.27, 23

	.type	execute_program.end_cycle,@object ; @execute_program.end_cycle
	.local	execute_program.end_cycle
	.comm	execute_program.end_cycle,4,4
	.type	execute_program.tmp,@object ; @execute_program.tmp
	.local	execute_program.tmp
	.comm	execute_program.tmp,12,4
	.type	.L.str.28,@object       ; @.str.28
.L.str.28 NOP 
	.asciz	"%d\n"
	.size	.L.str.28, 4

	.type	.L.str.29,@object       ; @.str.29
.L.str.29 NOP 
	.asciz	"\\\\"
	.size	.L.str.29, 3

	.type	.L.str.30,@object       ; @.str.30
.L.str.30 NOP 
	.asciz	"\\a"
	.size	.L.str.30, 3

	.type	.L.str.31,@object       ; @.str.31
.L.str.31 NOP 
	.asciz	"\\b"
	.size	.L.str.31, 3

	.type	.L.str.32,@object       ; @.str.32
.L.str.32 NOP 
	.asciz	"\\f"
	.size	.L.str.32, 3

	.type	.L.str.33,@object       ; @.str.33
.L.str.33 NOP 
	.asciz	"\\n"
	.size	.L.str.33, 3

	.type	.L.str.34,@object       ; @.str.34
.L.str.34 NOP 
	.asciz	"\\r"
	.size	.L.str.34, 3

	.type	.L.str.35,@object       ; @.str.35
.L.str.35 NOP 
	.asciz	"\\t"
	.size	.L.str.35, 3

	.type	.L.str.36,@object       ; @.str.36
.L.str.36 NOP 
	.asciz	"\\v"
	.size	.L.str.36, 3

	.type	.L.str.37,@object       ; @.str.37
.L.str.37 NOP 
	.asciz	"\\%02x"
	.size	.L.str.37, 6

	.type	.L.str.38,@object       ; @.str.38
.L.str.38 NOP 
	.asciz	"Read error on input file to 'r' command"
	.size	.L.str.38, 40

	.type	regs,@object            ; @regs
	.local	regs
	.comm	regs,12,4
	.type	.L.str.39,@object       ; @.str.39
.L.str.39 NOP 
	.asciz	"INTERNAL ERROR: Bad cmd %c"
	.size	.L.str.39, 27

	.type	.L.str.40,@object       ; @.str.40
.L.str.40 NOP 
	.asciz	"INTERNAL ERROR: bad address type"
	.size	.L.str.40, 33

	.type	.L.str.41,@object       ; @.str.41
.L.str.41 NOP 
	.asciz	"Usage: %s [-nV] [--quiet] [--silent] [--version] [-e script]\n        [-f script-file] [--expression=script] [--file=script-file] [file...]\n"
	.size	.L.str.41, 140

	.type	.L.str.42,@object       ; @.str.42
.L.str.42 NOP 
	.asciz	"%s: "
	.size	.L.str.42, 5

	.type	__id_s,@object          ; @__id_s
	.local	__id_s
	.comm	__id_s,256,4
	.type	.L.str.43,@object       ; @.str.43
.L.str.43 NOP 
	.asciz	"{Unknown file pointer}"
	.size	.L.str.43, 23

	.type	.L.str.44,@object       ; @.str.44
.L.str.44 NOP 
	.asciz	"Couldn't open file %s"
	.size	.L.str.44, 22

	.type	.L.str.45,@object       ; @.str.45
.L.str.45 NOP 
	.asciz	"Internal error: too many files open"
	.size	.L.str.45, 36

	.type	.L.str.46,@object       ; @.str.46
.L.str.46 NOP 
	.asciz	"couldn't write %d items to %s"
	.size	.L.str.46, 30

	.type	.L.str.47,@object       ; @.str.47
.L.str.47 NOP 
	.asciz	"Couldn't close %s"
	.size	.L.str.47, 18

	.type	.L.str.48,@object       ; @.str.48
.L.str.48 NOP 
	.asciz	"Couldn't allocate memory"
	.size	.L.str.48, 25

	.type	.L.str.49,@object       ; @.str.49
.L.str.49 NOP 
	.asciz	"Couldn't re-allocate memory"
	.size	.L.str.49, 28

	.type	re_syntax_options,@object ; @re_syntax_options
	.bss
	.globl	re_syntax_options
	.p2align	2
re_syntax_options NOP 
	.long	0                       ; 0x0
	.size	re_syntax_options, 4

	.type	re_max_failures,@object ; @re_max_failures
	.data
	.globl	re_max_failures
	.p2align	2
re_max_failures NOP 
	.long	2000                    ; 0x7d0
	.size	re_max_failures, 4

	.type	re_syntax_table,@object ; @re_syntax_table
	.local	re_syntax_table
	.comm	re_syntax_table,256,1
	.type	re_error_msg,@object    ; @re_error_msg
	.p2align	2
re_error_msg NOP 
	.long	0
	.long	.L.str.69
	.long	.L.str.70
	.long	.L.str.71
	.long	.L.str.72
	.long	.L.str.73
	.long	.L.str.74
	.long	.L.str.75
	.long	.L.str.76
	.long	.L.str.77
	.long	.L.str.78
	.long	.L.str.79
	.long	.L.str.80
	.long	.L.str.81
	.long	.L.str.82
	.long	.L.str.83
	.long	.L.str.84
	.size	re_error_msg, 68

	.type	.L.str.50,@object       ; @.str.50
	.rodata.str1.1
.L.str.50 NOP 
	.asciz	"Success"
	.size	.L.str.50, 8

	.type	.L.str.51,@object       ; @.str.51
.L.str.51 NOP 
	.asciz	"expression"
	.size	.L.str.51, 11

	.type	.L.str.52,@object       ; @.str.52
.L.str.52 NOP 
	.asciz	"file"
	.size	.L.str.52, 5

	.type	.L.str.53,@object       ; @.str.53
.L.str.53 NOP 
	.asciz	"quiet"
	.size	.L.str.53, 6

	.type	.L.str.54,@object       ; @.str.54
.L.str.54 NOP 
	.asciz	"silent"
	.size	.L.str.54, 7

	.type	.L.str.55,@object       ; @.str.55
.L.str.55 NOP 
	.asciz	"version"
	.size	.L.str.55, 8

	.type	.L.str.56,@object       ; @.str.56
.L.str.56 NOP 
	.asciz	"help"
	.size	.L.str.56, 5

	.type	.L.str.57,@object       ; @.str.57
.L.str.57 NOP 
	.asciz	"alnum"
	.size	.L.str.57, 6

	.type	.L.str.58,@object       ; @.str.58
.L.str.58 NOP 
	.asciz	"alpha"
	.size	.L.str.58, 6

	.type	.L.str.59,@object       ; @.str.59
.L.str.59 NOP 
	.asciz	"blank"
	.size	.L.str.59, 6

	.type	.L.str.60,@object       ; @.str.60
.L.str.60 NOP 
	.asciz	"cntrl"
	.size	.L.str.60, 6

	.type	.L.str.61,@object       ; @.str.61
.L.str.61 NOP 
	.asciz	"digit"
	.size	.L.str.61, 6

	.type	.L.str.62,@object       ; @.str.62
.L.str.62 NOP 
	.asciz	"graph"
	.size	.L.str.62, 6

	.type	.L.str.63,@object       ; @.str.63
.L.str.63 NOP 
	.asciz	"lower"
	.size	.L.str.63, 6

	.type	.L.str.64,@object       ; @.str.64
.L.str.64 NOP 
	.asciz	"print"
	.size	.L.str.64, 6

	.type	.L.str.65,@object       ; @.str.65
.L.str.65 NOP 
	.asciz	"punct"
	.size	.L.str.65, 6

	.type	.L.str.66,@object       ; @.str.66
.L.str.66 NOP 
	.asciz	"space"
	.size	.L.str.66, 6

	.type	.L.str.67,@object       ; @.str.67
.L.str.67 NOP 
	.asciz	"upper"
	.size	.L.str.67, 6

	.type	.L.str.68,@object       ; @.str.68
.L.str.68 NOP 
	.asciz	"xdigit"
	.size	.L.str.68, 7

	.type	init_syntax_once.done,@object ; @init_syntax_once.done
	.local	init_syntax_once.done
	.comm	init_syntax_once.done,4,4
	.type	.L.str.69,@object       ; @.str.69
.L.str.69 NOP 
	.asciz	"No match"
	.size	.L.str.69, 9

	.type	.L.str.70,@object       ; @.str.70
.L.str.70 NOP 
	.asciz	"Invalid regular expression"
	.size	.L.str.70, 27

	.type	.L.str.71,@object       ; @.str.71
.L.str.71 NOP 
	.asciz	"Invalid collation character"
	.size	.L.str.71, 28

	.type	.L.str.72,@object       ; @.str.72
.L.str.72 NOP 
	.asciz	"Invalid character class name"
	.size	.L.str.72, 29

	.type	.L.str.73,@object       ; @.str.73
.L.str.73 NOP 
	.asciz	"Trailing backslash"
	.size	.L.str.73, 19

	.type	.L.str.74,@object       ; @.str.74
.L.str.74 NOP 
	.asciz	"Invalid back reference"
	.size	.L.str.74, 23

	.type	.L.str.75,@object       ; @.str.75
.L.str.75 NOP 
	.asciz	"Unmatched [ or [^"
	.size	.L.str.75, 18

	.type	.L.str.76,@object       ; @.str.76
.L.str.76 NOP 
	.asciz	"Unmatched ( or \\("
	.size	.L.str.76, 18

	.type	.L.str.77,@object       ; @.str.77
.L.str.77 NOP 
	.asciz	"Unmatched \\{"
	.size	.L.str.77, 13

	.type	.L.str.78,@object       ; @.str.78
.L.str.78 NOP 
	.asciz	"Invalid content of \\{\\}"
	.size	.L.str.78, 24

	.type	.L.str.79,@object       ; @.str.79
.L.str.79 NOP 
	.asciz	"Invalid range end"
	.size	.L.str.79, 18

	.type	.L.str.80,@object       ; @.str.80
.L.str.80 NOP 
	.asciz	"Memory exhausted"
	.size	.L.str.80, 17

	.type	.L.str.81,@object       ; @.str.81
.L.str.81 NOP 
	.asciz	"Invalid preceding regular expression"
	.size	.L.str.81, 37

	.type	.L.str.82,@object       ; @.str.82
.L.str.82 NOP 
	.asciz	"Premature end of regular expression"
	.size	.L.str.82, 36

	.type	.L.str.83,@object       ; @.str.83
.L.str.83 NOP 
	.asciz	"Regular expression too big"
	.size	.L.str.83, 27

	.type	.L.str.84,@object       ; @.str.84
.L.str.84 NOP 
	.asciz	"Unmatched ) or \\)"
	.size	.L.str.84, 18

	.ident	"clang version 9.0.1 "
	.note.GNU-stack
