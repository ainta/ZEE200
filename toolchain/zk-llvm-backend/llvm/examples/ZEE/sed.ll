; ModuleID = 'sed.c'
source_filename = "sed.c"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-pc-linux-gnu"

%struct.vector = type { %struct.sed_cmd*, i32, i32, %struct.vector*, i32 }
%struct.sed_cmd = type { %struct.addr, %struct.addr, i32, i8, %union.anon }
%struct.addr = type { i32, %struct.re_pattern_buffer*, i32 }
%struct.re_pattern_buffer = type { i8*, i32, i32, i32, i8*, i8*, i32, i8 }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { %struct.re_pattern_buffer*, i8*, i32, i32, i32, %struct._IO_FILE* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.sed_label = type { %struct.vector*, i32, i8*, %struct.sed_label* }
%struct.option = type { i8*, i32, i32*, i32 }
%struct.line = type { i8*, i32, i32 }
%struct.anon.1 = type { %struct._IO_FILE*, i8*, i32 }
%struct.re_registers = type { i32, i32*, i32* }
%struct.id = type { %struct._IO_FILE*, i8* }
%struct.anon = type { i8*, i32 }
%struct.buffer = type { i32, i32, i8* }
%struct.fail_stack_type = type { i8**, i32, i32 }
%union.register_info_type = type { i8* }
%struct.anon.2 = type { i8, [3 x i8] }
%struct.compile_stack_type = type { %struct.compile_stack_elt_t*, i32, i32 }
%struct.compile_stack_elt_t = type { i32, i32, i32, i32, i32 }
%struct.regmatch_t = type { i32, i32 }

@.str = private unnamed_addr constant [21 x i8] c"GNU sed version 1.17\00", align 1
@version_string = dso_local global i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), align 4
@no_default_output = dso_local global i32 0, align 4
@input_line_number = dso_local global i32 0, align 4
@last_input_file = dso_local global i32 0, align 4
@input_EOF = dso_local global i32 0, align 4
@quit_cmd = dso_local global i32 0, align 4
@replaced = dso_local global i32 0, align 4
@program_depth = dso_local global i32 0, align 4
@the_program = dso_local global %struct.vector* null, align 4
@jumps = dso_local global %struct.sed_label* null, align 4
@labels = dso_local global %struct.sed_label* null, align 4
@prog_line = dso_local global i32 1, align 4
@bad_input = dso_local global i32 0, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"Executable\00", align 1
@myname = common dso_local global i8* null, align 4
@.str.2 = private unnamed_addr constant [8 x i8] c"hne:f:V\00", align 1
@longopts = internal global [7 x %struct.option] [%struct.option { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.51, i32 0, i32 0), i32 1, i32* null, i32 101 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i32 1, i32* null, i32 102 }, %struct.option { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.53, i32 0, i32 0), i32 0, i32* null, i32 110 }, %struct.option { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.54, i32 0, i32 0), i32 0, i32* null, i32 110 }, %struct.option { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.55, i32 0, i32 0), i32 0, i32* null, i32 86 }, %struct.option { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.56, i32 0, i32 0), i32 0, i32* null, i32 104 }, %struct.option zeroinitializer], align 4
@optarg = external dso_local global i8*, align 4
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 4
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@optind = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [34 x i8] c"Can't find label for jump to '%s'\00", align 1
@line = common dso_local global %struct.line zeroinitializer, align 4
@append = common dso_local global %struct.line zeroinitializer, align 4
@hold = common dso_local global %struct.line zeroinitializer, align 4
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@file_ptrs = common dso_local global [32 x %struct.anon.1] zeroinitializer, align 4
@prog_file = common dso_local global %struct._IO_FILE* null, align 4
@prog_cur = common dso_local global i8* null, align 4
@prog_start = common dso_local global i8* null, align 4
@prog_end = common dso_local global i8* null, align 4
@prog_name = common dso_local global i8* null, align 4
@stdin = external dso_local global %struct._IO_FILE*, align 4
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"Unexpected ','\00", align 1
@NO_COMMAND = internal global [16 x i8] c"Missing command\00", align 1
@NO_ADDR = internal global [35 x i8] c"Command doesn't take any addresses\00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"Multiple '!'s\00", align 1
@ONE_ADDR = internal global [30 x i8] c"Command only uses one address\00", align 1
@LINE_JUNK = internal global [31 x i8] c"Extra characters after command\00", align 1
@.str.10 = private unnamed_addr constant [15 x i8] c"Unexpected '}'\00", align 1
@.str.11 = private unnamed_addr constant [29 x i8] c"} doesn't want any addresses\00", align 1
@.str.12 = private unnamed_addr constant [29 x i8] c": doesn't want any addresses\00", align 1
@last_regex = common dso_local global %struct.re_pattern_buffer* null, align 4
@.str.13 = private unnamed_addr constant [25 x i8] c"Unterminated `s' command\00", align 1
@.str.14 = private unnamed_addr constant [36 x i8] c"multiple 'p' options to 's' command\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"multiple 'g' options to 's' command\00", align 1
@.str.16 = private unnamed_addr constant [39 x i8] c"multiple number options to 's' command\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"Unknown option to 's'\00", align 1
@BAD_EOF = internal global [23 x i8] c"Unexpected End-of-file\00", align 1
@.str.18 = private unnamed_addr constant [44 x i8] c"strings for y command are different lengths\00", align 1
@.str.19 = private unnamed_addr constant [16 x i8] c"Unknown command\00", align 1
@.str.20 = private unnamed_addr constant [14 x i8] c"Unmatched `{'\00", align 1
@.str.21 = private unnamed_addr constant [25 x i8] c"%s: file %s line %d: %s\0A\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@NO_REGEX = internal global [31 x i8] c"No previous regular expression\00", align 1
@.str.23 = private unnamed_addr constant [28 x i8] c"missing ' ' before filename\00", align 1
@.str.24 = private unnamed_addr constant [45 x i8] c"Can't open file for both reading and writing\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.26 = private unnamed_addr constant [76 x i8] c"Hopelessely evil compiled in limit on number of open files.  re-compile sed\00", align 1
@input_file = common dso_local global %struct._IO_FILE* null, align 4
@.str.27 = private unnamed_addr constant [23 x i8] c"%s: can't read %s: %s\0A\00", align 1
@execute_program.end_cycle = internal global i32 0, align 4
@execute_program.tmp = internal global %struct.line zeroinitializer, align 4
@.str.28 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"\5Ca\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"\5Cb\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"\5Cf\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"\5Cn\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"\5Cr\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"\5Ct\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"\5Cv\00", align 1
@.str.37 = private unnamed_addr constant [6 x i8] c"\5C%02x\00", align 1
@.str.38 = private unnamed_addr constant [40 x i8] c"Read error on input file to 'r' command\00", align 1
@regs = internal global %struct.re_registers zeroinitializer, align 4
@.str.39 = private unnamed_addr constant [27 x i8] c"INTERNAL ERROR: Bad cmd %c\00", align 1
@.str.40 = private unnamed_addr constant [33 x i8] c"INTERNAL ERROR: bad address type\00", align 1
@.str.41 = private unnamed_addr constant [140 x i8] c"Usage: %s [-nV] [--quiet] [--silent] [--version] [-e script]\0A        [-f script-file] [--expression=script] [--file=script-file] [file...]\0A\00", align 1
@.str.42 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@__id_s = internal global [32 x %struct.id] zeroinitializer, align 4
@.str.43 = private unnamed_addr constant [23 x i8] c"{Unknown file pointer}\00", align 1
@.str.44 = private unnamed_addr constant [22 x i8] c"Couldn't open file %s\00", align 1
@.str.45 = private unnamed_addr constant [36 x i8] c"Internal error: too many files open\00", align 1
@.str.46 = private unnamed_addr constant [30 x i8] c"couldn't write %d items to %s\00", align 1
@.str.47 = private unnamed_addr constant [18 x i8] c"Couldn't close %s\00", align 1
@.str.48 = private unnamed_addr constant [25 x i8] c"Couldn't allocate memory\00", align 1
@.str.49 = private unnamed_addr constant [28 x i8] c"Couldn't re-allocate memory\00", align 1
@re_syntax_options = dso_local global i32 0, align 4
@re_max_failures = dso_local global i32 2000, align 4
@re_syntax_table = internal global [256 x i8] zeroinitializer, align 1
@re_error_msg = internal global [17 x i8*] [i8* null, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.69, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.71, i32 0, i32 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.73, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.75, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.77, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.78, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.79, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.80, i32 0, i32 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.81, i32 0, i32 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.83, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.84, i32 0, i32 0)], align 4
@.str.50 = private unnamed_addr constant [8 x i8] c"Success\00", align 1
@.str.51 = private unnamed_addr constant [11 x i8] c"expression\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str.53 = private unnamed_addr constant [6 x i8] c"quiet\00", align 1
@.str.54 = private unnamed_addr constant [7 x i8] c"silent\00", align 1
@.str.55 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str.56 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"alnum\00", align 1
@.str.58 = private unnamed_addr constant [6 x i8] c"alpha\00", align 1
@.str.59 = private unnamed_addr constant [6 x i8] c"blank\00", align 1
@.str.60 = private unnamed_addr constant [6 x i8] c"cntrl\00", align 1
@.str.61 = private unnamed_addr constant [6 x i8] c"digit\00", align 1
@.str.62 = private unnamed_addr constant [6 x i8] c"graph\00", align 1
@.str.63 = private unnamed_addr constant [6 x i8] c"lower\00", align 1
@.str.64 = private unnamed_addr constant [6 x i8] c"print\00", align 1
@.str.65 = private unnamed_addr constant [6 x i8] c"punct\00", align 1
@.str.66 = private unnamed_addr constant [6 x i8] c"space\00", align 1
@.str.67 = private unnamed_addr constant [6 x i8] c"upper\00", align 1
@.str.68 = private unnamed_addr constant [7 x i8] c"xdigit\00", align 1
@init_syntax_once.done = internal global i32 0, align 4
@.str.69 = private unnamed_addr constant [9 x i8] c"No match\00", align 1
@.str.70 = private unnamed_addr constant [27 x i8] c"Invalid regular expression\00", align 1
@.str.71 = private unnamed_addr constant [28 x i8] c"Invalid collation character\00", align 1
@.str.72 = private unnamed_addr constant [29 x i8] c"Invalid character class name\00", align 1
@.str.73 = private unnamed_addr constant [19 x i8] c"Trailing backslash\00", align 1
@.str.74 = private unnamed_addr constant [23 x i8] c"Invalid back reference\00", align 1
@.str.75 = private unnamed_addr constant [18 x i8] c"Unmatched [ or [^\00", align 1
@.str.76 = private unnamed_addr constant [18 x i8] c"Unmatched ( or \5C(\00", align 1
@.str.77 = private unnamed_addr constant [13 x i8] c"Unmatched \5C{\00", align 1
@.str.78 = private unnamed_addr constant [24 x i8] c"Invalid content of \5C{\5C}\00", align 1
@.str.79 = private unnamed_addr constant [18 x i8] c"Invalid range end\00", align 1
@.str.80 = private unnamed_addr constant [17 x i8] c"Memory exhausted\00", align 1
@.str.81 = private unnamed_addr constant [37 x i8] c"Invalid preceding regular expression\00", align 1
@.str.82 = private unnamed_addr constant [36 x i8] c"Premature end of regular expression\00", align 1
@.str.83 = private unnamed_addr constant [27 x i8] c"Regular expression too big\00", align 1
@.str.84 = private unnamed_addr constant [18 x i8] c"Unmatched ) or \5C)\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.sed_label*, align 4
  %10 = alloca %struct.sed_label*, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 4
  store i8* null, i8** %7, align 4
  store i32 0, i32* %8, align 4
  %11 = call i32 @re_set_syntax(i32 66246)
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8** @myname, align 4
  br label %12

12:                                               ; preds = %54, %2
  %13 = load i32, i32* %4, align 4
  %14 = load i8**, i8*** %5, align 4
  %15 = call i32 @getopt_long(i32 %13, i8** %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), %struct.option* getelementptr inbounds ([7 x %struct.option], [7 x %struct.option]* @longopts, i32 0, i32 0), i32* null)
  store i32 %15, i32* %6, align 4
  %16 = icmp ne i32 %15, -1
  br i1 %16, label %17, label %55

17:                                               ; preds = %12
  %18 = load i32, i32* %6, align 4
  switch i32 %18, label %53 [
    i32 110, label %19
    i32 101, label %20
    i32 102, label %46
    i32 86, label %48
    i32 104, label %52
  ]

19:                                               ; preds = %17
  store i32 1, i32* @no_default_output, align 4
  br label %54

20:                                               ; preds = %17
  %21 = load i8*, i8** %7, align 4
  %22 = icmp eq i8* %21, null
  br i1 %22, label %23, label %31

23:                                               ; preds = %20
  %24 = load i8*, i8** @optarg, align 4
  %25 = call i32 @strlen(i8* %24) #8
  %26 = add i32 %25, 2
  %27 = call i8* @ck_malloc(i32 %26)
  store i8* %27, i8** %7, align 4
  %28 = load i8*, i8** %7, align 4
  %29 = load i8*, i8** @optarg, align 4
  %30 = call i8* @strcpy(i8* %28, i8* %29) #7
  br label %43

31:                                               ; preds = %20
  %32 = load i8*, i8** %7, align 4
  %33 = load i8*, i8** %7, align 4
  %34 = call i32 @strlen(i8* %33) #8
  %35 = load i8*, i8** @optarg, align 4
  %36 = call i32 @strlen(i8* %35) #8
  %37 = add i32 %34, %36
  %38 = add i32 %37, 2
  %39 = call i8* @ck_realloc(i8* %32, i32 %38)
  store i8* %39, i8** %7, align 4
  %40 = load i8*, i8** %7, align 4
  %41 = load i8*, i8** @optarg, align 4
  %42 = call i8* @strcat(i8* %40, i8* %41) #7
  br label %43

43:                                               ; preds = %31, %23
  %44 = load i8*, i8** %7, align 4
  %45 = call i8* @strcat(i8* %44, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0)) #7
  store i32 1, i32* %8, align 4
  br label %54

46:                                               ; preds = %17
  %47 = load i8*, i8** @optarg, align 4
  call void @compile_file(i8* %47)
  store i32 1, i32* %8, align 4
  br label %54

48:                                               ; preds = %17
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %50 = load i8*, i8** @version_string, align 4
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %50)
  call void @exit(i32 0) #9
  unreachable

52:                                               ; preds = %17
  call void @usage(i32 0)
  br label %54

53:                                               ; preds = %17
  call void @usage(i32 4)
  br label %54

54:                                               ; preds = %53, %52, %46, %43, %19
  br label %12

55:                                               ; preds = %12
  %56 = load i8*, i8** %7, align 4
  %57 = icmp ne i8* %56, null
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = load i8*, i8** %7, align 4
  call void @compile_string(i8* %59)
  %60 = load i8*, i8** %7, align 4
  call void @free(i8* %60) #7
  br label %61

61:                                               ; preds = %58, %55
  %62 = load i32, i32* %8, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %75, label %64

64:                                               ; preds = %61
  %65 = load i32, i32* @optind, align 4
  %66 = load i32, i32* %4, align 4
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %64
  call void @usage(i32 4)
  br label %69

69:                                               ; preds = %68, %64
  %70 = load i8**, i8*** %5, align 4
  %71 = load i32, i32* @optind, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* @optind, align 4
  %73 = getelementptr inbounds i8*, i8** %70, i32 %71
  %74 = load i8*, i8** %73, align 4
  call void @compile_string(i8* %74)
  br label %75

75:                                               ; preds = %69, %61
  %76 = load %struct.sed_label*, %struct.sed_label** @jumps, align 4
  store %struct.sed_label* %76, %struct.sed_label** %9, align 4
  br label %77

77:                                               ; preds = %127, %75
  %78 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %79 = icmp ne %struct.sed_label* %78, null
  br i1 %79, label %80, label %131

80:                                               ; preds = %77
  %81 = load %struct.sed_label*, %struct.sed_label** @labels, align 4
  store %struct.sed_label* %81, %struct.sed_label** %10, align 4
  br label %82

82:                                               ; preds = %96, %80
  %83 = load %struct.sed_label*, %struct.sed_label** %10, align 4
  %84 = icmp ne %struct.sed_label* %83, null
  br i1 %84, label %85, label %100

85:                                               ; preds = %82
  %86 = load %struct.sed_label*, %struct.sed_label** %10, align 4
  %87 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %86, i32 0, i32 2
  %88 = load i8*, i8** %87, align 4
  %89 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %90 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %89, i32 0, i32 2
  %91 = load i8*, i8** %90, align 4
  %92 = call i32 @strcmp(i8* %88, i8* %91) #8
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %95, label %94

94:                                               ; preds = %85
  br label %100

95:                                               ; preds = %85
  br label %96

96:                                               ; preds = %95
  %97 = load %struct.sed_label*, %struct.sed_label** %10, align 4
  %98 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %97, i32 0, i32 3
  %99 = load %struct.sed_label*, %struct.sed_label** %98, align 4
  store %struct.sed_label* %99, %struct.sed_label** %10, align 4
  br label %82

100:                                              ; preds = %94, %82
  %101 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %102 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %101, i32 0, i32 2
  %103 = load i8*, i8** %102, align 4
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %114

107:                                              ; preds = %100
  %108 = load %struct.sed_label*, %struct.sed_label** %10, align 4
  %109 = icmp ne %struct.sed_label* %108, null
  br i1 %109, label %114, label %110

110:                                              ; preds = %107
  %111 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %112 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %111, i32 0, i32 2
  %113 = load i8*, i8** %112, align 4
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.5, i32 0, i32 0), i8* %113)
  br label %114

114:                                              ; preds = %110, %107, %100
  %115 = load %struct.sed_label*, %struct.sed_label** %10, align 4
  %116 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %117 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %116, i32 0, i32 0
  %118 = load %struct.vector*, %struct.vector** %117, align 4
  %119 = getelementptr inbounds %struct.vector, %struct.vector* %118, i32 0, i32 0
  %120 = load %struct.sed_cmd*, %struct.sed_cmd** %119, align 4
  %121 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %122 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %121, i32 0, i32 1
  %123 = load i32, i32* %122, align 4
  %124 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %120, i32 %123
  %125 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %124, i32 0, i32 4
  %126 = bitcast %union.anon* %125 to %struct.sed_label**
  store %struct.sed_label* %115, %struct.sed_label** %126, align 4
  br label %127

127:                                              ; preds = %114
  %128 = load %struct.sed_label*, %struct.sed_label** %9, align 4
  %129 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %128, i32 0, i32 3
  %130 = load %struct.sed_label*, %struct.sed_label** %129, align 4
  store %struct.sed_label* %130, %struct.sed_label** %9, align 4
  br label %77

131:                                              ; preds = %77
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %132 = call i8* @ck_malloc(i32 50)
  store i8* %132, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %133 = call i8* @ck_malloc(i32 50)
  store i8* %133, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  store i32 1, i32* getelementptr inbounds (%struct.line, %struct.line* @hold, i32 0, i32 1), align 4
  store i32 50, i32* getelementptr inbounds (%struct.line, %struct.line* @hold, i32 0, i32 2), align 4
  %134 = call i8* @ck_malloc(i32 50)
  store i8* %134, i8** getelementptr inbounds (%struct.line, %struct.line* @hold, i32 0, i32 0), align 4
  %135 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @hold, i32 0, i32 0), align 4
  %136 = getelementptr inbounds i8, i8* %135, i32 0
  store i8 10, i8* %136, align 1
  %137 = load i32, i32* %4, align 4
  %138 = load i32, i32* @optind, align 4
  %139 = icmp sle i32 %137, %138
  br i1 %139, label %140, label %143

140:                                              ; preds = %131
  %141 = load i32, i32* @last_input_file, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* @last_input_file, align 4
  call void @read_file(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  br label %168

143:                                              ; preds = %131
  br label %144

144:                                              ; preds = %166, %143
  %145 = load i32, i32* @optind, align 4
  %146 = load i32, i32* %4, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %167

148:                                              ; preds = %144
  %149 = load i32, i32* @optind, align 4
  %150 = load i32, i32* %4, align 4
  %151 = sub nsw i32 %150, 1
  %152 = icmp eq i32 %149, %151
  br i1 %152, label %153, label %156

153:                                              ; preds = %148
  %154 = load i32, i32* @last_input_file, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* @last_input_file, align 4
  br label %156

156:                                              ; preds = %153, %148
  %157 = load i8**, i8*** %5, align 4
  %158 = load i32, i32* @optind, align 4
  %159 = getelementptr inbounds i8*, i8** %157, i32 %158
  %160 = load i8*, i8** %159, align 4
  call void @read_file(i8* %160)
  %161 = load i32, i32* @optind, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* @optind, align 4
  %163 = load i32, i32* @quit_cmd, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %166

165:                                              ; preds = %156
  br label %167

166:                                              ; preds = %156
  br label %144

167:                                              ; preds = %165, %144
  br label %168

168:                                              ; preds = %167, %140
  call void @close_files()
  %169 = load i32, i32* @bad_input, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %172

171:                                              ; preds = %168
  call void @exit(i32 2) #9
  unreachable

172:                                              ; preds = %168
  call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_set_syntax(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* @re_syntax_options, align 4
  store i32 %4, i32* %3, align 4
  %5 = load i32, i32* %2, align 4
  store i32 %5, i32* @re_syntax_options, align 4
  %6 = load i32, i32* %3, align 4
  ret i32 %6
}

declare dso_local i32 @getopt_long(i32, i8**, i8*, %struct.option*, i32*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i8* @ck_malloc(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = load i32, i32* %2, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %2, align 4
  br label %9

9:                                                ; preds = %6, %1
  %10 = load i32, i32* %2, align 4
  %11 = call noalias i8* @malloc(i32 %10) #7
  store i8* %11, i8** %3, align 4
  %12 = load i8*, i8** %3, align 4
  %13 = icmp eq i8* %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %9
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.48, i32 0, i32 0))
  br label %15

15:                                               ; preds = %14, %9
  %16 = load i8*, i8** %3, align 4
  ret i8* %16
}

; Function Attrs: nounwind readonly
declare dso_local i32 @strlen(i8*) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind optnone
define dso_local i8* @ck_realloc(i8*, i32) #0 {
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 4
  store i8* %0, i8** %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = load i8*, i8** %3, align 4
  %7 = load i32, i32* %4, align 4
  %8 = call i8* @realloc(i8* %6, i32 %7) #7
  store i8* %8, i8** %5, align 4
  %9 = load i8*, i8** %5, align 4
  %10 = icmp eq i8* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.49, i32 0, i32 0))
  br label %12

12:                                               ; preds = %11, %2
  %13 = load i8*, i8** %5, align 4
  ret i8* %13
}

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @compile_file(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 4
  store i8* null, i8** @prog_end, align 4
  store i8* null, i8** @prog_cur, align 4
  store i8* null, i8** @prog_start, align 4
  %4 = load i8*, i8** %2, align 4
  store i8* %4, i8** @prog_name, align 4
  store i32 1, i32* @prog_line, align 4
  %5 = load i8*, i8** %2, align 4
  %6 = getelementptr inbounds i8, i8* %5, i32 0
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, 45
  br i1 %9, label %10, label %18

10:                                               ; preds = %1
  %11 = load i8*, i8** %2, align 4
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  store %struct._IO_FILE* %17, %struct._IO_FILE** @prog_file, align 4
  br label %21

18:                                               ; preds = %10, %1
  %19 = load i8*, i8** %2, align 4
  %20 = call %struct._IO_FILE* @ck_fopen(i8* %19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %20, %struct._IO_FILE** @prog_file, align 4
  br label %21

21:                                               ; preds = %18, %16
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %23 = call i32 @_IO_getc(%struct._IO_FILE* %22)
  store i32 %23, i32* %3, align 4
  %24 = load i32, i32* %3, align 4
  %25 = icmp eq i32 %24, 35
  br i1 %25, label %26, label %49

26:                                               ; preds = %21
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %28 = call i32 @_IO_getc(%struct._IO_FILE* %27)
  store i32 %28, i32* %3, align 4
  %29 = load i32, i32* %3, align 4
  %30 = icmp eq i32 %29, 110
  br i1 %30, label %31, label %34

31:                                               ; preds = %26
  %32 = load i32, i32* @no_default_output, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* @no_default_output, align 4
  br label %34

34:                                               ; preds = %31, %26
  br label %35

35:                                               ; preds = %43, %34
  %36 = load i32, i32* %3, align 4
  %37 = icmp ne i32 %36, -1
  br i1 %37, label %38, label %41

38:                                               ; preds = %35
  %39 = load i32, i32* %3, align 4
  %40 = icmp ne i32 %39, 10
  br label %41

41:                                               ; preds = %38, %35
  %42 = phi i1 [ false, %35 ], [ %40, %38 ]
  br i1 %42, label %43, label %46

43:                                               ; preds = %41
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %45 = call i32 @_IO_getc(%struct._IO_FILE* %44)
  store i32 %45, i32* %3, align 4
  br label %35

46:                                               ; preds = %41
  %47 = load i32, i32* @prog_line, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* @prog_line, align 4
  br label %57

49:                                               ; preds = %21
  %50 = load i32, i32* %3, align 4
  %51 = icmp ne i32 %50, -1
  br i1 %51, label %52, label %56

52:                                               ; preds = %49
  %53 = load i32, i32* %3, align 4
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %55 = call i32 @ungetc(i32 %53, %struct._IO_FILE* %54)
  br label %56

56:                                               ; preds = %52, %49
  br label %57

57:                                               ; preds = %56, %46
  %58 = load %struct.vector*, %struct.vector** @the_program, align 4
  %59 = load i32, i32* @prog_line, align 4
  %60 = call %struct.vector* @compile_program(%struct.vector* %58, i32 %59)
  store %struct.vector* %60, %struct.vector** @the_program, align 4
  ret void
}

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @usage(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  br label %9

7:                                                ; preds = %1
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi %struct._IO_FILE* [ %6, %5 ], [ %8, %7 ]
  %11 = load i8*, i8** @myname, align 4
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @.str.41, i32 0, i32 0), i8* %11)
  %13 = load i32, i32* %2, align 4
  call void @exit(i32 %13) #9
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @compile_string(i8*) #0 {
  %2 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** @prog_file, align 4
  store i32 0, i32* @prog_line, align 4
  %3 = load i8*, i8** %2, align 4
  store i8* %3, i8** @prog_cur, align 4
  store i8* %3, i8** @prog_start, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = load i8*, i8** %2, align 4
  %6 = call i32 @strlen(i8* %5) #8
  %7 = getelementptr inbounds i8, i8* %4, i32 %6
  store i8* %7, i8** @prog_end, align 4
  %8 = load %struct.vector*, %struct.vector** @the_program, align 4
  %9 = load i32, i32* @prog_line, align 4
  %10 = call %struct.vector* @compile_program(%struct.vector* %8, i32 %9)
  store %struct.vector* %10, %struct.vector** @the_program, align 4
  ret void
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @panic(i8*, ...) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %5 = load i8*, i8** @myname, align 4
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.42, i32 0, i32 0), i8* %5)
  %7 = bitcast i8** %3 to i8*
  call void @llvm.va_start(i8* %7)
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %9 = load i8*, i8** %2, align 4
  %10 = load i8*, i8** %3, align 4
  %11 = call i32 @vfprintf(%struct._IO_FILE* %8, i8* %9, i8* %10)
  %12 = bitcast i8** %3 to i8*
  call void @llvm.va_end(i8* %12)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %14 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %13)
  call void @exit(i32 4) #9
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @read_file(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 45
  br i1 %7, label %8, label %16

8:                                                ; preds = %1
  %9 = load i8*, i8** %2, align 4
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  store %struct._IO_FILE* %15, %struct._IO_FILE** @input_file, align 4
  br label %33

16:                                               ; preds = %8, %1
  %17 = load i8*, i8** %2, align 4
  %18 = call %struct._IO_FILE* @fopen(i8* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %18, %struct._IO_FILE** @input_file, align 4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %20 = icmp eq %struct._IO_FILE* %19, null
  br i1 %20, label %21, label %32

21:                                               ; preds = %16
  %22 = call i32* @__errno_location() #10
  %23 = load i32, i32* %22, align 4
  %24 = call i8* @strerror(i32 %23) #7
  store i8* %24, i8** %3, align 4
  %25 = load i32, i32* @bad_input, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* @bad_input, align 4
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %28 = load i8*, i8** @myname, align 4
  %29 = load i8*, i8** %2, align 4
  %30 = load i8*, i8** %3, align 4
  %31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.27, i32 0, i32 0), i8* %28, i8* %29, i8* %30)
  br label %59

32:                                               ; preds = %16
  br label %33

33:                                               ; preds = %32, %14
  br label %34

34:                                               ; preds = %56, %33
  %35 = call i32 @read_pattern_space()
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %57

37:                                               ; preds = %34
  %38 = load %struct.vector*, %struct.vector** @the_program, align 4
  call void @execute_program(%struct.vector* %38)
  %39 = load i32, i32* @no_default_output, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %45, label %41

41:                                               ; preds = %37
  %42 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %43 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %42, i32 1, i32 %43, %struct._IO_FILE* %44)
  br label %45

45:                                               ; preds = %41, %37
  %46 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %52

48:                                               ; preds = %45
  %49 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  %50 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %49, i32 1, i32 %50, %struct._IO_FILE* %51)
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  br label %52

52:                                               ; preds = %48, %45
  %53 = load i32, i32* @quit_cmd, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %52
  br label %57

56:                                               ; preds = %52
  br label %34

57:                                               ; preds = %55, %34
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  call void @ck_fclose(%struct._IO_FILE* %58)
  br label %59

59:                                               ; preds = %57, %21
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @close_files() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %2

2:                                                ; preds = %18, %0
  %3 = load i32, i32* %1, align 4
  %4 = icmp slt i32 %3, 32
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  %6 = load i32, i32* %1, align 4
  %7 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %6
  %8 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %7, i32 0, i32 0
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 4
  %10 = icmp ne %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %5
  %12 = load i32, i32* %1, align 4
  %13 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %12
  %14 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %13, i32 0, i32 0
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 4
  %16 = call i32 @fclose(%struct._IO_FILE* %15)
  br label %17

17:                                               ; preds = %11, %5
  br label %18

18:                                               ; preds = %17
  %19 = load i32, i32* %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %1, align 4
  br label %2

21:                                               ; preds = %2
  ret void
}

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone
define dso_local %struct.vector* @compile_program(%struct.vector*, i32) #0 {
  %3 = alloca %struct.vector*, align 4
  %4 = alloca %struct.vector*, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.sed_cmd*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i8*, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.vector* %0, %struct.vector** %4, align 4
  store i32 %1, i32* %5, align 4
  %14 = load %struct.vector*, %struct.vector** %4, align 4
  %15 = icmp ne %struct.vector* %14, null
  br i1 %15, label %31, label %16

16:                                               ; preds = %2
  %17 = call i8* @ck_malloc(i32 20)
  %18 = bitcast i8* %17 to %struct.vector*
  store %struct.vector* %18, %struct.vector** %4, align 4
  %19 = call i8* @ck_malloc(i32 2240)
  %20 = bitcast i8* %19 to %struct.sed_cmd*
  %21 = load %struct.vector*, %struct.vector** %4, align 4
  %22 = getelementptr inbounds %struct.vector, %struct.vector* %21, i32 0, i32 0
  store %struct.sed_cmd* %20, %struct.sed_cmd** %22, align 4
  %23 = load %struct.vector*, %struct.vector** %4, align 4
  %24 = getelementptr inbounds %struct.vector, %struct.vector* %23, i32 0, i32 2
  store i32 40, i32* %24, align 4
  %25 = load %struct.vector*, %struct.vector** %4, align 4
  %26 = getelementptr inbounds %struct.vector, %struct.vector* %25, i32 0, i32 1
  store i32 0, i32* %26, align 4
  %27 = load %struct.vector*, %struct.vector** %4, align 4
  %28 = getelementptr inbounds %struct.vector, %struct.vector* %27, i32 0, i32 3
  store %struct.vector* null, %struct.vector** %28, align 4
  %29 = load %struct.vector*, %struct.vector** %4, align 4
  %30 = getelementptr inbounds %struct.vector, %struct.vector* %29, i32 0, i32 4
  store i32 0, i32* %30, align 4
  br label %31

31:                                               ; preds = %16, %2
  br label %32

32:                                               ; preds = %792, %31
  br label %33

33:                                               ; preds = %213, %32
  br label %34

34:                                               ; preds = %65, %33
  %35 = load i32, i32* %7, align 4
  store i32 %35, i32* %8, align 4
  %36 = call i32 @inchar()
  store i32 %36, i32* %7, align 4
  %37 = load i32, i32* %8, align 4
  %38 = icmp eq i32 %37, 92
  br i1 %38, label %39, label %44

39:                                               ; preds = %34
  %40 = load i32, i32* %7, align 4
  %41 = icmp eq i32 %40, 10
  br i1 %41, label %42, label %44

42:                                               ; preds = %39
  %43 = call i32 @inchar()
  store i32 %43, i32* %7, align 4
  br label %44

44:                                               ; preds = %42, %39, %34
  br label %45

45:                                               ; preds = %44
  %46 = load i32, i32* %7, align 4
  %47 = icmp ne i32 %46, -1
  br i1 %47, label %48, label %65

48:                                               ; preds = %45
  %49 = call i16** @__ctype_b_loc() #10
  %50 = load i16*, i16** %49, align 4
  %51 = load i32, i32* %7, align 4
  %52 = getelementptr inbounds i16, i16* %50, i32 %51
  %53 = load i16, i16* %52, align 2
  %54 = zext i16 %53 to i32
  %55 = and i32 %54, 1
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %63, label %57

57:                                               ; preds = %48
  %58 = load i32, i32* %7, align 4
  %59 = icmp eq i32 %58, 10
  br i1 %59, label %63, label %60

60:                                               ; preds = %57
  %61 = load i32, i32* %7, align 4
  %62 = icmp eq i32 %61, 59
  br label %63

63:                                               ; preds = %60, %57, %48
  %64 = phi i1 [ true, %57 ], [ true, %48 ], [ %62, %60 ]
  br label %65

65:                                               ; preds = %63, %45
  %66 = phi i1 [ false, %45 ], [ %64, %63 ]
  br i1 %66, label %34, label %67

67:                                               ; preds = %65
  %68 = load i32, i32* %7, align 4
  %69 = icmp eq i32 %68, -1
  br i1 %69, label %70, label %71

70:                                               ; preds = %67
  br label %793

71:                                               ; preds = %67
  %72 = load i32, i32* %7, align 4
  call void @savchar(i32 %72)
  %73 = load %struct.vector*, %struct.vector** %4, align 4
  %74 = getelementptr inbounds %struct.vector, %struct.vector* %73, i32 0, i32 1
  %75 = load i32, i32* %74, align 4
  %76 = load %struct.vector*, %struct.vector** %4, align 4
  %77 = getelementptr inbounds %struct.vector, %struct.vector* %76, i32 0, i32 2
  %78 = load i32, i32* %77, align 4
  %79 = icmp eq i32 %75, %78
  br i1 %79, label %80, label %98

80:                                               ; preds = %71
  %81 = load %struct.vector*, %struct.vector** %4, align 4
  %82 = getelementptr inbounds %struct.vector, %struct.vector* %81, i32 0, i32 0
  %83 = load %struct.sed_cmd*, %struct.sed_cmd** %82, align 4
  %84 = bitcast %struct.sed_cmd* %83 to i8*
  %85 = load %struct.vector*, %struct.vector** %4, align 4
  %86 = getelementptr inbounds %struct.vector, %struct.vector* %85, i32 0, i32 1
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %87, 40
  %89 = mul i32 %88, 56
  %90 = call i8* @ck_realloc(i8* %84, i32 %89)
  %91 = bitcast i8* %90 to %struct.sed_cmd*
  %92 = load %struct.vector*, %struct.vector** %4, align 4
  %93 = getelementptr inbounds %struct.vector, %struct.vector* %92, i32 0, i32 0
  store %struct.sed_cmd* %91, %struct.sed_cmd** %93, align 4
  %94 = load %struct.vector*, %struct.vector** %4, align 4
  %95 = getelementptr inbounds %struct.vector, %struct.vector* %94, i32 0, i32 2
  %96 = load i32, i32* %95, align 4
  %97 = add nsw i32 %96, 40
  store i32 %97, i32* %95, align 4
  br label %98

98:                                               ; preds = %80, %71
  %99 = load %struct.vector*, %struct.vector** %4, align 4
  %100 = getelementptr inbounds %struct.vector, %struct.vector* %99, i32 0, i32 0
  %101 = load %struct.sed_cmd*, %struct.sed_cmd** %100, align 4
  %102 = load %struct.vector*, %struct.vector** %4, align 4
  %103 = getelementptr inbounds %struct.vector, %struct.vector* %102, i32 0, i32 1
  %104 = load i32, i32* %103, align 4
  %105 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %101, i32 %104
  store %struct.sed_cmd* %105, %struct.sed_cmd** %6, align 4
  %106 = load %struct.vector*, %struct.vector** %4, align 4
  %107 = getelementptr inbounds %struct.vector, %struct.vector* %106, i32 0, i32 1
  %108 = load i32, i32* %107, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %107, align 4
  %110 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %111 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %110, i32 0, i32 0
  %112 = getelementptr inbounds %struct.addr, %struct.addr* %111, i32 0, i32 0
  store i32 0, i32* %112, align 4
  %113 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %114 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %113, i32 0, i32 1
  %115 = getelementptr inbounds %struct.addr, %struct.addr* %114, i32 0, i32 0
  store i32 0, i32* %115, align 4
  %116 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %117 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %116, i32 0, i32 2
  store i32 0, i32* %117, align 4
  %118 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %119 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %118, i32 0, i32 3
  store i8 0, i8* %119, align 4
  %120 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %121 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %120, i32 0, i32 0
  %122 = call i32 @compile_address(%struct.addr* %121)
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %157

124:                                              ; preds = %98
  %125 = call i32 @inchar()
  store i32 %125, i32* %7, align 4
  %126 = load i32, i32* %7, align 4
  %127 = icmp eq i32 %126, 44
  br i1 %127, label %128, label %154

128:                                              ; preds = %124
  br label %129

129:                                              ; preds = %143, %128
  %130 = call i32 @inchar()
  store i32 %130, i32* %7, align 4
  br label %131

131:                                              ; preds = %129
  %132 = load i32, i32* %7, align 4
  %133 = icmp ne i32 %132, -1
  br i1 %133, label %134, label %143

134:                                              ; preds = %131
  %135 = call i16** @__ctype_b_loc() #10
  %136 = load i16*, i16** %135, align 4
  %137 = load i32, i32* %7, align 4
  %138 = getelementptr inbounds i16, i16* %136, i32 %137
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  %141 = and i32 %140, 1
  %142 = icmp ne i32 %141, 0
  br label %143

143:                                              ; preds = %134, %131
  %144 = phi i1 [ false, %131 ], [ %142, %134 ]
  br i1 %144, label %129, label %145

145:                                              ; preds = %143
  %146 = load i32, i32* %7, align 4
  call void @savchar(i32 %146)
  %147 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %148 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %147, i32 0, i32 1
  %149 = call i32 @compile_address(%struct.addr* %148)
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %152

151:                                              ; preds = %145
  br label %153

152:                                              ; preds = %145
  call void @bad_prog(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i32 0, i32 0))
  br label %153

153:                                              ; preds = %152, %151
  br label %156

154:                                              ; preds = %124
  %155 = load i32, i32* %7, align 4
  call void @savchar(i32 %155)
  br label %156

156:                                              ; preds = %154, %153
  br label %157

157:                                              ; preds = %156, %98
  %158 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %159 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %158, i32 0, i32 0
  %160 = getelementptr inbounds %struct.addr, %struct.addr* %159, i32 0, i32 0
  %161 = load i32, i32* %160, align 4
  %162 = icmp eq i32 %161, 1
  br i1 %162, label %163, label %187

163:                                              ; preds = %157
  %164 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %165 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %164, i32 0, i32 1
  %166 = getelementptr inbounds %struct.addr, %struct.addr* %165, i32 0, i32 0
  %167 = load i32, i32* %166, align 4
  %168 = icmp eq i32 %167, 1
  br i1 %168, label %169, label %187

169:                                              ; preds = %163
  %170 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %171 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %170, i32 0, i32 1
  %172 = getelementptr inbounds %struct.addr, %struct.addr* %171, i32 0, i32 2
  %173 = load i32, i32* %172, align 4
  %174 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %175 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %174, i32 0, i32 0
  %176 = getelementptr inbounds %struct.addr, %struct.addr* %175, i32 0, i32 2
  %177 = load i32, i32* %176, align 4
  %178 = icmp slt i32 %173, %177
  br i1 %178, label %179, label %187

179:                                              ; preds = %169
  %180 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %181 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %180, i32 0, i32 0
  %182 = getelementptr inbounds %struct.addr, %struct.addr* %181, i32 0, i32 2
  %183 = load i32, i32* %182, align 4
  %184 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %185 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %184, i32 0, i32 1
  %186 = getelementptr inbounds %struct.addr, %struct.addr* %185, i32 0, i32 2
  store i32 %183, i32* %186, align 4
  br label %187

187:                                              ; preds = %179, %169, %163, %157
  %188 = call i32 @inchar()
  store i32 %188, i32* %7, align 4
  %189 = load i32, i32* %7, align 4
  %190 = icmp eq i32 %189, -1
  br i1 %190, label %191, label %192

191:                                              ; preds = %187
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @NO_COMMAND, i32 0, i32 0))
  br label %192

192:                                              ; preds = %191, %187
  br label %193

193:                                              ; preds = %250, %192
  %194 = load i32, i32* %7, align 4
  switch i32 %194, label %791 [
    i32 35, label %195
    i32 33, label %218
    i32 97, label %251
    i32 105, label %251
    i32 99, label %259
    i32 123, label %314
    i32 125, label %341
    i32 58, label %383
    i32 98, label %399
    i32 116, label %399
    i32 113, label %408
    i32 61, label %408
    i32 100, label %416
    i32 68, label %416
    i32 103, label %416
    i32 71, label %416
    i32 104, label %416
    i32 72, label %416
    i32 108, label %416
    i32 110, label %416
    i32 78, label %416
    i32 112, label %416
    i32 80, label %416
    i32 120, label %416
    i32 114, label %454
    i32 119, label %462
    i32 115, label %474
    i32 121, label %705
  ]

195:                                              ; preds = %193
  %196 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %197 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %196, i32 0, i32 0
  %198 = getelementptr inbounds %struct.addr, %struct.addr* %197, i32 0, i32 0
  %199 = load i32, i32* %198, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %202

201:                                              ; preds = %195
  call void @bad_prog(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @NO_ADDR, i32 0, i32 0))
  br label %202

202:                                              ; preds = %201, %195
  br label %203

203:                                              ; preds = %211, %202
  %204 = call i32 @inchar()
  store i32 %204, i32* %7, align 4
  br label %205

205:                                              ; preds = %203
  %206 = load i32, i32* %7, align 4
  %207 = icmp ne i32 %206, -1
  br i1 %207, label %208, label %211

208:                                              ; preds = %205
  %209 = load i32, i32* %7, align 4
  %210 = icmp ne i32 %209, 10
  br label %211

211:                                              ; preds = %208, %205
  %212 = phi i1 [ false, %205 ], [ %210, %208 ]
  br i1 %212, label %203, label %213

213:                                              ; preds = %211
  %214 = load %struct.vector*, %struct.vector** %4, align 4
  %215 = getelementptr inbounds %struct.vector, %struct.vector* %214, i32 0, i32 1
  %216 = load i32, i32* %215, align 4
  %217 = add nsw i32 %216, -1
  store i32 %217, i32* %215, align 4
  br label %33

218:                                              ; preds = %193
  %219 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %220 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %219, i32 0, i32 2
  %221 = load i32, i32* %220, align 4
  %222 = and i32 %221, 2
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %225

224:                                              ; preds = %218
  call void @bad_prog(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0))
  br label %225

225:                                              ; preds = %224, %218
  %226 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %227 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %226, i32 0, i32 2
  %228 = load i32, i32* %227, align 4
  %229 = or i32 %228, 2
  store i32 %229, i32* %227, align 4
  br label %230

230:                                              ; preds = %244, %225
  %231 = call i32 @inchar()
  store i32 %231, i32* %7, align 4
  br label %232

232:                                              ; preds = %230
  %233 = load i32, i32* %7, align 4
  %234 = icmp ne i32 %233, -1
  br i1 %234, label %235, label %244

235:                                              ; preds = %232
  %236 = call i16** @__ctype_b_loc() #10
  %237 = load i16*, i16** %236, align 4
  %238 = load i32, i32* %7, align 4
  %239 = getelementptr inbounds i16, i16* %237, i32 %238
  %240 = load i16, i16* %239, align 2
  %241 = zext i16 %240 to i32
  %242 = and i32 %241, 1
  %243 = icmp ne i32 %242, 0
  br label %244

244:                                              ; preds = %235, %232
  %245 = phi i1 [ false, %232 ], [ %243, %235 ]
  br i1 %245, label %230, label %246

246:                                              ; preds = %244
  %247 = load i32, i32* %7, align 4
  %248 = icmp eq i32 %247, -1
  br i1 %248, label %249, label %250

249:                                              ; preds = %246
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @NO_COMMAND, i32 0, i32 0))
  br label %250

250:                                              ; preds = %249, %246
  br label %193

251:                                              ; preds = %193, %193
  %252 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %253 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %252, i32 0, i32 1
  %254 = getelementptr inbounds %struct.addr, %struct.addr* %253, i32 0, i32 0
  %255 = load i32, i32* %254, align 4
  %256 = icmp ne i32 %255, 0
  br i1 %256, label %257, label %258

257:                                              ; preds = %251
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %258

258:                                              ; preds = %257, %251
  br label %259

259:                                              ; preds = %193, %258
  %260 = load i32, i32* %7, align 4
  %261 = trunc i32 %260 to i8
  %262 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %263 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %262, i32 0, i32 3
  store i8 %261, i8* %263, align 4
  %264 = call i32 @inchar()
  %265 = icmp ne i32 %264, 92
  br i1 %265, label %269, label %266

266:                                              ; preds = %259
  %267 = call i32 @inchar()
  %268 = icmp ne i32 %267, 10
  br i1 %268, label %269, label %270

269:                                              ; preds = %266, %259
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %270

270:                                              ; preds = %269, %266
  %271 = call i8* @init_buffer()
  store i8* %271, i8** %10, align 4
  br label %272

272:                                              ; preds = %285, %270
  %273 = call i32 @inchar()
  store i32 %273, i32* %7, align 4
  %274 = icmp ne i32 %273, -1
  br i1 %274, label %275, label %278

275:                                              ; preds = %272
  %276 = load i32, i32* %7, align 4
  %277 = icmp ne i32 %276, 10
  br label %278

278:                                              ; preds = %275, %272
  %279 = phi i1 [ false, %272 ], [ %277, %275 ]
  br i1 %279, label %280, label %288

280:                                              ; preds = %278
  %281 = load i32, i32* %7, align 4
  %282 = icmp eq i32 %281, 92
  br i1 %282, label %283, label %285

283:                                              ; preds = %280
  %284 = call i32 @inchar()
  store i32 %284, i32* %7, align 4
  br label %285

285:                                              ; preds = %283, %280
  %286 = load i8*, i8** %10, align 4
  %287 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %286, i32 %287)
  br label %272

288:                                              ; preds = %278
  %289 = load i32, i32* %7, align 4
  %290 = icmp ne i32 %289, -1
  br i1 %290, label %291, label %294

291:                                              ; preds = %288
  %292 = load i8*, i8** %10, align 4
  %293 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %292, i32 %293)
  br label %294

294:                                              ; preds = %291, %288
  %295 = load i8*, i8** %10, align 4
  %296 = call i32 @size_buffer(i8* %295)
  store i32 %296, i32* %12, align 4
  %297 = load i32, i32* %12, align 4
  %298 = call i8* @ck_malloc(i32 %297)
  store i8* %298, i8** %11, align 4
  %299 = load i8*, i8** %10, align 4
  %300 = call i8* @get_buffer(i8* %299)
  %301 = load i8*, i8** %11, align 4
  %302 = load i32, i32* %12, align 4
  call void @bcopy(i8* %300, i8* %301, i32 %302) #7
  %303 = load i8*, i8** %10, align 4
  call void @flush_buffer(i8* %303)
  %304 = load i32, i32* %12, align 4
  %305 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %306 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %305, i32 0, i32 4
  %307 = bitcast %union.anon* %306 to %struct.anon*
  %308 = getelementptr inbounds %struct.anon, %struct.anon* %307, i32 0, i32 1
  store i32 %304, i32* %308, align 4
  %309 = load i8*, i8** %11, align 4
  %310 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %311 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %310, i32 0, i32 4
  %312 = bitcast %union.anon* %311 to %struct.anon*
  %313 = getelementptr inbounds %struct.anon, %struct.anon* %312, i32 0, i32 0
  store i8* %309, i8** %313, align 4
  br label %792

314:                                              ; preds = %193
  %315 = load i32, i32* %7, align 4
  %316 = trunc i32 %315 to i8
  %317 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %318 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %317, i32 0, i32 3
  store i8 %316, i8* %318, align 4
  %319 = load i32, i32* @program_depth, align 4
  %320 = add nsw i32 %319, 1
  store i32 %320, i32* @program_depth, align 4
  %321 = load i32, i32* @prog_line, align 4
  %322 = call %struct.vector* @compile_program(%struct.vector* null, i32 %321)
  %323 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %324 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %323, i32 0, i32 4
  %325 = bitcast %union.anon* %324 to %struct.vector**
  store %struct.vector* %322, %struct.vector** %325, align 4
  %326 = load %struct.vector*, %struct.vector** %4, align 4
  %327 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %328 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %327, i32 0, i32 4
  %329 = bitcast %union.anon* %328 to %struct.vector**
  %330 = load %struct.vector*, %struct.vector** %329, align 4
  %331 = getelementptr inbounds %struct.vector, %struct.vector* %330, i32 0, i32 3
  store %struct.vector* %326, %struct.vector** %331, align 4
  %332 = load %struct.vector*, %struct.vector** %4, align 4
  %333 = getelementptr inbounds %struct.vector, %struct.vector* %332, i32 0, i32 1
  %334 = load i32, i32* %333, align 4
  %335 = sub nsw i32 %334, 1
  %336 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %337 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %336, i32 0, i32 4
  %338 = bitcast %union.anon* %337 to %struct.vector**
  %339 = load %struct.vector*, %struct.vector** %338, align 4
  %340 = getelementptr inbounds %struct.vector, %struct.vector* %339, i32 0, i32 4
  store i32 %335, i32* %340, align 4
  br label %792

341:                                              ; preds = %193
  %342 = load i32, i32* @program_depth, align 4
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %345, label %344

344:                                              ; preds = %341
  call void @bad_prog(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.10, i32 0, i32 0))
  br label %345

345:                                              ; preds = %344, %341
  %346 = load i32, i32* @program_depth, align 4
  %347 = add nsw i32 %346, -1
  store i32 %347, i32* @program_depth, align 4
  %348 = load i32, i32* %7, align 4
  %349 = trunc i32 %348 to i8
  %350 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %351 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %350, i32 0, i32 3
  store i8 %349, i8* %351, align 4
  %352 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %353 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %352, i32 0, i32 0
  %354 = getelementptr inbounds %struct.addr, %struct.addr* %353, i32 0, i32 0
  %355 = load i32, i32* %354, align 4
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %357, label %358

357:                                              ; preds = %345
  call void @bad_prog(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.11, i32 0, i32 0))
  br label %358

358:                                              ; preds = %357, %345
  br label %359

359:                                              ; preds = %380, %358
  %360 = call i32 @inchar()
  store i32 %360, i32* %7, align 4
  %361 = icmp ne i32 %360, -1
  br i1 %361, label %362, label %368

362:                                              ; preds = %359
  %363 = load i32, i32* %7, align 4
  %364 = icmp ne i32 %363, 10
  br i1 %364, label %365, label %368

365:                                              ; preds = %362
  %366 = load i32, i32* %7, align 4
  %367 = icmp ne i32 %366, 59
  br label %368

368:                                              ; preds = %365, %362, %359
  %369 = phi i1 [ false, %362 ], [ false, %359 ], [ %367, %365 ]
  br i1 %369, label %370, label %381

370:                                              ; preds = %368
  %371 = call i16** @__ctype_b_loc() #10
  %372 = load i16*, i16** %371, align 4
  %373 = load i32, i32* %7, align 4
  %374 = getelementptr inbounds i16, i16* %372, i32 %373
  %375 = load i16, i16* %374, align 2
  %376 = zext i16 %375 to i32
  %377 = and i32 %376, 1
  %378 = icmp ne i32 %377, 0
  br i1 %378, label %380, label %379

379:                                              ; preds = %370
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %380

380:                                              ; preds = %379, %370
  br label %359

381:                                              ; preds = %368
  %382 = load %struct.vector*, %struct.vector** %4, align 4
  store %struct.vector* %382, %struct.vector** %3, align 4
  br label %800

383:                                              ; preds = %193
  %384 = load i32, i32* %7, align 4
  %385 = trunc i32 %384 to i8
  %386 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %387 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %386, i32 0, i32 3
  store i8 %385, i8* %387, align 4
  %388 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %389 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %388, i32 0, i32 0
  %390 = getelementptr inbounds %struct.addr, %struct.addr* %389, i32 0, i32 0
  %391 = load i32, i32* %390, align 4
  %392 = icmp ne i32 %391, 0
  br i1 %392, label %393, label %394

393:                                              ; preds = %383
  call void @bad_prog(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.12, i32 0, i32 0))
  br label %394

394:                                              ; preds = %393, %383
  %395 = load %struct.sed_label*, %struct.sed_label** @labels, align 4
  %396 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %397 = load %struct.vector*, %struct.vector** %4, align 4
  %398 = call %struct.sed_label* @setup_jump(%struct.sed_label* %395, %struct.sed_cmd* %396, %struct.vector* %397)
  store %struct.sed_label* %398, %struct.sed_label** @labels, align 4
  br label %792

399:                                              ; preds = %193, %193
  %400 = load i32, i32* %7, align 4
  %401 = trunc i32 %400 to i8
  %402 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %403 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %402, i32 0, i32 3
  store i8 %401, i8* %403, align 4
  %404 = load %struct.sed_label*, %struct.sed_label** @jumps, align 4
  %405 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %406 = load %struct.vector*, %struct.vector** %4, align 4
  %407 = call %struct.sed_label* @setup_jump(%struct.sed_label* %404, %struct.sed_cmd* %405, %struct.vector* %406)
  store %struct.sed_label* %407, %struct.sed_label** @jumps, align 4
  br label %792

408:                                              ; preds = %193, %193
  %409 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %410 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %409, i32 0, i32 1
  %411 = getelementptr inbounds %struct.addr, %struct.addr* %410, i32 0, i32 0
  %412 = load i32, i32* %411, align 4
  %413 = icmp ne i32 %412, 0
  br i1 %413, label %414, label %415

414:                                              ; preds = %408
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %415

415:                                              ; preds = %414, %408
  br label %416

416:                                              ; preds = %193, %193, %193, %193, %193, %193, %193, %193, %193, %193, %193, %193, %415
  %417 = load i32, i32* %7, align 4
  %418 = trunc i32 %417 to i8
  %419 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %420 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %419, i32 0, i32 3
  store i8 %418, i8* %420, align 4
  br label %421

421:                                              ; preds = %441, %416
  %422 = call i32 @inchar()
  store i32 %422, i32* %7, align 4
  br label %423

423:                                              ; preds = %421
  %424 = load i32, i32* %7, align 4
  %425 = icmp ne i32 %424, -1
  br i1 %425, label %426, label %441

426:                                              ; preds = %423
  %427 = call i16** @__ctype_b_loc() #10
  %428 = load i16*, i16** %427, align 4
  %429 = load i32, i32* %7, align 4
  %430 = getelementptr inbounds i16, i16* %428, i32 %429
  %431 = load i16, i16* %430, align 2
  %432 = zext i16 %431 to i32
  %433 = and i32 %432, 1
  %434 = icmp ne i32 %433, 0
  br i1 %434, label %435, label %441

435:                                              ; preds = %426
  %436 = load i32, i32* %7, align 4
  %437 = icmp ne i32 %436, 10
  br i1 %437, label %438, label %441

438:                                              ; preds = %435
  %439 = load i32, i32* %7, align 4
  %440 = icmp ne i32 %439, 59
  br label %441

441:                                              ; preds = %438, %435, %426, %423
  %442 = phi i1 [ false, %435 ], [ false, %426 ], [ false, %423 ], [ %440, %438 ]
  br i1 %442, label %421, label %443

443:                                              ; preds = %441
  %444 = load i32, i32* %7, align 4
  %445 = icmp ne i32 %444, 10
  br i1 %445, label %446, label %453

446:                                              ; preds = %443
  %447 = load i32, i32* %7, align 4
  %448 = icmp ne i32 %447, 59
  br i1 %448, label %449, label %453

449:                                              ; preds = %446
  %450 = load i32, i32* %7, align 4
  %451 = icmp ne i32 %450, -1
  br i1 %451, label %452, label %453

452:                                              ; preds = %449
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %453

453:                                              ; preds = %452, %449, %446, %443
  br label %792

454:                                              ; preds = %193
  %455 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %456 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %455, i32 0, i32 1
  %457 = getelementptr inbounds %struct.addr, %struct.addr* %456, i32 0, i32 0
  %458 = load i32, i32* %457, align 4
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %461

460:                                              ; preds = %454
  call void @bad_prog(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @ONE_ADDR, i32 0, i32 0))
  br label %461

461:                                              ; preds = %460, %454
  br label %462

462:                                              ; preds = %193, %461
  %463 = load i32, i32* %7, align 4
  %464 = trunc i32 %463 to i8
  %465 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %466 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %465, i32 0, i32 3
  store i8 %464, i8* %466, align 4
  %467 = load i32, i32* %7, align 4
  %468 = icmp eq i32 %467, 114
  %469 = zext i1 %468 to i32
  %470 = call %struct._IO_FILE* @compile_filename(i32 %469)
  %471 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %472 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %471, i32 0, i32 4
  %473 = bitcast %union.anon* %472 to %struct._IO_FILE**
  store %struct._IO_FILE* %470, %struct._IO_FILE** %473, align 4
  br label %792

474:                                              ; preds = %193
  %475 = load i32, i32* %7, align 4
  %476 = trunc i32 %475 to i8
  %477 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %478 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %477, i32 0, i32 3
  store i8 %476, i8* %478, align 4
  %479 = call i32 @inchar()
  store i32 %479, i32* %9, align 4
  %480 = load i32, i32* %9, align 4
  call void @compile_regex(i32 %480)
  %481 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %482 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %483 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %482, i32 0, i32 4
  %484 = bitcast %union.anon* %483 to %struct.anon.0*
  %485 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %484, i32 0, i32 0
  store %struct.re_pattern_buffer* %481, %struct.re_pattern_buffer** %485, align 4
  %486 = call i8* @init_buffer()
  store i8* %486, i8** %10, align 4
  br label %487

487:                                              ; preds = %519, %474
  %488 = call i32 @inchar()
  store i32 %488, i32* %7, align 4
  %489 = icmp ne i32 %488, -1
  br i1 %489, label %490, label %497

490:                                              ; preds = %487
  %491 = load i32, i32* %7, align 4
  %492 = load i32, i32* %9, align 4
  %493 = icmp ne i32 %491, %492
  br i1 %493, label %494, label %497

494:                                              ; preds = %490
  %495 = load i32, i32* %7, align 4
  %496 = icmp ne i32 %495, 10
  br label %497

497:                                              ; preds = %494, %490, %487
  %498 = phi i1 [ false, %490 ], [ false, %487 ], [ %496, %494 ]
  br i1 %498, label %499, label %520

499:                                              ; preds = %497
  %500 = load i32, i32* %7, align 4
  %501 = icmp eq i32 %500, 92
  br i1 %501, label %502, label %516

502:                                              ; preds = %499
  %503 = call i32 @inchar()
  store i32 %503, i32* %13, align 4
  %504 = load i32, i32* %13, align 4
  %505 = icmp ne i32 %504, -1
  br i1 %505, label %506, label %515

506:                                              ; preds = %502
  %507 = load i32, i32* %13, align 4
  %508 = icmp ne i32 %507, 10
  br i1 %508, label %509, label %512

509:                                              ; preds = %506
  %510 = load i8*, i8** %10, align 4
  %511 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %510, i32 %511)
  br label %512

512:                                              ; preds = %509, %506
  %513 = load i8*, i8** %10, align 4
  %514 = load i32, i32* %13, align 4
  call void @add1_buffer(i8* %513, i32 %514)
  br label %515

515:                                              ; preds = %512, %502
  br label %519

516:                                              ; preds = %499
  %517 = load i8*, i8** %10, align 4
  %518 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %517, i32 %518)
  br label %519

519:                                              ; preds = %516, %515
  br label %487

520:                                              ; preds = %497
  %521 = load i32, i32* %7, align 4
  %522 = load i32, i32* %9, align 4
  %523 = icmp ne i32 %521, %522
  br i1 %523, label %524, label %534

524:                                              ; preds = %520
  %525 = load i32, i32* %7, align 4
  %526 = icmp eq i32 %525, 10
  br i1 %526, label %527, label %533

527:                                              ; preds = %524
  %528 = load i32, i32* @prog_line, align 4
  %529 = icmp sgt i32 %528, 1
  br i1 %529, label %530, label %533

530:                                              ; preds = %527
  %531 = load i32, i32* @prog_line, align 4
  %532 = add nsw i32 %531, -1
  store i32 %532, i32* @prog_line, align 4
  br label %533

533:                                              ; preds = %530, %527, %524
  call void @bad_prog(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i32 0, i32 0))
  br label %534

534:                                              ; preds = %533, %520
  %535 = load i8*, i8** %10, align 4
  %536 = call i32 @size_buffer(i8* %535)
  %537 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %538 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %537, i32 0, i32 4
  %539 = bitcast %union.anon* %538 to %struct.anon.0*
  %540 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %539, i32 0, i32 2
  store i32 %536, i32* %540, align 4
  %541 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %542 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %541, i32 0, i32 4
  %543 = bitcast %union.anon* %542 to %struct.anon.0*
  %544 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %543, i32 0, i32 2
  %545 = load i32, i32* %544, align 4
  %546 = call i8* @ck_malloc(i32 %545)
  %547 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %548 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %547, i32 0, i32 4
  %549 = bitcast %union.anon* %548 to %struct.anon.0*
  %550 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %549, i32 0, i32 1
  store i8* %546, i8** %550, align 4
  %551 = load i8*, i8** %10, align 4
  %552 = call i8* @get_buffer(i8* %551)
  %553 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %554 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %553, i32 0, i32 4
  %555 = bitcast %union.anon* %554 to %struct.anon.0*
  %556 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %555, i32 0, i32 1
  %557 = load i8*, i8** %556, align 4
  %558 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %559 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %558, i32 0, i32 4
  %560 = bitcast %union.anon* %559 to %struct.anon.0*
  %561 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %560, i32 0, i32 2
  %562 = load i32, i32* %561, align 4
  call void @bcopy(i8* %552, i8* %557, i32 %562) #7
  %563 = load i8*, i8** %10, align 4
  call void @flush_buffer(i8* %563)
  %564 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %565 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %564, i32 0, i32 4
  %566 = bitcast %union.anon* %565 to %struct.anon.0*
  %567 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %566, i32 0, i32 3
  store i32 0, i32* %567, align 4
  %568 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %569 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %568, i32 0, i32 4
  %570 = bitcast %union.anon* %569 to %struct.anon.0*
  %571 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %570, i32 0, i32 4
  store i32 0, i32* %571, align 4
  %572 = load i32, i32* %7, align 4
  %573 = icmp eq i32 %572, -1
  br i1 %573, label %574, label %575

574:                                              ; preds = %534
  br label %792

575:                                              ; preds = %534
  br label %576

576:                                              ; preds = %698, %575
  %577 = call i32 @inchar()
  store i32 %577, i32* %7, align 4
  %578 = load i32, i32* %7, align 4
  switch i32 %578, label %687 [
    i32 112, label %579
    i32 103, label %595
    i32 119, label %626
    i32 48, label %638
    i32 49, label %638
    i32 50, label %638
    i32 51, label %638
    i32 52, label %638
    i32 53, label %638
    i32 54, label %638
    i32 55, label %638
    i32 56, label %638
    i32 57, label %638
    i32 10, label %686
    i32 59, label %686
    i32 -1, label %686
  ]

579:                                              ; preds = %576
  %580 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %581 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %580, i32 0, i32 4
  %582 = bitcast %union.anon* %581 to %struct.anon.0*
  %583 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %582, i32 0, i32 3
  %584 = load i32, i32* %583, align 4
  %585 = and i32 %584, 2
  %586 = icmp ne i32 %585, 0
  br i1 %586, label %587, label %588

587:                                              ; preds = %579
  call void @bad_prog(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.14, i32 0, i32 0))
  br label %588

588:                                              ; preds = %587, %579
  %589 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %590 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %589, i32 0, i32 4
  %591 = bitcast %union.anon* %590 to %struct.anon.0*
  %592 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %591, i32 0, i32 3
  %593 = load i32, i32* %592, align 4
  %594 = or i32 %593, 2
  store i32 %594, i32* %592, align 4
  br label %688

595:                                              ; preds = %576
  %596 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %597 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %596, i32 0, i32 4
  %598 = bitcast %union.anon* %597 to %struct.anon.0*
  %599 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %598, i32 0, i32 3
  %600 = load i32, i32* %599, align 4
  %601 = and i32 %600, 8
  %602 = icmp ne i32 %601, 0
  br i1 %602, label %603, label %610

603:                                              ; preds = %595
  %604 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %605 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %604, i32 0, i32 4
  %606 = bitcast %union.anon* %605 to %struct.anon.0*
  %607 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %606, i32 0, i32 3
  %608 = load i32, i32* %607, align 4
  %609 = and i32 %608, -9
  store i32 %609, i32* %607, align 4
  br label %610

610:                                              ; preds = %603, %595
  %611 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %612 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %611, i32 0, i32 4
  %613 = bitcast %union.anon* %612 to %struct.anon.0*
  %614 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %613, i32 0, i32 3
  %615 = load i32, i32* %614, align 4
  %616 = and i32 %615, 1
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %618, label %619

618:                                              ; preds = %610
  call void @bad_prog(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0))
  br label %619

619:                                              ; preds = %618, %610
  %620 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %621 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %620, i32 0, i32 4
  %622 = bitcast %union.anon* %621 to %struct.anon.0*
  %623 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %622, i32 0, i32 3
  %624 = load i32, i32* %623, align 4
  %625 = or i32 %624, 1
  store i32 %625, i32* %623, align 4
  br label %688

626:                                              ; preds = %576
  %627 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %628 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %627, i32 0, i32 4
  %629 = bitcast %union.anon* %628 to %struct.anon.0*
  %630 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %629, i32 0, i32 3
  %631 = load i32, i32* %630, align 4
  %632 = or i32 %631, 4
  store i32 %632, i32* %630, align 4
  %633 = call %struct._IO_FILE* @compile_filename(i32 0)
  %634 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %635 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %634, i32 0, i32 4
  %636 = bitcast %union.anon* %635 to %struct.anon.0*
  %637 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %636, i32 0, i32 5
  store %struct._IO_FILE* %633, %struct._IO_FILE** %637, align 4
  store i32 10, i32* %7, align 4
  br label %688

638:                                              ; preds = %576, %576, %576, %576, %576, %576, %576, %576, %576, %576
  %639 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %640 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %639, i32 0, i32 4
  %641 = bitcast %union.anon* %640 to %struct.anon.0*
  %642 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %641, i32 0, i32 3
  %643 = load i32, i32* %642, align 4
  %644 = and i32 %643, 8
  %645 = icmp ne i32 %644, 0
  br i1 %645, label %646, label %647

646:                                              ; preds = %638
  call void @bad_prog(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.16, i32 0, i32 0))
  br label %647

647:                                              ; preds = %646, %638
  %648 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %649 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %648, i32 0, i32 4
  %650 = bitcast %union.anon* %649 to %struct.anon.0*
  %651 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %650, i32 0, i32 3
  %652 = load i32, i32* %651, align 4
  %653 = and i32 %652, 1
  %654 = icmp eq i32 %653, 0
  br i1 %654, label %655, label %662

655:                                              ; preds = %647
  %656 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %657 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %656, i32 0, i32 4
  %658 = bitcast %union.anon* %657 to %struct.anon.0*
  %659 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %658, i32 0, i32 3
  %660 = load i32, i32* %659, align 4
  %661 = or i32 %660, 8
  store i32 %661, i32* %659, align 4
  br label %662

662:                                              ; preds = %655, %647
  store i32 0, i32* %12, align 4
  br label %663

663:                                              ; preds = %672, %662
  %664 = call i16** @__ctype_b_loc() #10
  %665 = load i16*, i16** %664, align 4
  %666 = load i32, i32* %7, align 4
  %667 = getelementptr inbounds i16, i16* %665, i32 %666
  %668 = load i16, i16* %667, align 2
  %669 = zext i16 %668 to i32
  %670 = and i32 %669, 2048
  %671 = icmp ne i32 %670, 0
  br i1 %671, label %672, label %679

672:                                              ; preds = %663
  %673 = load i32, i32* %12, align 4
  %674 = mul nsw i32 %673, 10
  %675 = load i32, i32* %7, align 4
  %676 = add nsw i32 %674, %675
  %677 = sub nsw i32 %676, 48
  store i32 %677, i32* %12, align 4
  %678 = call i32 @inchar()
  store i32 %678, i32* %7, align 4
  br label %663

679:                                              ; preds = %663
  %680 = load i32, i32* %7, align 4
  call void @savchar(i32 %680)
  %681 = load i32, i32* %12, align 4
  %682 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %683 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %682, i32 0, i32 4
  %684 = bitcast %union.anon* %683 to %struct.anon.0*
  %685 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %684, i32 0, i32 4
  store i32 %681, i32* %685, align 4
  br label %688

686:                                              ; preds = %576, %576, %576
  br label %688

687:                                              ; preds = %576
  call void @bad_prog(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.17, i32 0, i32 0))
  br label %688

688:                                              ; preds = %687, %686, %679, %626, %619, %588
  br label %689

689:                                              ; preds = %688
  %690 = load i32, i32* %7, align 4
  %691 = icmp ne i32 %690, -1
  br i1 %691, label %692, label %698

692:                                              ; preds = %689
  %693 = load i32, i32* %7, align 4
  %694 = icmp ne i32 %693, 10
  br i1 %694, label %695, label %698

695:                                              ; preds = %692
  %696 = load i32, i32* %7, align 4
  %697 = icmp ne i32 %696, 59
  br label %698

698:                                              ; preds = %695, %692, %689
  %699 = phi i1 [ false, %692 ], [ false, %689 ], [ %697, %695 ]
  br i1 %699, label %576, label %700

700:                                              ; preds = %698
  %701 = load i32, i32* %7, align 4
  %702 = icmp eq i32 %701, -1
  br i1 %702, label %703, label %704

703:                                              ; preds = %700
  br label %792

704:                                              ; preds = %700
  br label %792

705:                                              ; preds = %193
  %706 = load i32, i32* %7, align 4
  %707 = trunc i32 %706 to i8
  %708 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %709 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %708, i32 0, i32 3
  store i8 %707, i8* %709, align 4
  %710 = call i8* @ck_malloc(i32 256)
  store i8* %710, i8** %11, align 4
  store i32 0, i32* %12, align 4
  br label %711

711:                                              ; preds = %720, %705
  %712 = load i32, i32* %12, align 4
  %713 = icmp slt i32 %712, 256
  br i1 %713, label %714, label %723

714:                                              ; preds = %711
  %715 = load i32, i32* %12, align 4
  %716 = trunc i32 %715 to i8
  %717 = load i8*, i8** %11, align 4
  %718 = load i32, i32* %12, align 4
  %719 = getelementptr inbounds i8, i8* %717, i32 %718
  store i8 %716, i8* %719, align 1
  br label %720

720:                                              ; preds = %714
  %721 = load i32, i32* %12, align 4
  %722 = add nsw i32 %721, 1
  store i32 %722, i32* %12, align 4
  br label %711

723:                                              ; preds = %711
  %724 = call i8* @init_buffer()
  store i8* %724, i8** %10, align 4
  %725 = call i32 @inchar()
  store i32 %725, i32* %9, align 4
  br label %726

726:                                              ; preds = %735, %723
  %727 = call i32 @inchar()
  store i32 %727, i32* %7, align 4
  %728 = icmp ne i32 %727, -1
  br i1 %728, label %729, label %733

729:                                              ; preds = %726
  %730 = load i32, i32* %7, align 4
  %731 = load i32, i32* %9, align 4
  %732 = icmp ne i32 %730, %731
  br label %733

733:                                              ; preds = %729, %726
  %734 = phi i1 [ false, %726 ], [ %732, %729 ]
  br i1 %734, label %735, label %738

735:                                              ; preds = %733
  %736 = load i8*, i8** %10, align 4
  %737 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %736, i32 %737)
  br label %726

738:                                              ; preds = %733
  %739 = load i8*, i8** %11, align 4
  %740 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %741 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %740, i32 0, i32 4
  %742 = bitcast %union.anon* %741 to i8**
  store i8* %739, i8** %742, align 4
  %743 = load i8*, i8** %10, align 4
  %744 = call i8* @get_buffer(i8* %743)
  store i8* %744, i8** %11, align 4
  %745 = load i8*, i8** %10, align 4
  %746 = call i32 @size_buffer(i8* %745)
  store i32 %746, i32* %12, align 4
  br label %747

747:                                              ; preds = %772, %738
  %748 = load i32, i32* %12, align 4
  %749 = icmp ne i32 %748, 0
  br i1 %749, label %750, label %775

750:                                              ; preds = %747
  %751 = call i32 @inchar()
  store i32 %751, i32* %7, align 4
  %752 = load i32, i32* %7, align 4
  %753 = icmp eq i32 %752, -1
  br i1 %753, label %754, label %755

754:                                              ; preds = %750
  call void @bad_prog(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @BAD_EOF, i32 0, i32 0))
  br label %755

755:                                              ; preds = %754, %750
  %756 = load i32, i32* %7, align 4
  %757 = load i32, i32* %9, align 4
  %758 = icmp eq i32 %756, %757
  br i1 %758, label %759, label %760

759:                                              ; preds = %755
  call void @bad_prog(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.18, i32 0, i32 0))
  br label %760

760:                                              ; preds = %759, %755
  %761 = load i32, i32* %7, align 4
  %762 = trunc i32 %761 to i8
  %763 = load %struct.sed_cmd*, %struct.sed_cmd** %6, align 4
  %764 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %763, i32 0, i32 4
  %765 = bitcast %union.anon* %764 to i8**
  %766 = load i8*, i8** %765, align 4
  %767 = load i8*, i8** %11, align 4
  %768 = getelementptr inbounds i8, i8* %767, i32 1
  store i8* %768, i8** %11, align 4
  %769 = load i8, i8* %767, align 1
  %770 = zext i8 %769 to i32
  %771 = getelementptr inbounds i8, i8* %766, i32 %770
  store i8 %762, i8* %771, align 1
  br label %772

772:                                              ; preds = %760
  %773 = load i32, i32* %12, align 4
  %774 = add nsw i32 %773, -1
  store i32 %774, i32* %12, align 4
  br label %747

775:                                              ; preds = %747
  %776 = load i8*, i8** %10, align 4
  call void @flush_buffer(i8* %776)
  %777 = call i32 @inchar()
  %778 = load i32, i32* %9, align 4
  %779 = icmp ne i32 %777, %778
  br i1 %779, label %789, label %780

780:                                              ; preds = %775
  %781 = call i32 @inchar()
  store i32 %781, i32* %7, align 4
  %782 = icmp ne i32 %781, -1
  br i1 %782, label %783, label %790

783:                                              ; preds = %780
  %784 = load i32, i32* %7, align 4
  %785 = icmp ne i32 %784, 10
  br i1 %785, label %786, label %790

786:                                              ; preds = %783
  %787 = load i32, i32* %7, align 4
  %788 = icmp ne i32 %787, 59
  br i1 %788, label %789, label %790

789:                                              ; preds = %786, %775
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @LINE_JUNK, i32 0, i32 0))
  br label %790

790:                                              ; preds = %789, %786, %783, %780
  br label %792

791:                                              ; preds = %193
  call void @bad_prog(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i32 0, i32 0))
  br label %792

792:                                              ; preds = %791, %790, %704, %703, %574, %462, %453, %399, %394, %314, %294
  br label %32

793:                                              ; preds = %70
  %794 = load i32, i32* @program_depth, align 4
  %795 = icmp ne i32 %794, 0
  br i1 %795, label %796, label %798

796:                                              ; preds = %793
  %797 = load i32, i32* %5, align 4
  store i32 %797, i32* @prog_line, align 4
  call void @bad_prog(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.20, i32 0, i32 0))
  br label %798

798:                                              ; preds = %796, %793
  %799 = load %struct.vector*, %struct.vector** %4, align 4
  store %struct.vector* %799, %struct.vector** %3, align 4
  br label %800

800:                                              ; preds = %798, %381
  %801 = load %struct.vector*, %struct.vector** %3, align 4
  ret %struct.vector* %801
}

; Function Attrs: noinline nounwind optnone
define dso_local %struct._IO_FILE* @ck_fopen(i8*, i8*) #0 {
  %3 = alloca i8*, align 4
  %4 = alloca i8*, align 4
  %5 = alloca %struct._IO_FILE*, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 4
  store i8* %1, i8** %4, align 4
  %7 = load i8*, i8** %3, align 4
  %8 = load i8*, i8** %4, align 4
  %9 = call %struct._IO_FILE* @fopen(i8* %7, i8* %8)
  store %struct._IO_FILE* %9, %struct._IO_FILE** %5, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 4
  %11 = icmp eq %struct._IO_FILE* %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i8*, i8** %3, align 4
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i32 0, i32 0), i8* %13)
  br label %14

14:                                               ; preds = %12, %2
  store i32 0, i32* %6, align 4
  br label %15

15:                                               ; preds = %44, %14
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %16, 32
  br i1 %17, label %18, label %47

18:                                               ; preds = %15
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %20
  %22 = getelementptr inbounds %struct.id, %struct.id* %21, i32 0, i32 0
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %22, align 4
  %24 = icmp eq %struct._IO_FILE* %19, %23
  br i1 %24, label %25, label %43

25:                                               ; preds = %18
  %26 = load i32, i32* %6, align 4
  %27 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %26
  %28 = getelementptr inbounds %struct.id, %struct.id* %27, i32 0, i32 1
  %29 = load i8*, i8** %28, align 4
  call void @free(i8* %29) #7
  %30 = load i8*, i8** %3, align 4
  %31 = call i32 @strlen(i8* %30) #8
  %32 = add i32 %31, 1
  %33 = call i8* @ck_malloc(i32 %32)
  %34 = load i32, i32* %6, align 4
  %35 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %34
  %36 = getelementptr inbounds %struct.id, %struct.id* %35, i32 0, i32 1
  store i8* %33, i8** %36, align 4
  %37 = load i32, i32* %6, align 4
  %38 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %37
  %39 = getelementptr inbounds %struct.id, %struct.id* %38, i32 0, i32 1
  %40 = load i8*, i8** %39, align 4
  %41 = load i8*, i8** %3, align 4
  %42 = call i8* @strcpy(i8* %40, i8* %41) #7
  br label %47

43:                                               ; preds = %18
  br label %44

44:                                               ; preds = %43
  %45 = load i32, i32* %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %6, align 4
  br label %15

47:                                               ; preds = %25, %15
  %48 = load i32, i32* %6, align 4
  %49 = icmp eq i32 %48, 32
  br i1 %49, label %50, label %87

50:                                               ; preds = %47
  store i32 0, i32* %6, align 4
  br label %51

51:                                               ; preds = %62, %50
  %52 = load i32, i32* %6, align 4
  %53 = icmp slt i32 %52, 32
  br i1 %53, label %54, label %65

54:                                               ; preds = %51
  %55 = load i32, i32* %6, align 4
  %56 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %55
  %57 = getelementptr inbounds %struct.id, %struct.id* %56, i32 0, i32 0
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** %57, align 4
  %59 = icmp eq %struct._IO_FILE* %58, null
  br i1 %59, label %60, label %61

60:                                               ; preds = %54
  br label %65

61:                                               ; preds = %54
  br label %62

62:                                               ; preds = %61
  %63 = load i32, i32* %6, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %6, align 4
  br label %51

65:                                               ; preds = %60, %51
  %66 = load i32, i32* %6, align 4
  %67 = icmp eq i32 %66, 32
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.45, i32 0, i32 0))
  br label %69

69:                                               ; preds = %68, %65
  %70 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 4
  %71 = load i32, i32* %6, align 4
  %72 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %71
  %73 = getelementptr inbounds %struct.id, %struct.id* %72, i32 0, i32 0
  store %struct._IO_FILE* %70, %struct._IO_FILE** %73, align 4
  %74 = load i8*, i8** %3, align 4
  %75 = call i32 @strlen(i8* %74) #8
  %76 = add i32 %75, 1
  %77 = call i8* @ck_malloc(i32 %76)
  %78 = load i32, i32* %6, align 4
  %79 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %78
  %80 = getelementptr inbounds %struct.id, %struct.id* %79, i32 0, i32 1
  store i8* %77, i8** %80, align 4
  %81 = load i32, i32* %6, align 4
  %82 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %81
  %83 = getelementptr inbounds %struct.id, %struct.id* %82, i32 0, i32 1
  %84 = load i8*, i8** %83, align 4
  %85 = load i8*, i8** %3, align 4
  %86 = call i8* @strcpy(i8* %84, i8* %85) #7
  br label %87

87:                                               ; preds = %69, %47
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 4
  ret %struct._IO_FILE* %88
}

declare dso_local i32 @_IO_getc(%struct._IO_FILE*) #1

declare dso_local i32 @ungetc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @inchar() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %4 = icmp ne %struct._IO_FILE* %3, null
  br i1 %4, label %5, label %14

5:                                                ; preds = %0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %7 = call i32 @feof(%struct._IO_FILE* %6) #7
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %5
  store i32 -1, i32* %1, align 4
  br label %41

10:                                               ; preds = %5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %12 = call i32 @_IO_getc(%struct._IO_FILE* %11)
  store i32 %12, i32* %2, align 4
  br label %13

13:                                               ; preds = %10
  br label %30

14:                                               ; preds = %0
  %15 = load i8*, i8** @prog_cur, align 4
  %16 = icmp ne i8* %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %14
  store i32 -1, i32* %1, align 4
  br label %41

18:                                               ; preds = %14
  %19 = load i8*, i8** @prog_cur, align 4
  %20 = load i8*, i8** @prog_end, align 4
  %21 = icmp eq i8* %19, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store i32 -1, i32* %2, align 4
  store i8* null, i8** @prog_cur, align 4
  br label %28

23:                                               ; preds = %18
  %24 = load i8*, i8** @prog_cur, align 4
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** @prog_cur, align 4
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i32
  store i32 %27, i32* %2, align 4
  br label %28

28:                                               ; preds = %23, %22
  br label %29

29:                                               ; preds = %28
  br label %30

30:                                               ; preds = %29, %13
  %31 = load i32, i32* %2, align 4
  %32 = icmp eq i32 %31, 10
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = load i32, i32* @prog_line, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = load i32, i32* @prog_line, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* @prog_line, align 4
  br label %39

39:                                               ; preds = %36, %33, %30
  %40 = load i32, i32* %2, align 4
  store i32 %40, i32* %1, align 4
  br label %41

41:                                               ; preds = %39, %17, %9
  %42 = load i32, i32* %1, align 4
  ret i32 %42
}

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #5

; Function Attrs: noinline nounwind optnone
define dso_local void @savchar(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %27

6:                                                ; preds = %1
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, 10
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load i32, i32* @prog_line, align 4
  %11 = icmp sgt i32 %10, 1
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load i32, i32* @prog_line, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* @prog_line, align 4
  br label %15

15:                                               ; preds = %12, %9, %6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %17 = icmp ne %struct._IO_FILE* %16, null
  br i1 %17, label %18, label %22

18:                                               ; preds = %15
  %19 = load i32, i32* %2, align 4
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @prog_file, align 4
  %21 = call i32 @ungetc(i32 %19, %struct._IO_FILE* %20)
  br label %27

22:                                               ; preds = %15
  %23 = load i32, i32* %2, align 4
  %24 = trunc i32 %23 to i8
  %25 = load i8*, i8** @prog_cur, align 4
  %26 = getelementptr inbounds i8, i8* %25, i32 -1
  store i8* %26, i8** @prog_cur, align 4
  store i8 %24, i8* %26, align 1
  br label %27

27:                                               ; preds = %5, %22, %18
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @compile_address(%struct.addr*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.addr*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.addr* %0, %struct.addr** %3, align 4
  %6 = call i32 @inchar()
  store i32 %6, i32* %4, align 4
  %7 = call i16** @__ctype_b_loc() #10
  %8 = load i16*, i16** %7, align 4
  %9 = load i32, i32* %4, align 4
  %10 = getelementptr inbounds i16, i16* %8, i32 %9
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = and i32 %12, 2048
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %62

15:                                               ; preds = %1
  %16 = load i32, i32* %4, align 4
  %17 = sub nsw i32 %16, 48
  store i32 %17, i32* %5, align 4
  br label %18

18:                                               ; preds = %32, %15
  %19 = call i32 @inchar()
  store i32 %19, i32* %4, align 4
  %20 = icmp ne i32 %19, -1
  br i1 %20, label %21, label %30

21:                                               ; preds = %18
  %22 = call i16** @__ctype_b_loc() #10
  %23 = load i16*, i16** %22, align 4
  %24 = load i32, i32* %4, align 4
  %25 = getelementptr inbounds i16, i16* %23, i32 %24
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  %28 = and i32 %27, 2048
  %29 = icmp ne i32 %28, 0
  br label %30

30:                                               ; preds = %21, %18
  %31 = phi i1 [ false, %18 ], [ %29, %21 ]
  br i1 %31, label %32, label %38

32:                                               ; preds = %30
  %33 = load i32, i32* %5, align 4
  %34 = mul nsw i32 %33, 10
  %35 = load i32, i32* %4, align 4
  %36 = add nsw i32 %34, %35
  %37 = sub nsw i32 %36, 48
  store i32 %37, i32* %5, align 4
  br label %18

38:                                               ; preds = %30
  br label %39

39:                                               ; preds = %53, %38
  %40 = load i32, i32* %4, align 4
  %41 = icmp ne i32 %40, -1
  br i1 %41, label %42, label %51

42:                                               ; preds = %39
  %43 = call i16** @__ctype_b_loc() #10
  %44 = load i16*, i16** %43, align 4
  %45 = load i32, i32* %4, align 4
  %46 = getelementptr inbounds i16, i16* %44, i32 %45
  %47 = load i16, i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 1
  %50 = icmp ne i32 %49, 0
  br label %51

51:                                               ; preds = %42, %39
  %52 = phi i1 [ false, %39 ], [ %50, %42 ]
  br i1 %52, label %53, label %55

53:                                               ; preds = %51
  %54 = call i32 @inchar()
  store i32 %54, i32* %4, align 4
  br label %39

55:                                               ; preds = %51
  %56 = load i32, i32* %4, align 4
  call void @savchar(i32 %56)
  %57 = load %struct.addr*, %struct.addr** %3, align 4
  %58 = getelementptr inbounds %struct.addr, %struct.addr* %57, i32 0, i32 0
  store i32 1, i32* %58, align 4
  %59 = load i32, i32* %5, align 4
  %60 = load %struct.addr*, %struct.addr** %3, align 4
  %61 = getelementptr inbounds %struct.addr, %struct.addr* %60, i32 0, i32 2
  store i32 %59, i32* %61, align 4
  store i32 1, i32* %2, align 4
  br label %127

62:                                               ; preds = %1
  %63 = load i32, i32* %4, align 4
  %64 = icmp eq i32 %63, 47
  br i1 %64, label %68, label %65

65:                                               ; preds = %62
  %66 = load i32, i32* %4, align 4
  %67 = icmp eq i32 %66, 92
  br i1 %67, label %68, label %98

68:                                               ; preds = %65, %62
  %69 = load %struct.addr*, %struct.addr** %3, align 4
  %70 = getelementptr inbounds %struct.addr, %struct.addr* %69, i32 0, i32 0
  store i32 2, i32* %70, align 4
  %71 = load i32, i32* %4, align 4
  %72 = icmp eq i32 %71, 92
  br i1 %72, label %73, label %75

73:                                               ; preds = %68
  %74 = call i32 @inchar()
  store i32 %74, i32* %4, align 4
  br label %75

75:                                               ; preds = %73, %68
  %76 = load i32, i32* %4, align 4
  call void @compile_regex(i32 %76)
  %77 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %78 = load %struct.addr*, %struct.addr** %3, align 4
  %79 = getelementptr inbounds %struct.addr, %struct.addr* %78, i32 0, i32 1
  store %struct.re_pattern_buffer* %77, %struct.re_pattern_buffer** %79, align 4
  br label %80

80:                                               ; preds = %94, %75
  %81 = call i32 @inchar()
  store i32 %81, i32* %4, align 4
  br label %82

82:                                               ; preds = %80
  %83 = load i32, i32* %4, align 4
  %84 = icmp ne i32 %83, -1
  br i1 %84, label %85, label %94

85:                                               ; preds = %82
  %86 = call i16** @__ctype_b_loc() #10
  %87 = load i16*, i16** %86, align 4
  %88 = load i32, i32* %4, align 4
  %89 = getelementptr inbounds i16, i16* %87, i32 %88
  %90 = load i16, i16* %89, align 2
  %91 = zext i16 %90 to i32
  %92 = and i32 %91, 1
  %93 = icmp ne i32 %92, 0
  br label %94

94:                                               ; preds = %85, %82
  %95 = phi i1 [ false, %82 ], [ %93, %85 ]
  br i1 %95, label %80, label %96

96:                                               ; preds = %94
  %97 = load i32, i32* %4, align 4
  call void @savchar(i32 %97)
  store i32 1, i32* %2, align 4
  br label %127

98:                                               ; preds = %65
  %99 = load i32, i32* %4, align 4
  %100 = icmp eq i32 %99, 36
  br i1 %100, label %101, label %122

101:                                              ; preds = %98
  %102 = load %struct.addr*, %struct.addr** %3, align 4
  %103 = getelementptr inbounds %struct.addr, %struct.addr* %102, i32 0, i32 0
  store i32 3, i32* %103, align 4
  br label %104

104:                                              ; preds = %118, %101
  %105 = call i32 @inchar()
  store i32 %105, i32* %4, align 4
  br label %106

106:                                              ; preds = %104
  %107 = load i32, i32* %4, align 4
  %108 = icmp ne i32 %107, -1
  br i1 %108, label %109, label %118

109:                                              ; preds = %106
  %110 = call i16** @__ctype_b_loc() #10
  %111 = load i16*, i16** %110, align 4
  %112 = load i32, i32* %4, align 4
  %113 = getelementptr inbounds i16, i16* %111, i32 %112
  %114 = load i16, i16* %113, align 2
  %115 = zext i16 %114 to i32
  %116 = and i32 %115, 1
  %117 = icmp ne i32 %116, 0
  br label %118

118:                                              ; preds = %109, %106
  %119 = phi i1 [ false, %106 ], [ %117, %109 ]
  br i1 %119, label %104, label %120

120:                                              ; preds = %118
  %121 = load i32, i32* %4, align 4
  call void @savchar(i32 %121)
  store i32 1, i32* %2, align 4
  br label %127

122:                                              ; preds = %98
  %123 = load i32, i32* %4, align 4
  call void @savchar(i32 %123)
  br label %124

124:                                              ; preds = %122
  br label %125

125:                                              ; preds = %124
  br label %126

126:                                              ; preds = %125
  store i32 0, i32* %2, align 4
  br label %127

127:                                              ; preds = %126, %120, %96, %55
  %128 = load i32, i32* %2, align 4
  ret i32 %128
}

; Function Attrs: noinline nounwind optnone
define dso_local void @bad_prog(i8*) #0 {
  %2 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %3 = load i32, i32* @prog_line, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %12

5:                                                ; preds = %1
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %7 = load i8*, i8** @myname, align 4
  %8 = load i8*, i8** @prog_name, align 4
  %9 = load i32, i32* @prog_line, align 4
  %10 = load i8*, i8** %2, align 4
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.21, i32 0, i32 0), i8* %7, i8* %8, i32 %9, i8* %10)
  br label %17

12:                                               ; preds = %1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %14 = load i8*, i8** @myname, align 4
  %15 = load i8*, i8** %2, align 4
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0), i8* %14, i8* %15)
  br label %17

17:                                               ; preds = %12, %5
  call void @exit(i32 1) #9
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @init_buffer() #0 {
  %1 = alloca %struct.buffer*, align 4
  %2 = call i8* @ck_malloc(i32 12)
  %3 = bitcast i8* %2 to %struct.buffer*
  store %struct.buffer* %3, %struct.buffer** %1, align 4
  %4 = load %struct.buffer*, %struct.buffer** %1, align 4
  %5 = getelementptr inbounds %struct.buffer, %struct.buffer* %4, i32 0, i32 0
  store i32 50, i32* %5, align 4
  %6 = call i8* @ck_malloc(i32 50)
  %7 = load %struct.buffer*, %struct.buffer** %1, align 4
  %8 = getelementptr inbounds %struct.buffer, %struct.buffer* %7, i32 0, i32 2
  store i8* %6, i8** %8, align 4
  %9 = load %struct.buffer*, %struct.buffer** %1, align 4
  %10 = getelementptr inbounds %struct.buffer, %struct.buffer* %9, i32 0, i32 1
  store i32 0, i32* %10, align 4
  %11 = load %struct.buffer*, %struct.buffer** %1, align 4
  %12 = bitcast %struct.buffer* %11 to i8*
  ret i8* %12
}

; Function Attrs: noinline nounwind optnone
define dso_local void @add1_buffer(i8*, i32) #0 {
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.buffer*, align 4
  store i8* %0, i8** %3, align 4
  store i32 %1, i32* %4, align 4
  %6 = load i8*, i8** %3, align 4
  %7 = bitcast i8* %6 to %struct.buffer*
  store %struct.buffer* %7, %struct.buffer** %5, align 4
  %8 = load %struct.buffer*, %struct.buffer** %5, align 4
  %9 = getelementptr inbounds %struct.buffer, %struct.buffer* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = add nsw i32 %10, 1
  %12 = load %struct.buffer*, %struct.buffer** %5, align 4
  %13 = getelementptr inbounds %struct.buffer, %struct.buffer* %12, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = icmp sgt i32 %11, %14
  br i1 %15, label %16, label %30

16:                                               ; preds = %2
  %17 = load %struct.buffer*, %struct.buffer** %5, align 4
  %18 = getelementptr inbounds %struct.buffer, %struct.buffer* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, i32* %18, align 4
  %21 = load %struct.buffer*, %struct.buffer** %5, align 4
  %22 = getelementptr inbounds %struct.buffer, %struct.buffer* %21, i32 0, i32 2
  %23 = load i8*, i8** %22, align 4
  %24 = load %struct.buffer*, %struct.buffer** %5, align 4
  %25 = getelementptr inbounds %struct.buffer, %struct.buffer* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 4
  %27 = call i8* @ck_realloc(i8* %23, i32 %26)
  %28 = load %struct.buffer*, %struct.buffer** %5, align 4
  %29 = getelementptr inbounds %struct.buffer, %struct.buffer* %28, i32 0, i32 2
  store i8* %27, i8** %29, align 4
  br label %30

30:                                               ; preds = %16, %2
  %31 = load i32, i32* %4, align 4
  %32 = trunc i32 %31 to i8
  %33 = load %struct.buffer*, %struct.buffer** %5, align 4
  %34 = getelementptr inbounds %struct.buffer, %struct.buffer* %33, i32 0, i32 2
  %35 = load i8*, i8** %34, align 4
  %36 = load %struct.buffer*, %struct.buffer** %5, align 4
  %37 = getelementptr inbounds %struct.buffer, %struct.buffer* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds i8, i8* %35, i32 %38
  store i8 %32, i8* %39, align 1
  %40 = load %struct.buffer*, %struct.buffer** %5, align 4
  %41 = getelementptr inbounds %struct.buffer, %struct.buffer* %40, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %41, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @size_buffer(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca %struct.buffer*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = bitcast i8* %4 to %struct.buffer*
  store %struct.buffer* %5, %struct.buffer** %3, align 4
  %6 = load %struct.buffer*, %struct.buffer** %3, align 4
  %7 = getelementptr inbounds %struct.buffer, %struct.buffer* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  ret i32 %8
}

; Function Attrs: nounwind
declare dso_local void @bcopy(i8*, i8*, i32) #3

; Function Attrs: noinline nounwind optnone
define dso_local i8* @get_buffer(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca %struct.buffer*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = bitcast i8* %4 to %struct.buffer*
  store %struct.buffer* %5, %struct.buffer** %3, align 4
  %6 = load %struct.buffer*, %struct.buffer** %3, align 4
  %7 = getelementptr inbounds %struct.buffer, %struct.buffer* %6, i32 0, i32 2
  %8 = load i8*, i8** %7, align 4
  ret i8* %8
}

; Function Attrs: noinline nounwind optnone
define dso_local void @flush_buffer(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca %struct.buffer*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = bitcast i8* %4 to %struct.buffer*
  store %struct.buffer* %5, %struct.buffer** %3, align 4
  %6 = load %struct.buffer*, %struct.buffer** %3, align 4
  %7 = getelementptr inbounds %struct.buffer, %struct.buffer* %6, i32 0, i32 2
  %8 = load i8*, i8** %7, align 4
  call void @free(i8* %8) #7
  %9 = load %struct.buffer*, %struct.buffer** %3, align 4
  %10 = getelementptr inbounds %struct.buffer, %struct.buffer* %9, i32 0, i32 2
  store i8* null, i8** %10, align 4
  %11 = load %struct.buffer*, %struct.buffer** %3, align 4
  %12 = getelementptr inbounds %struct.buffer, %struct.buffer* %11, i32 0, i32 0
  store i32 0, i32* %12, align 4
  %13 = load %struct.buffer*, %struct.buffer** %3, align 4
  %14 = getelementptr inbounds %struct.buffer, %struct.buffer* %13, i32 0, i32 1
  store i32 0, i32* %14, align 4
  %15 = load %struct.buffer*, %struct.buffer** %3, align 4
  %16 = bitcast %struct.buffer* %15 to i8*
  call void @free(i8* %16) #7
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local %struct.sed_label* @setup_jump(%struct.sed_label*, %struct.sed_cmd*, %struct.vector*) #0 {
  %4 = alloca %struct.sed_label*, align 4
  %5 = alloca %struct.sed_cmd*, align 4
  %6 = alloca %struct.vector*, align 4
  %7 = alloca %struct.sed_label*, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i32, align 4
  store %struct.sed_label* %0, %struct.sed_label** %4, align 4
  store %struct.sed_cmd* %1, %struct.sed_cmd** %5, align 4
  store %struct.vector* %2, %struct.vector** %6, align 4
  %10 = call i8* @init_buffer()
  store i8* %10, i8** %8, align 4
  br label %11

11:                                               ; preds = %25, %3
  %12 = call i32 @inchar()
  store i32 %12, i32* %9, align 4
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %14, label %23

14:                                               ; preds = %11
  %15 = call i16** @__ctype_b_loc() #10
  %16 = load i16*, i16** %15, align 4
  %17 = load i32, i32* %9, align 4
  %18 = getelementptr inbounds i16, i16* %16, i32 %17
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = and i32 %20, 1
  %22 = icmp ne i32 %21, 0
  br label %23

23:                                               ; preds = %14, %11
  %24 = phi i1 [ false, %11 ], [ %22, %14 ]
  br i1 %24, label %25, label %26

25:                                               ; preds = %23
  br label %11

26:                                               ; preds = %23
  br label %27

27:                                               ; preds = %50, %26
  %28 = load i32, i32* %9, align 4
  %29 = icmp ne i32 %28, -1
  br i1 %29, label %30, label %48

30:                                               ; preds = %27
  %31 = load i32, i32* %9, align 4
  %32 = icmp ne i32 %31, 10
  br i1 %32, label %33, label %48

33:                                               ; preds = %30
  %34 = call i16** @__ctype_b_loc() #10
  %35 = load i16*, i16** %34, align 4
  %36 = load i32, i32* %9, align 4
  %37 = getelementptr inbounds i16, i16* %35, i32 %36
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = and i32 %39, 1
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %48, label %42

42:                                               ; preds = %33
  %43 = load i32, i32* %9, align 4
  %44 = icmp ne i32 %43, 59
  br i1 %44, label %45, label %48

45:                                               ; preds = %42
  %46 = load i32, i32* %9, align 4
  %47 = icmp ne i32 %46, 125
  br label %48

48:                                               ; preds = %45, %42, %33, %30, %27
  %49 = phi i1 [ false, %42 ], [ false, %33 ], [ false, %30 ], [ false, %27 ], [ %47, %45 ]
  br i1 %49, label %50, label %54

50:                                               ; preds = %48
  %51 = load i8*, i8** %8, align 4
  %52 = load i32, i32* %9, align 4
  call void @add1_buffer(i8* %51, i32 %52)
  %53 = call i32 @inchar()
  store i32 %53, i32* %9, align 4
  br label %27

54:                                               ; preds = %48
  %55 = load i32, i32* %9, align 4
  call void @savchar(i32 %55)
  %56 = load i8*, i8** %8, align 4
  call void @add1_buffer(i8* %56, i32 0)
  %57 = call i8* @ck_malloc(i32 16)
  %58 = bitcast i8* %57 to %struct.sed_label*
  store %struct.sed_label* %58, %struct.sed_label** %7, align 4
  %59 = load %struct.vector*, %struct.vector** %6, align 4
  %60 = load %struct.sed_label*, %struct.sed_label** %7, align 4
  %61 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %60, i32 0, i32 0
  store %struct.vector* %59, %struct.vector** %61, align 4
  %62 = load %struct.sed_cmd*, %struct.sed_cmd** %5, align 4
  %63 = load %struct.vector*, %struct.vector** %6, align 4
  %64 = getelementptr inbounds %struct.vector, %struct.vector* %63, i32 0, i32 0
  %65 = load %struct.sed_cmd*, %struct.sed_cmd** %64, align 4
  %66 = ptrtoint %struct.sed_cmd* %62 to i32
  %67 = ptrtoint %struct.sed_cmd* %65 to i32
  %68 = sub i32 %66, %67
  %69 = sdiv exact i32 %68, 56
  %70 = load %struct.sed_label*, %struct.sed_label** %7, align 4
  %71 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %70, i32 0, i32 1
  store i32 %69, i32* %71, align 4
  %72 = load i8*, i8** %8, align 4
  %73 = call i8* @get_buffer(i8* %72)
  %74 = call i8* @ck_strdup(i8* %73)
  %75 = load %struct.sed_label*, %struct.sed_label** %7, align 4
  %76 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %75, i32 0, i32 2
  store i8* %74, i8** %76, align 4
  %77 = load %struct.sed_label*, %struct.sed_label** %4, align 4
  %78 = load %struct.sed_label*, %struct.sed_label** %7, align 4
  %79 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %78, i32 0, i32 3
  store %struct.sed_label* %77, %struct.sed_label** %79, align 4
  %80 = load i8*, i8** %8, align 4
  call void @flush_buffer(i8* %80)
  %81 = load %struct.sed_label*, %struct.sed_label** %7, align 4
  ret %struct.sed_label* %81
}

; Function Attrs: noinline nounwind optnone
define dso_local %struct._IO_FILE* @compile_filename(i32) #0 {
  %2 = alloca %struct._IO_FILE*, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %8 = call i32 @inchar()
  %9 = icmp ne i32 %8, 32
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @bad_prog(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.23, i32 0, i32 0))
  br label %11

11:                                               ; preds = %10, %1
  %12 = call i8* @init_buffer()
  store i8* %12, i8** %6, align 4
  br label %13

13:                                               ; preds = %21, %11
  %14 = call i32 @inchar()
  store i32 %14, i32* %7, align 4
  %15 = icmp ne i32 %14, -1
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = load i32, i32* %7, align 4
  %18 = icmp ne i32 %17, 10
  br label %19

19:                                               ; preds = %16, %13
  %20 = phi i1 [ false, %13 ], [ %18, %16 ]
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = load i8*, i8** %6, align 4
  %23 = load i32, i32* %7, align 4
  call void @add1_buffer(i8* %22, i32 %23)
  br label %13

24:                                               ; preds = %19
  %25 = load i8*, i8** %6, align 4
  call void @add1_buffer(i8* %25, i32 0)
  %26 = load i8*, i8** %6, align 4
  %27 = call i8* @get_buffer(i8* %26)
  store i8* %27, i8** %4, align 4
  store i32 0, i32* %5, align 4
  br label %28

28:                                               ; preds = %61, %24
  %29 = load i32, i32* %5, align 4
  %30 = icmp slt i32 %29, 32
  br i1 %30, label %31, label %64

31:                                               ; preds = %28
  %32 = load i32, i32* %5, align 4
  %33 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %32
  %34 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %33, i32 0, i32 1
  %35 = load i8*, i8** %34, align 4
  %36 = icmp ne i8* %35, null
  br i1 %36, label %38, label %37

37:                                               ; preds = %31
  br label %64

38:                                               ; preds = %31
  %39 = load i32, i32* %5, align 4
  %40 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %39
  %41 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %40, i32 0, i32 1
  %42 = load i8*, i8** %41, align 4
  %43 = load i8*, i8** %4, align 4
  %44 = call i32 @strcmp(i8* %42, i8* %43) #8
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %60, label %46

46:                                               ; preds = %38
  %47 = load i32, i32* %5, align 4
  %48 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %47
  %49 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %48, i32 0, i32 2
  %50 = load i32, i32* %49, align 4
  %51 = load i32, i32* %3, align 4
  %52 = icmp ne i32 %50, %51
  br i1 %52, label %53, label %54

53:                                               ; preds = %46
  call void @bad_prog(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.24, i32 0, i32 0))
  br label %54

54:                                               ; preds = %53, %46
  %55 = load i8*, i8** %6, align 4
  call void @flush_buffer(i8* %55)
  %56 = load i32, i32* %5, align 4
  %57 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %56
  %58 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %57, i32 0, i32 0
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** %58, align 4
  store %struct._IO_FILE* %59, %struct._IO_FILE** %2, align 4
  br label %98

60:                                               ; preds = %38
  br label %61

61:                                               ; preds = %60
  %62 = load i32, i32* %5, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %5, align 4
  br label %28

64:                                               ; preds = %37, %28
  %65 = load i32, i32* %5, align 4
  %66 = icmp slt i32 %65, 32
  br i1 %66, label %67, label %97

67:                                               ; preds = %64
  %68 = load i8*, i8** %4, align 4
  %69 = call i8* @ck_strdup(i8* %68)
  %70 = load i32, i32* %5, align 4
  %71 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %70
  %72 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %71, i32 0, i32 1
  store i8* %69, i8** %72, align 4
  %73 = load i32, i32* %3, align 4
  %74 = load i32, i32* %5, align 4
  %75 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %74
  %76 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %75, i32 0, i32 2
  store i32 %73, i32* %76, align 4
  %77 = load i32, i32* %3, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %85, label %79

79:                                               ; preds = %67
  %80 = load i8*, i8** %4, align 4
  %81 = call %struct._IO_FILE* @ck_fopen(i8* %80, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i32 0, i32 0))
  %82 = load i32, i32* %5, align 4
  %83 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %82
  %84 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %83, i32 0, i32 0
  store %struct._IO_FILE* %81, %struct._IO_FILE** %84, align 4
  br label %91

85:                                               ; preds = %67
  %86 = load i8*, i8** %4, align 4
  %87 = call %struct._IO_FILE* @ck_fopen(i8* %86, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  %88 = load i32, i32* %5, align 4
  %89 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %88
  %90 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %89, i32 0, i32 0
  store %struct._IO_FILE* %87, %struct._IO_FILE** %90, align 4
  br label %91

91:                                               ; preds = %85, %79
  %92 = load i8*, i8** %6, align 4
  call void @flush_buffer(i8* %92)
  %93 = load i32, i32* %5, align 4
  %94 = getelementptr inbounds [32 x %struct.anon.1], [32 x %struct.anon.1]* @file_ptrs, i32 0, i32 %93
  %95 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %94, i32 0, i32 0
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** %95, align 4
  store %struct._IO_FILE* %96, %struct._IO_FILE** %2, align 4
  br label %98

97:                                               ; preds = %64
  call void @bad_prog(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.26, i32 0, i32 0))
  store %struct._IO_FILE* null, %struct._IO_FILE** %2, align 4
  br label %98

98:                                               ; preds = %97, %91, %54
  %99 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 4
  ret %struct._IO_FILE* %99
}

; Function Attrs: noinline nounwind optnone
define dso_local void @compile_regex(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  store i32 -1, i32* %5, align 4
  %8 = call i8* @init_buffer()
  store i8* %8, i8** %3, align 4
  br label %9

9:                                                ; preds = %120, %103, %96, %61, %51, %36, %1
  %10 = call i32 @inchar()
  store i32 %10, i32* %4, align 4
  %11 = icmp ne i32 %10, -1
  br i1 %11, label %12, label %21

12:                                               ; preds = %9
  %13 = load i32, i32* %4, align 4
  %14 = load i32, i32* %2, align 4
  %15 = icmp ne i32 %13, %14
  br i1 %15, label %19, label %16

16:                                               ; preds = %12
  %17 = load i32, i32* %5, align 4
  %18 = icmp sge i32 %17, 0
  br label %19

19:                                               ; preds = %16, %12
  %20 = phi i1 [ true, %12 ], [ %18, %16 ]
  br label %21

21:                                               ; preds = %19, %9
  %22 = phi i1 [ false, %9 ], [ %20, %19 ]
  br i1 %22, label %23, label %121

23:                                               ; preds = %21
  %24 = load i32, i32* %4, align 4
  %25 = icmp eq i32 %24, 94
  br i1 %25, label %26, label %37

26:                                               ; preds = %23
  %27 = load i8*, i8** %3, align 4
  %28 = call i32 @size_buffer(i8* %27)
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %33

30:                                               ; preds = %26
  %31 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %31, i32 92)
  %32 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %32, i32 96)
  br label %36

33:                                               ; preds = %26
  %34 = load i8*, i8** %3, align 4
  %35 = load i32, i32* %4, align 4
  call void @add1_buffer(i8* %34, i32 %35)
  br label %36

36:                                               ; preds = %33, %30
  br label %9

37:                                               ; preds = %23
  %38 = load i32, i32* %4, align 4
  %39 = icmp eq i32 %38, 36
  br i1 %39, label %40, label %52

40:                                               ; preds = %37
  %41 = call i32 @inchar()
  store i32 %41, i32* %4, align 4
  %42 = load i32, i32* %4, align 4
  call void @savchar(i32 %42)
  %43 = load i32, i32* %4, align 4
  %44 = load i32, i32* %2, align 4
  %45 = icmp eq i32 %43, %44
  br i1 %45, label %46, label %49

46:                                               ; preds = %40
  %47 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %47, i32 92)
  %48 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %48, i32 39)
  br label %51

49:                                               ; preds = %40
  %50 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %50, i32 36)
  br label %51

51:                                               ; preds = %49, %46
  br label %9

52:                                               ; preds = %37
  %53 = load i32, i32* %4, align 4
  %54 = icmp eq i32 %53, 91
  br i1 %54, label %55, label %64

55:                                               ; preds = %52
  %56 = load i32, i32* %5, align 4
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = load i8*, i8** %3, align 4
  %60 = call i32 @size_buffer(i8* %59)
  store i32 %60, i32* %5, align 4
  br label %61

61:                                               ; preds = %58, %55
  %62 = load i8*, i8** %3, align 4
  %63 = load i32, i32* %4, align 4
  call void @add1_buffer(i8* %62, i32 %63)
  br label %9

64:                                               ; preds = %52
  %65 = load i32, i32* %4, align 4
  %66 = icmp eq i32 %65, 93
  br i1 %66, label %67, label %97

67:                                               ; preds = %64
  %68 = load i8*, i8** %3, align 4
  %69 = load i32, i32* %4, align 4
  call void @add1_buffer(i8* %68, i32 %69)
  %70 = load i8*, i8** %3, align 4
  %71 = call i8* @get_buffer(i8* %70)
  store i8* %71, i8** %6, align 4
  %72 = load i8*, i8** %3, align 4
  %73 = call i32 @size_buffer(i8* %72)
  %74 = sub nsw i32 %73, 1
  store i32 %74, i32* %7, align 4
  %75 = load i32, i32* %5, align 4
  %76 = icmp sge i32 %75, 0
  br i1 %76, label %77, label %95

77:                                               ; preds = %67
  %78 = load i32, i32* %7, align 4
  %79 = load i32, i32* %5, align 4
  %80 = add nsw i32 %79, 1
  %81 = icmp eq i32 %78, %80
  br i1 %81, label %96, label %82

82:                                               ; preds = %77
  %83 = load i32, i32* %7, align 4
  %84 = load i32, i32* %5, align 4
  %85 = add nsw i32 %84, 2
  %86 = icmp eq i32 %83, %85
  br i1 %86, label %87, label %95

87:                                               ; preds = %82
  %88 = load i8*, i8** %6, align 4
  %89 = load i32, i32* %5, align 4
  %90 = add nsw i32 %89, 1
  %91 = getelementptr inbounds i8, i8* %88, i32 %90
  %92 = load i8, i8* %91, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %93, 94
  br i1 %94, label %96, label %95

95:                                               ; preds = %87, %82, %67
  store i32 -1, i32* %5, align 4
  br label %96

96:                                               ; preds = %95, %87, %77
  br label %9

97:                                               ; preds = %64
  %98 = load i32, i32* %4, align 4
  %99 = icmp ne i32 %98, 92
  br i1 %99, label %103, label %100

100:                                              ; preds = %97
  %101 = load i32, i32* %5, align 4
  %102 = icmp sge i32 %101, 0
  br i1 %102, label %103, label %106

103:                                              ; preds = %100, %97
  %104 = load i8*, i8** %3, align 4
  %105 = load i32, i32* %4, align 4
  call void @add1_buffer(i8* %104, i32 %105)
  br label %9

106:                                              ; preds = %100
  br label %107

107:                                              ; preds = %106
  br label %108

108:                                              ; preds = %107
  br label %109

109:                                              ; preds = %108
  br label %110

110:                                              ; preds = %109
  %111 = call i32 @inchar()
  store i32 %111, i32* %4, align 4
  %112 = load i32, i32* %4, align 4
  switch i32 %112, label %116 [
    i32 110, label %113
    i32 -1, label %115
  ]

113:                                              ; preds = %110
  %114 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %114, i32 10)
  br label %120

115:                                              ; preds = %110
  br label %120

116:                                              ; preds = %110
  %117 = load i8*, i8** %3, align 4
  call void @add1_buffer(i8* %117, i32 92)
  %118 = load i8*, i8** %3, align 4
  %119 = load i32, i32* %4, align 4
  call void @add1_buffer(i8* %118, i32 %119)
  br label %120

120:                                              ; preds = %116, %115, %113
  br label %9

121:                                              ; preds = %21
  %122 = load i32, i32* %4, align 4
  %123 = icmp eq i32 %122, -1
  br i1 %123, label %124, label %125

124:                                              ; preds = %121
  call void @bad_prog(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @BAD_EOF, i32 0, i32 0))
  br label %125

125:                                              ; preds = %124, %121
  %126 = load i8*, i8** %3, align 4
  %127 = call i32 @size_buffer(i8* %126)
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %154

129:                                              ; preds = %125
  %130 = call i8* @ck_malloc(i32 32)
  %131 = bitcast i8* %130 to %struct.re_pattern_buffer*
  store %struct.re_pattern_buffer* %131, %struct.re_pattern_buffer** @last_regex, align 4
  %132 = load i8*, i8** %3, align 4
  %133 = call i32 @size_buffer(i8* %132)
  %134 = add nsw i32 %133, 10
  %135 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %136 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %135, i32 0, i32 1
  store i32 %134, i32* %136, align 4
  %137 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %138 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %137, i32 0, i32 1
  %139 = load i32, i32* %138, align 4
  %140 = call i8* @ck_malloc(i32 %139)
  %141 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %142 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %141, i32 0, i32 0
  store i8* %140, i8** %142, align 4
  %143 = call i8* @ck_malloc(i32 256)
  %144 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %145 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %144, i32 0, i32 4
  store i8* %143, i8** %145, align 4
  %146 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %147 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %146, i32 0, i32 5
  store i8* null, i8** %147, align 4
  %148 = load i8*, i8** %3, align 4
  %149 = call i8* @get_buffer(i8* %148)
  %150 = load i8*, i8** %3, align 4
  %151 = call i32 @size_buffer(i8* %150)
  %152 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %153 = call i8* @re_compile_pattern(i8* %149, i32 %151, %struct.re_pattern_buffer* %152)
  br label %159

154:                                              ; preds = %125
  %155 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** @last_regex, align 4
  %156 = icmp ne %struct.re_pattern_buffer* %155, null
  br i1 %156, label %158, label %157

157:                                              ; preds = %154
  call void @bad_prog(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @NO_REGEX, i32 0, i32 0))
  br label %158

158:                                              ; preds = %157, %154
  br label %159

159:                                              ; preds = %158, %129
  %160 = load i8*, i8** %3, align 4
  call void @flush_buffer(i8* %160)
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone
define dso_local i8* @re_compile_pattern(i8*, i32, %struct.re_pattern_buffer*) #0 {
  %4 = alloca i8*, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.re_pattern_buffer*, align 4
  %7 = alloca i32, align 4
  store i8* %0, i8** %4, align 4
  store i32 %1, i32* %5, align 4
  store %struct.re_pattern_buffer* %2, %struct.re_pattern_buffer** %6, align 4
  %8 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %9 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %8, i32 0, i32 7
  %10 = load i8, i8* %9, align 4
  %11 = and i8 %10, -7
  store i8 %11, i8* %9, align 4
  %12 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %13 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %12, i32 0, i32 7
  %14 = load i8, i8* %13, align 4
  %15 = and i8 %14, -17
  store i8 %15, i8* %13, align 4
  %16 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %17 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %16, i32 0, i32 7
  %18 = load i8, i8* %17, align 4
  %19 = and i8 %18, 127
  %20 = or i8 %19, -128
  store i8 %20, i8* %17, align 4
  %21 = load i8*, i8** %4, align 4
  %22 = load i32, i32* %5, align 4
  %23 = load i32, i32* @re_syntax_options, align 4
  %24 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %25 = call i32 @regex_compile(i8* %21, i32 %22, i32 %23, %struct.re_pattern_buffer* %24)
  store i32 %25, i32* %7, align 4
  %26 = load i32, i32* %7, align 4
  %27 = getelementptr inbounds [17 x i8*], [17 x i8*]* @re_error_msg, i32 0, i32 %26
  %28 = load i8*, i8** %27, align 4
  ret i8* %28
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @ck_strdup(i8*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %4 = load i8*, i8** %2, align 4
  %5 = call i32 @strlen(i8* %4) #8
  %6 = add i32 %5, 2
  %7 = call i8* @ck_malloc(i32 %6)
  store i8* %7, i8** %3, align 4
  %8 = load i8*, i8** %3, align 4
  %9 = load i8*, i8** %2, align 4
  %10 = call i8* @strcpy(i8* %8, i8* %9) #7
  %11 = load i8*, i8** %3, align 4
  ret i8* %11
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare dso_local i8* @strerror(i32) #3

; Function Attrs: nounwind readnone
declare dso_local i32* @__errno_location() #5

; Function Attrs: noinline nounwind optnone
define dso_local i32 @read_pattern_space() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca i32, align 4
  %5 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  store i8* %5, i8** %3, align 4
  %6 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  store i32 %6, i32* %2, align 4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %8 = call i32 @feof(%struct._IO_FILE* %7) #7
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %0
  store i32 0, i32* %1, align 4
  br label %79

11:                                               ; preds = %0
  %12 = load i32, i32* @input_line_number, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @input_line_number, align 4
  store i32 0, i32* @replaced, align 4
  br label %14

14:                                               ; preds = %61, %11
  %15 = load i32, i32* %2, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %28

17:                                               ; preds = %14
  %18 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %19 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %20 = mul nsw i32 %19, 2
  %21 = call i8* @ck_realloc(i8* %18, i32 %20)
  store i8* %21, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %22 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %23 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %24 = getelementptr inbounds i8, i8* %22, i32 %23
  store i8* %24, i8** %3, align 4
  %25 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  store i32 %25, i32* %2, align 4
  %26 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %27 = mul nsw i32 %26, 2
  store i32 %27, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  br label %28

28:                                               ; preds = %17, %14
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %30 = call i32 @_IO_getc(%struct._IO_FILE* %29)
  store i32 %30, i32* %4, align 4
  %31 = load i32, i32* %4, align 4
  %32 = icmp eq i32 %31, -1
  br i1 %32, label %33, label %48

33:                                               ; preds = %28
  %34 = load i32, i32* %2, align 4
  %35 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  store i32 0, i32* %1, align 4
  br label %79

38:                                               ; preds = %33
  %39 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %40 = load i32, i32* %2, align 4
  %41 = sub nsw i32 %39, %40
  store i32 %41, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %42 = load i32, i32* @last_input_file, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %38
  %45 = load i32, i32* @input_EOF, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* @input_EOF, align 4
  br label %47

47:                                               ; preds = %44, %38
  store i32 1, i32* %1, align 4
  br label %79

48:                                               ; preds = %28
  %49 = load i32, i32* %4, align 4
  %50 = trunc i32 %49 to i8
  %51 = load i8*, i8** %3, align 4
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %3, align 4
  store i8 %50, i8* %51, align 1
  %53 = load i32, i32* %2, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, i32* %2, align 4
  %55 = load i32, i32* %4, align 4
  %56 = icmp eq i32 %55, 10
  br i1 %56, label %57, label %61

57:                                               ; preds = %48
  %58 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %59 = load i32, i32* %2, align 4
  %60 = sub nsw i32 %58, %59
  store i32 %60, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  br label %62

61:                                               ; preds = %48
  br label %14

62:                                               ; preds = %57
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %64 = call i32 @_IO_getc(%struct._IO_FILE* %63)
  store i32 %64, i32* %4, align 4
  %65 = load i32, i32* %4, align 4
  %66 = icmp ne i32 %65, -1
  br i1 %66, label %67, label %71

67:                                               ; preds = %62
  %68 = load i32, i32* %4, align 4
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %70 = call i32 @ungetc(i32 %68, %struct._IO_FILE* %69)
  br label %78

71:                                               ; preds = %62
  %72 = load i32, i32* @last_input_file, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %77

74:                                               ; preds = %71
  %75 = load i32, i32* @input_EOF, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* @input_EOF, align 4
  br label %77

77:                                               ; preds = %74, %71
  br label %78

78:                                               ; preds = %77, %67
  store i32 1, i32* %1, align 4
  br label %79

79:                                               ; preds = %78, %47, %37, %10
  %80 = load i32, i32* %1, align 4
  ret i32 %80
}

; Function Attrs: noinline nounwind optnone
define dso_local void @execute_program(%struct.vector*) #0 {
  %2 = alloca %struct.vector*, align 4
  %3 = alloca %struct.sed_cmd*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.line, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i8*, align 4
  %12 = alloca i8*, align 4
  %13 = alloca i8*, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.vector*, align 4
  %16 = alloca %struct.sed_label*, align 4
  %17 = alloca i8*, align 4
  %18 = alloca i32, align 4
  %19 = alloca i8*, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i8*, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.sed_label*, align 4
  %28 = alloca %struct.line, align 4
  %29 = alloca i8*, align 4
  %30 = alloca i8*, align 4
  store %struct.vector* %0, %struct.vector** %2, align 4
  %31 = load %struct.vector*, %struct.vector** %2, align 4
  store %struct.vector* %31, %struct.vector** %15, align 4
  br label %32

32:                                               ; preds = %266, %1
  %33 = load %struct.vector*, %struct.vector** %15, align 4
  store %struct.vector* %33, %struct.vector** %2, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* @execute_program.end_cycle, align 4
  %34 = load %struct.vector*, %struct.vector** %2, align 4
  %35 = getelementptr inbounds %struct.vector, %struct.vector* %34, i32 0, i32 0
  %36 = load %struct.sed_cmd*, %struct.sed_cmd** %35, align 4
  store %struct.sed_cmd* %36, %struct.sed_cmd** %3, align 4
  %37 = load %struct.vector*, %struct.vector** %2, align 4
  %38 = getelementptr inbounds %struct.vector, %struct.vector* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %4, align 4
  br label %40

40:                                               ; preds = %900, %32
  %41 = load i32, i32* %4, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %905

43:                                               ; preds = %40
  br label %44

44:                                               ; preds = %824, %204, %119, %43
  store i32 0, i32* %5, align 4
  %45 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %46 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %45, i32 0, i32 2
  %47 = load i32, i32* %46, align 4
  %48 = and i32 %47, 1
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %61

50:                                               ; preds = %44
  store i32 1, i32* %5, align 4
  %51 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %52 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %51, i32 0, i32 1
  %53 = call i32 @match_address(%struct.addr* %52)
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %60

55:                                               ; preds = %50
  %56 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %57 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %56, i32 0, i32 2
  %58 = load i32, i32* %57, align 4
  %59 = and i32 %58, -2
  store i32 %59, i32* %57, align 4
  br label %60

60:                                               ; preds = %55, %50
  br label %91

61:                                               ; preds = %44
  %62 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %63 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %62, i32 0, i32 0
  %64 = call i32 @match_address(%struct.addr* %63)
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %90

66:                                               ; preds = %61
  store i32 1, i32* %5, align 4
  %67 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %68 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %67, i32 0, i32 1
  %69 = getelementptr inbounds %struct.addr, %struct.addr* %68, i32 0, i32 0
  %70 = load i32, i32* %69, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %89

72:                                               ; preds = %66
  %73 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %74 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %73, i32 0, i32 1
  %75 = getelementptr inbounds %struct.addr, %struct.addr* %74, i32 0, i32 0
  %76 = load i32, i32* %75, align 4
  %77 = icmp eq i32 %76, 2
  br i1 %77, label %83, label %78

78:                                               ; preds = %72
  %79 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %80 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %79, i32 0, i32 1
  %81 = call i32 @match_address(%struct.addr* %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %88, label %83

83:                                               ; preds = %78, %72
  %84 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %85 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %84, i32 0, i32 2
  %86 = load i32, i32* %85, align 4
  %87 = or i32 %86, 1
  store i32 %87, i32* %85, align 4
  br label %88

88:                                               ; preds = %83, %78
  br label %89

89:                                               ; preds = %88, %66
  br label %90

90:                                               ; preds = %89, %61
  br label %91

91:                                               ; preds = %90, %60
  %92 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %93 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %92, i32 0, i32 2
  %94 = load i32, i32* %93, align 4
  %95 = and i32 %94, 2
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %102

97:                                               ; preds = %91
  %98 = load i32, i32* %5, align 4
  %99 = icmp ne i32 %98, 0
  %100 = xor i1 %99, true
  %101 = zext i1 %100 to i32
  store i32 %101, i32* %5, align 4
  br label %102

102:                                              ; preds = %97, %91
  %103 = load i32, i32* %5, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %106, label %105

105:                                              ; preds = %102
  br label %900

106:                                              ; preds = %102
  %107 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %108 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %107, i32 0, i32 3
  %109 = load i8, i8* %108, align 4
  %110 = sext i8 %109 to i32
  switch i32 %110, label %890 [
    i32 123, label %111
    i32 125, label %131
    i32 58, label %153
    i32 61, label %154
    i32 97, label %157
    i32 98, label %195
    i32 99, label %228
    i32 100, label %249
    i32 68, label %252
    i32 103, label %275
    i32 71, label %276
    i32 104, label %277
    i32 72, label %278
    i32 105, label %279
    i32 108, label %291
    i32 110, label %386
    i32 78, label %400
    i32 112, label %406
    i32 80, label %410
    i32 113, label %429
    i32 114, label %435
    i32 115, label %484
    i32 116, label %812
    i32 119, label %849
    i32 120, label %863
    i32 121, label %866
  ]

111:                                              ; preds = %106
  %112 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %113 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %112, i32 0, i32 4
  %114 = bitcast %union.anon* %113 to %struct.vector**
  %115 = load %struct.vector*, %struct.vector** %114, align 4
  %116 = getelementptr inbounds %struct.vector, %struct.vector* %115, i32 0, i32 1
  %117 = load i32, i32* %116, align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %130

119:                                              ; preds = %111
  %120 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %121 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %120, i32 0, i32 4
  %122 = bitcast %union.anon* %121 to %struct.vector**
  %123 = load %struct.vector*, %struct.vector** %122, align 4
  store %struct.vector* %123, %struct.vector** %2, align 4
  %124 = load %struct.vector*, %struct.vector** %2, align 4
  %125 = getelementptr inbounds %struct.vector, %struct.vector* %124, i32 0, i32 0
  %126 = load %struct.sed_cmd*, %struct.sed_cmd** %125, align 4
  store %struct.sed_cmd* %126, %struct.sed_cmd** %3, align 4
  %127 = load %struct.vector*, %struct.vector** %2, align 4
  %128 = getelementptr inbounds %struct.vector, %struct.vector* %127, i32 0, i32 1
  %129 = load i32, i32* %128, align 4
  store i32 %129, i32* %4, align 4
  br label %44

130:                                              ; preds = %111
  br label %895

131:                                              ; preds = %106
  %132 = load %struct.vector*, %struct.vector** %2, align 4
  %133 = getelementptr inbounds %struct.vector, %struct.vector* %132, i32 0, i32 3
  %134 = load %struct.vector*, %struct.vector** %133, align 4
  %135 = getelementptr inbounds %struct.vector, %struct.vector* %134, i32 0, i32 0
  %136 = load %struct.sed_cmd*, %struct.sed_cmd** %135, align 4
  %137 = load %struct.vector*, %struct.vector** %2, align 4
  %138 = getelementptr inbounds %struct.vector, %struct.vector* %137, i32 0, i32 4
  %139 = load i32, i32* %138, align 4
  %140 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %136, i32 %139
  store %struct.sed_cmd* %140, %struct.sed_cmd** %3, align 4
  %141 = load %struct.vector*, %struct.vector** %2, align 4
  %142 = getelementptr inbounds %struct.vector, %struct.vector* %141, i32 0, i32 3
  %143 = load %struct.vector*, %struct.vector** %142, align 4
  %144 = getelementptr inbounds %struct.vector, %struct.vector* %143, i32 0, i32 1
  %145 = load i32, i32* %144, align 4
  %146 = load %struct.vector*, %struct.vector** %2, align 4
  %147 = getelementptr inbounds %struct.vector, %struct.vector* %146, i32 0, i32 4
  %148 = load i32, i32* %147, align 4
  %149 = sub nsw i32 %145, %148
  store i32 %149, i32* %4, align 4
  %150 = load %struct.vector*, %struct.vector** %2, align 4
  %151 = getelementptr inbounds %struct.vector, %struct.vector* %150, i32 0, i32 3
  %152 = load %struct.vector*, %struct.vector** %151, align 4
  store %struct.vector* %152, %struct.vector** %2, align 4
  br label %895

153:                                              ; preds = %106
  br label %895

154:                                              ; preds = %106
  %155 = load i32, i32* @input_line_number, align 4
  %156 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.28, i32 0, i32 0), i32 %155)
  br label %895

157:                                              ; preds = %106
  br label %158

158:                                              ; preds = %168, %157
  %159 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %160 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %161 = sub nsw i32 %159, %160
  %162 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %163 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %162, i32 0, i32 4
  %164 = bitcast %union.anon* %163 to %struct.anon*
  %165 = getelementptr inbounds %struct.anon, %struct.anon* %164, i32 0, i32 1
  %166 = load i32, i32* %165, align 4
  %167 = icmp slt i32 %161, %166
  br i1 %167, label %168, label %174

168:                                              ; preds = %158
  %169 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %170 = mul nsw i32 %169, 2
  store i32 %170, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %171 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  %172 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %173 = call i8* @ck_realloc(i8* %171, i32 %172)
  store i8* %173, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  br label %158

174:                                              ; preds = %158
  %175 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %176 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %175, i32 0, i32 4
  %177 = bitcast %union.anon* %176 to %struct.anon*
  %178 = getelementptr inbounds %struct.anon, %struct.anon* %177, i32 0, i32 0
  %179 = load i8*, i8** %178, align 4
  %180 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  %181 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %182 = getelementptr inbounds i8, i8* %180, i32 %181
  %183 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %184 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %183, i32 0, i32 4
  %185 = bitcast %union.anon* %184 to %struct.anon*
  %186 = getelementptr inbounds %struct.anon, %struct.anon* %185, i32 0, i32 1
  %187 = load i32, i32* %186, align 4
  call void @bcopy(i8* %179, i8* %182, i32 %187) #7
  %188 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %189 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %188, i32 0, i32 4
  %190 = bitcast %union.anon* %189 to %struct.anon*
  %191 = getelementptr inbounds %struct.anon, %struct.anon* %190, i32 0, i32 1
  %192 = load i32, i32* %191, align 4
  %193 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %194 = add nsw i32 %193, %192
  store i32 %194, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  br label %895

195:                                              ; preds = %106
  %196 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %197 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %196, i32 0, i32 4
  %198 = bitcast %union.anon* %197 to %struct.sed_label**
  %199 = load %struct.sed_label*, %struct.sed_label** %198, align 4
  %200 = icmp ne %struct.sed_label* %199, null
  br i1 %200, label %204, label %201

201:                                              ; preds = %195
  %202 = load i32, i32* @execute_program.end_cycle, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* @execute_program.end_cycle, align 4
  br label %227

204:                                              ; preds = %195
  %205 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %206 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %205, i32 0, i32 4
  %207 = bitcast %union.anon* %206 to %struct.sed_label**
  %208 = load %struct.sed_label*, %struct.sed_label** %207, align 4
  store %struct.sed_label* %208, %struct.sed_label** %16, align 4
  %209 = load %struct.sed_label*, %struct.sed_label** %16, align 4
  %210 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %209, i32 0, i32 0
  %211 = load %struct.vector*, %struct.vector** %210, align 4
  %212 = getelementptr inbounds %struct.vector, %struct.vector* %211, i32 0, i32 1
  %213 = load i32, i32* %212, align 4
  %214 = load %struct.sed_label*, %struct.sed_label** %16, align 4
  %215 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %214, i32 0, i32 1
  %216 = load i32, i32* %215, align 4
  %217 = sub nsw i32 %213, %216
  store i32 %217, i32* %4, align 4
  %218 = load %struct.sed_label*, %struct.sed_label** %16, align 4
  %219 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %218, i32 0, i32 0
  %220 = load %struct.vector*, %struct.vector** %219, align 4
  %221 = getelementptr inbounds %struct.vector, %struct.vector* %220, i32 0, i32 0
  %222 = load %struct.sed_cmd*, %struct.sed_cmd** %221, align 4
  %223 = load %struct.sed_label*, %struct.sed_label** %16, align 4
  %224 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %223, i32 0, i32 1
  %225 = load i32, i32* %224, align 4
  %226 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %222, i32 %225
  store %struct.sed_cmd* %226, %struct.sed_cmd** %3, align 4
  br label %44

227:                                              ; preds = %201
  br label %895

228:                                              ; preds = %106
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %229 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %230 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %229, i32 0, i32 2
  %231 = load i32, i32* %230, align 4
  %232 = and i32 %231, 1
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %246, label %234

234:                                              ; preds = %228
  %235 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %236 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %235, i32 0, i32 4
  %237 = bitcast %union.anon* %236 to %struct.anon*
  %238 = getelementptr inbounds %struct.anon, %struct.anon* %237, i32 0, i32 0
  %239 = load i8*, i8** %238, align 4
  %240 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %241 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %240, i32 0, i32 4
  %242 = bitcast %union.anon* %241 to %struct.anon*
  %243 = getelementptr inbounds %struct.anon, %struct.anon* %242, i32 0, i32 1
  %244 = load i32, i32* %243, align 4
  %245 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %239, i32 1, i32 %244, %struct._IO_FILE* %245)
  br label %246

246:                                              ; preds = %234, %228
  %247 = load i32, i32* @execute_program.end_cycle, align 4
  %248 = add nsw i32 %247, 1
  store i32 %248, i32* @execute_program.end_cycle, align 4
  br label %895

249:                                              ; preds = %106
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %250 = load i32, i32* @execute_program.end_cycle, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* @execute_program.end_cycle, align 4
  br label %895

252:                                              ; preds = %106
  %253 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %254 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %255 = call i8* @eol_pos(i8* %253, i32 %254)
  store i8* %255, i8** %17, align 4
  %256 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %257 = load i8*, i8** %17, align 4
  %258 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %259 = ptrtoint i8* %257 to i32
  %260 = ptrtoint i8* %258 to i32
  %261 = sub i32 %259, %260
  %262 = sub nsw i32 %256, %261
  %263 = sub nsw i32 %262, 1
  store i32 %263, i32* %18, align 4
  %264 = load i32, i32* %18, align 4
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %266, label %272

266:                                              ; preds = %252
  %267 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %268 = load i8*, i8** %17, align 4
  %269 = getelementptr inbounds i8, i8* %268, i32 1
  %270 = load i32, i32* %18, align 4
  call void @chr_copy(i8* %267, i8* %269, i32 %270)
  %271 = load i32, i32* %18, align 4
  store i32 %271, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  br label %32

272:                                              ; preds = %252
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %273 = load i32, i32* @execute_program.end_cycle, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* @execute_program.end_cycle, align 4
  br label %895

275:                                              ; preds = %106
  call void @line_copy(%struct.line* @hold, %struct.line* @line)
  br label %895

276:                                              ; preds = %106
  call void @line_append(%struct.line* @hold, %struct.line* @line)
  br label %895

277:                                              ; preds = %106
  call void @line_copy(%struct.line* @line, %struct.line* @hold)
  br label %895

278:                                              ; preds = %106
  call void @line_append(%struct.line* @line, %struct.line* @hold)
  br label %895

279:                                              ; preds = %106
  %280 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %281 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %280, i32 0, i32 4
  %282 = bitcast %union.anon* %281 to %struct.anon*
  %283 = getelementptr inbounds %struct.anon, %struct.anon* %282, i32 0, i32 0
  %284 = load i8*, i8** %283, align 4
  %285 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %286 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %285, i32 0, i32 4
  %287 = bitcast %union.anon* %286 to %struct.anon*
  %288 = getelementptr inbounds %struct.anon, %struct.anon* %287, i32 0, i32 1
  %289 = load i32, i32* %288, align 4
  %290 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %284, i32 1, i32 %289, %struct._IO_FILE* %290)
  br label %895

291:                                              ; preds = %106
  store i32 0, i32* %21, align 4
  %292 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  store i32 %292, i32* %20, align 4
  %293 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  store i8* %293, i8** %19, align 4
  br label %294

294:                                              ; preds = %381, %291
  %295 = load i32, i32* %20, align 4
  %296 = add nsw i32 %295, -1
  store i32 %296, i32* %20, align 4
  %297 = icmp ne i32 %295, 0
  br i1 %297, label %298, label %384

298:                                              ; preds = %294
  %299 = load i32, i32* %20, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %307, label %301

301:                                              ; preds = %298
  %302 = load i8*, i8** %19, align 4
  %303 = load i8, i8* %302, align 1
  %304 = sext i8 %303 to i32
  %305 = icmp eq i32 %304, 10
  br i1 %305, label %306, label %307

306:                                              ; preds = %301
  br label %384

307:                                              ; preds = %301, %298
  %308 = load i32, i32* %21, align 4
  %309 = icmp sgt i32 %308, 77
  br i1 %309, label %310, label %312

310:                                              ; preds = %307
  store i32 0, i32* %21, align 4
  %311 = call i32 @putchar(i32 10)
  br label %312

312:                                              ; preds = %310, %307
  %313 = load i8*, i8** %19, align 4
  %314 = load i8, i8* %313, align 1
  %315 = sext i8 %314 to i32
  %316 = icmp eq i32 %315, 92
  br i1 %316, label %317, label %321

317:                                              ; preds = %312
  %318 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0))
  %319 = load i32, i32* %21, align 4
  %320 = add nsw i32 %319, 2
  store i32 %320, i32* %21, align 4
  br label %381

321:                                              ; preds = %312
  %322 = call i16** @__ctype_b_loc() #10
  %323 = load i16*, i16** %322, align 4
  %324 = load i8*, i8** %19, align 4
  %325 = load i8, i8* %324, align 1
  %326 = sext i8 %325 to i32
  %327 = getelementptr inbounds i16, i16* %323, i32 %326
  %328 = load i16, i16* %327, align 2
  %329 = zext i16 %328 to i32
  %330 = and i32 %329, 16384
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %332, label %339

332:                                              ; preds = %321
  %333 = load i8*, i8** %19, align 4
  %334 = load i8, i8* %333, align 1
  %335 = sext i8 %334 to i32
  %336 = call i32 @putchar(i32 %335)
  %337 = load i32, i32* %21, align 4
  %338 = add nsw i32 %337, 1
  store i32 %338, i32* %21, align 4
  br label %380

339:                                              ; preds = %321
  %340 = load i8*, i8** %19, align 4
  %341 = load i8, i8* %340, align 1
  %342 = sext i8 %341 to i32
  switch i32 %342, label %371 [
    i32 7, label %343
    i32 8, label %347
    i32 12, label %351
    i32 10, label %355
    i32 13, label %359
    i32 9, label %363
    i32 11, label %367
  ]

343:                                              ; preds = %339
  %344 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.30, i32 0, i32 0))
  %345 = load i32, i32* %21, align 4
  %346 = add nsw i32 %345, 2
  store i32 %346, i32* %21, align 4
  br label %379

347:                                              ; preds = %339
  %348 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0))
  %349 = load i32, i32* %21, align 4
  %350 = add nsw i32 %349, 2
  store i32 %350, i32* %21, align 4
  br label %379

351:                                              ; preds = %339
  %352 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0))
  %353 = load i32, i32* %21, align 4
  %354 = add nsw i32 %353, 2
  store i32 %354, i32* %21, align 4
  br label %379

355:                                              ; preds = %339
  %356 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0))
  %357 = load i32, i32* %21, align 4
  %358 = add nsw i32 %357, 2
  store i32 %358, i32* %21, align 4
  br label %379

359:                                              ; preds = %339
  %360 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0))
  %361 = load i32, i32* %21, align 4
  %362 = add nsw i32 %361, 2
  store i32 %362, i32* %21, align 4
  br label %379

363:                                              ; preds = %339
  %364 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0))
  %365 = load i32, i32* %21, align 4
  %366 = add nsw i32 %365, 2
  store i32 %366, i32* %21, align 4
  br label %379

367:                                              ; preds = %339
  %368 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0))
  %369 = load i32, i32* %21, align 4
  %370 = add nsw i32 %369, 2
  store i32 %370, i32* %21, align 4
  br label %379

371:                                              ; preds = %339
  %372 = load i8*, i8** %19, align 4
  %373 = load i8, i8* %372, align 1
  %374 = sext i8 %373 to i32
  %375 = and i32 %374, 255
  %376 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i32 0, i32 0), i32 %375)
  %377 = load i32, i32* %21, align 4
  %378 = add nsw i32 %377, 2
  store i32 %378, i32* %21, align 4
  br label %379

379:                                              ; preds = %371, %367, %363, %359, %355, %351, %347, %343
  br label %380

380:                                              ; preds = %379, %332
  br label %381

381:                                              ; preds = %380, %317
  %382 = load i8*, i8** %19, align 4
  %383 = getelementptr inbounds i8, i8* %382, i32 1
  store i8* %383, i8** %19, align 4
  br label %294

384:                                              ; preds = %306, %294
  %385 = call i32 @putchar(i32 10)
  br label %895

386:                                              ; preds = %106
  %387 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %388 = call i32 @feof(%struct._IO_FILE* %387) #7
  %389 = icmp ne i32 %388, 0
  br i1 %389, label %390, label %391

390:                                              ; preds = %386
  br label %430

391:                                              ; preds = %386
  %392 = load i32, i32* @no_default_output, align 4
  %393 = icmp ne i32 %392, 0
  br i1 %393, label %398, label %394

394:                                              ; preds = %391
  %395 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %396 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %397 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %395, i32 1, i32 %396, %struct._IO_FILE* %397)
  br label %398

398:                                              ; preds = %394, %391
  %399 = call i32 @read_pattern_space()
  br label %895

400:                                              ; preds = %106
  %401 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %402 = call i32 @feof(%struct._IO_FILE* %401) #7
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %405

404:                                              ; preds = %400
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  br label %430

405:                                              ; preds = %400
  call void @append_pattern_space()
  br label %895

406:                                              ; preds = %106
  %407 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %408 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %409 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %407, i32 1, i32 %408, %struct._IO_FILE* %409)
  br label %895

410:                                              ; preds = %106
  %411 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %412 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %413 = call i8* @eol_pos(i8* %411, i32 %412)
  store i8* %413, i8** %22, align 4
  %414 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %415 = load i8*, i8** %22, align 4
  %416 = icmp ne i8* %415, null
  br i1 %416, label %417, label %424

417:                                              ; preds = %410
  %418 = load i8*, i8** %22, align 4
  %419 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %420 = ptrtoint i8* %418 to i32
  %421 = ptrtoint i8* %419 to i32
  %422 = sub i32 %420, %421
  %423 = add nsw i32 %422, 1
  br label %426

424:                                              ; preds = %410
  %425 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  br label %426

426:                                              ; preds = %424, %417
  %427 = phi i32 [ %423, %417 ], [ %425, %424 ]
  %428 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %414, i32 1, i32 %427, %struct._IO_FILE* %428)
  br label %895

429:                                              ; preds = %106
  br label %430

430:                                              ; preds = %429, %404, %390
  %431 = load i32, i32* @quit_cmd, align 4
  %432 = add nsw i32 %431, 1
  store i32 %432, i32* @quit_cmd, align 4
  %433 = load i32, i32* @execute_program.end_cycle, align 4
  %434 = add nsw i32 %433, 1
  store i32 %434, i32* @execute_program.end_cycle, align 4
  br label %895

435:                                              ; preds = %106
  store i32 0, i32* %23, align 4
  %436 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %437 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %436, i32 0, i32 4
  %438 = bitcast %union.anon* %437 to %struct._IO_FILE**
  %439 = load %struct._IO_FILE*, %struct._IO_FILE** %438, align 4
  %440 = icmp ne %struct._IO_FILE* %439, null
  br i1 %440, label %441, label %483

441:                                              ; preds = %435
  %442 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %443 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %442, i32 0, i32 4
  %444 = bitcast %union.anon* %443 to %struct._IO_FILE**
  %445 = load %struct._IO_FILE*, %struct._IO_FILE** %444, align 4
  call void @rewind(%struct._IO_FILE* %445)
  br label %446

446:                                              ; preds = %471, %441
  %447 = load i32, i32* %23, align 4
  %448 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %449 = add nsw i32 %448, %447
  store i32 %449, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %450 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %451 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %452 = icmp eq i32 %450, %451
  br i1 %452, label %453, label %459

453:                                              ; preds = %446
  %454 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %455 = mul nsw i32 %454, 2
  store i32 %455, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %456 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  %457 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %458 = call i8* @ck_realloc(i8* %456, i32 %457)
  store i8* %458, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  br label %459

459:                                              ; preds = %453, %446
  %460 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 0), align 4
  %461 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %462 = getelementptr inbounds i8, i8* %460, i32 %461
  %463 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 2), align 4
  %464 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @append, i32 0, i32 1), align 4
  %465 = sub nsw i32 %463, %464
  %466 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %467 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %466, i32 0, i32 4
  %468 = bitcast %union.anon* %467 to %struct._IO_FILE**
  %469 = load %struct._IO_FILE*, %struct._IO_FILE** %468, align 4
  %470 = call i32 @fread(i8* %462, i32 1, i32 %465, %struct._IO_FILE* %469)
  store i32 %470, i32* %23, align 4
  br label %471

471:                                              ; preds = %459
  %472 = load i32, i32* %23, align 4
  %473 = icmp sgt i32 %472, 0
  br i1 %473, label %446, label %474

474:                                              ; preds = %471
  %475 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %476 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %475, i32 0, i32 4
  %477 = bitcast %union.anon* %476 to %struct._IO_FILE**
  %478 = load %struct._IO_FILE*, %struct._IO_FILE** %477, align 4
  %479 = call i32 @ferror(%struct._IO_FILE* %478) #7
  %480 = icmp ne i32 %479, 0
  br i1 %480, label %481, label %482

481:                                              ; preds = %474
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.38, i32 0, i32 0))
  br label %482

482:                                              ; preds = %481, %474
  br label %483

483:                                              ; preds = %482, %435
  br label %895

484:                                              ; preds = %106
  %485 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %486 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %487 = sub nsw i32 %486, 1
  %488 = getelementptr inbounds i8, i8* %485, i32 %487
  %489 = load i8, i8* %488, align 1
  %490 = sext i8 %489 to i32
  %491 = icmp eq i32 %490, 10
  %492 = zext i1 %491 to i32
  store i32 %492, i32* %24, align 4
  %493 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %494 = icmp ne i32 %493, 0
  br i1 %494, label %497, label %495

495:                                              ; preds = %484
  store i32 50, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %496 = call i8* @ck_malloc(i32 50)
  store i8* %496, i8** getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 0), align 4
  br label %497

497:                                              ; preds = %495, %484
  store i32 0, i32* %14, align 4
  store i32 0, i32* %6, align 4
  %498 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %499 = load i32, i32* %24, align 4
  %500 = sub nsw i32 %498, %499
  store i32 %500, i32* %7, align 4
  store i32 0, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  %501 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %502 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %501, i32 0, i32 4
  %503 = bitcast %union.anon* %502 to %struct.anon.0*
  %504 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %503, i32 0, i32 1
  %505 = load i8*, i8** %504, align 4
  store i8* %505, i8** %10, align 4
  %506 = load i8*, i8** %10, align 4
  %507 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %508 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %507, i32 0, i32 4
  %509 = bitcast %union.anon* %508 to %struct.anon.0*
  %510 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %509, i32 0, i32 2
  %511 = load i32, i32* %510, align 4
  %512 = getelementptr inbounds i8, i8* %506, i32 %511
  store i8* %512, i8** %11, align 4
  br label %513

513:                                              ; preds = %750, %587, %497
  %514 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %515 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %514, i32 0, i32 4
  %516 = bitcast %union.anon* %515 to %struct.anon.0*
  %517 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %516, i32 0, i32 0
  %518 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %517, align 4
  %519 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %520 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %521 = load i32, i32* %24, align 4
  %522 = sub nsw i32 %520, %521
  %523 = load i32, i32* %6, align 4
  %524 = load i32, i32* %7, align 4
  %525 = call i32 @re_search(%struct.re_pattern_buffer* %518, i8* %519, i32 %522, i32 %523, i32 %524, %struct.re_registers* @regs)
  store i32 %525, i32* %8, align 4
  %526 = icmp sge i32 %525, 0
  br i1 %526, label %527, label %751

527:                                              ; preds = %513
  %528 = load i32, i32* %14, align 4
  %529 = add nsw i32 %528, 1
  store i32 %529, i32* %14, align 4
  %530 = load i32, i32* %8, align 4
  %531 = load i32, i32* %6, align 4
  %532 = sub nsw i32 %530, %531
  %533 = icmp ne i32 %532, 0
  br i1 %533, label %534, label %541

534:                                              ; preds = %527
  %535 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %536 = load i32, i32* %6, align 4
  %537 = getelementptr inbounds i8, i8* %535, i32 %536
  %538 = load i32, i32* %8, align 4
  %539 = load i32, i32* %6, align 4
  %540 = sub nsw i32 %538, %539
  call void @str_append(%struct.line* @execute_program.tmp, i8* %537, i32 %540)
  br label %541

541:                                              ; preds = %534, %527
  %542 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %543 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %542, i32 0, i32 4
  %544 = bitcast %union.anon* %543 to %struct.anon.0*
  %545 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %544, i32 0, i32 3
  %546 = load i32, i32* %545, align 4
  %547 = and i32 %546, 8
  %548 = icmp ne i32 %547, 0
  br i1 %548, label %549, label %595

549:                                              ; preds = %541
  %550 = load i32, i32* %14, align 4
  %551 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %552 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %551, i32 0, i32 4
  %553 = bitcast %union.anon* %552 to %struct.anon.0*
  %554 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %553, i32 0, i32 4
  %555 = load i32, i32* %554, align 4
  %556 = icmp ne i32 %550, %555
  br i1 %556, label %557, label %594

557:                                              ; preds = %549
  %558 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %559 = getelementptr inbounds i32, i32* %558, i32 0
  %560 = load i32, i32* %559, align 4
  %561 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %562 = getelementptr inbounds i32, i32* %561, i32 0
  %563 = load i32, i32* %562, align 4
  %564 = sub nsw i32 %560, %563
  store i32 %564, i32* %25, align 4
  %565 = load i32, i32* %25, align 4
  %566 = icmp ne i32 %565, 0
  br i1 %566, label %568, label %567

567:                                              ; preds = %557
  store i32 1, i32* %25, align 4
  br label %568

568:                                              ; preds = %567, %557
  %569 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %570 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %571 = getelementptr inbounds i32, i32* %570, i32 0
  %572 = load i32, i32* %571, align 4
  %573 = getelementptr inbounds i8, i8* %569, i32 %572
  %574 = load i32, i32* %25, align 4
  call void @str_append(%struct.line* @execute_program.tmp, i8* %573, i32 %574)
  %575 = load i32, i32* %8, align 4
  %576 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %577 = getelementptr inbounds i32, i32* %576, i32 0
  %578 = load i32, i32* %577, align 4
  %579 = icmp eq i32 %575, %578
  br i1 %579, label %580, label %583

580:                                              ; preds = %568
  %581 = load i32, i32* %8, align 4
  %582 = add nsw i32 %581, 1
  br label %587

583:                                              ; preds = %568
  %584 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %585 = getelementptr inbounds i32, i32* %584, i32 0
  %586 = load i32, i32* %585, align 4
  br label %587

587:                                              ; preds = %583, %580
  %588 = phi i32 [ %582, %580 ], [ %586, %583 ]
  store i32 %588, i32* %6, align 4
  %589 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %590 = load i32, i32* %24, align 4
  %591 = sub nsw i32 %589, %590
  %592 = load i32, i32* %6, align 4
  %593 = sub nsw i32 %591, %592
  store i32 %593, i32* %7, align 4
  br label %513

594:                                              ; preds = %549
  br label %595

595:                                              ; preds = %594, %541
  %596 = load i8*, i8** %10, align 4
  store i8* %596, i8** %13, align 4
  store i8* %596, i8** %12, align 4
  br label %597

597:                                              ; preds = %698, %595
  %598 = load i8*, i8** %12, align 4
  %599 = load i8*, i8** %11, align 4
  %600 = icmp ult i8* %598, %599
  br i1 %600, label %601, label %701

601:                                              ; preds = %597
  %602 = load i8*, i8** %12, align 4
  %603 = load i8, i8* %602, align 1
  %604 = sext i8 %603 to i32
  %605 = icmp eq i32 %604, 38
  br i1 %605, label %606, label %635

606:                                              ; preds = %601
  %607 = load i8*, i8** %12, align 4
  %608 = load i8*, i8** %13, align 4
  %609 = ptrtoint i8* %607 to i32
  %610 = ptrtoint i8* %608 to i32
  %611 = sub i32 %609, %610
  %612 = icmp ne i32 %611, 0
  br i1 %612, label %613, label %620

613:                                              ; preds = %606
  %614 = load i8*, i8** %13, align 4
  %615 = load i8*, i8** %12, align 4
  %616 = load i8*, i8** %13, align 4
  %617 = ptrtoint i8* %615 to i32
  %618 = ptrtoint i8* %616 to i32
  %619 = sub i32 %617, %618
  call void @str_append(%struct.line* @execute_program.tmp, i8* %614, i32 %619)
  br label %620

620:                                              ; preds = %613, %606
  %621 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %622 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %623 = getelementptr inbounds i32, i32* %622, i32 0
  %624 = load i32, i32* %623, align 4
  %625 = getelementptr inbounds i8, i8* %621, i32 %624
  %626 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %627 = getelementptr inbounds i32, i32* %626, i32 0
  %628 = load i32, i32* %627, align 4
  %629 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %630 = getelementptr inbounds i32, i32* %629, i32 0
  %631 = load i32, i32* %630, align 4
  %632 = sub nsw i32 %628, %631
  call void @str_append(%struct.line* @execute_program.tmp, i8* %625, i32 %632)
  %633 = load i8*, i8** %12, align 4
  %634 = getelementptr inbounds i8, i8* %633, i32 1
  store i8* %634, i8** %13, align 4
  br label %697

635:                                              ; preds = %601
  %636 = load i8*, i8** %12, align 4
  %637 = load i8, i8* %636, align 1
  %638 = sext i8 %637 to i32
  %639 = icmp eq i32 %638, 92
  br i1 %639, label %640, label %696

640:                                              ; preds = %635
  %641 = load i8*, i8** %12, align 4
  %642 = load i8*, i8** %13, align 4
  %643 = ptrtoint i8* %641 to i32
  %644 = ptrtoint i8* %642 to i32
  %645 = sub i32 %643, %644
  %646 = icmp ne i32 %645, 0
  br i1 %646, label %647, label %654

647:                                              ; preds = %640
  %648 = load i8*, i8** %13, align 4
  %649 = load i8*, i8** %12, align 4
  %650 = load i8*, i8** %13, align 4
  %651 = ptrtoint i8* %649 to i32
  %652 = ptrtoint i8* %650 to i32
  %653 = sub i32 %651, %652
  call void @str_append(%struct.line* @execute_program.tmp, i8* %648, i32 %653)
  br label %654

654:                                              ; preds = %647, %640
  %655 = load i8*, i8** %12, align 4
  %656 = getelementptr inbounds i8, i8* %655, i32 1
  store i8* %656, i8** %12, align 4
  %657 = load i8*, i8** %12, align 4
  %658 = load i8*, i8** %11, align 4
  %659 = icmp ne i8* %657, %658
  br i1 %659, label %660, label %693

660:                                              ; preds = %654
  %661 = load i8*, i8** %12, align 4
  %662 = load i8, i8* %661, align 1
  %663 = sext i8 %662 to i32
  %664 = icmp sge i32 %663, 48
  br i1 %664, label %665, label %690

665:                                              ; preds = %660
  %666 = load i8*, i8** %12, align 4
  %667 = load i8, i8* %666, align 1
  %668 = sext i8 %667 to i32
  %669 = icmp sle i32 %668, 57
  br i1 %669, label %670, label %690

670:                                              ; preds = %665
  %671 = load i8*, i8** %12, align 4
  %672 = load i8, i8* %671, align 1
  %673 = sext i8 %672 to i32
  %674 = sub nsw i32 %673, 48
  store i32 %674, i32* %26, align 4
  %675 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %676 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %677 = load i32, i32* %26, align 4
  %678 = getelementptr inbounds i32, i32* %676, i32 %677
  %679 = load i32, i32* %678, align 4
  %680 = getelementptr inbounds i8, i8* %675, i32 %679
  %681 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %682 = load i32, i32* %26, align 4
  %683 = getelementptr inbounds i32, i32* %681, i32 %682
  %684 = load i32, i32* %683, align 4
  %685 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 1), align 4
  %686 = load i32, i32* %26, align 4
  %687 = getelementptr inbounds i32, i32* %685, i32 %686
  %688 = load i32, i32* %687, align 4
  %689 = sub nsw i32 %684, %688
  call void @str_append(%struct.line* @execute_program.tmp, i8* %680, i32 %689)
  br label %692

690:                                              ; preds = %665, %660
  %691 = load i8*, i8** %12, align 4
  call void @str_append(%struct.line* @execute_program.tmp, i8* %691, i32 1)
  br label %692

692:                                              ; preds = %690, %670
  br label %693

693:                                              ; preds = %692, %654
  %694 = load i8*, i8** %12, align 4
  %695 = getelementptr inbounds i8, i8* %694, i32 1
  store i8* %695, i8** %13, align 4
  br label %696

696:                                              ; preds = %693, %635
  br label %697

697:                                              ; preds = %696, %620
  br label %698

698:                                              ; preds = %697
  %699 = load i8*, i8** %12, align 4
  %700 = getelementptr inbounds i8, i8* %699, i32 1
  store i8* %700, i8** %12, align 4
  br label %597

701:                                              ; preds = %597
  %702 = load i8*, i8** %12, align 4
  %703 = load i8*, i8** %13, align 4
  %704 = ptrtoint i8* %702 to i32
  %705 = ptrtoint i8* %703 to i32
  %706 = sub i32 %704, %705
  %707 = icmp ne i32 %706, 0
  br i1 %707, label %708, label %715

708:                                              ; preds = %701
  %709 = load i8*, i8** %13, align 4
  %710 = load i8*, i8** %12, align 4
  %711 = load i8*, i8** %13, align 4
  %712 = ptrtoint i8* %710 to i32
  %713 = ptrtoint i8* %711 to i32
  %714 = sub i32 %712, %713
  call void @str_append(%struct.line* @execute_program.tmp, i8* %709, i32 %714)
  br label %715

715:                                              ; preds = %708, %701
  %716 = load i32, i32* %8, align 4
  %717 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %718 = getelementptr inbounds i32, i32* %717, i32 0
  %719 = load i32, i32* %718, align 4
  %720 = icmp eq i32 %716, %719
  br i1 %720, label %721, label %729

721:                                              ; preds = %715
  %722 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %723 = load i32, i32* %8, align 4
  %724 = getelementptr inbounds i8, i8* %722, i32 %723
  call void @str_append(%struct.line* @execute_program.tmp, i8* %724, i32 1)
  %725 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %726 = getelementptr inbounds i32, i32* %725, i32 0
  %727 = load i32, i32* %726, align 4
  %728 = add nsw i32 %727, 1
  store i32 %728, i32* %726, align 4
  br label %729

729:                                              ; preds = %721, %715
  %730 = load i32*, i32** getelementptr inbounds (%struct.re_registers, %struct.re_registers* @regs, i32 0, i32 2), align 4
  %731 = getelementptr inbounds i32, i32* %730, i32 0
  %732 = load i32, i32* %731, align 4
  store i32 %732, i32* %6, align 4
  %733 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %734 = load i32, i32* %24, align 4
  %735 = sub nsw i32 %733, %734
  %736 = load i32, i32* %6, align 4
  %737 = sub nsw i32 %735, %736
  store i32 %737, i32* %7, align 4
  %738 = load i32, i32* %7, align 4
  %739 = icmp slt i32 %738, 0
  br i1 %739, label %740, label %741

740:                                              ; preds = %729
  br label %751

741:                                              ; preds = %729
  %742 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %743 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %742, i32 0, i32 4
  %744 = bitcast %union.anon* %743 to %struct.anon.0*
  %745 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %744, i32 0, i32 3
  %746 = load i32, i32* %745, align 4
  %747 = and i32 %746, 1
  %748 = icmp ne i32 %747, 0
  br i1 %748, label %750, label %749

749:                                              ; preds = %741
  br label %751

750:                                              ; preds = %741
  br label %513

751:                                              ; preds = %749, %740, %513
  %752 = load i32, i32* %14, align 4
  %753 = icmp ne i32 %752, 0
  br i1 %753, label %755, label %754

754:                                              ; preds = %751
  br label %895

755:                                              ; preds = %751
  store i32 1, i32* @replaced, align 4
  %756 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %757 = load i32, i32* %6, align 4
  %758 = getelementptr inbounds i8, i8* %756, i32 %757
  %759 = load i32, i32* %7, align 4
  %760 = load i32, i32* %24, align 4
  %761 = add nsw i32 %759, %760
  call void @str_append(%struct.line* @execute_program.tmp, i8* %758, i32 %761)
  %762 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %763 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 0
  store i8* %762, i8** %763, align 4
  %764 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %765 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 1
  store i32 %764, i32* %765, align 4
  %766 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %767 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 2
  store i32 %766, i32* %767, align 4
  %768 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 0), align 4
  store i8* %768, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %769 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  store i32 %769, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %770 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  store i32 %770, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %771 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 0
  %772 = load i8*, i8** %771, align 4
  store i8* %772, i8** getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 0), align 4
  %773 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 1
  %774 = load i32, i32* %773, align 4
  store i32 %774, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 1), align 4
  %775 = getelementptr inbounds %struct.line, %struct.line* %9, i32 0, i32 2
  %776 = load i32, i32* %775, align 4
  store i32 %776, i32* getelementptr inbounds (%struct.line, %struct.line* @execute_program.tmp, i32 0, i32 2), align 4
  %777 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %778 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %777, i32 0, i32 4
  %779 = bitcast %union.anon* %778 to %struct.anon.0*
  %780 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %779, i32 0, i32 3
  %781 = load i32, i32* %780, align 4
  %782 = and i32 %781, 4
  %783 = icmp ne i32 %782, 0
  br i1 %783, label %784, label %799

784:                                              ; preds = %755
  %785 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %786 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %785, i32 0, i32 4
  %787 = bitcast %union.anon* %786 to %struct.anon.0*
  %788 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %787, i32 0, i32 5
  %789 = load %struct._IO_FILE*, %struct._IO_FILE** %788, align 4
  %790 = icmp ne %struct._IO_FILE* %789, null
  br i1 %790, label %791, label %799

791:                                              ; preds = %784
  %792 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %793 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %794 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %795 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %794, i32 0, i32 4
  %796 = bitcast %union.anon* %795 to %struct.anon.0*
  %797 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %796, i32 0, i32 5
  %798 = load %struct._IO_FILE*, %struct._IO_FILE** %797, align 4
  call void @ck_fwrite(i8* %792, i32 1, i32 %793, %struct._IO_FILE* %798)
  br label %799

799:                                              ; preds = %791, %784, %755
  %800 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %801 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %800, i32 0, i32 4
  %802 = bitcast %union.anon* %801 to %struct.anon.0*
  %803 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %802, i32 0, i32 3
  %804 = load i32, i32* %803, align 4
  %805 = and i32 %804, 2
  %806 = icmp ne i32 %805, 0
  br i1 %806, label %807, label %811

807:                                              ; preds = %799
  %808 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %809 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %810 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @ck_fwrite(i8* %808, i32 1, i32 %809, %struct._IO_FILE* %810)
  br label %811

811:                                              ; preds = %807, %799
  br label %895

812:                                              ; preds = %106
  %813 = load i32, i32* @replaced, align 4
  %814 = icmp ne i32 %813, 0
  br i1 %814, label %815, label %848

815:                                              ; preds = %812
  store i32 0, i32* @replaced, align 4
  %816 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %817 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %816, i32 0, i32 4
  %818 = bitcast %union.anon* %817 to %struct.sed_label**
  %819 = load %struct.sed_label*, %struct.sed_label** %818, align 4
  %820 = icmp ne %struct.sed_label* %819, null
  br i1 %820, label %824, label %821

821:                                              ; preds = %815
  %822 = load i32, i32* @execute_program.end_cycle, align 4
  %823 = add nsw i32 %822, 1
  store i32 %823, i32* @execute_program.end_cycle, align 4
  br label %847

824:                                              ; preds = %815
  %825 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %826 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %825, i32 0, i32 4
  %827 = bitcast %union.anon* %826 to %struct.sed_label**
  %828 = load %struct.sed_label*, %struct.sed_label** %827, align 4
  store %struct.sed_label* %828, %struct.sed_label** %27, align 4
  %829 = load %struct.sed_label*, %struct.sed_label** %27, align 4
  %830 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %829, i32 0, i32 0
  %831 = load %struct.vector*, %struct.vector** %830, align 4
  %832 = getelementptr inbounds %struct.vector, %struct.vector* %831, i32 0, i32 1
  %833 = load i32, i32* %832, align 4
  %834 = load %struct.sed_label*, %struct.sed_label** %27, align 4
  %835 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %834, i32 0, i32 1
  %836 = load i32, i32* %835, align 4
  %837 = sub nsw i32 %833, %836
  store i32 %837, i32* %4, align 4
  %838 = load %struct.sed_label*, %struct.sed_label** %27, align 4
  %839 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %838, i32 0, i32 0
  %840 = load %struct.vector*, %struct.vector** %839, align 4
  %841 = getelementptr inbounds %struct.vector, %struct.vector* %840, i32 0, i32 0
  %842 = load %struct.sed_cmd*, %struct.sed_cmd** %841, align 4
  %843 = load %struct.sed_label*, %struct.sed_label** %27, align 4
  %844 = getelementptr inbounds %struct.sed_label, %struct.sed_label* %843, i32 0, i32 1
  %845 = load i32, i32* %844, align 4
  %846 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %842, i32 %845
  store %struct.sed_cmd* %846, %struct.sed_cmd** %3, align 4
  br label %44

847:                                              ; preds = %821
  br label %848

848:                                              ; preds = %847, %812
  br label %895

849:                                              ; preds = %106
  %850 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %851 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %850, i32 0, i32 4
  %852 = bitcast %union.anon* %851 to %struct._IO_FILE**
  %853 = load %struct._IO_FILE*, %struct._IO_FILE** %852, align 4
  %854 = icmp ne %struct._IO_FILE* %853, null
  br i1 %854, label %855, label %862

855:                                              ; preds = %849
  %856 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %857 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %858 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %859 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %858, i32 0, i32 4
  %860 = bitcast %union.anon* %859 to %struct._IO_FILE**
  %861 = load %struct._IO_FILE*, %struct._IO_FILE** %860, align 4
  call void @ck_fwrite(i8* %856, i32 1, i32 %857, %struct._IO_FILE* %861)
  br label %862

862:                                              ; preds = %855, %849
  br label %895

863:                                              ; preds = %106
  %864 = bitcast %struct.line* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %864, i8* align 4 bitcast (%struct.line* @line to i8*), i32 12, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 bitcast (%struct.line* @line to i8*), i8* align 4 bitcast (%struct.line* @hold to i8*), i32 12, i1 false)
  %865 = bitcast %struct.line* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 bitcast (%struct.line* @hold to i8*), i8* align 4 %865, i32 12, i1 false)
  br label %895

866:                                              ; preds = %106
  %867 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  store i8* %867, i8** %29, align 4
  %868 = load i8*, i8** %29, align 4
  %869 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %870 = getelementptr inbounds i8, i8* %868, i32 %869
  store i8* %870, i8** %30, align 4
  br label %871

871:                                              ; preds = %886, %866
  %872 = load i8*, i8** %29, align 4
  %873 = load i8*, i8** %30, align 4
  %874 = icmp ult i8* %872, %873
  br i1 %874, label %875, label %889

875:                                              ; preds = %871
  %876 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %877 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %876, i32 0, i32 4
  %878 = bitcast %union.anon* %877 to i8**
  %879 = load i8*, i8** %878, align 4
  %880 = load i8*, i8** %29, align 4
  %881 = load i8, i8* %880, align 1
  %882 = zext i8 %881 to i32
  %883 = getelementptr inbounds i8, i8* %879, i32 %882
  %884 = load i8, i8* %883, align 1
  %885 = load i8*, i8** %29, align 4
  store i8 %884, i8* %885, align 1
  br label %886

886:                                              ; preds = %875
  %887 = load i8*, i8** %29, align 4
  %888 = getelementptr inbounds i8, i8* %887, i32 1
  store i8* %888, i8** %29, align 4
  br label %871

889:                                              ; preds = %871
  br label %895

890:                                              ; preds = %106
  %891 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %892 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %891, i32 0, i32 3
  %893 = load i8, i8* %892, align 4
  %894 = sext i8 %893 to i32
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.39, i32 0, i32 0), i32 %894)
  br label %895

895:                                              ; preds = %890, %889, %863, %862, %848, %811, %754, %483, %430, %426, %406, %405, %398, %384, %279, %278, %277, %276, %275, %272, %249, %246, %227, %174, %154, %153, %131, %130
  %896 = load i32, i32* @execute_program.end_cycle, align 4
  %897 = icmp ne i32 %896, 0
  br i1 %897, label %898, label %899

898:                                              ; preds = %895
  br label %905

899:                                              ; preds = %895
  br label %900

900:                                              ; preds = %899, %105
  %901 = load %struct.sed_cmd*, %struct.sed_cmd** %3, align 4
  %902 = getelementptr inbounds %struct.sed_cmd, %struct.sed_cmd* %901, i32 1
  store %struct.sed_cmd* %902, %struct.sed_cmd** %3, align 4
  %903 = load i32, i32* %4, align 4
  %904 = add nsw i32 %903, -1
  store i32 %904, i32* %4, align 4
  br label %40

905:                                              ; preds = %898, %40
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @ck_fwrite(i8*, i32, i32, %struct._IO_FILE*) #0 {
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct._IO_FILE*, align 4
  store i8* %0, i8** %5, align 4
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store %struct._IO_FILE* %3, %struct._IO_FILE** %8, align 4
  %9 = load i8*, i8** %5, align 4
  %10 = load i32, i32* %6, align 4
  %11 = load i32, i32* %7, align 4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 4
  %13 = call i32 @fwrite(i8* %9, i32 %10, i32 %11, %struct._IO_FILE* %12)
  %14 = load i32, i32* %7, align 4
  %15 = icmp ne i32 %13, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %4
  %17 = load i32, i32* %7, align 4
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %8, align 4
  %19 = call i8* @__fp_name(%struct._IO_FILE* %18)
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.46, i32 0, i32 0), i32 %17, i8* %19)
  br label %20

20:                                               ; preds = %16, %4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @ck_fclose(%struct._IO_FILE*) #0 {
  %2 = alloca %struct._IO_FILE*, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %2, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 4
  %4 = call i32 @fclose(%struct._IO_FILE* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 4
  %8 = call i8* @__fp_name(%struct._IO_FILE* %7)
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.47, i32 0, i32 0), i8* %8)
  br label %9

9:                                                ; preds = %6, %1
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @match_address(%struct.addr*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.addr*, align 4
  %4 = alloca i32, align 4
  store %struct.addr* %0, %struct.addr** %3, align 4
  %5 = load %struct.addr*, %struct.addr** %3, align 4
  %6 = getelementptr inbounds %struct.addr, %struct.addr* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  switch i32 %7, label %44 [
    i32 0, label %8
    i32 1, label %9
    i32 2, label %16
    i32 3, label %39
  ]

8:                                                ; preds = %1
  store i32 1, i32* %2, align 4
  br label %46

9:                                                ; preds = %1
  %10 = load i32, i32* @input_line_number, align 4
  %11 = load %struct.addr*, %struct.addr** %3, align 4
  %12 = getelementptr inbounds %struct.addr, %struct.addr* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp eq i32 %10, %13
  %15 = zext i1 %14 to i32
  store i32 %15, i32* %2, align 4
  br label %46

16:                                               ; preds = %1
  %17 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %18 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %19 = sub nsw i32 %18, 1
  %20 = getelementptr inbounds i8, i8* %17, i32 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 10
  %24 = zext i1 %23 to i32
  store i32 %24, i32* %4, align 4
  %25 = load %struct.addr*, %struct.addr** %3, align 4
  %26 = getelementptr inbounds %struct.addr, %struct.addr* %25, i32 0, i32 1
  %27 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %26, align 4
  %28 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %29 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %30 = load i32, i32* %4, align 4
  %31 = sub nsw i32 %29, %30
  %32 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %33 = load i32, i32* %4, align 4
  %34 = sub nsw i32 %32, %33
  %35 = call i32 @re_search(%struct.re_pattern_buffer* %27, i8* %28, i32 %31, i32 0, i32 %34, %struct.re_registers* null)
  %36 = icmp sge i32 %35, 0
  %37 = zext i1 %36 to i64
  %38 = select i1 %36, i32 1, i32 0
  store i32 %38, i32* %2, align 4
  br label %46

39:                                               ; preds = %1
  %40 = load i32, i32* @input_EOF, align 4
  %41 = icmp ne i32 %40, 0
  %42 = zext i1 %41 to i64
  %43 = select i1 %41, i32 1, i32 0
  store i32 %43, i32* %2, align 4
  br label %46

44:                                               ; preds = %1
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.40, i32 0, i32 0))
  br label %45

45:                                               ; preds = %44
  store i32 -1, i32* %2, align 4
  br label %46

46:                                               ; preds = %45, %39, %16, %9, %8
  %47 = load i32, i32* %2, align 4
  ret i32 %47
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone
define internal i8* @eol_pos(i8*, i32) #0 {
  %3 = alloca i8*, align 4
  %4 = alloca i8*, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 4
  store i32 %1, i32* %5, align 4
  br label %6

6:                                                ; preds = %19, %2
  %7 = load i32, i32* %5, align 4
  %8 = add nsw i32 %7, -1
  store i32 %8, i32* %5, align 4
  %9 = icmp ne i32 %7, 0
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = load i8*, i8** %4, align 4
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %4, align 4
  %13 = load i8, i8* %11, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 10
  br i1 %15, label %16, label %19

16:                                               ; preds = %10
  %17 = load i8*, i8** %4, align 4
  %18 = getelementptr inbounds i8, i8* %17, i32 -1
  store i8* %18, i8** %4, align 4
  store i8* %18, i8** %3, align 4
  br label %23

19:                                               ; preds = %10
  br label %6

20:                                               ; preds = %6
  %21 = load i8*, i8** %4, align 4
  %22 = getelementptr inbounds i8, i8* %21, i32 -1
  store i8* %22, i8** %4, align 4
  store i8* %22, i8** %3, align 4
  br label %23

23:                                               ; preds = %20, %16
  %24 = load i8*, i8** %3, align 4
  ret i8* %24
}

; Function Attrs: noinline nounwind optnone
define internal void @chr_copy(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  br label %7

7:                                                ; preds = %11, %3
  %8 = load i32, i32* %6, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %6, align 4
  %10 = icmp ne i32 %8, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %7
  %12 = load i8*, i8** %5, align 4
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %5, align 4
  %14 = load i8, i8* %12, align 1
  %15 = load i8*, i8** %4, align 4
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %4, align 4
  store i8 %14, i8* %15, align 1
  br label %7

17:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @line_copy(%struct.line*, %struct.line*) #0 {
  %3 = alloca %struct.line*, align 4
  %4 = alloca %struct.line*, align 4
  store %struct.line* %0, %struct.line** %3, align 4
  store %struct.line* %1, %struct.line** %4, align 4
  %5 = load %struct.line*, %struct.line** %3, align 4
  %6 = getelementptr inbounds %struct.line, %struct.line* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = load %struct.line*, %struct.line** %4, align 4
  %9 = getelementptr inbounds %struct.line, %struct.line* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp sgt i32 %7, %10
  br i1 %11, label %12, label %27

12:                                               ; preds = %2
  %13 = load %struct.line*, %struct.line** %3, align 4
  %14 = getelementptr inbounds %struct.line, %struct.line* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 4
  %16 = load %struct.line*, %struct.line** %4, align 4
  %17 = getelementptr inbounds %struct.line, %struct.line* %16, i32 0, i32 2
  store i32 %15, i32* %17, align 4
  %18 = load %struct.line*, %struct.line** %4, align 4
  %19 = getelementptr inbounds %struct.line, %struct.line* %18, i32 0, i32 0
  %20 = load i8*, i8** %19, align 4
  %21 = load %struct.line*, %struct.line** %4, align 4
  %22 = getelementptr inbounds %struct.line, %struct.line* %21, i32 0, i32 2
  %23 = load i32, i32* %22, align 4
  %24 = call i8* @ck_realloc(i8* %20, i32 %23)
  %25 = load %struct.line*, %struct.line** %4, align 4
  %26 = getelementptr inbounds %struct.line, %struct.line* %25, i32 0, i32 0
  store i8* %24, i8** %26, align 4
  br label %27

27:                                               ; preds = %12, %2
  %28 = load %struct.line*, %struct.line** %3, align 4
  %29 = getelementptr inbounds %struct.line, %struct.line* %28, i32 0, i32 0
  %30 = load i8*, i8** %29, align 4
  %31 = load %struct.line*, %struct.line** %4, align 4
  %32 = getelementptr inbounds %struct.line, %struct.line* %31, i32 0, i32 0
  %33 = load i8*, i8** %32, align 4
  %34 = load %struct.line*, %struct.line** %3, align 4
  %35 = getelementptr inbounds %struct.line, %struct.line* %34, i32 0, i32 1
  %36 = load i32, i32* %35, align 4
  call void @bcopy(i8* %30, i8* %33, i32 %36) #7
  %37 = load %struct.line*, %struct.line** %3, align 4
  %38 = getelementptr inbounds %struct.line, %struct.line* %37, i32 0, i32 1
  %39 = load i32, i32* %38, align 4
  %40 = load %struct.line*, %struct.line** %4, align 4
  %41 = getelementptr inbounds %struct.line, %struct.line* %40, i32 0, i32 1
  store i32 %39, i32* %41, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @line_append(%struct.line*, %struct.line*) #0 {
  %3 = alloca %struct.line*, align 4
  %4 = alloca %struct.line*, align 4
  store %struct.line* %0, %struct.line** %3, align 4
  store %struct.line* %1, %struct.line** %4, align 4
  %5 = load %struct.line*, %struct.line** %3, align 4
  %6 = getelementptr inbounds %struct.line, %struct.line* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = load %struct.line*, %struct.line** %4, align 4
  %9 = getelementptr inbounds %struct.line, %struct.line* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = load %struct.line*, %struct.line** %4, align 4
  %12 = getelementptr inbounds %struct.line, %struct.line* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = sub nsw i32 %10, %13
  %15 = icmp sgt i32 %7, %14
  br i1 %15, label %16, label %33

16:                                               ; preds = %2
  %17 = load %struct.line*, %struct.line** %3, align 4
  %18 = getelementptr inbounds %struct.line, %struct.line* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.line*, %struct.line** %4, align 4
  %21 = getelementptr inbounds %struct.line, %struct.line* %20, i32 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = add nsw i32 %22, %19
  store i32 %23, i32* %21, align 4
  %24 = load %struct.line*, %struct.line** %4, align 4
  %25 = getelementptr inbounds %struct.line, %struct.line* %24, i32 0, i32 0
  %26 = load i8*, i8** %25, align 4
  %27 = load %struct.line*, %struct.line** %4, align 4
  %28 = getelementptr inbounds %struct.line, %struct.line* %27, i32 0, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = call i8* @ck_realloc(i8* %26, i32 %29)
  %31 = load %struct.line*, %struct.line** %4, align 4
  %32 = getelementptr inbounds %struct.line, %struct.line* %31, i32 0, i32 0
  store i8* %30, i8** %32, align 4
  br label %33

33:                                               ; preds = %16, %2
  %34 = load %struct.line*, %struct.line** %3, align 4
  %35 = getelementptr inbounds %struct.line, %struct.line* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 4
  %37 = load %struct.line*, %struct.line** %4, align 4
  %38 = getelementptr inbounds %struct.line, %struct.line* %37, i32 0, i32 0
  %39 = load i8*, i8** %38, align 4
  %40 = load %struct.line*, %struct.line** %4, align 4
  %41 = getelementptr inbounds %struct.line, %struct.line* %40, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = getelementptr inbounds i8, i8* %39, i32 %42
  %44 = load %struct.line*, %struct.line** %3, align 4
  %45 = getelementptr inbounds %struct.line, %struct.line* %44, i32 0, i32 1
  %46 = load i32, i32* %45, align 4
  call void @bcopy(i8* %36, i8* %43, i32 %46) #7
  %47 = load %struct.line*, %struct.line** %3, align 4
  %48 = getelementptr inbounds %struct.line, %struct.line* %47, i32 0, i32 1
  %49 = load i32, i32* %48, align 4
  %50 = load %struct.line*, %struct.line** %4, align 4
  %51 = getelementptr inbounds %struct.line, %struct.line* %50, i32 0, i32 1
  %52 = load i32, i32* %51, align 4
  %53 = add nsw i32 %52, %49
  store i32 %53, i32* %51, align 4
  ret void
}

declare dso_local i32 @putchar(i32) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @append_pattern_space() #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %6 = getelementptr inbounds i8, i8* %4, i32 %5
  store i8* %6, i8** %1, align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %8 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %9 = sub nsw i32 %7, %8
  store i32 %9, i32* %2, align 4
  %10 = load i32, i32* @input_line_number, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* @input_line_number, align 4
  store i32 0, i32* @replaced, align 4
  br label %12

12:                                               ; preds = %59, %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %14 = call i32 @_IO_getc(%struct._IO_FILE* %13)
  store i32 %14, i32* %3, align 4
  %15 = load i32, i32* %3, align 4
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %32

17:                                               ; preds = %12
  %18 = load i32, i32* %2, align 4
  %19 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %76

22:                                               ; preds = %17
  %23 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %24 = load i32, i32* %2, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  %26 = load i32, i32* @last_input_file, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %22
  %29 = load i32, i32* @input_EOF, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* @input_EOF, align 4
  br label %31

31:                                               ; preds = %28, %22
  br label %76

32:                                               ; preds = %12
  %33 = load i32, i32* %2, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %46

35:                                               ; preds = %32
  %36 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %37 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %38 = mul nsw i32 %37, 2
  %39 = call i8* @ck_realloc(i8* %36, i32 %38)
  store i8* %39, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %40 = load i8*, i8** getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 0), align 4
  %41 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %42 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8* %42, i8** %1, align 4
  %43 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  store i32 %43, i32* %2, align 4
  %44 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %45 = mul nsw i32 %44, 2
  store i32 %45, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  br label %46

46:                                               ; preds = %35, %32
  %47 = load i32, i32* %3, align 4
  %48 = trunc i32 %47 to i8
  %49 = load i8*, i8** %1, align 4
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %1, align 4
  store i8 %48, i8* %49, align 1
  %51 = load i32, i32* %2, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %2, align 4
  %53 = load i32, i32* %3, align 4
  %54 = icmp eq i32 %53, 10
  br i1 %54, label %55, label %59

55:                                               ; preds = %46
  %56 = load i32, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 2), align 4
  %57 = load i32, i32* %2, align 4
  %58 = sub nsw i32 %56, %57
  store i32 %58, i32* getelementptr inbounds (%struct.line, %struct.line* @line, i32 0, i32 1), align 4
  br label %60

59:                                               ; preds = %46
  br label %12

60:                                               ; preds = %55
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %62 = call i32 @_IO_getc(%struct._IO_FILE* %61)
  store i32 %62, i32* %3, align 4
  %63 = load i32, i32* %3, align 4
  %64 = icmp ne i32 %63, -1
  br i1 %64, label %65, label %69

65:                                               ; preds = %60
  %66 = load i32, i32* %3, align 4
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @input_file, align 4
  %68 = call i32 @ungetc(i32 %66, %struct._IO_FILE* %67)
  br label %76

69:                                               ; preds = %60
  %70 = load i32, i32* @last_input_file, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %75

72:                                               ; preds = %69
  %73 = load i32, i32* @input_EOF, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* @input_EOF, align 4
  br label %75

75:                                               ; preds = %72, %69
  br label %76

76:                                               ; preds = %21, %31, %75, %65
  ret void
}

declare dso_local void @rewind(%struct._IO_FILE*) #1

declare dso_local i32 @fread(i8*, i32, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local i32 @ferror(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_search(%struct.re_pattern_buffer*, i8*, i32, i32, i32, %struct.re_registers*) #0 {
  %7 = alloca %struct.re_pattern_buffer*, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.re_registers*, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %7, align 4
  store i8* %1, i8** %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store %struct.re_registers* %5, %struct.re_registers** %12, align 4
  %13 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %7, align 4
  %14 = load i8*, i8** %8, align 4
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %10, align 4
  %17 = load i32, i32* %11, align 4
  %18 = load %struct.re_registers*, %struct.re_registers** %12, align 4
  %19 = load i32, i32* %9, align 4
  %20 = call i32 @re_search_2(%struct.re_pattern_buffer* %13, i8* null, i32 0, i8* %14, i32 %15, i32 %16, i32 %17, %struct.re_registers* %18, i32 %19)
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone
define dso_local void @str_append(%struct.line*, i8*, i32) #0 {
  %4 = alloca %struct.line*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  store %struct.line* %0, %struct.line** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = load %struct.line*, %struct.line** %4, align 4
  %9 = getelementptr inbounds %struct.line, %struct.line* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = load %struct.line*, %struct.line** %4, align 4
  %12 = getelementptr inbounds %struct.line, %struct.line* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = sub nsw i32 %10, %13
  %15 = icmp sgt i32 %7, %14
  br i1 %15, label %16, label %31

16:                                               ; preds = %3
  %17 = load i32, i32* %6, align 4
  %18 = load %struct.line*, %struct.line** %4, align 4
  %19 = getelementptr inbounds %struct.line, %struct.line* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 4
  %21 = add nsw i32 %20, %17
  store i32 %21, i32* %19, align 4
  %22 = load %struct.line*, %struct.line** %4, align 4
  %23 = getelementptr inbounds %struct.line, %struct.line* %22, i32 0, i32 0
  %24 = load i8*, i8** %23, align 4
  %25 = load %struct.line*, %struct.line** %4, align 4
  %26 = getelementptr inbounds %struct.line, %struct.line* %25, i32 0, i32 2
  %27 = load i32, i32* %26, align 4
  %28 = call i8* @ck_realloc(i8* %24, i32 %27)
  %29 = load %struct.line*, %struct.line** %4, align 4
  %30 = getelementptr inbounds %struct.line, %struct.line* %29, i32 0, i32 0
  store i8* %28, i8** %30, align 4
  br label %31

31:                                               ; preds = %16, %3
  %32 = load i8*, i8** %5, align 4
  %33 = load %struct.line*, %struct.line** %4, align 4
  %34 = getelementptr inbounds %struct.line, %struct.line* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 4
  %36 = load %struct.line*, %struct.line** %4, align 4
  %37 = getelementptr inbounds %struct.line, %struct.line* %36, i32 0, i32 1
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds i8, i8* %35, i32 %38
  %40 = load i32, i32* %6, align 4
  call void @bcopy(i8* %32, i8* %39, i32 %40) #7
  %41 = load i32, i32* %6, align 4
  %42 = load %struct.line*, %struct.line** %4, align 4
  %43 = getelementptr inbounds %struct.line, %struct.line* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = add nsw i32 %44, %41
  store i32 %45, i32* %43, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i1 immarg) #6

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #7

declare dso_local i32 @vfprintf(%struct._IO_FILE*, i8*, i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #7

declare dso_local i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i8* @__fp_name(%struct._IO_FILE*) #0 {
  %2 = alloca i8*, align 4
  %3 = alloca %struct._IO_FILE*, align 4
  %4 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 4
  store i32 0, i32* %4, align 4
  br label %5

5:                                                ; preds = %21, %1
  %6 = load i32, i32* %4, align 4
  %7 = icmp slt i32 %6, 32
  br i1 %7, label %8, label %24

8:                                                ; preds = %5
  %9 = load i32, i32* %4, align 4
  %10 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %9
  %11 = getelementptr inbounds %struct.id, %struct.id* %10, i32 0, i32 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 4
  %14 = icmp eq %struct._IO_FILE* %12, %13
  br i1 %14, label %15, label %20

15:                                               ; preds = %8
  %16 = load i32, i32* %4, align 4
  %17 = getelementptr inbounds [32 x %struct.id], [32 x %struct.id]* @__id_s, i32 0, i32 %16
  %18 = getelementptr inbounds %struct.id, %struct.id* %17, i32 0, i32 1
  %19 = load i8*, i8** %18, align 4
  store i8* %19, i8** %2, align 4
  br label %25

20:                                               ; preds = %8
  br label %21

21:                                               ; preds = %20
  %22 = load i32, i32* %4, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %4, align 4
  br label %5

24:                                               ; preds = %5
  store i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.43, i32 0, i32 0), i8** %2, align 4
  br label %25

25:                                               ; preds = %24, %15
  %26 = load i8*, i8** %2, align 4
  ret i8* %26
}

declare dso_local i32 @fwrite(i8*, i32, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i32) #3

; Function Attrs: noinline nounwind optnone
define dso_local i8* @xmalloc(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i8* @ck_malloc(i32 %3)
  ret i8* %4
}

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i32) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @add_buffer(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.buffer*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  store i8* %0, i8** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i8*, i8** %4, align 4
  %11 = bitcast i8* %10 to %struct.buffer*
  store %struct.buffer* %11, %struct.buffer** %7, align 4
  %12 = load %struct.buffer*, %struct.buffer** %7, align 4
  %13 = getelementptr inbounds %struct.buffer, %struct.buffer* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %6, align 4
  %16 = add nsw i32 %14, %15
  %17 = load %struct.buffer*, %struct.buffer** %7, align 4
  %18 = getelementptr inbounds %struct.buffer, %struct.buffer* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  %20 = icmp sgt i32 %16, %19
  br i1 %20, label %21, label %35

21:                                               ; preds = %3
  %22 = load %struct.buffer*, %struct.buffer** %7, align 4
  %23 = getelementptr inbounds %struct.buffer, %struct.buffer* %22, i32 0, i32 0
  %24 = load i32, i32* %23, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, i32* %23, align 4
  %26 = load %struct.buffer*, %struct.buffer** %7, align 4
  %27 = getelementptr inbounds %struct.buffer, %struct.buffer* %26, i32 0, i32 2
  %28 = load i8*, i8** %27, align 4
  %29 = load %struct.buffer*, %struct.buffer** %7, align 4
  %30 = getelementptr inbounds %struct.buffer, %struct.buffer* %29, i32 0, i32 0
  %31 = load i32, i32* %30, align 4
  %32 = call i8* @ck_realloc(i8* %28, i32 %31)
  %33 = load %struct.buffer*, %struct.buffer** %7, align 4
  %34 = getelementptr inbounds %struct.buffer, %struct.buffer* %33, i32 0, i32 2
  store i8* %32, i8** %34, align 4
  br label %35

35:                                               ; preds = %21, %3
  %36 = load i32, i32* %6, align 4
  store i32 %36, i32* %8, align 4
  %37 = load %struct.buffer*, %struct.buffer** %7, align 4
  %38 = getelementptr inbounds %struct.buffer, %struct.buffer* %37, i32 0, i32 2
  %39 = load i8*, i8** %38, align 4
  %40 = load %struct.buffer*, %struct.buffer** %7, align 4
  %41 = getelementptr inbounds %struct.buffer, %struct.buffer* %40, i32 0, i32 1
  %42 = load i32, i32* %41, align 4
  %43 = getelementptr inbounds i8, i8* %39, i32 %42
  store i8* %43, i8** %9, align 4
  br label %44

44:                                               ; preds = %48, %35
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %8, align 4
  %47 = icmp ne i32 %45, 0
  br i1 %47, label %48, label %54

48:                                               ; preds = %44
  %49 = load i8*, i8** %5, align 4
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %5, align 4
  %51 = load i8, i8* %49, align 1
  %52 = load i8*, i8** %9, align 4
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %9, align 4
  store i8 %51, i8* %52, align 1
  br label %44

54:                                               ; preds = %44
  %55 = load i32, i32* %6, align 4
  %56 = load %struct.buffer*, %struct.buffer** %7, align 4
  %57 = getelementptr inbounds %struct.buffer, %struct.buffer* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = add nsw i32 %58, %55
  store i32 %59, i32* %57, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_compile_fastmap(%struct.re_pattern_buffer*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.re_pattern_buffer*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.fail_stack_type, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 4
  %13 = alloca i8*, align 4
  %14 = alloca i8, align 1
  %15 = alloca i8, align 1
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %3, align 4
  store i32 0, i32* %8, align 4
  %16 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %17 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %16, i32 0, i32 4
  %18 = load i8*, i8** %17, align 4
  store i8* %18, i8** %9, align 4
  %19 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %20 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %19, i32 0, i32 0
  %21 = load i8*, i8** %20, align 4
  store i8* %21, i8** %10, align 4
  %22 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %23 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %22, i32 0, i32 2
  %24 = load i32, i32* %23, align 4
  store i32 %24, i32* %11, align 4
  %25 = load i8*, i8** %10, align 4
  store i8* %25, i8** %12, align 4
  %26 = load i8*, i8** %10, align 4
  %27 = load i32, i32* %11, align 4
  %28 = getelementptr inbounds i8, i8* %26, i32 %27
  store i8* %28, i8** %13, align 4
  store i8 1, i8* %14, align 1
  store i8 0, i8* %15, align 1
  br label %29

29:                                               ; preds = %1
  %30 = alloca i8, i32 20, align 16
  %31 = bitcast i8* %30 to i8**
  %32 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  store i8** %31, i8*** %32, align 4
  %33 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %34 = load i8**, i8*** %33, align 4
  %35 = icmp eq i8** %34, null
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  store i32 -2, i32* %2, align 4
  br label %487

37:                                               ; preds = %29
  %38 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  store i32 5, i32* %38, align 4
  %39 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  store i32 0, i32* %39, align 4
  br label %40

40:                                               ; preds = %37
  %41 = load i8*, i8** %9, align 4
  call void @llvm.memset.p0i8.i32(i8* align 1 %41, i8 0, i32 256, i1 false)
  %42 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %43 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %42, i32 0, i32 7
  %44 = load i8, i8* %43, align 4
  %45 = and i8 %44, -9
  %46 = or i8 %45, 8
  store i8 %46, i8* %43, align 4
  %47 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %48 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %47, i32 0, i32 7
  %49 = load i8, i8* %48, align 4
  %50 = and i8 %49, -2
  store i8 %50, i8* %48, align 4
  br label %51

51:                                               ; preds = %470, %466, %463, %462, %436, %327, %286, %275, %251, %40
  %52 = load i8*, i8** %12, align 4
  %53 = load i8*, i8** %13, align 4
  %54 = icmp ne i8* %52, %53
  br i1 %54, label %60, label %55

55:                                               ; preds = %51
  %56 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %57 = load i32, i32* %56, align 4
  %58 = icmp eq i32 %57, 0
  %59 = xor i1 %58, true
  br label %60

60:                                               ; preds = %55, %51
  %61 = phi i1 [ true, %51 ], [ %59, %55 ]
  br i1 %61, label %62, label %472

62:                                               ; preds = %60
  %63 = load i8*, i8** %12, align 4
  %64 = load i8*, i8** %13, align 4
  %65 = icmp eq i8* %63, %64
  br i1 %65, label %66, label %88

66:                                               ; preds = %62
  %67 = load i8, i8* %14, align 1
  %68 = sext i8 %67 to i32
  %69 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %70 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %69, i32 0, i32 7
  %71 = load i8, i8* %70, align 4
  %72 = and i8 %71, 1
  %73 = zext i8 %72 to i32
  %74 = or i32 %73, %68
  %75 = trunc i32 %74 to i8
  %76 = load i8, i8* %70, align 4
  %77 = and i8 %75, 1
  %78 = and i8 %76, -2
  %79 = or i8 %78, %77
  store i8 %79, i8* %70, align 4
  %80 = zext i8 %77 to i32
  store i8 1, i8* %14, align 1
  %81 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %82 = load i8**, i8*** %81, align 4
  %83 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %84 = load i32, i32* %83, align 4
  %85 = add i32 %84, -1
  store i32 %85, i32* %83, align 4
  %86 = getelementptr inbounds i8*, i8** %82, i32 %85
  %87 = load i8*, i8** %86, align 4
  store i8* %87, i8** %12, align 4
  br label %88

88:                                               ; preds = %66, %62
  %89 = load i8*, i8** %12, align 4
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  store i8* %90, i8** %12, align 4
  %91 = load i8, i8* %89, align 1
  %92 = zext i8 %91 to i32
  switch i32 %92, label %469 [
    i32 7, label %93
    i32 1, label %99
    i32 3, label %106
    i32 4, label %137
    i32 23, label %183
    i32 24, label %202
    i32 2, label %221
    i32 0, label %251
    i32 8, label %251
    i32 9, label %251
    i32 10, label %251
    i32 11, label %251
    i32 27, label %251
    i32 28, label %251
    i32 25, label %251
    i32 26, label %251
    i32 19, label %251
    i32 21, label %252
    i32 16, label %252
    i32 17, label %252
    i32 12, label %252
    i32 13, label %252
    i32 18, label %252
    i32 14, label %328
    i32 15, label %328
    i32 20, label %437
    i32 22, label %463
    i32 5, label %466
    i32 6, label %466
  ]

93:                                               ; preds = %88
  %94 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %95 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %94, i32 0, i32 7
  %96 = load i8, i8* %95, align 4
  %97 = and i8 %96, -2
  %98 = or i8 %97, 1
  store i8 %98, i8* %95, align 4
  store i32 0, i32* %2, align 4
  br label %487

99:                                               ; preds = %88
  %100 = load i8*, i8** %9, align 4
  %101 = load i8*, i8** %12, align 4
  %102 = getelementptr inbounds i8, i8* %101, i32 1
  %103 = load i8, i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = getelementptr inbounds i8, i8* %100, i32 %104
  store i8 1, i8* %105, align 1
  br label %470

106:                                              ; preds = %88
  %107 = load i8*, i8** %12, align 4
  %108 = getelementptr inbounds i8, i8* %107, i32 1
  store i8* %108, i8** %12, align 4
  %109 = load i8, i8* %107, align 1
  %110 = zext i8 %109 to i32
  %111 = mul nsw i32 %110, 8
  %112 = sub nsw i32 %111, 1
  store i32 %112, i32* %4, align 4
  br label %113

113:                                              ; preds = %133, %106
  %114 = load i32, i32* %4, align 4
  %115 = icmp sge i32 %114, 0
  br i1 %115, label %116, label %136

116:                                              ; preds = %113
  %117 = load i8*, i8** %12, align 4
  %118 = load i32, i32* %4, align 4
  %119 = sdiv i32 %118, 8
  %120 = getelementptr inbounds i8, i8* %117, i32 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = load i32, i32* %4, align 4
  %124 = srem i32 %123, 8
  %125 = shl i32 1, %124
  %126 = and i32 %122, %125
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %128, label %132

128:                                              ; preds = %116
  %129 = load i8*, i8** %9, align 4
  %130 = load i32, i32* %4, align 4
  %131 = getelementptr inbounds i8, i8* %129, i32 %130
  store i8 1, i8* %131, align 1
  br label %132

132:                                              ; preds = %128, %116
  br label %133

133:                                              ; preds = %132
  %134 = load i32, i32* %4, align 4
  %135 = add nsw i32 %134, -1
  store i32 %135, i32* %4, align 4
  br label %113

136:                                              ; preds = %113
  br label %470

137:                                              ; preds = %88
  %138 = load i8*, i8** %12, align 4
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = mul nsw i32 %140, 8
  store i32 %141, i32* %4, align 4
  br label %142

142:                                              ; preds = %149, %137
  %143 = load i32, i32* %4, align 4
  %144 = icmp slt i32 %143, 256
  br i1 %144, label %145, label %152

145:                                              ; preds = %142
  %146 = load i8*, i8** %9, align 4
  %147 = load i32, i32* %4, align 4
  %148 = getelementptr inbounds i8, i8* %146, i32 %147
  store i8 1, i8* %148, align 1
  br label %149

149:                                              ; preds = %145
  %150 = load i32, i32* %4, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %4, align 4
  br label %142

152:                                              ; preds = %142
  %153 = load i8*, i8** %12, align 4
  %154 = getelementptr inbounds i8, i8* %153, i32 1
  store i8* %154, i8** %12, align 4
  %155 = load i8, i8* %153, align 1
  %156 = zext i8 %155 to i32
  %157 = mul nsw i32 %156, 8
  %158 = sub nsw i32 %157, 1
  store i32 %158, i32* %4, align 4
  br label %159

159:                                              ; preds = %179, %152
  %160 = load i32, i32* %4, align 4
  %161 = icmp sge i32 %160, 0
  br i1 %161, label %162, label %182

162:                                              ; preds = %159
  %163 = load i8*, i8** %12, align 4
  %164 = load i32, i32* %4, align 4
  %165 = sdiv i32 %164, 8
  %166 = getelementptr inbounds i8, i8* %163, i32 %165
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = load i32, i32* %4, align 4
  %170 = srem i32 %169, 8
  %171 = shl i32 1, %170
  %172 = and i32 %168, %171
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %178, label %174

174:                                              ; preds = %162
  %175 = load i8*, i8** %9, align 4
  %176 = load i32, i32* %4, align 4
  %177 = getelementptr inbounds i8, i8* %175, i32 %176
  store i8 1, i8* %177, align 1
  br label %178

178:                                              ; preds = %174, %162
  br label %179

179:                                              ; preds = %178
  %180 = load i32, i32* %4, align 4
  %181 = add nsw i32 %180, -1
  store i32 %181, i32* %4, align 4
  br label %159

182:                                              ; preds = %159
  br label %470

183:                                              ; preds = %88
  store i32 0, i32* %4, align 4
  br label %184

184:                                              ; preds = %198, %183
  %185 = load i32, i32* %4, align 4
  %186 = icmp slt i32 %185, 256
  br i1 %186, label %187, label %201

187:                                              ; preds = %184
  %188 = load i32, i32* %4, align 4
  %189 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %188
  %190 = load i8, i8* %189, align 1
  %191 = sext i8 %190 to i32
  %192 = icmp eq i32 %191, 1
  br i1 %192, label %193, label %197

193:                                              ; preds = %187
  %194 = load i8*, i8** %9, align 4
  %195 = load i32, i32* %4, align 4
  %196 = getelementptr inbounds i8, i8* %194, i32 %195
  store i8 1, i8* %196, align 1
  br label %197

197:                                              ; preds = %193, %187
  br label %198

198:                                              ; preds = %197
  %199 = load i32, i32* %4, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %4, align 4
  br label %184

201:                                              ; preds = %184
  br label %470

202:                                              ; preds = %88
  store i32 0, i32* %4, align 4
  br label %203

203:                                              ; preds = %217, %202
  %204 = load i32, i32* %4, align 4
  %205 = icmp slt i32 %204, 256
  br i1 %205, label %206, label %220

206:                                              ; preds = %203
  %207 = load i32, i32* %4, align 4
  %208 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %207
  %209 = load i8, i8* %208, align 1
  %210 = sext i8 %209 to i32
  %211 = icmp ne i32 %210, 1
  br i1 %211, label %212, label %216

212:                                              ; preds = %206
  %213 = load i8*, i8** %9, align 4
  %214 = load i32, i32* %4, align 4
  %215 = getelementptr inbounds i8, i8* %213, i32 %214
  store i8 1, i8* %215, align 1
  br label %216

216:                                              ; preds = %212, %206
  br label %217

217:                                              ; preds = %216
  %218 = load i32, i32* %4, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %4, align 4
  br label %203

220:                                              ; preds = %203
  br label %470

221:                                              ; preds = %88
  store i32 0, i32* %4, align 4
  br label %222

222:                                              ; preds = %229, %221
  %223 = load i32, i32* %4, align 4
  %224 = icmp slt i32 %223, 256
  br i1 %224, label %225, label %232

225:                                              ; preds = %222
  %226 = load i8*, i8** %9, align 4
  %227 = load i32, i32* %4, align 4
  %228 = getelementptr inbounds i8, i8* %226, i32 %227
  store i8 1, i8* %228, align 1
  br label %229

229:                                              ; preds = %225
  %230 = load i32, i32* %4, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %4, align 4
  br label %222

232:                                              ; preds = %222
  %233 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %234 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %233, i32 0, i32 3
  %235 = load i32, i32* %234, align 4
  %236 = and i32 %235, 64
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %241, label %238

238:                                              ; preds = %232
  %239 = load i8*, i8** %9, align 4
  %240 = getelementptr inbounds i8, i8* %239, i32 10
  store i8 0, i8* %240, align 1
  br label %250

241:                                              ; preds = %232
  %242 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %243 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %242, i32 0, i32 7
  %244 = load i8, i8* %243, align 4
  %245 = and i8 %244, 1
  %246 = zext i8 %245 to i32
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %248, label %249

248:                                              ; preds = %241
  store i32 0, i32* %2, align 4
  br label %487

249:                                              ; preds = %241
  br label %250

250:                                              ; preds = %249, %238
  br label %470

251:                                              ; preds = %88, %88, %88, %88, %88, %88, %88, %88, %88, %88
  br label %51

252:                                              ; preds = %88, %88, %88, %88, %88, %88
  br label %253

253:                                              ; preds = %252
  br label %254

254:                                              ; preds = %253
  %255 = load i8*, i8** %12, align 4
  %256 = load i8, i8* %255, align 1
  %257 = zext i8 %256 to i32
  %258 = and i32 %257, 255
  store i32 %258, i32* %4, align 4
  %259 = load i8*, i8** %12, align 4
  %260 = getelementptr inbounds i8, i8* %259, i32 1
  %261 = load i8, i8* %260, align 1
  %262 = sext i8 %261 to i32
  %263 = shl i32 %262, 8
  %264 = load i32, i32* %4, align 4
  %265 = add nsw i32 %264, %263
  store i32 %265, i32* %4, align 4
  br label %266

266:                                              ; preds = %254
  %267 = load i8*, i8** %12, align 4
  %268 = getelementptr inbounds i8, i8* %267, i32 2
  store i8* %268, i8** %12, align 4
  br label %269

269:                                              ; preds = %266
  %270 = load i32, i32* %4, align 4
  %271 = load i8*, i8** %12, align 4
  %272 = getelementptr inbounds i8, i8* %271, i32 %270
  store i8* %272, i8** %12, align 4
  %273 = load i32, i32* %4, align 4
  %274 = icmp sgt i32 %273, 0
  br i1 %274, label %275, label %276

275:                                              ; preds = %269
  br label %51

276:                                              ; preds = %269
  %277 = load i8*, i8** %12, align 4
  %278 = load i8, i8* %277, align 1
  %279 = zext i8 %278 to i32
  %280 = icmp ne i32 %279, 14
  br i1 %280, label %281, label %287

281:                                              ; preds = %276
  %282 = load i8*, i8** %12, align 4
  %283 = load i8, i8* %282, align 1
  %284 = zext i8 %283 to i32
  %285 = icmp ne i32 %284, 20
  br i1 %285, label %286, label %287

286:                                              ; preds = %281
  br label %51

287:                                              ; preds = %281, %276
  %288 = load i8*, i8** %12, align 4
  %289 = getelementptr inbounds i8, i8* %288, i32 1
  store i8* %289, i8** %12, align 4
  br label %290

290:                                              ; preds = %287
  br label %291

291:                                              ; preds = %290
  %292 = load i8*, i8** %12, align 4
  %293 = load i8, i8* %292, align 1
  %294 = zext i8 %293 to i32
  %295 = and i32 %294, 255
  store i32 %295, i32* %4, align 4
  %296 = load i8*, i8** %12, align 4
  %297 = getelementptr inbounds i8, i8* %296, i32 1
  %298 = load i8, i8* %297, align 1
  %299 = sext i8 %298 to i32
  %300 = shl i32 %299, 8
  %301 = load i32, i32* %4, align 4
  %302 = add nsw i32 %301, %300
  store i32 %302, i32* %4, align 4
  br label %303

303:                                              ; preds = %291
  %304 = load i8*, i8** %12, align 4
  %305 = getelementptr inbounds i8, i8* %304, i32 2
  store i8* %305, i8** %12, align 4
  br label %306

306:                                              ; preds = %303
  %307 = load i32, i32* %4, align 4
  %308 = load i8*, i8** %12, align 4
  %309 = getelementptr inbounds i8, i8* %308, i32 %307
  store i8* %309, i8** %12, align 4
  %310 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %311 = load i32, i32* %310, align 4
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %327, label %313

313:                                              ; preds = %306
  %314 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %315 = load i8**, i8*** %314, align 4
  %316 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %317 = load i32, i32* %316, align 4
  %318 = sub i32 %317, 1
  %319 = getelementptr inbounds i8*, i8** %315, i32 %318
  %320 = load i8*, i8** %319, align 4
  %321 = load i8*, i8** %12, align 4
  %322 = icmp eq i8* %320, %321
  br i1 %322, label %323, label %327

323:                                              ; preds = %313
  %324 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %325 = load i32, i32* %324, align 4
  %326 = add i32 %325, -1
  store i32 %326, i32* %324, align 4
  br label %327

327:                                              ; preds = %323, %313, %306
  br label %51

328:                                              ; preds = %88, %88
  br label %329

329:                                              ; preds = %459, %328
  br label %330

330:                                              ; preds = %329
  br label %331

331:                                              ; preds = %330
  %332 = load i8*, i8** %12, align 4
  %333 = load i8, i8* %332, align 1
  %334 = zext i8 %333 to i32
  %335 = and i32 %334, 255
  store i32 %335, i32* %4, align 4
  %336 = load i8*, i8** %12, align 4
  %337 = getelementptr inbounds i8, i8* %336, i32 1
  %338 = load i8, i8* %337, align 1
  %339 = sext i8 %338 to i32
  %340 = shl i32 %339, 8
  %341 = load i32, i32* %4, align 4
  %342 = add nsw i32 %341, %340
  store i32 %342, i32* %4, align 4
  br label %343

343:                                              ; preds = %331
  %344 = load i8*, i8** %12, align 4
  %345 = getelementptr inbounds i8, i8* %344, i32 2
  store i8* %345, i8** %12, align 4
  br label %346

346:                                              ; preds = %343
  %347 = load i8*, i8** %12, align 4
  %348 = load i32, i32* %4, align 4
  %349 = getelementptr inbounds i8, i8* %347, i32 %348
  %350 = load i8*, i8** %13, align 4
  %351 = icmp ult i8* %349, %350
  br i1 %351, label %352, label %409

352:                                              ; preds = %346
  %353 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %354 = load i32, i32* %353, align 4
  %355 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  %356 = load i32, i32* %355, align 4
  %357 = icmp eq i32 %354, %356
  br i1 %357, label %358, label %397

358:                                              ; preds = %352
  %359 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  %360 = load i32, i32* %359, align 4
  %361 = load i32, i32* @re_max_failures, align 4
  %362 = load i32, i32* %8, align 4
  %363 = sub i32 %362, 1
  %364 = mul i32 %363, 3
  %365 = add i32 %364, 4
  %366 = mul i32 %361, %365
  %367 = icmp ugt i32 %360, %366
  br i1 %367, label %368, label %369

368:                                              ; preds = %358
  br i1 false, label %397, label %396

369:                                              ; preds = %358
  %370 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  %371 = load i32, i32* %370, align 4
  %372 = shl i32 %371, 1
  %373 = mul i32 %372, 4
  %374 = alloca i8, i32 %373, align 16
  store i8* %374, i8** %7, align 4
  %375 = load i8*, i8** %7, align 4
  %376 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %377 = load i8**, i8*** %376, align 4
  %378 = bitcast i8** %377 to i8*
  %379 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  %380 = load i32, i32* %379, align 4
  %381 = mul i32 %380, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %375, i8* align 4 %378, i32 %381, i1 false)
  %382 = load i8*, i8** %7, align 4
  %383 = bitcast i8* %382 to i8**
  %384 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  store i8** %383, i8*** %384, align 4
  %385 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %386 = load i8**, i8*** %385, align 4
  %387 = icmp eq i8** %386, null
  br i1 %387, label %388, label %389

388:                                              ; preds = %369
  br label %393

389:                                              ; preds = %369
  %390 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 1
  %391 = load i32, i32* %390, align 4
  %392 = shl i32 %391, 1
  store i32 %392, i32* %390, align 4
  br label %393

393:                                              ; preds = %389, %388
  %394 = phi i32 [ 0, %388 ], [ 1, %389 ]
  %395 = icmp ne i32 %394, 0
  br i1 %395, label %397, label %396

396:                                              ; preds = %393, %368
  br i1 false, label %408, label %407

397:                                              ; preds = %393, %368, %352
  %398 = load i8*, i8** %12, align 4
  %399 = load i32, i32* %4, align 4
  %400 = getelementptr inbounds i8, i8* %398, i32 %399
  %401 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 0
  %402 = load i8**, i8*** %401, align 4
  %403 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %6, i32 0, i32 2
  %404 = load i32, i32* %403, align 4
  %405 = add i32 %404, 1
  store i32 %405, i32* %403, align 4
  %406 = getelementptr inbounds i8*, i8** %402, i32 %404
  store i8* %400, i8** %406, align 4
  br i1 true, label %408, label %407

407:                                              ; preds = %397, %396
  store i32 -2, i32* %2, align 4
  br label %487

408:                                              ; preds = %397, %396
  br label %415

409:                                              ; preds = %346
  %410 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %411 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %410, i32 0, i32 7
  %412 = load i8, i8* %411, align 4
  %413 = and i8 %412, -2
  %414 = or i8 %413, 1
  store i8 %414, i8* %411, align 4
  br label %415

415:                                              ; preds = %409, %408
  %416 = load i8, i8* %15, align 1
  %417 = icmp ne i8 %416, 0
  br i1 %417, label %418, label %436

418:                                              ; preds = %415
  br label %419

419:                                              ; preds = %418
  br label %420

420:                                              ; preds = %419
  %421 = load i8*, i8** %12, align 4
  %422 = load i8, i8* %421, align 1
  %423 = zext i8 %422 to i32
  %424 = and i32 %423, 255
  store i32 %424, i32* %5, align 4
  %425 = load i8*, i8** %12, align 4
  %426 = getelementptr inbounds i8, i8* %425, i32 1
  %427 = load i8, i8* %426, align 1
  %428 = sext i8 %427 to i32
  %429 = shl i32 %428, 8
  %430 = load i32, i32* %5, align 4
  %431 = add nsw i32 %430, %429
  store i32 %431, i32* %5, align 4
  br label %432

432:                                              ; preds = %420
  %433 = load i8*, i8** %12, align 4
  %434 = getelementptr inbounds i8, i8* %433, i32 2
  store i8* %434, i8** %12, align 4
  br label %435

435:                                              ; preds = %432
  store i8 0, i8* %15, align 1
  br label %436

436:                                              ; preds = %435, %415
  br label %51

437:                                              ; preds = %88
  %438 = load i8*, i8** %12, align 4
  %439 = getelementptr inbounds i8, i8* %438, i32 2
  store i8* %439, i8** %12, align 4
  br label %440

440:                                              ; preds = %437
  br label %441

441:                                              ; preds = %440
  %442 = load i8*, i8** %12, align 4
  %443 = load i8, i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = and i32 %444, 255
  store i32 %445, i32* %5, align 4
  %446 = load i8*, i8** %12, align 4
  %447 = getelementptr inbounds i8, i8* %446, i32 1
  %448 = load i8, i8* %447, align 1
  %449 = sext i8 %448 to i32
  %450 = shl i32 %449, 8
  %451 = load i32, i32* %5, align 4
  %452 = add nsw i32 %451, %450
  store i32 %452, i32* %5, align 4
  br label %453

453:                                              ; preds = %441
  %454 = load i8*, i8** %12, align 4
  %455 = getelementptr inbounds i8, i8* %454, i32 2
  store i8* %455, i8** %12, align 4
  br label %456

456:                                              ; preds = %453
  %457 = load i32, i32* %5, align 4
  %458 = icmp eq i32 %457, 0
  br i1 %458, label %459, label %462

459:                                              ; preds = %456
  %460 = load i8*, i8** %12, align 4
  %461 = getelementptr inbounds i8, i8* %460, i32 -4
  store i8* %461, i8** %12, align 4
  store i8 1, i8* %15, align 1
  br label %329

462:                                              ; preds = %456
  br label %51

463:                                              ; preds = %88
  %464 = load i8*, i8** %12, align 4
  %465 = getelementptr inbounds i8, i8* %464, i32 4
  store i8* %465, i8** %12, align 4
  br label %51

466:                                              ; preds = %88, %88
  %467 = load i8*, i8** %12, align 4
  %468 = getelementptr inbounds i8, i8* %467, i32 2
  store i8* %468, i8** %12, align 4
  br label %51

469:                                              ; preds = %88
  call void @abort() #9
  unreachable

470:                                              ; preds = %250, %220, %201, %182, %136, %99
  store i8 0, i8* %14, align 1
  %471 = load i8*, i8** %13, align 4
  store i8* %471, i8** %12, align 4
  br label %51

472:                                              ; preds = %60
  %473 = load i8, i8* %14, align 1
  %474 = sext i8 %473 to i32
  %475 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %3, align 4
  %476 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %475, i32 0, i32 7
  %477 = load i8, i8* %476, align 4
  %478 = and i8 %477, 1
  %479 = zext i8 %478 to i32
  %480 = or i32 %479, %474
  %481 = trunc i32 %480 to i8
  %482 = load i8, i8* %476, align 4
  %483 = and i8 %481, 1
  %484 = and i8 %482, -2
  %485 = or i8 %484, %483
  store i8 %485, i8* %476, align 4
  %486 = zext i8 %483 to i32
  store i32 0, i32* %2, align 4
  br label %487

487:                                              ; preds = %472, %407, %248, %93, %36
  %488 = load i32, i32* %2, align 4
  ret i32 %488
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #6

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #4

; Function Attrs: noinline nounwind optnone
define dso_local void @re_set_registers(%struct.re_pattern_buffer*, %struct.re_registers*, i32, i32*, i32*) #0 {
  %6 = alloca %struct.re_pattern_buffer*, align 4
  %7 = alloca %struct.re_registers*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 4
  %10 = alloca i32*, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %6, align 4
  store %struct.re_registers* %1, %struct.re_registers** %7, align 4
  store i32 %2, i32* %8, align 4
  store i32* %3, i32** %9, align 4
  store i32* %4, i32** %10, align 4
  %11 = load i32, i32* %8, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %5
  %14 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %15 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %14, i32 0, i32 7
  %16 = load i8, i8* %15, align 4
  %17 = and i8 %16, -7
  %18 = or i8 %17, 2
  store i8 %18, i8* %15, align 4
  %19 = load i32, i32* %8, align 4
  %20 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %21 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %20, i32 0, i32 0
  store i32 %19, i32* %21, align 4
  %22 = load i32*, i32** %9, align 4
  %23 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %24 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %23, i32 0, i32 1
  store i32* %22, i32** %24, align 4
  %25 = load i32*, i32** %10, align 4
  %26 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %27 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %26, i32 0, i32 2
  store i32* %25, i32** %27, align 4
  br label %39

28:                                               ; preds = %5
  %29 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %30 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %29, i32 0, i32 7
  %31 = load i8, i8* %30, align 4
  %32 = and i8 %31, -7
  store i8 %32, i8* %30, align 4
  %33 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %34 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %33, i32 0, i32 0
  store i32 0, i32* %34, align 4
  %35 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %36 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %35, i32 0, i32 2
  store i32* null, i32** %36, align 4
  %37 = load %struct.re_registers*, %struct.re_registers** %7, align 4
  %38 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %37, i32 0, i32 1
  store i32* null, i32** %38, align 4
  br label %39

39:                                               ; preds = %28, %13
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_search_2(%struct.re_pattern_buffer*, i8*, i32, i8*, i32, i32, i32, %struct.re_registers*, i32) #0 {
  %10 = alloca i32, align 4
  %11 = alloca %struct.re_pattern_buffer*, align 4
  %12 = alloca i8*, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.re_registers*, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i8*, align 4
  %22 = alloca i8*, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i8*, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i8, align 1
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %11, align 4
  store i8* %1, i8** %12, align 4
  store i32 %2, i32* %13, align 4
  store i8* %3, i8** %14, align 4
  store i32 %4, i32* %15, align 4
  store i32 %5, i32* %16, align 4
  store i32 %6, i32* %17, align 4
  store %struct.re_registers* %7, %struct.re_registers** %18, align 4
  store i32 %8, i32* %19, align 4
  %29 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %30 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %29, i32 0, i32 4
  %31 = load i8*, i8** %30, align 4
  store i8* %31, i8** %21, align 4
  %32 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %33 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %32, i32 0, i32 5
  %34 = load i8*, i8** %33, align 4
  store i8* %34, i8** %22, align 4
  %35 = load i32, i32* %13, align 4
  %36 = load i32, i32* %15, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, i32* %23, align 4
  %38 = load i32, i32* %16, align 4
  %39 = load i32, i32* %17, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, i32* %24, align 4
  %41 = load i32, i32* %16, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %47, label %43

43:                                               ; preds = %9
  %44 = load i32, i32* %16, align 4
  %45 = load i32, i32* %23, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %43, %9
  store i32 -1, i32* %10, align 4
  br label %310

48:                                               ; preds = %43
  %49 = load i32, i32* %24, align 4
  %50 = icmp slt i32 %49, -1
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, i32* %16, align 4
  %53 = sub nsw i32 -1, %52
  store i32 %53, i32* %17, align 4
  br label %63

54:                                               ; preds = %48
  %55 = load i32, i32* %24, align 4
  %56 = load i32, i32* %23, align 4
  %57 = icmp sgt i32 %55, %56
  br i1 %57, label %58, label %62

58:                                               ; preds = %54
  %59 = load i32, i32* %23, align 4
  %60 = load i32, i32* %16, align 4
  %61 = sub nsw i32 %59, %60
  store i32 %61, i32* %17, align 4
  br label %62

62:                                               ; preds = %58, %54
  br label %63

63:                                               ; preds = %62, %51
  %64 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %65 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %64, i32 0, i32 2
  %66 = load i32, i32* %65, align 4
  %67 = icmp ugt i32 %66, 0
  br i1 %67, label %68, label %85

68:                                               ; preds = %63
  %69 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %70 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %69, i32 0, i32 0
  %71 = load i8*, i8** %70, align 4
  %72 = getelementptr inbounds i8, i8* %71, i32 0
  %73 = load i8, i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 10
  br i1 %75, label %76, label %85

76:                                               ; preds = %68
  %77 = load i32, i32* %17, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %85

79:                                               ; preds = %76
  %80 = load i32, i32* %16, align 4
  %81 = icmp sgt i32 %80, 0
  br i1 %81, label %82, label %83

82:                                               ; preds = %79
  store i32 -1, i32* %10, align 4
  br label %310

83:                                               ; preds = %79
  store i32 1, i32* %17, align 4
  br label %84

84:                                               ; preds = %83
  br label %85

85:                                               ; preds = %84, %76, %68, %63
  %86 = load i8*, i8** %21, align 4
  %87 = icmp ne i8* %86, null
  br i1 %87, label %88, label %102

88:                                               ; preds = %85
  %89 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %90 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %89, i32 0, i32 7
  %91 = load i8, i8* %90, align 4
  %92 = lshr i8 %91, 3
  %93 = and i8 %92, 1
  %94 = zext i8 %93 to i32
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %102, label %96

96:                                               ; preds = %88
  %97 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %98 = call i32 @re_compile_fastmap(%struct.re_pattern_buffer* %97)
  %99 = icmp eq i32 %98, -2
  br i1 %99, label %100, label %101

100:                                              ; preds = %96
  store i32 -2, i32* %10, align 4
  br label %310

101:                                              ; preds = %96
  br label %102

102:                                              ; preds = %101, %88, %85
  br label %103

103:                                              ; preds = %308, %102
  %104 = load i8*, i8** %21, align 4
  %105 = icmp ne i8* %104, null
  br i1 %105, label %106, label %253

106:                                              ; preds = %103
  %107 = load i32, i32* %16, align 4
  %108 = load i32, i32* %23, align 4
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %110, label %253

110:                                              ; preds = %106
  %111 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %112 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %111, i32 0, i32 7
  %113 = load i8, i8* %112, align 4
  %114 = and i8 %113, 1
  %115 = zext i8 %114 to i32
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %253, label %117

117:                                              ; preds = %110
  %118 = load i32, i32* %17, align 4
  %119 = icmp sgt i32 %118, 0
  br i1 %119, label %120, label %206

120:                                              ; preds = %117
  store i32 0, i32* %26, align 4
  %121 = load i32, i32* %17, align 4
  store i32 %121, i32* %27, align 4
  %122 = load i32, i32* %16, align 4
  %123 = load i32, i32* %13, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %137

125:                                              ; preds = %120
  %126 = load i32, i32* %16, align 4
  %127 = load i32, i32* %17, align 4
  %128 = add nsw i32 %126, %127
  %129 = load i32, i32* %13, align 4
  %130 = icmp sge i32 %128, %129
  br i1 %130, label %131, label %137

131:                                              ; preds = %125
  %132 = load i32, i32* %17, align 4
  %133 = load i32, i32* %13, align 4
  %134 = load i32, i32* %16, align 4
  %135 = sub nsw i32 %133, %134
  %136 = sub nsw i32 %132, %135
  store i32 %136, i32* %26, align 4
  br label %137

137:                                              ; preds = %131, %125, %120
  %138 = load i32, i32* %16, align 4
  %139 = load i32, i32* %13, align 4
  %140 = icmp sge i32 %138, %139
  br i1 %140, label %141, label %146

141:                                              ; preds = %137
  %142 = load i8*, i8** %14, align 4
  %143 = load i32, i32* %13, align 4
  %144 = sub i32 0, %143
  %145 = getelementptr inbounds i8, i8* %142, i32 %144
  br label %148

146:                                              ; preds = %137
  %147 = load i8*, i8** %12, align 4
  br label %148

148:                                              ; preds = %146, %141
  %149 = phi i8* [ %145, %141 ], [ %147, %146 ]
  %150 = load i32, i32* %16, align 4
  %151 = getelementptr inbounds i8, i8* %149, i32 %150
  store i8* %151, i8** %25, align 4
  %152 = load i8*, i8** %22, align 4
  %153 = icmp ne i8* %152, null
  br i1 %153, label %154, label %179

154:                                              ; preds = %148
  br label %155

155:                                              ; preds = %175, %154
  %156 = load i32, i32* %17, align 4
  %157 = load i32, i32* %26, align 4
  %158 = icmp sgt i32 %156, %157
  br i1 %158, label %159, label %173

159:                                              ; preds = %155
  %160 = load i8*, i8** %21, align 4
  %161 = load i8*, i8** %22, align 4
  %162 = load i8*, i8** %25, align 4
  %163 = getelementptr inbounds i8, i8* %162, i32 1
  store i8* %163, i8** %25, align 4
  %164 = load i8, i8* %162, align 1
  %165 = zext i8 %164 to i32
  %166 = getelementptr inbounds i8, i8* %161, i32 %165
  %167 = load i8, i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = getelementptr inbounds i8, i8* %160, i32 %168
  %170 = load i8, i8* %169, align 1
  %171 = icmp ne i8 %170, 0
  %172 = xor i1 %171, true
  br label %173

173:                                              ; preds = %159, %155
  %174 = phi i1 [ false, %155 ], [ %172, %159 ]
  br i1 %174, label %175, label %178

175:                                              ; preds = %173
  %176 = load i32, i32* %17, align 4
  %177 = add nsw i32 %176, -1
  store i32 %177, i32* %17, align 4
  br label %155

178:                                              ; preds = %173
  br label %200

179:                                              ; preds = %148
  br label %180

180:                                              ; preds = %196, %179
  %181 = load i32, i32* %17, align 4
  %182 = load i32, i32* %26, align 4
  %183 = icmp sgt i32 %181, %182
  br i1 %183, label %184, label %194

184:                                              ; preds = %180
  %185 = load i8*, i8** %21, align 4
  %186 = load i8*, i8** %25, align 4
  %187 = getelementptr inbounds i8, i8* %186, i32 1
  store i8* %187, i8** %25, align 4
  %188 = load i8, i8* %186, align 1
  %189 = zext i8 %188 to i32
  %190 = getelementptr inbounds i8, i8* %185, i32 %189
  %191 = load i8, i8* %190, align 1
  %192 = icmp ne i8 %191, 0
  %193 = xor i1 %192, true
  br label %194

194:                                              ; preds = %184, %180
  %195 = phi i1 [ false, %180 ], [ %193, %184 ]
  br i1 %195, label %196, label %199

196:                                              ; preds = %194
  %197 = load i32, i32* %17, align 4
  %198 = add nsw i32 %197, -1
  store i32 %198, i32* %17, align 4
  br label %180

199:                                              ; preds = %194
  br label %200

200:                                              ; preds = %199, %178
  %201 = load i32, i32* %27, align 4
  %202 = load i32, i32* %17, align 4
  %203 = sub nsw i32 %201, %202
  %204 = load i32, i32* %16, align 4
  %205 = add nsw i32 %204, %203
  store i32 %205, i32* %16, align 4
  br label %252

206:                                              ; preds = %117
  %207 = load i32, i32* %13, align 4
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %213, label %209

209:                                              ; preds = %206
  %210 = load i32, i32* %16, align 4
  %211 = load i32, i32* %13, align 4
  %212 = icmp sge i32 %210, %211
  br i1 %212, label %213, label %221

213:                                              ; preds = %209, %206
  %214 = load i8*, i8** %14, align 4
  %215 = load i32, i32* %16, align 4
  %216 = load i32, i32* %13, align 4
  %217 = sub nsw i32 %215, %216
  %218 = getelementptr inbounds i8, i8* %214, i32 %217
  %219 = load i8, i8* %218, align 1
  %220 = sext i8 %219 to i32
  br label %227

221:                                              ; preds = %209
  %222 = load i8*, i8** %12, align 4
  %223 = load i32, i32* %16, align 4
  %224 = getelementptr inbounds i8, i8* %222, i32 %223
  %225 = load i8, i8* %224, align 1
  %226 = sext i8 %225 to i32
  br label %227

227:                                              ; preds = %221, %213
  %228 = phi i32 [ %220, %213 ], [ %226, %221 ]
  %229 = trunc i32 %228 to i8
  store i8 %229, i8* %28, align 1
  %230 = load i8*, i8** %21, align 4
  %231 = load i8*, i8** %22, align 4
  %232 = icmp ne i8* %231, null
  br i1 %232, label %233, label %240

233:                                              ; preds = %227
  %234 = load i8*, i8** %22, align 4
  %235 = load i8, i8* %28, align 1
  %236 = zext i8 %235 to i32
  %237 = getelementptr inbounds i8, i8* %234, i32 %236
  %238 = load i8, i8* %237, align 1
  %239 = sext i8 %238 to i32
  br label %243

240:                                              ; preds = %227
  %241 = load i8, i8* %28, align 1
  %242 = sext i8 %241 to i32
  br label %243

243:                                              ; preds = %240, %233
  %244 = phi i32 [ %239, %233 ], [ %242, %240 ]
  %245 = trunc i32 %244 to i8
  %246 = zext i8 %245 to i32
  %247 = getelementptr inbounds i8, i8* %230, i32 %246
  %248 = load i8, i8* %247, align 1
  %249 = icmp ne i8 %248, 0
  br i1 %249, label %251, label %250

250:                                              ; preds = %243
  br label %290

251:                                              ; preds = %243
  br label %252

252:                                              ; preds = %251, %200
  br label %253

253:                                              ; preds = %252, %110, %106, %103
  %254 = load i32, i32* %17, align 4
  %255 = icmp sge i32 %254, 0
  br i1 %255, label %256, label %271

256:                                              ; preds = %253
  %257 = load i32, i32* %16, align 4
  %258 = load i32, i32* %23, align 4
  %259 = icmp eq i32 %257, %258
  br i1 %259, label %260, label %271

260:                                              ; preds = %256
  %261 = load i8*, i8** %21, align 4
  %262 = icmp ne i8* %261, null
  br i1 %262, label %263, label %271

263:                                              ; preds = %260
  %264 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %265 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %264, i32 0, i32 7
  %266 = load i8, i8* %265, align 4
  %267 = and i8 %266, 1
  %268 = zext i8 %267 to i32
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %271, label %270

270:                                              ; preds = %263
  store i32 -1, i32* %10, align 4
  br label %310

271:                                              ; preds = %263, %260, %256, %253
  %272 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %11, align 4
  %273 = load i8*, i8** %12, align 4
  %274 = load i32, i32* %13, align 4
  %275 = load i8*, i8** %14, align 4
  %276 = load i32, i32* %15, align 4
  %277 = load i32, i32* %16, align 4
  %278 = load %struct.re_registers*, %struct.re_registers** %18, align 4
  %279 = load i32, i32* %19, align 4
  %280 = call i32 @re_match_2(%struct.re_pattern_buffer* %272, i8* %273, i32 %274, i8* %275, i32 %276, i32 %277, %struct.re_registers* %278, i32 %279)
  store i32 %280, i32* %20, align 4
  %281 = load i32, i32* %20, align 4
  %282 = icmp sge i32 %281, 0
  br i1 %282, label %283, label %285

283:                                              ; preds = %271
  %284 = load i32, i32* %16, align 4
  store i32 %284, i32* %10, align 4
  br label %310

285:                                              ; preds = %271
  %286 = load i32, i32* %20, align 4
  %287 = icmp eq i32 %286, -2
  br i1 %287, label %288, label %289

288:                                              ; preds = %285
  store i32 -2, i32* %10, align 4
  br label %310

289:                                              ; preds = %285
  br label %290

290:                                              ; preds = %289, %250
  %291 = load i32, i32* %17, align 4
  %292 = icmp ne i32 %291, 0
  br i1 %292, label %294, label %293

293:                                              ; preds = %290
  br label %309

294:                                              ; preds = %290
  %295 = load i32, i32* %17, align 4
  %296 = icmp sgt i32 %295, 0
  br i1 %296, label %297, label %302

297:                                              ; preds = %294
  %298 = load i32, i32* %17, align 4
  %299 = add nsw i32 %298, -1
  store i32 %299, i32* %17, align 4
  %300 = load i32, i32* %16, align 4
  %301 = add nsw i32 %300, 1
  store i32 %301, i32* %16, align 4
  br label %307

302:                                              ; preds = %294
  %303 = load i32, i32* %17, align 4
  %304 = add nsw i32 %303, 1
  store i32 %304, i32* %17, align 4
  %305 = load i32, i32* %16, align 4
  %306 = add nsw i32 %305, -1
  store i32 %306, i32* %16, align 4
  br label %307

307:                                              ; preds = %302, %297
  br label %308

308:                                              ; preds = %307
  br label %103

309:                                              ; preds = %293
  store i32 -1, i32* %10, align 4
  br label %310

310:                                              ; preds = %309, %288, %283, %270, %100, %82, %47
  %311 = load i32, i32* %10, align 4
  ret i32 %311
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_match_2(%struct.re_pattern_buffer*, i8*, i32, i8*, i32, i32, %struct.re_registers*, i32) #0 {
  %9 = alloca i32, align 4
  %10 = alloca %struct.re_pattern_buffer*, align 4
  %11 = alloca i8*, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.re_registers*, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i8*, align 4
  %20 = alloca i8*, align 4
  %21 = alloca i8*, align 4
  %22 = alloca i8*, align 4
  %23 = alloca i8*, align 4
  %24 = alloca i8*, align 4
  %25 = alloca i8*, align 4
  %26 = alloca i8*, align 4
  %27 = alloca i8*, align 4
  %28 = alloca i8*, align 4
  %29 = alloca %struct.fail_stack_type, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i8**, align 4
  %34 = alloca i8**, align 4
  %35 = alloca i8**, align 4
  %36 = alloca i8**, align 4
  %37 = alloca %union.register_info_type*, align 4
  %38 = alloca i32, align 4
  %39 = alloca i8**, align 4
  %40 = alloca i8**, align 4
  %41 = alloca i8*, align 4
  %42 = alloca i8**, align 4
  %43 = alloca %union.register_info_type*, align 4
  %44 = alloca i8, align 1
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i8, align 1
  %48 = alloca i8, align 1
  %49 = alloca i32, align 4
  %50 = alloca i8, align 1
  %51 = alloca i8, align 1
  %52 = alloca i32, align 4
  %53 = alloca i8*, align 4
  %54 = alloca i32, align 4
  %55 = alloca i8*, align 4
  %56 = alloca i8*, align 4
  %57 = alloca i32, align 4
  %58 = alloca i8*, align 4
  %59 = alloca i32, align 4
  %60 = alloca i8*, align 4
  %61 = alloca i32, align 4
  %62 = alloca i8*, align 4
  %63 = alloca i8, align 1
  %64 = alloca i32, align 4
  %65 = alloca i32, align 4
  %66 = alloca i32, align 4
  %67 = alloca i8*, align 4
  %68 = alloca i8*, align 4
  %69 = alloca i32, align 4
  %70 = alloca i8*, align 4
  %71 = alloca i8*, align 4
  %72 = alloca i32, align 4
  %73 = alloca i8*, align 4
  %74 = alloca i32, align 4
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i8*, align 4
  %79 = alloca i8, align 1
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %10, align 4
  store i8* %1, i8** %11, align 4
  store i32 %2, i32* %12, align 4
  store i8* %3, i8** %13, align 4
  store i32 %4, i32* %14, align 4
  store i32 %5, i32* %15, align 4
  store %struct.re_registers* %6, %struct.re_registers** %16, align 4
  store i32 %7, i32* %17, align 4
  %80 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %81 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %80, i32 0, i32 0
  %82 = load i8*, i8** %81, align 4
  store i8* %82, i8** %26, align 4
  %83 = load i8*, i8** %26, align 4
  %84 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %85 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %84, i32 0, i32 2
  %86 = load i32, i32* %85, align 4
  %87 = getelementptr inbounds i8, i8* %83, i32 %86
  store i8* %87, i8** %27, align 4
  %88 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %89 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %88, i32 0, i32 5
  %90 = load i8*, i8** %89, align 4
  store i8* %90, i8** %28, align 4
  %91 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %92 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %91, i32 0, i32 6
  %93 = load i32, i32* %92, align 4
  %94 = add i32 %93, 1
  store i32 %94, i32* %30, align 4
  store i32 257, i32* %31, align 4
  store i32 256, i32* %32, align 4
  store i32 0, i32* %38, align 4
  store i8* null, i8** %41, align 4
  br label %95

95:                                               ; preds = %8
  %96 = alloca i8, i32 20, align 16
  %97 = bitcast i8* %96 to i8**
  %98 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %97, i8*** %98, align 4
  %99 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %100 = load i8**, i8*** %99, align 4
  %101 = icmp eq i8** %100, null
  br i1 %101, label %102, label %103

102:                                              ; preds = %95
  store i32 -2, i32* %9, align 4
  br label %3471

103:                                              ; preds = %95
  %104 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  store i32 5, i32* %104, align 4
  %105 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  store i32 0, i32* %105, align 4
  br label %106

106:                                              ; preds = %103
  %107 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %108 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %107, i32 0, i32 6
  %109 = load i32, i32* %108, align 4
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %177

111:                                              ; preds = %106
  %112 = load i32, i32* %30, align 4
  %113 = mul i32 %112, 4
  %114 = alloca i8, i32 %113, align 16
  %115 = bitcast i8* %114 to i8**
  store i8** %115, i8*** %33, align 4
  %116 = load i32, i32* %30, align 4
  %117 = mul i32 %116, 4
  %118 = alloca i8, i32 %117, align 16
  %119 = bitcast i8* %118 to i8**
  store i8** %119, i8*** %34, align 4
  %120 = load i32, i32* %30, align 4
  %121 = mul i32 %120, 4
  %122 = alloca i8, i32 %121, align 16
  %123 = bitcast i8* %122 to i8**
  store i8** %123, i8*** %35, align 4
  %124 = load i32, i32* %30, align 4
  %125 = mul i32 %124, 4
  %126 = alloca i8, i32 %125, align 16
  %127 = bitcast i8* %126 to i8**
  store i8** %127, i8*** %36, align 4
  %128 = load i32, i32* %30, align 4
  %129 = mul i32 %128, 4
  %130 = alloca i8, i32 %129, align 16
  %131 = bitcast i8* %130 to i8**
  store i8** %131, i8*** %39, align 4
  %132 = load i32, i32* %30, align 4
  %133 = mul i32 %132, 4
  %134 = alloca i8, i32 %133, align 16
  %135 = bitcast i8* %134 to i8**
  store i8** %135, i8*** %40, align 4
  %136 = load i32, i32* %30, align 4
  %137 = mul i32 %136, 4
  %138 = alloca i8, i32 %137, align 16
  %139 = bitcast i8* %138 to %union.register_info_type*
  store %union.register_info_type* %139, %union.register_info_type** %37, align 4
  %140 = load i32, i32* %30, align 4
  %141 = mul i32 %140, 4
  %142 = alloca i8, i32 %141, align 16
  %143 = bitcast i8* %142 to i8**
  store i8** %143, i8*** %42, align 4
  %144 = load i32, i32* %30, align 4
  %145 = mul i32 %144, 4
  %146 = alloca i8, i32 %145, align 16
  %147 = bitcast i8* %146 to %union.register_info_type*
  store %union.register_info_type* %147, %union.register_info_type** %43, align 4
  %148 = load i8**, i8*** %33, align 4
  %149 = icmp ne i8** %148, null
  br i1 %149, label %150, label %174

150:                                              ; preds = %111
  %151 = load i8**, i8*** %34, align 4
  %152 = icmp ne i8** %151, null
  br i1 %152, label %153, label %174

153:                                              ; preds = %150
  %154 = load i8**, i8*** %35, align 4
  %155 = icmp ne i8** %154, null
  br i1 %155, label %156, label %174

156:                                              ; preds = %153
  %157 = load i8**, i8*** %36, align 4
  %158 = icmp ne i8** %157, null
  br i1 %158, label %159, label %174

159:                                              ; preds = %156
  %160 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %161 = icmp ne %union.register_info_type* %160, null
  br i1 %161, label %162, label %174

162:                                              ; preds = %159
  %163 = load i8**, i8*** %39, align 4
  %164 = icmp ne i8** %163, null
  br i1 %164, label %165, label %174

165:                                              ; preds = %162
  %166 = load i8**, i8*** %40, align 4
  %167 = icmp ne i8** %166, null
  br i1 %167, label %168, label %174

168:                                              ; preds = %165
  %169 = load i8**, i8*** %42, align 4
  %170 = icmp ne i8** %169, null
  br i1 %170, label %171, label %174

171:                                              ; preds = %168
  %172 = load %union.register_info_type*, %union.register_info_type** %43, align 4
  %173 = icmp ne %union.register_info_type* %172, null
  br i1 %173, label %176, label %174

174:                                              ; preds = %171, %168, %165, %162, %159, %156, %153, %150, %111
  %175 = alloca i8, i32 0, align 16
  store i32 -2, i32* %9, align 4
  br label %3471

176:                                              ; preds = %171
  br label %177

177:                                              ; preds = %176, %106
  %178 = load i32, i32* %15, align 4
  %179 = icmp slt i32 %178, 0
  br i1 %179, label %186, label %180

180:                                              ; preds = %177
  %181 = load i32, i32* %15, align 4
  %182 = load i32, i32* %12, align 4
  %183 = load i32, i32* %14, align 4
  %184 = add nsw i32 %182, %183
  %185 = icmp sgt i32 %181, %184
  br i1 %185, label %186, label %188

186:                                              ; preds = %180, %177
  %187 = alloca i8, i32 0, align 16
  store i32 -1, i32* %9, align 4
  br label %3471

188:                                              ; preds = %180
  store i32 1, i32* %18, align 4
  br label %189

189:                                              ; preds = %235, %188
  %190 = load i32, i32* %18, align 4
  %191 = load i32, i32* %30, align 4
  %192 = icmp ult i32 %190, %191
  br i1 %192, label %193, label %238

193:                                              ; preds = %189
  %194 = load i8**, i8*** %36, align 4
  %195 = load i32, i32* %18, align 4
  %196 = getelementptr inbounds i8*, i8** %194, i32 %195
  store i8* inttoptr (i32 -1 to i8*), i8** %196, align 4
  %197 = load i8**, i8*** %35, align 4
  %198 = load i32, i32* %18, align 4
  %199 = getelementptr inbounds i8*, i8** %197, i32 %198
  store i8* inttoptr (i32 -1 to i8*), i8** %199, align 4
  %200 = load i8**, i8*** %34, align 4
  %201 = load i32, i32* %18, align 4
  %202 = getelementptr inbounds i8*, i8** %200, i32 %201
  store i8* inttoptr (i32 -1 to i8*), i8** %202, align 4
  %203 = load i8**, i8*** %33, align 4
  %204 = load i32, i32* %18, align 4
  %205 = getelementptr inbounds i8*, i8** %203, i32 %204
  store i8* inttoptr (i32 -1 to i8*), i8** %205, align 4
  %206 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %207 = load i32, i32* %18, align 4
  %208 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %206, i32 %207
  %209 = bitcast %union.register_info_type* %208 to %struct.anon.2*
  %210 = bitcast %struct.anon.2* %209 to i8*
  %211 = load i8, i8* %210, align 4
  %212 = and i8 %211, -4
  %213 = or i8 %212, 3
  store i8 %213, i8* %210, align 4
  %214 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %215 = load i32, i32* %18, align 4
  %216 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %214, i32 %215
  %217 = bitcast %union.register_info_type* %216 to %struct.anon.2*
  %218 = bitcast %struct.anon.2* %217 to i8*
  %219 = load i8, i8* %218, align 4
  %220 = and i8 %219, -5
  store i8 %220, i8* %218, align 4
  %221 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %222 = load i32, i32* %18, align 4
  %223 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %221, i32 %222
  %224 = bitcast %union.register_info_type* %223 to %struct.anon.2*
  %225 = bitcast %struct.anon.2* %224 to i8*
  %226 = load i8, i8* %225, align 4
  %227 = and i8 %226, -9
  store i8 %227, i8* %225, align 4
  %228 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %229 = load i32, i32* %18, align 4
  %230 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %228, i32 %229
  %231 = bitcast %union.register_info_type* %230 to %struct.anon.2*
  %232 = bitcast %struct.anon.2* %231 to i8*
  %233 = load i8, i8* %232, align 4
  %234 = and i8 %233, -17
  store i8 %234, i8* %232, align 4
  br label %235

235:                                              ; preds = %193
  %236 = load i32, i32* %18, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %18, align 4
  br label %189

238:                                              ; preds = %189
  %239 = load i32, i32* %14, align 4
  %240 = icmp eq i32 %239, 0
  br i1 %240, label %241, label %247

241:                                              ; preds = %238
  %242 = load i8*, i8** %11, align 4
  %243 = icmp ne i8* %242, null
  br i1 %243, label %244, label %247

244:                                              ; preds = %241
  %245 = load i8*, i8** %11, align 4
  store i8* %245, i8** %13, align 4
  %246 = load i32, i32* %12, align 4
  store i32 %246, i32* %14, align 4
  store i8* null, i8** %11, align 4
  store i32 0, i32* %12, align 4
  br label %247

247:                                              ; preds = %244, %241, %238
  %248 = load i8*, i8** %11, align 4
  %249 = load i32, i32* %12, align 4
  %250 = getelementptr inbounds i8, i8* %248, i32 %249
  store i8* %250, i8** %20, align 4
  %251 = load i8*, i8** %13, align 4
  %252 = load i32, i32* %14, align 4
  %253 = getelementptr inbounds i8, i8* %251, i32 %252
  store i8* %253, i8** %21, align 4
  %254 = load i32, i32* %17, align 4
  %255 = load i32, i32* %12, align 4
  %256 = icmp sle i32 %254, %255
  br i1 %256, label %257, label %262

257:                                              ; preds = %247
  %258 = load i8*, i8** %11, align 4
  %259 = load i32, i32* %17, align 4
  %260 = getelementptr inbounds i8, i8* %258, i32 %259
  store i8* %260, i8** %22, align 4
  %261 = load i8*, i8** %13, align 4
  store i8* %261, i8** %23, align 4
  br label %270

262:                                              ; preds = %247
  %263 = load i8*, i8** %20, align 4
  store i8* %263, i8** %22, align 4
  %264 = load i8*, i8** %13, align 4
  %265 = load i32, i32* %17, align 4
  %266 = getelementptr inbounds i8, i8* %264, i32 %265
  %267 = load i32, i32* %12, align 4
  %268 = sub i32 0, %267
  %269 = getelementptr inbounds i8, i8* %266, i32 %268
  store i8* %269, i8** %23, align 4
  br label %270

270:                                              ; preds = %262, %257
  %271 = load i32, i32* %12, align 4
  %272 = icmp sgt i32 %271, 0
  br i1 %272, label %273, label %282

273:                                              ; preds = %270
  %274 = load i32, i32* %15, align 4
  %275 = load i32, i32* %12, align 4
  %276 = icmp sle i32 %274, %275
  br i1 %276, label %277, label %282

277:                                              ; preds = %273
  %278 = load i8*, i8** %11, align 4
  %279 = load i32, i32* %15, align 4
  %280 = getelementptr inbounds i8, i8* %278, i32 %279
  store i8* %280, i8** %24, align 4
  %281 = load i8*, i8** %22, align 4
  store i8* %281, i8** %25, align 4
  br label %290

282:                                              ; preds = %273, %270
  %283 = load i8*, i8** %13, align 4
  %284 = load i32, i32* %15, align 4
  %285 = getelementptr inbounds i8, i8* %283, i32 %284
  %286 = load i32, i32* %12, align 4
  %287 = sub i32 0, %286
  %288 = getelementptr inbounds i8, i8* %285, i32 %287
  store i8* %288, i8** %24, align 4
  %289 = load i8*, i8** %23, align 4
  store i8* %289, i8** %25, align 4
  br label %290

290:                                              ; preds = %282, %277
  br label %291

291:                                              ; preds = %3464, %3315, %290
  %292 = load i8*, i8** %26, align 4
  %293 = load i8*, i8** %27, align 4
  %294 = icmp eq i8* %292, %293
  br i1 %294, label %295, label %748

295:                                              ; preds = %291
  %296 = load i8*, i8** %24, align 4
  %297 = load i8*, i8** %23, align 4
  %298 = icmp ne i8* %296, %297
  br i1 %298, label %299, label %413

299:                                              ; preds = %295
  %300 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %301 = load i32, i32* %300, align 4
  %302 = icmp eq i32 %301, 0
  br i1 %302, label %369, label %303

303:                                              ; preds = %299
  %304 = load i32, i32* %12, align 4
  %305 = icmp ne i32 %304, 0
  br i1 %305, label %306, label %316

306:                                              ; preds = %303
  %307 = load i8*, i8** %11, align 4
  %308 = load i8*, i8** %41, align 4
  %309 = icmp ule i8* %307, %308
  br i1 %309, label %310, label %316

310:                                              ; preds = %306
  %311 = load i8*, i8** %41, align 4
  %312 = load i8*, i8** %11, align 4
  %313 = load i32, i32* %12, align 4
  %314 = getelementptr inbounds i8, i8* %312, i32 %313
  %315 = icmp ule i8* %311, %314
  br label %316

316:                                              ; preds = %310, %306, %303
  %317 = phi i1 [ false, %306 ], [ false, %303 ], [ %315, %310 ]
  %318 = zext i1 %317 to i32
  %319 = load i8*, i8** %25, align 4
  %320 = load i8*, i8** %22, align 4
  %321 = icmp eq i8* %319, %320
  %322 = zext i1 %321 to i32
  %323 = icmp eq i32 %318, %322
  %324 = zext i1 %323 to i32
  %325 = trunc i32 %324 to i8
  store i8 %325, i8* %44, align 1
  %326 = load i32, i32* %38, align 4
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %328, label %343

328:                                              ; preds = %316
  %329 = load i8, i8* %44, align 1
  %330 = sext i8 %329 to i32
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %332, label %336

332:                                              ; preds = %328
  %333 = load i8*, i8** %24, align 4
  %334 = load i8*, i8** %41, align 4
  %335 = icmp ugt i8* %333, %334
  br i1 %335, label %343, label %336

336:                                              ; preds = %332, %328
  %337 = load i8, i8* %44, align 1
  %338 = icmp ne i8 %337, 0
  br i1 %338, label %368, label %339

339:                                              ; preds = %336
  %340 = load i8*, i8** %25, align 4
  %341 = load i8*, i8** %22, align 4
  %342 = icmp eq i8* %340, %341
  br i1 %342, label %368, label %343

343:                                              ; preds = %339, %332, %316
  store i32 1, i32* %38, align 4
  %344 = load i8*, i8** %24, align 4
  store i8* %344, i8** %41, align 4
  store i32 1, i32* %18, align 4
  br label %345

345:                                              ; preds = %364, %343
  %346 = load i32, i32* %18, align 4
  %347 = load i32, i32* %30, align 4
  %348 = icmp ult i32 %346, %347
  br i1 %348, label %349, label %367

349:                                              ; preds = %345
  %350 = load i8**, i8*** %33, align 4
  %351 = load i32, i32* %18, align 4
  %352 = getelementptr inbounds i8*, i8** %350, i32 %351
  %353 = load i8*, i8** %352, align 4
  %354 = load i8**, i8*** %39, align 4
  %355 = load i32, i32* %18, align 4
  %356 = getelementptr inbounds i8*, i8** %354, i32 %355
  store i8* %353, i8** %356, align 4
  %357 = load i8**, i8*** %34, align 4
  %358 = load i32, i32* %18, align 4
  %359 = getelementptr inbounds i8*, i8** %357, i32 %358
  %360 = load i8*, i8** %359, align 4
  %361 = load i8**, i8*** %40, align 4
  %362 = load i32, i32* %18, align 4
  %363 = getelementptr inbounds i8*, i8** %361, i32 %362
  store i8* %360, i8** %363, align 4
  br label %364

364:                                              ; preds = %349
  %365 = load i32, i32* %18, align 4
  %366 = add nsw i32 %365, 1
  store i32 %366, i32* %18, align 4
  br label %345

367:                                              ; preds = %345
  br label %368

368:                                              ; preds = %367, %339, %336
  br label %3316

369:                                              ; preds = %299
  %370 = load i32, i32* %38, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %411

372:                                              ; preds = %369
  br label %373

373:                                              ; preds = %3468, %372
  %374 = load i8*, i8** %41, align 4
  store i8* %374, i8** %24, align 4
  %375 = load i8*, i8** %24, align 4
  %376 = load i8*, i8** %11, align 4
  %377 = icmp uge i8* %375, %376
  br i1 %377, label %378, label %384

378:                                              ; preds = %373
  %379 = load i8*, i8** %24, align 4
  %380 = load i8*, i8** %20, align 4
  %381 = icmp ule i8* %379, %380
  br i1 %381, label %382, label %384

382:                                              ; preds = %378
  %383 = load i8*, i8** %22, align 4
  br label %386

384:                                              ; preds = %378, %373
  %385 = load i8*, i8** %23, align 4
  br label %386

386:                                              ; preds = %384, %382
  %387 = phi i8* [ %383, %382 ], [ %385, %384 ]
  store i8* %387, i8** %25, align 4
  store i32 1, i32* %18, align 4
  br label %388

388:                                              ; preds = %407, %386
  %389 = load i32, i32* %18, align 4
  %390 = load i32, i32* %30, align 4
  %391 = icmp ult i32 %389, %390
  br i1 %391, label %392, label %410

392:                                              ; preds = %388
  %393 = load i8**, i8*** %39, align 4
  %394 = load i32, i32* %18, align 4
  %395 = getelementptr inbounds i8*, i8** %393, i32 %394
  %396 = load i8*, i8** %395, align 4
  %397 = load i8**, i8*** %33, align 4
  %398 = load i32, i32* %18, align 4
  %399 = getelementptr inbounds i8*, i8** %397, i32 %398
  store i8* %396, i8** %399, align 4
  %400 = load i8**, i8*** %40, align 4
  %401 = load i32, i32* %18, align 4
  %402 = getelementptr inbounds i8*, i8** %400, i32 %401
  %403 = load i8*, i8** %402, align 4
  %404 = load i8**, i8*** %34, align 4
  %405 = load i32, i32* %18, align 4
  %406 = getelementptr inbounds i8*, i8** %404, i32 %405
  store i8* %403, i8** %406, align 4
  br label %407

407:                                              ; preds = %392
  %408 = load i32, i32* %18, align 4
  %409 = add nsw i32 %408, 1
  store i32 %409, i32* %18, align 4
  br label %388

410:                                              ; preds = %388
  br label %411

411:                                              ; preds = %410, %369
  br label %412

412:                                              ; preds = %411
  br label %413

413:                                              ; preds = %412, %295
  %414 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %415 = icmp ne %struct.re_registers* %414, null
  br i1 %415, label %416, label %726

416:                                              ; preds = %413
  %417 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %418 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %417, i32 0, i32 7
  %419 = load i8, i8* %418, align 4
  %420 = lshr i8 %419, 4
  %421 = and i8 %420, 1
  %422 = zext i8 %421 to i32
  %423 = icmp ne i32 %422, 0
  br i1 %423, label %726, label %424

424:                                              ; preds = %416
  %425 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %426 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %425, i32 0, i32 7
  %427 = load i8, i8* %426, align 4
  %428 = lshr i8 %427, 1
  %429 = and i8 %428, 3
  %430 = zext i8 %429 to i32
  %431 = icmp eq i32 %430, 0
  br i1 %431, label %432, label %476

432:                                              ; preds = %424
  %433 = load i32, i32* %30, align 4
  %434 = add i32 %433, 1
  %435 = icmp ugt i32 30, %434
  br i1 %435, label %436, label %437

436:                                              ; preds = %432
  br label %440

437:                                              ; preds = %432
  %438 = load i32, i32* %30, align 4
  %439 = add i32 %438, 1
  br label %440

440:                                              ; preds = %437, %436
  %441 = phi i32 [ 30, %436 ], [ %439, %437 ]
  %442 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %443 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %442, i32 0, i32 0
  store i32 %441, i32* %443, align 4
  %444 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %445 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %444, i32 0, i32 0
  %446 = load i32, i32* %445, align 4
  %447 = mul i32 %446, 4
  %448 = call noalias i8* @malloc(i32 %447) #7
  %449 = bitcast i8* %448 to i32*
  %450 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %451 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %450, i32 0, i32 1
  store i32* %449, i32** %451, align 4
  %452 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %453 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %452, i32 0, i32 0
  %454 = load i32, i32* %453, align 4
  %455 = mul i32 %454, 4
  %456 = call noalias i8* @malloc(i32 %455) #7
  %457 = bitcast i8* %456 to i32*
  %458 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %459 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %458, i32 0, i32 2
  store i32* %457, i32** %459, align 4
  %460 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %461 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %460, i32 0, i32 1
  %462 = load i32*, i32** %461, align 4
  %463 = icmp eq i32* %462, null
  br i1 %463, label %469, label %464

464:                                              ; preds = %440
  %465 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %466 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %465, i32 0, i32 2
  %467 = load i32*, i32** %466, align 4
  %468 = icmp eq i32* %467, null
  br i1 %468, label %469, label %470

469:                                              ; preds = %464, %440
  store i32 -2, i32* %9, align 4
  br label %3471

470:                                              ; preds = %464
  %471 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %472 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %471, i32 0, i32 7
  %473 = load i8, i8* %472, align 4
  %474 = and i8 %473, -7
  %475 = or i8 %474, 2
  store i8 %475, i8* %472, align 4
  br label %534

476:                                              ; preds = %424
  %477 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %478 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %477, i32 0, i32 7
  %479 = load i8, i8* %478, align 4
  %480 = lshr i8 %479, 1
  %481 = and i8 %480, 3
  %482 = zext i8 %481 to i32
  %483 = icmp eq i32 %482, 1
  br i1 %483, label %484, label %532

484:                                              ; preds = %476
  %485 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %486 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %485, i32 0, i32 0
  %487 = load i32, i32* %486, align 4
  %488 = load i32, i32* %30, align 4
  %489 = add i32 %488, 1
  %490 = icmp ult i32 %487, %489
  br i1 %490, label %491, label %531

491:                                              ; preds = %484
  %492 = load i32, i32* %30, align 4
  %493 = add i32 %492, 1
  %494 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %495 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %494, i32 0, i32 0
  store i32 %493, i32* %495, align 4
  %496 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %497 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %496, i32 0, i32 1
  %498 = load i32*, i32** %497, align 4
  %499 = bitcast i32* %498 to i8*
  %500 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %501 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %500, i32 0, i32 0
  %502 = load i32, i32* %501, align 4
  %503 = mul i32 %502, 4
  %504 = call i8* @realloc(i8* %499, i32 %503) #7
  %505 = bitcast i8* %504 to i32*
  %506 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %507 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %506, i32 0, i32 1
  store i32* %505, i32** %507, align 4
  %508 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %509 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %508, i32 0, i32 2
  %510 = load i32*, i32** %509, align 4
  %511 = bitcast i32* %510 to i8*
  %512 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %513 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %512, i32 0, i32 0
  %514 = load i32, i32* %513, align 4
  %515 = mul i32 %514, 4
  %516 = call i8* @realloc(i8* %511, i32 %515) #7
  %517 = bitcast i8* %516 to i32*
  %518 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %519 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %518, i32 0, i32 2
  store i32* %517, i32** %519, align 4
  %520 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %521 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %520, i32 0, i32 1
  %522 = load i32*, i32** %521, align 4
  %523 = icmp eq i32* %522, null
  br i1 %523, label %529, label %524

524:                                              ; preds = %491
  %525 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %526 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %525, i32 0, i32 2
  %527 = load i32*, i32** %526, align 4
  %528 = icmp eq i32* %527, null
  br i1 %528, label %529, label %530

529:                                              ; preds = %524, %491
  store i32 -2, i32* %9, align 4
  br label %3471

530:                                              ; preds = %524
  br label %531

531:                                              ; preds = %530, %484
  br label %533

532:                                              ; preds = %476
  br label %533

533:                                              ; preds = %532, %531
  br label %534

534:                                              ; preds = %533, %470
  %535 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %536 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %535, i32 0, i32 0
  %537 = load i32, i32* %536, align 4
  %538 = icmp ugt i32 %537, 0
  br i1 %538, label %539, label %568

539:                                              ; preds = %534
  %540 = load i32, i32* %15, align 4
  %541 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %542 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %541, i32 0, i32 1
  %543 = load i32*, i32** %542, align 4
  %544 = getelementptr inbounds i32, i32* %543, i32 0
  store i32 %540, i32* %544, align 4
  %545 = load i8*, i8** %25, align 4
  %546 = load i8*, i8** %22, align 4
  %547 = icmp eq i8* %545, %546
  br i1 %547, label %548, label %554

548:                                              ; preds = %539
  %549 = load i8*, i8** %24, align 4
  %550 = load i8*, i8** %11, align 4
  %551 = ptrtoint i8* %549 to i32
  %552 = ptrtoint i8* %550 to i32
  %553 = sub i32 %551, %552
  br label %562

554:                                              ; preds = %539
  %555 = load i8*, i8** %24, align 4
  %556 = load i8*, i8** %13, align 4
  %557 = ptrtoint i8* %555 to i32
  %558 = ptrtoint i8* %556 to i32
  %559 = sub i32 %557, %558
  %560 = load i32, i32* %12, align 4
  %561 = add nsw i32 %559, %560
  br label %562

562:                                              ; preds = %554, %548
  %563 = phi i32 [ %553, %548 ], [ %561, %554 ]
  %564 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %565 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %564, i32 0, i32 2
  %566 = load i32*, i32** %565, align 4
  %567 = getelementptr inbounds i32, i32* %566, i32 0
  store i32 %563, i32* %567, align 4
  br label %568

568:                                              ; preds = %562, %534
  store i32 1, i32* %18, align 4
  br label %569

569:                                              ; preds = %700, %568
  %570 = load i32, i32* %18, align 4
  %571 = load i32, i32* %30, align 4
  %572 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %573 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %572, i32 0, i32 0
  %574 = load i32, i32* %573, align 4
  %575 = icmp ult i32 %571, %574
  br i1 %575, label %576, label %578

576:                                              ; preds = %569
  %577 = load i32, i32* %30, align 4
  br label %582

578:                                              ; preds = %569
  %579 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %580 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %579, i32 0, i32 0
  %581 = load i32, i32* %580, align 4
  br label %582

582:                                              ; preds = %578, %576
  %583 = phi i32 [ %577, %576 ], [ %581, %578 ]
  %584 = icmp ult i32 %570, %583
  br i1 %584, label %585, label %703

585:                                              ; preds = %582
  %586 = load i8**, i8*** %33, align 4
  %587 = load i32, i32* %18, align 4
  %588 = getelementptr inbounds i8*, i8** %586, i32 %587
  %589 = load i8*, i8** %588, align 4
  %590 = icmp eq i8* %589, inttoptr (i32 -1 to i8*)
  br i1 %590, label %597, label %591

591:                                              ; preds = %585
  %592 = load i8**, i8*** %34, align 4
  %593 = load i32, i32* %18, align 4
  %594 = getelementptr inbounds i8*, i8** %592, i32 %593
  %595 = load i8*, i8** %594, align 4
  %596 = icmp eq i8* %595, inttoptr (i32 -1 to i8*)
  br i1 %596, label %597, label %608

597:                                              ; preds = %591, %585
  %598 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %599 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %598, i32 0, i32 2
  %600 = load i32*, i32** %599, align 4
  %601 = load i32, i32* %18, align 4
  %602 = getelementptr inbounds i32, i32* %600, i32 %601
  store i32 -1, i32* %602, align 4
  %603 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %604 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %603, i32 0, i32 1
  %605 = load i32*, i32** %604, align 4
  %606 = load i32, i32* %18, align 4
  %607 = getelementptr inbounds i32, i32* %605, i32 %606
  store i32 -1, i32* %607, align 4
  br label %699

608:                                              ; preds = %591
  %609 = load i32, i32* %12, align 4
  %610 = icmp ne i32 %609, 0
  br i1 %610, label %611, label %636

611:                                              ; preds = %608
  %612 = load i8*, i8** %11, align 4
  %613 = load i8**, i8*** %33, align 4
  %614 = load i32, i32* %18, align 4
  %615 = getelementptr inbounds i8*, i8** %613, i32 %614
  %616 = load i8*, i8** %615, align 4
  %617 = icmp ule i8* %612, %616
  br i1 %617, label %618, label %636

618:                                              ; preds = %611
  %619 = load i8**, i8*** %33, align 4
  %620 = load i32, i32* %18, align 4
  %621 = getelementptr inbounds i8*, i8** %619, i32 %620
  %622 = load i8*, i8** %621, align 4
  %623 = load i8*, i8** %11, align 4
  %624 = load i32, i32* %12, align 4
  %625 = getelementptr inbounds i8, i8* %623, i32 %624
  %626 = icmp ule i8* %622, %625
  br i1 %626, label %627, label %636

627:                                              ; preds = %618
  %628 = load i8**, i8*** %33, align 4
  %629 = load i32, i32* %18, align 4
  %630 = getelementptr inbounds i8*, i8** %628, i32 %629
  %631 = load i8*, i8** %630, align 4
  %632 = load i8*, i8** %11, align 4
  %633 = ptrtoint i8* %631 to i32
  %634 = ptrtoint i8* %632 to i32
  %635 = sub i32 %633, %634
  br label %647

636:                                              ; preds = %618, %611, %608
  %637 = load i8**, i8*** %33, align 4
  %638 = load i32, i32* %18, align 4
  %639 = getelementptr inbounds i8*, i8** %637, i32 %638
  %640 = load i8*, i8** %639, align 4
  %641 = load i8*, i8** %13, align 4
  %642 = ptrtoint i8* %640 to i32
  %643 = ptrtoint i8* %641 to i32
  %644 = sub i32 %642, %643
  %645 = load i32, i32* %12, align 4
  %646 = add nsw i32 %644, %645
  br label %647

647:                                              ; preds = %636, %627
  %648 = phi i32 [ %635, %627 ], [ %646, %636 ]
  %649 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %650 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %649, i32 0, i32 1
  %651 = load i32*, i32** %650, align 4
  %652 = load i32, i32* %18, align 4
  %653 = getelementptr inbounds i32, i32* %651, i32 %652
  store i32 %648, i32* %653, align 4
  %654 = load i32, i32* %12, align 4
  %655 = icmp ne i32 %654, 0
  br i1 %655, label %656, label %681

656:                                              ; preds = %647
  %657 = load i8*, i8** %11, align 4
  %658 = load i8**, i8*** %34, align 4
  %659 = load i32, i32* %18, align 4
  %660 = getelementptr inbounds i8*, i8** %658, i32 %659
  %661 = load i8*, i8** %660, align 4
  %662 = icmp ule i8* %657, %661
  br i1 %662, label %663, label %681

663:                                              ; preds = %656
  %664 = load i8**, i8*** %34, align 4
  %665 = load i32, i32* %18, align 4
  %666 = getelementptr inbounds i8*, i8** %664, i32 %665
  %667 = load i8*, i8** %666, align 4
  %668 = load i8*, i8** %11, align 4
  %669 = load i32, i32* %12, align 4
  %670 = getelementptr inbounds i8, i8* %668, i32 %669
  %671 = icmp ule i8* %667, %670
  br i1 %671, label %672, label %681

672:                                              ; preds = %663
  %673 = load i8**, i8*** %34, align 4
  %674 = load i32, i32* %18, align 4
  %675 = getelementptr inbounds i8*, i8** %673, i32 %674
  %676 = load i8*, i8** %675, align 4
  %677 = load i8*, i8** %11, align 4
  %678 = ptrtoint i8* %676 to i32
  %679 = ptrtoint i8* %677 to i32
  %680 = sub i32 %678, %679
  br label %692

681:                                              ; preds = %663, %656, %647
  %682 = load i8**, i8*** %34, align 4
  %683 = load i32, i32* %18, align 4
  %684 = getelementptr inbounds i8*, i8** %682, i32 %683
  %685 = load i8*, i8** %684, align 4
  %686 = load i8*, i8** %13, align 4
  %687 = ptrtoint i8* %685 to i32
  %688 = ptrtoint i8* %686 to i32
  %689 = sub i32 %687, %688
  %690 = load i32, i32* %12, align 4
  %691 = add nsw i32 %689, %690
  br label %692

692:                                              ; preds = %681, %672
  %693 = phi i32 [ %680, %672 ], [ %691, %681 ]
  %694 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %695 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %694, i32 0, i32 2
  %696 = load i32*, i32** %695, align 4
  %697 = load i32, i32* %18, align 4
  %698 = getelementptr inbounds i32, i32* %696, i32 %697
  store i32 %693, i32* %698, align 4
  br label %699

699:                                              ; preds = %692, %597
  br label %700

700:                                              ; preds = %699
  %701 = load i32, i32* %18, align 4
  %702 = add nsw i32 %701, 1
  store i32 %702, i32* %18, align 4
  br label %569

703:                                              ; preds = %582
  %704 = load i32, i32* %30, align 4
  store i32 %704, i32* %18, align 4
  br label %705

705:                                              ; preds = %722, %703
  %706 = load i32, i32* %18, align 4
  %707 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %708 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %707, i32 0, i32 0
  %709 = load i32, i32* %708, align 4
  %710 = icmp ult i32 %706, %709
  br i1 %710, label %711, label %725

711:                                              ; preds = %705
  %712 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %713 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %712, i32 0, i32 2
  %714 = load i32*, i32** %713, align 4
  %715 = load i32, i32* %18, align 4
  %716 = getelementptr inbounds i32, i32* %714, i32 %715
  store i32 -1, i32* %716, align 4
  %717 = load %struct.re_registers*, %struct.re_registers** %16, align 4
  %718 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %717, i32 0, i32 1
  %719 = load i32*, i32** %718, align 4
  %720 = load i32, i32* %18, align 4
  %721 = getelementptr inbounds i32, i32* %719, i32 %720
  store i32 -1, i32* %721, align 4
  br label %722

722:                                              ; preds = %711
  %723 = load i32, i32* %18, align 4
  %724 = add nsw i32 %723, 1
  store i32 %724, i32* %18, align 4
  br label %705

725:                                              ; preds = %705
  br label %726

726:                                              ; preds = %725, %416, %413
  %727 = alloca i8, i32 0, align 16
  %728 = load i8*, i8** %24, align 4
  %729 = load i32, i32* %15, align 4
  %730 = sub i32 0, %729
  %731 = getelementptr inbounds i8, i8* %728, i32 %730
  %732 = load i8*, i8** %25, align 4
  %733 = load i8*, i8** %22, align 4
  %734 = icmp eq i8* %732, %733
  br i1 %734, label %735, label %737

735:                                              ; preds = %726
  %736 = load i8*, i8** %11, align 4
  br label %742

737:                                              ; preds = %726
  %738 = load i8*, i8** %13, align 4
  %739 = load i32, i32* %12, align 4
  %740 = sub i32 0, %739
  %741 = getelementptr inbounds i8, i8* %738, i32 %740
  br label %742

742:                                              ; preds = %737, %735
  %743 = phi i8* [ %736, %735 ], [ %741, %737 ]
  %744 = ptrtoint i8* %731 to i32
  %745 = ptrtoint i8* %743 to i32
  %746 = sub i32 %744, %745
  store i32 %746, i32* %18, align 4
  %747 = load i32, i32* %18, align 4
  store i32 %747, i32* %9, align 4
  br label %3471

748:                                              ; preds = %291
  %749 = load i8*, i8** %26, align 4
  %750 = getelementptr inbounds i8, i8* %749, i32 1
  store i8* %750, i8** %26, align 4
  %751 = load i8, i8* %749, align 1
  %752 = zext i8 %751 to i32
  switch i32 %752, label %3314 [
    i32 0, label %753
    i32 1, label %754
    i32 2, label %856
    i32 3, label %949
    i32 4, label %949
    i32 5, label %1056
    i32 6, label %1169
    i32 7, label %1575
    i32 8, label %1735
    i32 9, label %1775
    i32 10, label %1814
    i32 11, label %1830
    i32 15, label %1836
    i32 14, label %1982
    i32 17, label %2173
    i32 16, label %2342
    i32 12, label %2419
    i32 13, label %2441
    i32 18, label %2442
    i32 19, label %2568
    i32 20, label %2694
    i32 21, label %2743
    i32 22, label %2782
    i32 27, label %2832
    i32 28, label %2917
    i32 25, label %3002
    i32 26, label %3081
    i32 23, label %3164
    i32 24, label %3239
  ]

753:                                              ; preds = %748
  br label %3315

754:                                              ; preds = %748
  %755 = load i8*, i8** %26, align 4
  %756 = getelementptr inbounds i8, i8* %755, i32 1
  store i8* %756, i8** %26, align 4
  %757 = load i8, i8* %755, align 1
  %758 = zext i8 %757 to i32
  store i32 %758, i32* %18, align 4
  %759 = load i8*, i8** %28, align 4
  %760 = icmp ne i8* %759, null
  br i1 %760, label %761, label %796

761:                                              ; preds = %754
  br label %762

762:                                              ; preds = %791, %761
  br label %763

763:                                              ; preds = %772, %762
  %764 = load i8*, i8** %24, align 4
  %765 = load i8*, i8** %25, align 4
  %766 = icmp eq i8* %764, %765
  br i1 %766, label %767, label %775

767:                                              ; preds = %763
  %768 = load i8*, i8** %25, align 4
  %769 = load i8*, i8** %23, align 4
  %770 = icmp eq i8* %768, %769
  br i1 %770, label %771, label %772

771:                                              ; preds = %767
  br label %3316

772:                                              ; preds = %767
  %773 = load i8*, i8** %13, align 4
  store i8* %773, i8** %24, align 4
  %774 = load i8*, i8** %23, align 4
  store i8* %774, i8** %25, align 4
  br label %763

775:                                              ; preds = %763
  %776 = load i8*, i8** %28, align 4
  %777 = load i8*, i8** %24, align 4
  %778 = getelementptr inbounds i8, i8* %777, i32 1
  store i8* %778, i8** %24, align 4
  %779 = load i8, i8* %777, align 1
  %780 = zext i8 %779 to i32
  %781 = getelementptr inbounds i8, i8* %776, i32 %780
  %782 = load i8, i8* %781, align 1
  %783 = sext i8 %782 to i32
  %784 = load i8*, i8** %26, align 4
  %785 = getelementptr inbounds i8, i8* %784, i32 1
  store i8* %785, i8** %26, align 4
  %786 = load i8, i8* %784, align 1
  %787 = sext i8 %786 to i32
  %788 = icmp ne i32 %783, %787
  br i1 %788, label %789, label %790

789:                                              ; preds = %775
  br label %3316

790:                                              ; preds = %775
  br label %791

791:                                              ; preds = %790
  %792 = load i32, i32* %18, align 4
  %793 = add nsw i32 %792, -1
  store i32 %793, i32* %18, align 4
  %794 = icmp ne i32 %793, 0
  br i1 %794, label %762, label %795

795:                                              ; preds = %791
  br label %827

796:                                              ; preds = %754
  br label %797

797:                                              ; preds = %822, %796
  br label %798

798:                                              ; preds = %807, %797
  %799 = load i8*, i8** %24, align 4
  %800 = load i8*, i8** %25, align 4
  %801 = icmp eq i8* %799, %800
  br i1 %801, label %802, label %810

802:                                              ; preds = %798
  %803 = load i8*, i8** %25, align 4
  %804 = load i8*, i8** %23, align 4
  %805 = icmp eq i8* %803, %804
  br i1 %805, label %806, label %807

806:                                              ; preds = %802
  br label %3316

807:                                              ; preds = %802
  %808 = load i8*, i8** %13, align 4
  store i8* %808, i8** %24, align 4
  %809 = load i8*, i8** %23, align 4
  store i8* %809, i8** %25, align 4
  br label %798

810:                                              ; preds = %798
  %811 = load i8*, i8** %24, align 4
  %812 = getelementptr inbounds i8, i8* %811, i32 1
  store i8* %812, i8** %24, align 4
  %813 = load i8, i8* %811, align 1
  %814 = sext i8 %813 to i32
  %815 = load i8*, i8** %26, align 4
  %816 = getelementptr inbounds i8, i8* %815, i32 1
  store i8* %816, i8** %26, align 4
  %817 = load i8, i8* %815, align 1
  %818 = sext i8 %817 to i32
  %819 = icmp ne i32 %814, %818
  br i1 %819, label %820, label %821

820:                                              ; preds = %810
  br label %3316

821:                                              ; preds = %810
  br label %822

822:                                              ; preds = %821
  %823 = load i32, i32* %18, align 4
  %824 = add nsw i32 %823, -1
  store i32 %824, i32* %18, align 4
  %825 = icmp ne i32 %824, 0
  br i1 %825, label %797, label %826

826:                                              ; preds = %822
  br label %827

827:                                              ; preds = %826, %795
  br label %828

828:                                              ; preds = %827
  %829 = load i32, i32* %31, align 4
  store i32 %829, i32* %45, align 4
  br label %830

830:                                              ; preds = %851, %828
  %831 = load i32, i32* %45, align 4
  %832 = load i32, i32* %32, align 4
  %833 = icmp ule i32 %831, %832
  br i1 %833, label %834, label %854

834:                                              ; preds = %830
  %835 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %836 = load i32, i32* %45, align 4
  %837 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %835, i32 %836
  %838 = bitcast %union.register_info_type* %837 to %struct.anon.2*
  %839 = bitcast %struct.anon.2* %838 to i8*
  %840 = load i8, i8* %839, align 4
  %841 = and i8 %840, -17
  %842 = or i8 %841, 16
  store i8 %842, i8* %839, align 4
  %843 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %844 = load i32, i32* %45, align 4
  %845 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %843, i32 %844
  %846 = bitcast %union.register_info_type* %845 to %struct.anon.2*
  %847 = bitcast %struct.anon.2* %846 to i8*
  %848 = load i8, i8* %847, align 4
  %849 = and i8 %848, -9
  %850 = or i8 %849, 8
  store i8 %850, i8* %847, align 4
  br label %851

851:                                              ; preds = %834
  %852 = load i32, i32* %45, align 4
  %853 = add i32 %852, 1
  store i32 %853, i32* %45, align 4
  br label %830

854:                                              ; preds = %830
  br label %855

855:                                              ; preds = %854
  br label %3315

856:                                              ; preds = %748
  br label %857

857:                                              ; preds = %866, %856
  %858 = load i8*, i8** %24, align 4
  %859 = load i8*, i8** %25, align 4
  %860 = icmp eq i8* %858, %859
  br i1 %860, label %861, label %869

861:                                              ; preds = %857
  %862 = load i8*, i8** %25, align 4
  %863 = load i8*, i8** %23, align 4
  %864 = icmp eq i8* %862, %863
  br i1 %864, label %865, label %866

865:                                              ; preds = %861
  br label %3316

866:                                              ; preds = %861
  %867 = load i8*, i8** %13, align 4
  store i8* %867, i8** %24, align 4
  %868 = load i8*, i8** %23, align 4
  store i8* %868, i8** %25, align 4
  br label %857

869:                                              ; preds = %857
  %870 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %871 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %870, i32 0, i32 3
  %872 = load i32, i32* %871, align 4
  %873 = and i32 %872, 64
  %874 = icmp ne i32 %873, 0
  br i1 %874, label %893, label %875

875:                                              ; preds = %869
  %876 = load i8*, i8** %28, align 4
  %877 = icmp ne i8* %876, null
  br i1 %877, label %878, label %886

878:                                              ; preds = %875
  %879 = load i8*, i8** %28, align 4
  %880 = load i8*, i8** %24, align 4
  %881 = load i8, i8* %880, align 1
  %882 = zext i8 %881 to i32
  %883 = getelementptr inbounds i8, i8* %879, i32 %882
  %884 = load i8, i8* %883, align 1
  %885 = sext i8 %884 to i32
  br label %890

886:                                              ; preds = %875
  %887 = load i8*, i8** %24, align 4
  %888 = load i8, i8* %887, align 1
  %889 = sext i8 %888 to i32
  br label %890

890:                                              ; preds = %886, %878
  %891 = phi i32 [ %885, %878 ], [ %889, %886 ]
  %892 = icmp eq i32 %891, 10
  br i1 %892, label %917, label %893

893:                                              ; preds = %890, %869
  %894 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %895 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %894, i32 0, i32 3
  %896 = load i32, i32* %895, align 4
  %897 = and i32 %896, 128
  %898 = icmp ne i32 %897, 0
  br i1 %898, label %899, label %918

899:                                              ; preds = %893
  %900 = load i8*, i8** %28, align 4
  %901 = icmp ne i8* %900, null
  br i1 %901, label %902, label %910

902:                                              ; preds = %899
  %903 = load i8*, i8** %28, align 4
  %904 = load i8*, i8** %24, align 4
  %905 = load i8, i8* %904, align 1
  %906 = zext i8 %905 to i32
  %907 = getelementptr inbounds i8, i8* %903, i32 %906
  %908 = load i8, i8* %907, align 1
  %909 = sext i8 %908 to i32
  br label %914

910:                                              ; preds = %899
  %911 = load i8*, i8** %24, align 4
  %912 = load i8, i8* %911, align 1
  %913 = sext i8 %912 to i32
  br label %914

914:                                              ; preds = %910, %902
  %915 = phi i32 [ %909, %902 ], [ %913, %910 ]
  %916 = icmp eq i32 %915, 0
  br i1 %916, label %917, label %918

917:                                              ; preds = %914, %890
  br label %3316

918:                                              ; preds = %914, %893
  br label %919

919:                                              ; preds = %918
  %920 = load i32, i32* %31, align 4
  store i32 %920, i32* %46, align 4
  br label %921

921:                                              ; preds = %942, %919
  %922 = load i32, i32* %46, align 4
  %923 = load i32, i32* %32, align 4
  %924 = icmp ule i32 %922, %923
  br i1 %924, label %925, label %945

925:                                              ; preds = %921
  %926 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %927 = load i32, i32* %46, align 4
  %928 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %926, i32 %927
  %929 = bitcast %union.register_info_type* %928 to %struct.anon.2*
  %930 = bitcast %struct.anon.2* %929 to i8*
  %931 = load i8, i8* %930, align 4
  %932 = and i8 %931, -17
  %933 = or i8 %932, 16
  store i8 %933, i8* %930, align 4
  %934 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %935 = load i32, i32* %46, align 4
  %936 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %934, i32 %935
  %937 = bitcast %union.register_info_type* %936 to %struct.anon.2*
  %938 = bitcast %struct.anon.2* %937 to i8*
  %939 = load i8, i8* %938, align 4
  %940 = and i8 %939, -9
  %941 = or i8 %940, 8
  store i8 %941, i8* %938, align 4
  br label %942

942:                                              ; preds = %925
  %943 = load i32, i32* %46, align 4
  %944 = add i32 %943, 1
  store i32 %944, i32* %46, align 4
  br label %921

945:                                              ; preds = %921
  br label %946

946:                                              ; preds = %945
  %947 = load i8*, i8** %24, align 4
  %948 = getelementptr inbounds i8, i8* %947, i32 1
  store i8* %948, i8** %24, align 4
  br label %3315

949:                                              ; preds = %748, %748
  %950 = load i8*, i8** %26, align 4
  %951 = getelementptr inbounds i8, i8* %950, i32 -1
  %952 = load i8, i8* %951, align 1
  %953 = zext i8 %952 to i32
  %954 = icmp eq i32 %953, 4
  %955 = zext i1 %954 to i32
  %956 = trunc i32 %955 to i8
  store i8 %956, i8* %48, align 1
  br label %957

957:                                              ; preds = %966, %949
  %958 = load i8*, i8** %24, align 4
  %959 = load i8*, i8** %25, align 4
  %960 = icmp eq i8* %958, %959
  br i1 %960, label %961, label %969

961:                                              ; preds = %957
  %962 = load i8*, i8** %25, align 4
  %963 = load i8*, i8** %23, align 4
  %964 = icmp eq i8* %962, %963
  br i1 %964, label %965, label %966

965:                                              ; preds = %961
  br label %3316

966:                                              ; preds = %961
  %967 = load i8*, i8** %13, align 4
  store i8* %967, i8** %24, align 4
  %968 = load i8*, i8** %23, align 4
  store i8* %968, i8** %25, align 4
  br label %957

969:                                              ; preds = %957
  %970 = load i8*, i8** %28, align 4
  %971 = icmp ne i8* %970, null
  br i1 %971, label %972, label %980

972:                                              ; preds = %969
  %973 = load i8*, i8** %28, align 4
  %974 = load i8*, i8** %24, align 4
  %975 = load i8, i8* %974, align 1
  %976 = zext i8 %975 to i32
  %977 = getelementptr inbounds i8, i8* %973, i32 %976
  %978 = load i8, i8* %977, align 1
  %979 = sext i8 %978 to i32
  br label %984

980:                                              ; preds = %969
  %981 = load i8*, i8** %24, align 4
  %982 = load i8, i8* %981, align 1
  %983 = sext i8 %982 to i32
  br label %984

984:                                              ; preds = %980, %972
  %985 = phi i32 [ %979, %972 ], [ %983, %980 ]
  %986 = trunc i32 %985 to i8
  store i8 %986, i8* %47, align 1
  %987 = load i8, i8* %47, align 1
  %988 = zext i8 %987 to i32
  %989 = load i8*, i8** %26, align 4
  %990 = load i8, i8* %989, align 1
  %991 = zext i8 %990 to i32
  %992 = mul nsw i32 %991, 8
  %993 = icmp ult i32 %988, %992
  br i1 %993, label %994, label %1015

994:                                              ; preds = %984
  %995 = load i8*, i8** %26, align 4
  %996 = load i8, i8* %47, align 1
  %997 = zext i8 %996 to i32
  %998 = sdiv i32 %997, 8
  %999 = add nsw i32 1, %998
  %1000 = getelementptr inbounds i8, i8* %995, i32 %999
  %1001 = load i8, i8* %1000, align 1
  %1002 = zext i8 %1001 to i32
  %1003 = load i8, i8* %47, align 1
  %1004 = zext i8 %1003 to i32
  %1005 = srem i32 %1004, 8
  %1006 = shl i32 1, %1005
  %1007 = and i32 %1002, %1006
  %1008 = icmp ne i32 %1007, 0
  br i1 %1008, label %1009, label %1015

1009:                                             ; preds = %994
  %1010 = load i8, i8* %48, align 1
  %1011 = icmp ne i8 %1010, 0
  %1012 = xor i1 %1011, true
  %1013 = zext i1 %1012 to i32
  %1014 = trunc i32 %1013 to i8
  store i8 %1014, i8* %48, align 1
  br label %1015

1015:                                             ; preds = %1009, %994, %984
  %1016 = load i8*, i8** %26, align 4
  %1017 = load i8, i8* %1016, align 1
  %1018 = zext i8 %1017 to i32
  %1019 = add nsw i32 1, %1018
  %1020 = load i8*, i8** %26, align 4
  %1021 = getelementptr inbounds i8, i8* %1020, i32 %1019
  store i8* %1021, i8** %26, align 4
  %1022 = load i8, i8* %48, align 1
  %1023 = icmp ne i8 %1022, 0
  br i1 %1023, label %1025, label %1024

1024:                                             ; preds = %1015
  br label %3316

1025:                                             ; preds = %1015
  br label %1026

1026:                                             ; preds = %1025
  %1027 = load i32, i32* %31, align 4
  store i32 %1027, i32* %49, align 4
  br label %1028

1028:                                             ; preds = %1049, %1026
  %1029 = load i32, i32* %49, align 4
  %1030 = load i32, i32* %32, align 4
  %1031 = icmp ule i32 %1029, %1030
  br i1 %1031, label %1032, label %1052

1032:                                             ; preds = %1028
  %1033 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1034 = load i32, i32* %49, align 4
  %1035 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1033, i32 %1034
  %1036 = bitcast %union.register_info_type* %1035 to %struct.anon.2*
  %1037 = bitcast %struct.anon.2* %1036 to i8*
  %1038 = load i8, i8* %1037, align 4
  %1039 = and i8 %1038, -17
  %1040 = or i8 %1039, 16
  store i8 %1040, i8* %1037, align 4
  %1041 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1042 = load i32, i32* %49, align 4
  %1043 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1041, i32 %1042
  %1044 = bitcast %union.register_info_type* %1043 to %struct.anon.2*
  %1045 = bitcast %struct.anon.2* %1044 to i8*
  %1046 = load i8, i8* %1045, align 4
  %1047 = and i8 %1046, -9
  %1048 = or i8 %1047, 8
  store i8 %1048, i8* %1045, align 4
  br label %1049

1049:                                             ; preds = %1032
  %1050 = load i32, i32* %49, align 4
  %1051 = add i32 %1050, 1
  store i32 %1051, i32* %49, align 4
  br label %1028

1052:                                             ; preds = %1028
  br label %1053

1053:                                             ; preds = %1052
  %1054 = load i8*, i8** %24, align 4
  %1055 = getelementptr inbounds i8, i8* %1054, i32 1
  store i8* %1055, i8** %24, align 4
  br label %3315

1056:                                             ; preds = %748
  %1057 = load i8*, i8** %26, align 4
  store i8* %1057, i8** %19, align 4
  %1058 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1059 = load i8*, i8** %26, align 4
  %1060 = load i8, i8* %1059, align 1
  %1061 = zext i8 %1060 to i32
  %1062 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1058, i32 %1061
  %1063 = bitcast %union.register_info_type* %1062 to %struct.anon.2*
  %1064 = bitcast %struct.anon.2* %1063 to i8*
  %1065 = load i8, i8* %1064, align 4
  %1066 = and i8 %1065, 3
  %1067 = zext i8 %1066 to i32
  %1068 = icmp eq i32 %1067, 3
  br i1 %1068, label %1069, label %1087

1069:                                             ; preds = %1056
  %1070 = load i8*, i8** %27, align 4
  %1071 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1072 = call signext i8 @group_match_null_string_p(i8** %19, i8* %1070, %union.register_info_type* %1071)
  %1073 = sext i8 %1072 to i32
  %1074 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1075 = load i8*, i8** %26, align 4
  %1076 = load i8, i8* %1075, align 1
  %1077 = zext i8 %1076 to i32
  %1078 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1074, i32 %1077
  %1079 = bitcast %union.register_info_type* %1078 to %struct.anon.2*
  %1080 = bitcast %struct.anon.2* %1079 to i8*
  %1081 = trunc i32 %1073 to i8
  %1082 = load i8, i8* %1080, align 4
  %1083 = and i8 %1081, 3
  %1084 = and i8 %1082, -4
  %1085 = or i8 %1084, %1083
  store i8 %1085, i8* %1080, align 4
  %1086 = zext i8 %1083 to i32
  br label %1087

1087:                                             ; preds = %1069, %1056
  %1088 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1089 = load i8*, i8** %26, align 4
  %1090 = load i8, i8* %1089, align 1
  %1091 = zext i8 %1090 to i32
  %1092 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1088, i32 %1091
  %1093 = bitcast %union.register_info_type* %1092 to %struct.anon.2*
  %1094 = bitcast %struct.anon.2* %1093 to i8*
  %1095 = load i8, i8* %1094, align 4
  %1096 = and i8 %1095, 3
  %1097 = zext i8 %1096 to i32
  %1098 = icmp ne i32 %1097, 0
  br i1 %1098, label %1099, label %1118

1099:                                             ; preds = %1087
  %1100 = load i8**, i8*** %33, align 4
  %1101 = load i8*, i8** %26, align 4
  %1102 = load i8, i8* %1101, align 1
  %1103 = zext i8 %1102 to i32
  %1104 = getelementptr inbounds i8*, i8** %1100, i32 %1103
  %1105 = load i8*, i8** %1104, align 4
  %1106 = icmp eq i8* %1105, inttoptr (i32 -1 to i8*)
  br i1 %1106, label %1107, label %1109

1107:                                             ; preds = %1099
  %1108 = load i8*, i8** %24, align 4
  br label %1116

1109:                                             ; preds = %1099
  %1110 = load i8**, i8*** %33, align 4
  %1111 = load i8*, i8** %26, align 4
  %1112 = load i8, i8* %1111, align 1
  %1113 = zext i8 %1112 to i32
  %1114 = getelementptr inbounds i8*, i8** %1110, i32 %1113
  %1115 = load i8*, i8** %1114, align 4
  br label %1116

1116:                                             ; preds = %1109, %1107
  %1117 = phi i8* [ %1108, %1107 ], [ %1115, %1109 ]
  br label %1125

1118:                                             ; preds = %1087
  %1119 = load i8**, i8*** %33, align 4
  %1120 = load i8*, i8** %26, align 4
  %1121 = load i8, i8* %1120, align 1
  %1122 = zext i8 %1121 to i32
  %1123 = getelementptr inbounds i8*, i8** %1119, i32 %1122
  %1124 = load i8*, i8** %1123, align 4
  br label %1125

1125:                                             ; preds = %1118, %1116
  %1126 = phi i8* [ %1117, %1116 ], [ %1124, %1118 ]
  %1127 = load i8**, i8*** %35, align 4
  %1128 = load i8*, i8** %26, align 4
  %1129 = load i8, i8* %1128, align 1
  %1130 = zext i8 %1129 to i32
  %1131 = getelementptr inbounds i8*, i8** %1127, i32 %1130
  store i8* %1126, i8** %1131, align 4
  %1132 = load i8*, i8** %24, align 4
  %1133 = load i8**, i8*** %33, align 4
  %1134 = load i8*, i8** %26, align 4
  %1135 = load i8, i8* %1134, align 1
  %1136 = zext i8 %1135 to i32
  %1137 = getelementptr inbounds i8*, i8** %1133, i32 %1136
  store i8* %1132, i8** %1137, align 4
  %1138 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1139 = load i8*, i8** %26, align 4
  %1140 = load i8, i8* %1139, align 1
  %1141 = zext i8 %1140 to i32
  %1142 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1138, i32 %1141
  %1143 = bitcast %union.register_info_type* %1142 to %struct.anon.2*
  %1144 = bitcast %struct.anon.2* %1143 to i8*
  %1145 = load i8, i8* %1144, align 4
  %1146 = and i8 %1145, -5
  %1147 = or i8 %1146, 4
  store i8 %1147, i8* %1144, align 4
  %1148 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1149 = load i8*, i8** %26, align 4
  %1150 = load i8, i8* %1149, align 1
  %1151 = zext i8 %1150 to i32
  %1152 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1148, i32 %1151
  %1153 = bitcast %union.register_info_type* %1152 to %struct.anon.2*
  %1154 = bitcast %struct.anon.2* %1153 to i8*
  %1155 = load i8, i8* %1154, align 4
  %1156 = and i8 %1155, -9
  store i8 %1156, i8* %1154, align 4
  %1157 = load i8*, i8** %26, align 4
  %1158 = load i8, i8* %1157, align 1
  %1159 = zext i8 %1158 to i32
  store i32 %1159, i32* %32, align 4
  %1160 = load i32, i32* %31, align 4
  %1161 = icmp eq i32 %1160, 257
  br i1 %1161, label %1162, label %1166

1162:                                             ; preds = %1125
  %1163 = load i8*, i8** %26, align 4
  %1164 = load i8, i8* %1163, align 1
  %1165 = zext i8 %1164 to i32
  store i32 %1165, i32* %31, align 4
  br label %1166

1166:                                             ; preds = %1162, %1125
  %1167 = load i8*, i8** %26, align 4
  %1168 = getelementptr inbounds i8, i8* %1167, i32 2
  store i8* %1168, i8** %26, align 4
  br label %3315

1169:                                             ; preds = %748
  %1170 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1171 = load i8*, i8** %26, align 4
  %1172 = load i8, i8* %1171, align 1
  %1173 = zext i8 %1172 to i32
  %1174 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1170, i32 %1173
  %1175 = bitcast %union.register_info_type* %1174 to %struct.anon.2*
  %1176 = bitcast %struct.anon.2* %1175 to i8*
  %1177 = load i8, i8* %1176, align 4
  %1178 = and i8 %1177, 3
  %1179 = zext i8 %1178 to i32
  %1180 = icmp ne i32 %1179, 0
  br i1 %1180, label %1181, label %1200

1181:                                             ; preds = %1169
  %1182 = load i8**, i8*** %34, align 4
  %1183 = load i8*, i8** %26, align 4
  %1184 = load i8, i8* %1183, align 1
  %1185 = zext i8 %1184 to i32
  %1186 = getelementptr inbounds i8*, i8** %1182, i32 %1185
  %1187 = load i8*, i8** %1186, align 4
  %1188 = icmp eq i8* %1187, inttoptr (i32 -1 to i8*)
  br i1 %1188, label %1189, label %1191

1189:                                             ; preds = %1181
  %1190 = load i8*, i8** %24, align 4
  br label %1198

1191:                                             ; preds = %1181
  %1192 = load i8**, i8*** %34, align 4
  %1193 = load i8*, i8** %26, align 4
  %1194 = load i8, i8* %1193, align 1
  %1195 = zext i8 %1194 to i32
  %1196 = getelementptr inbounds i8*, i8** %1192, i32 %1195
  %1197 = load i8*, i8** %1196, align 4
  br label %1198

1198:                                             ; preds = %1191, %1189
  %1199 = phi i8* [ %1190, %1189 ], [ %1197, %1191 ]
  br label %1207

1200:                                             ; preds = %1169
  %1201 = load i8**, i8*** %34, align 4
  %1202 = load i8*, i8** %26, align 4
  %1203 = load i8, i8* %1202, align 1
  %1204 = zext i8 %1203 to i32
  %1205 = getelementptr inbounds i8*, i8** %1201, i32 %1204
  %1206 = load i8*, i8** %1205, align 4
  br label %1207

1207:                                             ; preds = %1200, %1198
  %1208 = phi i8* [ %1199, %1198 ], [ %1206, %1200 ]
  %1209 = load i8**, i8*** %36, align 4
  %1210 = load i8*, i8** %26, align 4
  %1211 = load i8, i8* %1210, align 1
  %1212 = zext i8 %1211 to i32
  %1213 = getelementptr inbounds i8*, i8** %1209, i32 %1212
  store i8* %1208, i8** %1213, align 4
  %1214 = load i8*, i8** %24, align 4
  %1215 = load i8**, i8*** %34, align 4
  %1216 = load i8*, i8** %26, align 4
  %1217 = load i8, i8* %1216, align 1
  %1218 = zext i8 %1217 to i32
  %1219 = getelementptr inbounds i8*, i8** %1215, i32 %1218
  store i8* %1214, i8** %1219, align 4
  %1220 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1221 = load i8*, i8** %26, align 4
  %1222 = load i8, i8* %1221, align 1
  %1223 = zext i8 %1222 to i32
  %1224 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1220, i32 %1223
  %1225 = bitcast %union.register_info_type* %1224 to %struct.anon.2*
  %1226 = bitcast %struct.anon.2* %1225 to i8*
  %1227 = load i8, i8* %1226, align 4
  %1228 = and i8 %1227, -5
  store i8 %1228, i8* %1226, align 4
  %1229 = load i32, i32* %31, align 4
  %1230 = load i32, i32* %32, align 4
  %1231 = icmp eq i32 %1229, %1230
  br i1 %1231, label %1232, label %1233

1232:                                             ; preds = %1207
  store i32 257, i32* %31, align 4
  store i32 256, i32* %32, align 4
  br label %1270

1233:                                             ; preds = %1207
  %1234 = load i8*, i8** %26, align 4
  %1235 = load i8, i8* %1234, align 1
  %1236 = zext i8 %1235 to i32
  %1237 = sub nsw i32 %1236, 1
  %1238 = trunc i32 %1237 to i8
  store i8 %1238, i8* %50, align 1
  br label %1239

1239:                                             ; preds = %1258, %1233
  %1240 = load i8, i8* %50, align 1
  %1241 = zext i8 %1240 to i32
  %1242 = icmp sgt i32 %1241, 0
  br i1 %1242, label %1243, label %1256

1243:                                             ; preds = %1239
  %1244 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1245 = load i8, i8* %50, align 1
  %1246 = zext i8 %1245 to i32
  %1247 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1244, i32 %1246
  %1248 = bitcast %union.register_info_type* %1247 to %struct.anon.2*
  %1249 = bitcast %struct.anon.2* %1248 to i8*
  %1250 = load i8, i8* %1249, align 4
  %1251 = lshr i8 %1250, 2
  %1252 = and i8 %1251, 1
  %1253 = zext i8 %1252 to i32
  %1254 = icmp ne i32 %1253, 0
  %1255 = xor i1 %1254, true
  br label %1256

1256:                                             ; preds = %1243, %1239
  %1257 = phi i1 [ false, %1239 ], [ %1255, %1243 ]
  br i1 %1257, label %1258, label %1261

1258:                                             ; preds = %1256
  %1259 = load i8, i8* %50, align 1
  %1260 = add i8 %1259, -1
  store i8 %1260, i8* %50, align 1
  br label %1239

1261:                                             ; preds = %1256
  %1262 = load i8, i8* %50, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = icmp eq i32 %1263, 0
  br i1 %1264, label %1265, label %1266

1265:                                             ; preds = %1261
  store i32 257, i32* %31, align 4
  store i32 256, i32* %32, align 4
  br label %1269

1266:                                             ; preds = %1261
  %1267 = load i8, i8* %50, align 1
  %1268 = zext i8 %1267 to i32
  store i32 %1268, i32* %32, align 4
  br label %1269

1269:                                             ; preds = %1266, %1265
  br label %1270

1270:                                             ; preds = %1269, %1232
  %1271 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1272 = load i8*, i8** %26, align 4
  %1273 = load i8, i8* %1272, align 1
  %1274 = zext i8 %1273 to i32
  %1275 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1271, i32 %1274
  %1276 = bitcast %union.register_info_type* %1275 to %struct.anon.2*
  %1277 = bitcast %struct.anon.2* %1276 to i8*
  %1278 = load i8, i8* %1277, align 4
  %1279 = lshr i8 %1278, 3
  %1280 = and i8 %1279, 1
  %1281 = zext i8 %1280 to i32
  %1282 = icmp ne i32 %1281, 0
  br i1 %1282, label %1283, label %1289

1283:                                             ; preds = %1270
  %1284 = load i8*, i8** %26, align 4
  %1285 = getelementptr inbounds i8, i8* %1284, i32 -3
  %1286 = load i8, i8* %1285, align 1
  %1287 = zext i8 %1286 to i32
  %1288 = icmp eq i32 %1287, 5
  br i1 %1288, label %1289, label %1572

1289:                                             ; preds = %1283, %1270
  %1290 = load i8*, i8** %26, align 4
  %1291 = getelementptr inbounds i8, i8* %1290, i32 2
  %1292 = load i8*, i8** %27, align 4
  %1293 = icmp ult i8* %1291, %1292
  br i1 %1293, label %1294, label %1572

1294:                                             ; preds = %1289
  store i8 0, i8* %51, align 1
  %1295 = load i8*, i8** %26, align 4
  %1296 = getelementptr inbounds i8, i8* %1295, i32 2
  store i8* %1296, i8** %19, align 4
  store i32 0, i32* %18, align 4
  %1297 = load i8*, i8** %19, align 4
  %1298 = getelementptr inbounds i8, i8* %1297, i32 1
  store i8* %1298, i8** %19, align 4
  %1299 = load i8, i8* %1297, align 1
  %1300 = zext i8 %1299 to i32
  switch i32 %1300, label %1326 [
    i32 21, label %1301
    i32 16, label %1302
    i32 17, label %1302
    i32 12, label %1302
    i32 18, label %1302
  ]

1301:                                             ; preds = %1294
  store i8 1, i8* %51, align 1
  br label %1302

1302:                                             ; preds = %1294, %1294, %1294, %1294, %1301
  br label %1303

1303:                                             ; preds = %1302
  br label %1304

1304:                                             ; preds = %1303
  %1305 = load i8*, i8** %19, align 4
  %1306 = load i8, i8* %1305, align 1
  %1307 = zext i8 %1306 to i32
  %1308 = and i32 %1307, 255
  store i32 %1308, i32* %18, align 4
  %1309 = load i8*, i8** %19, align 4
  %1310 = getelementptr inbounds i8, i8* %1309, i32 1
  %1311 = load i8, i8* %1310, align 1
  %1312 = sext i8 %1311 to i32
  %1313 = shl i32 %1312, 8
  %1314 = load i32, i32* %18, align 4
  %1315 = add nsw i32 %1314, %1313
  store i32 %1315, i32* %18, align 4
  br label %1316

1316:                                             ; preds = %1304
  %1317 = load i8*, i8** %19, align 4
  %1318 = getelementptr inbounds i8, i8* %1317, i32 2
  store i8* %1318, i8** %19, align 4
  br label %1319

1319:                                             ; preds = %1316
  %1320 = load i8, i8* %51, align 1
  %1321 = icmp ne i8 %1320, 0
  br i1 %1321, label %1322, label %1325

1322:                                             ; preds = %1319
  %1323 = load i8*, i8** %19, align 4
  %1324 = getelementptr inbounds i8, i8* %1323, i32 2
  store i8* %1324, i8** %19, align 4
  br label %1325

1325:                                             ; preds = %1322, %1319
  br label %1327

1326:                                             ; preds = %1294
  br label %1327

1327:                                             ; preds = %1326, %1325
  %1328 = load i32, i32* %18, align 4
  %1329 = load i8*, i8** %19, align 4
  %1330 = getelementptr inbounds i8, i8* %1329, i32 %1328
  store i8* %1330, i8** %19, align 4
  %1331 = load i32, i32* %18, align 4
  %1332 = icmp slt i32 %1331, 0
  br i1 %1332, label %1333, label %1571

1333:                                             ; preds = %1327
  %1334 = load i8*, i8** %19, align 4
  %1335 = load i8, i8* %1334, align 1
  %1336 = zext i8 %1335 to i32
  %1337 = icmp eq i32 %1336, 14
  br i1 %1337, label %1338, label %1571

1338:                                             ; preds = %1333
  %1339 = load i8*, i8** %19, align 4
  %1340 = getelementptr inbounds i8, i8* %1339, i32 3
  %1341 = load i8, i8* %1340, align 1
  %1342 = zext i8 %1341 to i32
  %1343 = icmp eq i32 %1342, 5
  br i1 %1343, label %1344, label %1571

1344:                                             ; preds = %1338
  %1345 = load i8*, i8** %19, align 4
  %1346 = getelementptr inbounds i8, i8* %1345, i32 4
  %1347 = load i8, i8* %1346, align 1
  %1348 = zext i8 %1347 to i32
  %1349 = load i8*, i8** %26, align 4
  %1350 = load i8, i8* %1349, align 1
  %1351 = zext i8 %1350 to i32
  %1352 = icmp eq i32 %1348, %1351
  br i1 %1352, label %1353, label %1571

1353:                                             ; preds = %1344
  %1354 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1355 = load i8*, i8** %26, align 4
  %1356 = load i8, i8* %1355, align 1
  %1357 = zext i8 %1356 to i32
  %1358 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1354, i32 %1357
  %1359 = bitcast %union.register_info_type* %1358 to %struct.anon.2*
  %1360 = bitcast %struct.anon.2* %1359 to i8*
  %1361 = load i8, i8* %1360, align 4
  %1362 = lshr i8 %1361, 4
  %1363 = and i8 %1362, 1
  %1364 = zext i8 %1363 to i32
  %1365 = icmp ne i32 %1364, 0
  br i1 %1365, label %1366, label %1422

1366:                                             ; preds = %1353
  %1367 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1368 = load i8*, i8** %26, align 4
  %1369 = load i8, i8* %1368, align 1
  %1370 = zext i8 %1369 to i32
  %1371 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1367, i32 %1370
  %1372 = bitcast %union.register_info_type* %1371 to %struct.anon.2*
  %1373 = bitcast %struct.anon.2* %1372 to i8*
  %1374 = load i8, i8* %1373, align 4
  %1375 = and i8 %1374, -17
  store i8 %1375, i8* %1373, align 4
  %1376 = load i8*, i8** %26, align 4
  %1377 = load i8, i8* %1376, align 1
  %1378 = zext i8 %1377 to i32
  store i32 %1378, i32* %52, align 4
  br label %1379

1379:                                             ; preds = %1418, %1366
  %1380 = load i32, i32* %52, align 4
  %1381 = load i8*, i8** %26, align 4
  %1382 = load i8, i8* %1381, align 1
  %1383 = zext i8 %1382 to i32
  %1384 = load i8*, i8** %26, align 4
  %1385 = getelementptr inbounds i8, i8* %1384, i32 1
  %1386 = load i8, i8* %1385, align 1
  %1387 = zext i8 %1386 to i32
  %1388 = add nsw i32 %1383, %1387
  %1389 = icmp ult i32 %1380, %1388
  br i1 %1389, label %1390, label %1421

1390:                                             ; preds = %1379
  %1391 = load i8**, i8*** %35, align 4
  %1392 = load i32, i32* %52, align 4
  %1393 = getelementptr inbounds i8*, i8** %1391, i32 %1392
  %1394 = load i8*, i8** %1393, align 4
  %1395 = load i8**, i8*** %33, align 4
  %1396 = load i32, i32* %52, align 4
  %1397 = getelementptr inbounds i8*, i8** %1395, i32 %1396
  store i8* %1394, i8** %1397, align 4
  %1398 = load i8**, i8*** %36, align 4
  %1399 = load i32, i32* %52, align 4
  %1400 = getelementptr inbounds i8*, i8** %1398, i32 %1399
  %1401 = load i8*, i8** %1400, align 4
  %1402 = ptrtoint i8* %1401 to i32
  %1403 = load i8**, i8*** %33, align 4
  %1404 = load i32, i32* %52, align 4
  %1405 = getelementptr inbounds i8*, i8** %1403, i32 %1404
  %1406 = load i8*, i8** %1405, align 4
  %1407 = ptrtoint i8* %1406 to i32
  %1408 = icmp sge i32 %1402, %1407
  br i1 %1408, label %1409, label %1417

1409:                                             ; preds = %1390
  %1410 = load i8**, i8*** %36, align 4
  %1411 = load i32, i32* %52, align 4
  %1412 = getelementptr inbounds i8*, i8** %1410, i32 %1411
  %1413 = load i8*, i8** %1412, align 4
  %1414 = load i8**, i8*** %34, align 4
  %1415 = load i32, i32* %52, align 4
  %1416 = getelementptr inbounds i8*, i8** %1414, i32 %1415
  store i8* %1413, i8** %1416, align 4
  br label %1417

1417:                                             ; preds = %1409, %1390
  br label %1418

1418:                                             ; preds = %1417
  %1419 = load i32, i32* %52, align 4
  %1420 = add i32 %1419, 1
  store i32 %1420, i32* %52, align 4
  br label %1379

1421:                                             ; preds = %1379
  br label %1422

1422:                                             ; preds = %1421, %1353
  %1423 = load i8*, i8** %19, align 4
  %1424 = getelementptr inbounds i8, i8* %1423, i32 1
  store i8* %1424, i8** %19, align 4
  br label %1425

1425:                                             ; preds = %1422
  br label %1426

1426:                                             ; preds = %1425
  %1427 = load i8*, i8** %19, align 4
  %1428 = load i8, i8* %1427, align 1
  %1429 = zext i8 %1428 to i32
  %1430 = and i32 %1429, 255
  store i32 %1430, i32* %18, align 4
  %1431 = load i8*, i8** %19, align 4
  %1432 = getelementptr inbounds i8, i8* %1431, i32 1
  %1433 = load i8, i8* %1432, align 1
  %1434 = sext i8 %1433 to i32
  %1435 = shl i32 %1434, 8
  %1436 = load i32, i32* %18, align 4
  %1437 = add nsw i32 %1436, %1435
  store i32 %1437, i32* %18, align 4
  br label %1438

1438:                                             ; preds = %1426
  %1439 = load i8*, i8** %19, align 4
  %1440 = getelementptr inbounds i8, i8* %1439, i32 2
  store i8* %1440, i8** %19, align 4
  br label %1441

1441:                                             ; preds = %1438
  br label %1442

1442:                                             ; preds = %1441
  br label %1443

1443:                                             ; preds = %1495, %1442
  %1444 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1445 = load i32, i32* %1444, align 4
  %1446 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1447 = load i32, i32* %1446, align 4
  %1448 = sub i32 %1445, %1447
  %1449 = load i32, i32* %32, align 4
  %1450 = load i32, i32* %31, align 4
  %1451 = sub i32 %1449, %1450
  %1452 = add i32 %1451, 1
  %1453 = mul i32 %1452, 3
  %1454 = add i32 %1453, 4
  %1455 = icmp ult i32 %1448, %1454
  br i1 %1455, label %1456, label %1496

1456:                                             ; preds = %1443
  %1457 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1458 = load i32, i32* %1457, align 4
  %1459 = load i32, i32* @re_max_failures, align 4
  %1460 = load i32, i32* %30, align 4
  %1461 = sub i32 %1460, 1
  %1462 = mul i32 %1461, 3
  %1463 = add i32 %1462, 4
  %1464 = mul i32 %1459, %1463
  %1465 = icmp ugt i32 %1458, %1464
  br i1 %1465, label %1466, label %1467

1466:                                             ; preds = %1456
  br i1 false, label %1495, label %1494

1467:                                             ; preds = %1456
  %1468 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1469 = load i32, i32* %1468, align 4
  %1470 = shl i32 %1469, 1
  %1471 = mul i32 %1470, 4
  %1472 = alloca i8, i32 %1471, align 16
  store i8* %1472, i8** %53, align 4
  %1473 = load i8*, i8** %53, align 4
  %1474 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1475 = load i8**, i8*** %1474, align 4
  %1476 = bitcast i8** %1475 to i8*
  %1477 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1478 = load i32, i32* %1477, align 4
  %1479 = mul i32 %1478, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %1473, i8* align 4 %1476, i32 %1479, i1 false)
  %1480 = load i8*, i8** %53, align 4
  %1481 = bitcast i8* %1480 to i8**
  %1482 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %1481, i8*** %1482, align 4
  %1483 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1484 = load i8**, i8*** %1483, align 4
  %1485 = icmp eq i8** %1484, null
  br i1 %1485, label %1486, label %1487

1486:                                             ; preds = %1467
  br label %1491

1487:                                             ; preds = %1467
  %1488 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1489 = load i32, i32* %1488, align 4
  %1490 = shl i32 %1489, 1
  store i32 %1490, i32* %1488, align 4
  br label %1491

1491:                                             ; preds = %1487, %1486
  %1492 = phi i32 [ 0, %1486 ], [ 1, %1487 ]
  %1493 = icmp ne i32 %1492, 0
  br i1 %1493, label %1495, label %1494

1494:                                             ; preds = %1491, %1466
  store i32 -2, i32* %9, align 4
  br label %3471

1495:                                             ; preds = %1491, %1466
  br label %1443

1496:                                             ; preds = %1443
  %1497 = load i32, i32* %31, align 4
  store i32 %1497, i32* %54, align 4
  br label %1498

1498:                                             ; preds = %1534, %1496
  %1499 = load i32, i32* %54, align 4
  %1500 = load i32, i32* %32, align 4
  %1501 = icmp ule i32 %1499, %1500
  br i1 %1501, label %1502, label %1537

1502:                                             ; preds = %1498
  %1503 = load i8**, i8*** %33, align 4
  %1504 = load i32, i32* %54, align 4
  %1505 = getelementptr inbounds i8*, i8** %1503, i32 %1504
  %1506 = load i8*, i8** %1505, align 4
  %1507 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1508 = load i8**, i8*** %1507, align 4
  %1509 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1510 = load i32, i32* %1509, align 4
  %1511 = add i32 %1510, 1
  store i32 %1511, i32* %1509, align 4
  %1512 = getelementptr inbounds i8*, i8** %1508, i32 %1510
  store i8* %1506, i8** %1512, align 4
  %1513 = load i8**, i8*** %34, align 4
  %1514 = load i32, i32* %54, align 4
  %1515 = getelementptr inbounds i8*, i8** %1513, i32 %1514
  %1516 = load i8*, i8** %1515, align 4
  %1517 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1518 = load i8**, i8*** %1517, align 4
  %1519 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1520 = load i32, i32* %1519, align 4
  %1521 = add i32 %1520, 1
  store i32 %1521, i32* %1519, align 4
  %1522 = getelementptr inbounds i8*, i8** %1518, i32 %1520
  store i8* %1516, i8** %1522, align 4
  %1523 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1524 = load i32, i32* %54, align 4
  %1525 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1523, i32 %1524
  %1526 = bitcast %union.register_info_type* %1525 to i8**
  %1527 = load i8*, i8** %1526, align 4
  %1528 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1529 = load i8**, i8*** %1528, align 4
  %1530 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1531 = load i32, i32* %1530, align 4
  %1532 = add i32 %1531, 1
  store i32 %1532, i32* %1530, align 4
  %1533 = getelementptr inbounds i8*, i8** %1529, i32 %1531
  store i8* %1527, i8** %1533, align 4
  br label %1534

1534:                                             ; preds = %1502
  %1535 = load i32, i32* %54, align 4
  %1536 = add nsw i32 %1535, 1
  store i32 %1536, i32* %54, align 4
  br label %1498

1537:                                             ; preds = %1498
  %1538 = load i32, i32* %31, align 4
  %1539 = inttoptr i32 %1538 to i8*
  %1540 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1541 = load i8**, i8*** %1540, align 4
  %1542 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1543 = load i32, i32* %1542, align 4
  %1544 = add i32 %1543, 1
  store i32 %1544, i32* %1542, align 4
  %1545 = getelementptr inbounds i8*, i8** %1541, i32 %1543
  store i8* %1539, i8** %1545, align 4
  %1546 = load i32, i32* %32, align 4
  %1547 = inttoptr i32 %1546 to i8*
  %1548 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1549 = load i8**, i8*** %1548, align 4
  %1550 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1551 = load i32, i32* %1550, align 4
  %1552 = add i32 %1551, 1
  store i32 %1552, i32* %1550, align 4
  %1553 = getelementptr inbounds i8*, i8** %1549, i32 %1551
  store i8* %1547, i8** %1553, align 4
  %1554 = load i8*, i8** %19, align 4
  %1555 = load i32, i32* %18, align 4
  %1556 = getelementptr inbounds i8, i8* %1554, i32 %1555
  %1557 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1558 = load i8**, i8*** %1557, align 4
  %1559 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1560 = load i32, i32* %1559, align 4
  %1561 = add i32 %1560, 1
  store i32 %1561, i32* %1559, align 4
  %1562 = getelementptr inbounds i8*, i8** %1558, i32 %1560
  store i8* %1556, i8** %1562, align 4
  %1563 = load i8*, i8** %24, align 4
  %1564 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1565 = load i8**, i8*** %1564, align 4
  %1566 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1567 = load i32, i32* %1566, align 4
  %1568 = add i32 %1567, 1
  store i32 %1568, i32* %1566, align 4
  %1569 = getelementptr inbounds i8*, i8** %1565, i32 %1567
  store i8* %1563, i8** %1569, align 4
  br label %1570

1570:                                             ; preds = %1537
  br label %3316

1571:                                             ; preds = %1344, %1338, %1333, %1327
  br label %1572

1572:                                             ; preds = %1571, %1289, %1283
  %1573 = load i8*, i8** %26, align 4
  %1574 = getelementptr inbounds i8, i8* %1573, i32 2
  store i8* %1574, i8** %26, align 4
  br label %3315

1575:                                             ; preds = %748
  %1576 = load i8*, i8** %26, align 4
  %1577 = getelementptr inbounds i8, i8* %1576, i32 1
  store i8* %1577, i8** %26, align 4
  %1578 = load i8, i8* %1576, align 1
  %1579 = zext i8 %1578 to i32
  store i32 %1579, i32* %57, align 4
  %1580 = load i8**, i8*** %33, align 4
  %1581 = load i32, i32* %57, align 4
  %1582 = getelementptr inbounds i8*, i8** %1580, i32 %1581
  %1583 = load i8*, i8** %1582, align 4
  %1584 = icmp eq i8* %1583, inttoptr (i32 -1 to i8*)
  br i1 %1584, label %1591, label %1585

1585:                                             ; preds = %1575
  %1586 = load i8**, i8*** %34, align 4
  %1587 = load i32, i32* %57, align 4
  %1588 = getelementptr inbounds i8*, i8** %1586, i32 %1587
  %1589 = load i8*, i8** %1588, align 4
  %1590 = icmp eq i8* %1589, inttoptr (i32 -1 to i8*)
  br i1 %1590, label %1591, label %1592

1591:                                             ; preds = %1585, %1575
  br label %3316

1592:                                             ; preds = %1585
  %1593 = load i8**, i8*** %33, align 4
  %1594 = load i32, i32* %57, align 4
  %1595 = getelementptr inbounds i8*, i8** %1593, i32 %1594
  %1596 = load i8*, i8** %1595, align 4
  store i8* %1596, i8** %55, align 4
  %1597 = load i32, i32* %12, align 4
  %1598 = icmp ne i32 %1597, 0
  br i1 %1598, label %1599, label %1615

1599:                                             ; preds = %1592
  %1600 = load i8*, i8** %11, align 4
  %1601 = load i8**, i8*** %33, align 4
  %1602 = load i32, i32* %57, align 4
  %1603 = getelementptr inbounds i8*, i8** %1601, i32 %1602
  %1604 = load i8*, i8** %1603, align 4
  %1605 = icmp ule i8* %1600, %1604
  br i1 %1605, label %1606, label %1615

1606:                                             ; preds = %1599
  %1607 = load i8**, i8*** %33, align 4
  %1608 = load i32, i32* %57, align 4
  %1609 = getelementptr inbounds i8*, i8** %1607, i32 %1608
  %1610 = load i8*, i8** %1609, align 4
  %1611 = load i8*, i8** %11, align 4
  %1612 = load i32, i32* %12, align 4
  %1613 = getelementptr inbounds i8, i8* %1611, i32 %1612
  %1614 = icmp ule i8* %1610, %1613
  br label %1615

1615:                                             ; preds = %1606, %1599, %1592
  %1616 = phi i1 [ false, %1599 ], [ false, %1592 ], [ %1614, %1606 ]
  %1617 = zext i1 %1616 to i32
  %1618 = load i32, i32* %12, align 4
  %1619 = icmp ne i32 %1618, 0
  br i1 %1619, label %1620, label %1636

1620:                                             ; preds = %1615
  %1621 = load i8*, i8** %11, align 4
  %1622 = load i8**, i8*** %34, align 4
  %1623 = load i32, i32* %57, align 4
  %1624 = getelementptr inbounds i8*, i8** %1622, i32 %1623
  %1625 = load i8*, i8** %1624, align 4
  %1626 = icmp ule i8* %1621, %1625
  br i1 %1626, label %1627, label %1636

1627:                                             ; preds = %1620
  %1628 = load i8**, i8*** %34, align 4
  %1629 = load i32, i32* %57, align 4
  %1630 = getelementptr inbounds i8*, i8** %1628, i32 %1629
  %1631 = load i8*, i8** %1630, align 4
  %1632 = load i8*, i8** %11, align 4
  %1633 = load i32, i32* %12, align 4
  %1634 = getelementptr inbounds i8, i8* %1632, i32 %1633
  %1635 = icmp ule i8* %1631, %1634
  br label %1636

1636:                                             ; preds = %1627, %1620, %1615
  %1637 = phi i1 [ false, %1620 ], [ false, %1615 ], [ %1635, %1627 ]
  %1638 = zext i1 %1637 to i32
  %1639 = icmp eq i32 %1617, %1638
  br i1 %1639, label %1640, label %1645

1640:                                             ; preds = %1636
  %1641 = load i8**, i8*** %34, align 4
  %1642 = load i32, i32* %57, align 4
  %1643 = getelementptr inbounds i8*, i8** %1641, i32 %1642
  %1644 = load i8*, i8** %1643, align 4
  br label %1647

1645:                                             ; preds = %1636
  %1646 = load i8*, i8** %22, align 4
  br label %1647

1647:                                             ; preds = %1645, %1640
  %1648 = phi i8* [ %1644, %1640 ], [ %1646, %1645 ]
  store i8* %1648, i8** %56, align 4
  br label %1649

1649:                                             ; preds = %1727, %1647
  br label %1650

1650:                                             ; preds = %1667, %1649
  %1651 = load i8*, i8** %55, align 4
  %1652 = load i8*, i8** %56, align 4
  %1653 = icmp eq i8* %1651, %1652
  br i1 %1653, label %1654, label %1673

1654:                                             ; preds = %1650
  %1655 = load i8*, i8** %56, align 4
  %1656 = load i8*, i8** %23, align 4
  %1657 = icmp eq i8* %1655, %1656
  br i1 %1657, label %1658, label %1659

1658:                                             ; preds = %1654
  br label %1673

1659:                                             ; preds = %1654
  %1660 = load i8*, i8** %56, align 4
  %1661 = load i8**, i8*** %34, align 4
  %1662 = load i32, i32* %57, align 4
  %1663 = getelementptr inbounds i8*, i8** %1661, i32 %1662
  %1664 = load i8*, i8** %1663, align 4
  %1665 = icmp eq i8* %1660, %1664
  br i1 %1665, label %1666, label %1667

1666:                                             ; preds = %1659
  br label %1673

1667:                                             ; preds = %1659
  %1668 = load i8*, i8** %13, align 4
  store i8* %1668, i8** %55, align 4
  %1669 = load i8**, i8*** %34, align 4
  %1670 = load i32, i32* %57, align 4
  %1671 = getelementptr inbounds i8*, i8** %1669, i32 %1670
  %1672 = load i8*, i8** %1671, align 4
  store i8* %1672, i8** %56, align 4
  br label %1650

1673:                                             ; preds = %1666, %1658, %1650
  %1674 = load i8*, i8** %55, align 4
  %1675 = load i8*, i8** %56, align 4
  %1676 = icmp eq i8* %1674, %1675
  br i1 %1676, label %1677, label %1678

1677:                                             ; preds = %1673
  br label %1734

1678:                                             ; preds = %1673
  br label %1679

1679:                                             ; preds = %1688, %1678
  %1680 = load i8*, i8** %24, align 4
  %1681 = load i8*, i8** %25, align 4
  %1682 = icmp eq i8* %1680, %1681
  br i1 %1682, label %1683, label %1691

1683:                                             ; preds = %1679
  %1684 = load i8*, i8** %25, align 4
  %1685 = load i8*, i8** %23, align 4
  %1686 = icmp eq i8* %1684, %1685
  br i1 %1686, label %1687, label %1688

1687:                                             ; preds = %1683
  br label %3316

1688:                                             ; preds = %1683
  %1689 = load i8*, i8** %13, align 4
  store i8* %1689, i8** %24, align 4
  %1690 = load i8*, i8** %23, align 4
  store i8* %1690, i8** %25, align 4
  br label %1679

1691:                                             ; preds = %1679
  %1692 = load i8*, i8** %25, align 4
  %1693 = load i8*, i8** %24, align 4
  %1694 = ptrtoint i8* %1692 to i32
  %1695 = ptrtoint i8* %1693 to i32
  %1696 = sub i32 %1694, %1695
  store i32 %1696, i32* %18, align 4
  %1697 = load i32, i32* %18, align 4
  %1698 = load i8*, i8** %56, align 4
  %1699 = load i8*, i8** %55, align 4
  %1700 = ptrtoint i8* %1698 to i32
  %1701 = ptrtoint i8* %1699 to i32
  %1702 = sub i32 %1700, %1701
  %1703 = icmp sgt i32 %1697, %1702
  br i1 %1703, label %1704, label %1710

1704:                                             ; preds = %1691
  %1705 = load i8*, i8** %56, align 4
  %1706 = load i8*, i8** %55, align 4
  %1707 = ptrtoint i8* %1705 to i32
  %1708 = ptrtoint i8* %1706 to i32
  %1709 = sub i32 %1707, %1708
  store i32 %1709, i32* %18, align 4
  br label %1710

1710:                                             ; preds = %1704, %1691
  %1711 = load i8*, i8** %28, align 4
  %1712 = icmp ne i8* %1711, null
  br i1 %1712, label %1713, label %1720

1713:                                             ; preds = %1710
  %1714 = load i8*, i8** %24, align 4
  %1715 = load i8*, i8** %55, align 4
  %1716 = load i32, i32* %18, align 4
  %1717 = load i8*, i8** %28, align 4
  %1718 = call i32 @bcmp_translate(i8* %1714, i8* %1715, i32 %1716, i8* %1717)
  %1719 = icmp ne i32 %1718, 0
  br i1 %1719, label %1726, label %1727

1720:                                             ; preds = %1710
  %1721 = load i8*, i8** %24, align 4
  %1722 = load i8*, i8** %55, align 4
  %1723 = load i32, i32* %18, align 4
  %1724 = call i32 @memcmp(i8* %1721, i8* %1722, i32 %1723) #8
  %1725 = icmp ne i32 %1724, 0
  br i1 %1725, label %1726, label %1727

1726:                                             ; preds = %1720, %1713
  br label %3316

1727:                                             ; preds = %1720, %1713
  %1728 = load i32, i32* %18, align 4
  %1729 = load i8*, i8** %24, align 4
  %1730 = getelementptr inbounds i8, i8* %1729, i32 %1728
  store i8* %1730, i8** %24, align 4
  %1731 = load i32, i32* %18, align 4
  %1732 = load i8*, i8** %55, align 4
  %1733 = getelementptr inbounds i8, i8* %1732, i32 %1731
  store i8* %1733, i8** %55, align 4
  br label %1649

1734:                                             ; preds = %1677
  br label %3315

1735:                                             ; preds = %748
  %1736 = load i8*, i8** %24, align 4
  %1737 = load i32, i32* %12, align 4
  %1738 = icmp ne i32 %1737, 0
  br i1 %1738, label %1739, label %1741

1739:                                             ; preds = %1735
  %1740 = load i8*, i8** %11, align 4
  br label %1743

1741:                                             ; preds = %1735
  %1742 = load i8*, i8** %13, align 4
  br label %1743

1743:                                             ; preds = %1741, %1739
  %1744 = phi i8* [ %1740, %1739 ], [ %1742, %1741 ]
  %1745 = icmp eq i8* %1736, %1744
  br i1 %1745, label %1749, label %1746

1746:                                             ; preds = %1743
  %1747 = load i32, i32* %14, align 4
  %1748 = icmp ne i32 %1747, 0
  br i1 %1748, label %1759, label %1749

1749:                                             ; preds = %1746, %1743
  %1750 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %1751 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1750, i32 0, i32 7
  %1752 = load i8, i8* %1751, align 4
  %1753 = lshr i8 %1752, 5
  %1754 = and i8 %1753, 1
  %1755 = zext i8 %1754 to i32
  %1756 = icmp ne i32 %1755, 0
  br i1 %1756, label %1758, label %1757

1757:                                             ; preds = %1749
  br label %3315

1758:                                             ; preds = %1749
  br label %1774

1759:                                             ; preds = %1746
  %1760 = load i8*, i8** %24, align 4
  %1761 = getelementptr inbounds i8, i8* %1760, i32 -1
  %1762 = load i8, i8* %1761, align 1
  %1763 = sext i8 %1762 to i32
  %1764 = icmp eq i32 %1763, 10
  br i1 %1764, label %1765, label %1773

1765:                                             ; preds = %1759
  %1766 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %1767 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1766, i32 0, i32 7
  %1768 = load i8, i8* %1767, align 4
  %1769 = lshr i8 %1768, 7
  %1770 = zext i8 %1769 to i32
  %1771 = icmp ne i32 %1770, 0
  br i1 %1771, label %1772, label %1773

1772:                                             ; preds = %1765
  br label %3315

1773:                                             ; preds = %1765, %1759
  br label %1774

1774:                                             ; preds = %1773, %1758
  br label %3316

1775:                                             ; preds = %748
  %1776 = load i8*, i8** %24, align 4
  %1777 = load i8*, i8** %21, align 4
  %1778 = icmp eq i8* %1776, %1777
  br i1 %1778, label %1779, label %1789

1779:                                             ; preds = %1775
  %1780 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %1781 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1780, i32 0, i32 7
  %1782 = load i8, i8* %1781, align 4
  %1783 = lshr i8 %1782, 6
  %1784 = and i8 %1783, 1
  %1785 = zext i8 %1784 to i32
  %1786 = icmp ne i32 %1785, 0
  br i1 %1786, label %1788, label %1787

1787:                                             ; preds = %1779
  br label %3315

1788:                                             ; preds = %1779
  br label %1813

1789:                                             ; preds = %1775
  %1790 = load i8*, i8** %24, align 4
  %1791 = load i8*, i8** %20, align 4
  %1792 = icmp eq i8* %1790, %1791
  br i1 %1792, label %1793, label %1797

1793:                                             ; preds = %1789
  %1794 = load i8*, i8** %13, align 4
  %1795 = load i8, i8* %1794, align 1
  %1796 = sext i8 %1795 to i32
  br label %1801

1797:                                             ; preds = %1789
  %1798 = load i8*, i8** %24, align 4
  %1799 = load i8, i8* %1798, align 1
  %1800 = sext i8 %1799 to i32
  br label %1801

1801:                                             ; preds = %1797, %1793
  %1802 = phi i32 [ %1796, %1793 ], [ %1800, %1797 ]
  %1803 = icmp eq i32 %1802, 10
  br i1 %1803, label %1804, label %1812

1804:                                             ; preds = %1801
  %1805 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %1806 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1805, i32 0, i32 7
  %1807 = load i8, i8* %1806, align 4
  %1808 = lshr i8 %1807, 7
  %1809 = zext i8 %1808 to i32
  %1810 = icmp ne i32 %1809, 0
  br i1 %1810, label %1811, label %1812

1811:                                             ; preds = %1804
  br label %3315

1812:                                             ; preds = %1804, %1801
  br label %1813

1813:                                             ; preds = %1812, %1788
  br label %3316

1814:                                             ; preds = %748
  %1815 = load i8*, i8** %24, align 4
  %1816 = load i32, i32* %12, align 4
  %1817 = icmp ne i32 %1816, 0
  br i1 %1817, label %1818, label %1820

1818:                                             ; preds = %1814
  %1819 = load i8*, i8** %11, align 4
  br label %1822

1820:                                             ; preds = %1814
  %1821 = load i8*, i8** %13, align 4
  br label %1822

1822:                                             ; preds = %1820, %1818
  %1823 = phi i8* [ %1819, %1818 ], [ %1821, %1820 ]
  %1824 = icmp eq i8* %1815, %1823
  br i1 %1824, label %1828, label %1825

1825:                                             ; preds = %1822
  %1826 = load i32, i32* %14, align 4
  %1827 = icmp ne i32 %1826, 0
  br i1 %1827, label %1829, label %1828

1828:                                             ; preds = %1825, %1822
  br label %3315

1829:                                             ; preds = %1825
  br label %3316

1830:                                             ; preds = %748
  %1831 = load i8*, i8** %24, align 4
  %1832 = load i8*, i8** %21, align 4
  %1833 = icmp eq i8* %1831, %1832
  br i1 %1833, label %1834, label %1835

1834:                                             ; preds = %1830
  br label %3315

1835:                                             ; preds = %1830
  br label %3316

1836:                                             ; preds = %748
  br label %1837

1837:                                             ; preds = %1836
  br label %1838

1838:                                             ; preds = %1837
  %1839 = load i8*, i8** %26, align 4
  %1840 = load i8, i8* %1839, align 1
  %1841 = zext i8 %1840 to i32
  %1842 = and i32 %1841, 255
  store i32 %1842, i32* %18, align 4
  %1843 = load i8*, i8** %26, align 4
  %1844 = getelementptr inbounds i8, i8* %1843, i32 1
  %1845 = load i8, i8* %1844, align 1
  %1846 = sext i8 %1845 to i32
  %1847 = shl i32 %1846, 8
  %1848 = load i32, i32* %18, align 4
  %1849 = add nsw i32 %1848, %1847
  store i32 %1849, i32* %18, align 4
  br label %1850

1850:                                             ; preds = %1838
  %1851 = load i8*, i8** %26, align 4
  %1852 = getelementptr inbounds i8, i8* %1851, i32 2
  store i8* %1852, i8** %26, align 4
  br label %1853

1853:                                             ; preds = %1850
  br label %1854

1854:                                             ; preds = %1853
  br label %1855

1855:                                             ; preds = %1907, %1854
  %1856 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1857 = load i32, i32* %1856, align 4
  %1858 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1859 = load i32, i32* %1858, align 4
  %1860 = sub i32 %1857, %1859
  %1861 = load i32, i32* %32, align 4
  %1862 = load i32, i32* %31, align 4
  %1863 = sub i32 %1861, %1862
  %1864 = add i32 %1863, 1
  %1865 = mul i32 %1864, 3
  %1866 = add i32 %1865, 4
  %1867 = icmp ult i32 %1860, %1866
  br i1 %1867, label %1868, label %1908

1868:                                             ; preds = %1855
  %1869 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1870 = load i32, i32* %1869, align 4
  %1871 = load i32, i32* @re_max_failures, align 4
  %1872 = load i32, i32* %30, align 4
  %1873 = sub i32 %1872, 1
  %1874 = mul i32 %1873, 3
  %1875 = add i32 %1874, 4
  %1876 = mul i32 %1871, %1875
  %1877 = icmp ugt i32 %1870, %1876
  br i1 %1877, label %1878, label %1879

1878:                                             ; preds = %1868
  br i1 false, label %1907, label %1906

1879:                                             ; preds = %1868
  %1880 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1881 = load i32, i32* %1880, align 4
  %1882 = shl i32 %1881, 1
  %1883 = mul i32 %1882, 4
  %1884 = alloca i8, i32 %1883, align 16
  store i8* %1884, i8** %58, align 4
  %1885 = load i8*, i8** %58, align 4
  %1886 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1887 = load i8**, i8*** %1886, align 4
  %1888 = bitcast i8** %1887 to i8*
  %1889 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1890 = load i32, i32* %1889, align 4
  %1891 = mul i32 %1890, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %1885, i8* align 4 %1888, i32 %1891, i1 false)
  %1892 = load i8*, i8** %58, align 4
  %1893 = bitcast i8* %1892 to i8**
  %1894 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %1893, i8*** %1894, align 4
  %1895 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1896 = load i8**, i8*** %1895, align 4
  %1897 = icmp eq i8** %1896, null
  br i1 %1897, label %1898, label %1899

1898:                                             ; preds = %1879
  br label %1903

1899:                                             ; preds = %1879
  %1900 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %1901 = load i32, i32* %1900, align 4
  %1902 = shl i32 %1901, 1
  store i32 %1902, i32* %1900, align 4
  br label %1903

1903:                                             ; preds = %1899, %1898
  %1904 = phi i32 [ 0, %1898 ], [ 1, %1899 ]
  %1905 = icmp ne i32 %1904, 0
  br i1 %1905, label %1907, label %1906

1906:                                             ; preds = %1903, %1878
  store i32 -2, i32* %9, align 4
  br label %3471

1907:                                             ; preds = %1903, %1878
  br label %1855

1908:                                             ; preds = %1855
  %1909 = load i32, i32* %31, align 4
  store i32 %1909, i32* %59, align 4
  br label %1910

1910:                                             ; preds = %1946, %1908
  %1911 = load i32, i32* %59, align 4
  %1912 = load i32, i32* %32, align 4
  %1913 = icmp ule i32 %1911, %1912
  br i1 %1913, label %1914, label %1949

1914:                                             ; preds = %1910
  %1915 = load i8**, i8*** %33, align 4
  %1916 = load i32, i32* %59, align 4
  %1917 = getelementptr inbounds i8*, i8** %1915, i32 %1916
  %1918 = load i8*, i8** %1917, align 4
  %1919 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1920 = load i8**, i8*** %1919, align 4
  %1921 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1922 = load i32, i32* %1921, align 4
  %1923 = add i32 %1922, 1
  store i32 %1923, i32* %1921, align 4
  %1924 = getelementptr inbounds i8*, i8** %1920, i32 %1922
  store i8* %1918, i8** %1924, align 4
  %1925 = load i8**, i8*** %34, align 4
  %1926 = load i32, i32* %59, align 4
  %1927 = getelementptr inbounds i8*, i8** %1925, i32 %1926
  %1928 = load i8*, i8** %1927, align 4
  %1929 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1930 = load i8**, i8*** %1929, align 4
  %1931 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1932 = load i32, i32* %1931, align 4
  %1933 = add i32 %1932, 1
  store i32 %1933, i32* %1931, align 4
  %1934 = getelementptr inbounds i8*, i8** %1930, i32 %1932
  store i8* %1928, i8** %1934, align 4
  %1935 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %1936 = load i32, i32* %59, align 4
  %1937 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %1935, i32 %1936
  %1938 = bitcast %union.register_info_type* %1937 to i8**
  %1939 = load i8*, i8** %1938, align 4
  %1940 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1941 = load i8**, i8*** %1940, align 4
  %1942 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1943 = load i32, i32* %1942, align 4
  %1944 = add i32 %1943, 1
  store i32 %1944, i32* %1942, align 4
  %1945 = getelementptr inbounds i8*, i8** %1941, i32 %1943
  store i8* %1939, i8** %1945, align 4
  br label %1946

1946:                                             ; preds = %1914
  %1947 = load i32, i32* %59, align 4
  %1948 = add nsw i32 %1947, 1
  store i32 %1948, i32* %59, align 4
  br label %1910

1949:                                             ; preds = %1910
  %1950 = load i32, i32* %31, align 4
  %1951 = inttoptr i32 %1950 to i8*
  %1952 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1953 = load i8**, i8*** %1952, align 4
  %1954 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1955 = load i32, i32* %1954, align 4
  %1956 = add i32 %1955, 1
  store i32 %1956, i32* %1954, align 4
  %1957 = getelementptr inbounds i8*, i8** %1953, i32 %1955
  store i8* %1951, i8** %1957, align 4
  %1958 = load i32, i32* %32, align 4
  %1959 = inttoptr i32 %1958 to i8*
  %1960 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1961 = load i8**, i8*** %1960, align 4
  %1962 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1963 = load i32, i32* %1962, align 4
  %1964 = add i32 %1963, 1
  store i32 %1964, i32* %1962, align 4
  %1965 = getelementptr inbounds i8*, i8** %1961, i32 %1963
  store i8* %1959, i8** %1965, align 4
  %1966 = load i8*, i8** %26, align 4
  %1967 = load i32, i32* %18, align 4
  %1968 = getelementptr inbounds i8, i8* %1966, i32 %1967
  %1969 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1970 = load i8**, i8*** %1969, align 4
  %1971 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1972 = load i32, i32* %1971, align 4
  %1973 = add i32 %1972, 1
  store i32 %1973, i32* %1971, align 4
  %1974 = getelementptr inbounds i8*, i8** %1970, i32 %1972
  store i8* %1968, i8** %1974, align 4
  %1975 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %1976 = load i8**, i8*** %1975, align 4
  %1977 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %1978 = load i32, i32* %1977, align 4
  %1979 = add i32 %1978, 1
  store i32 %1979, i32* %1977, align 4
  %1980 = getelementptr inbounds i8*, i8** %1976, i32 %1978
  store i8* null, i8** %1980, align 4
  br label %1981

1981:                                             ; preds = %1949
  br label %3315

1982:                                             ; preds = %748
  br label %1983

1983:                                             ; preds = %2736, %1982
  br label %1984

1984:                                             ; preds = %1983
  br label %1985

1985:                                             ; preds = %1984
  %1986 = load i8*, i8** %26, align 4
  %1987 = load i8, i8* %1986, align 1
  %1988 = zext i8 %1987 to i32
  %1989 = and i32 %1988, 255
  store i32 %1989, i32* %18, align 4
  %1990 = load i8*, i8** %26, align 4
  %1991 = getelementptr inbounds i8, i8* %1990, i32 1
  %1992 = load i8, i8* %1991, align 1
  %1993 = sext i8 %1992 to i32
  %1994 = shl i32 %1993, 8
  %1995 = load i32, i32* %18, align 4
  %1996 = add nsw i32 %1995, %1994
  store i32 %1996, i32* %18, align 4
  br label %1997

1997:                                             ; preds = %1985
  %1998 = load i8*, i8** %26, align 4
  %1999 = getelementptr inbounds i8, i8* %1998, i32 2
  store i8* %1999, i8** %26, align 4
  br label %2000

2000:                                             ; preds = %1997
  %2001 = load i8*, i8** %26, align 4
  store i8* %2001, i8** %19, align 4
  br label %2002

2002:                                             ; preds = %2013, %2000
  %2003 = load i8*, i8** %19, align 4
  %2004 = load i8*, i8** %27, align 4
  %2005 = icmp ult i8* %2003, %2004
  br i1 %2005, label %2006, label %2011

2006:                                             ; preds = %2002
  %2007 = load i8*, i8** %19, align 4
  %2008 = load i8, i8* %2007, align 1
  %2009 = zext i8 %2008 to i32
  %2010 = icmp eq i32 %2009, 0
  br label %2011

2011:                                             ; preds = %2006, %2002
  %2012 = phi i1 [ false, %2002 ], [ %2010, %2006 ]
  br i1 %2012, label %2013, label %2016

2013:                                             ; preds = %2011
  %2014 = load i8*, i8** %19, align 4
  %2015 = getelementptr inbounds i8, i8* %2014, i32 1
  store i8* %2015, i8** %19, align 4
  br label %2002

2016:                                             ; preds = %2011
  %2017 = load i8*, i8** %19, align 4
  %2018 = load i8*, i8** %27, align 4
  %2019 = icmp ult i8* %2017, %2018
  br i1 %2019, label %2020, label %2043

2020:                                             ; preds = %2016
  %2021 = load i8*, i8** %19, align 4
  %2022 = load i8, i8* %2021, align 1
  %2023 = zext i8 %2022 to i32
  %2024 = icmp eq i32 %2023, 5
  br i1 %2024, label %2025, label %2043

2025:                                             ; preds = %2020
  %2026 = load i8*, i8** %19, align 4
  %2027 = getelementptr inbounds i8, i8* %2026, i32 1
  %2028 = load i8, i8* %2027, align 1
  %2029 = zext i8 %2028 to i32
  %2030 = load i8*, i8** %19, align 4
  %2031 = getelementptr inbounds i8, i8* %2030, i32 2
  %2032 = load i8, i8* %2031, align 1
  %2033 = zext i8 %2032 to i32
  %2034 = add nsw i32 %2029, %2033
  store i32 %2034, i32* %32, align 4
  %2035 = load i32, i32* %31, align 4
  %2036 = icmp eq i32 %2035, 257
  br i1 %2036, label %2037, label %2042

2037:                                             ; preds = %2025
  %2038 = load i8*, i8** %19, align 4
  %2039 = getelementptr inbounds i8, i8* %2038, i32 1
  %2040 = load i8, i8* %2039, align 1
  %2041 = zext i8 %2040 to i32
  store i32 %2041, i32* %31, align 4
  br label %2042

2042:                                             ; preds = %2037, %2025
  br label %2043

2043:                                             ; preds = %2042, %2020, %2016
  br label %2044

2044:                                             ; preds = %2043
  br label %2045

2045:                                             ; preds = %2097, %2044
  %2046 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2047 = load i32, i32* %2046, align 4
  %2048 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2049 = load i32, i32* %2048, align 4
  %2050 = sub i32 %2047, %2049
  %2051 = load i32, i32* %32, align 4
  %2052 = load i32, i32* %31, align 4
  %2053 = sub i32 %2051, %2052
  %2054 = add i32 %2053, 1
  %2055 = mul i32 %2054, 3
  %2056 = add i32 %2055, 4
  %2057 = icmp ult i32 %2050, %2056
  br i1 %2057, label %2058, label %2098

2058:                                             ; preds = %2045
  %2059 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2060 = load i32, i32* %2059, align 4
  %2061 = load i32, i32* @re_max_failures, align 4
  %2062 = load i32, i32* %30, align 4
  %2063 = sub i32 %2062, 1
  %2064 = mul i32 %2063, 3
  %2065 = add i32 %2064, 4
  %2066 = mul i32 %2061, %2065
  %2067 = icmp ugt i32 %2060, %2066
  br i1 %2067, label %2068, label %2069

2068:                                             ; preds = %2058
  br i1 false, label %2097, label %2096

2069:                                             ; preds = %2058
  %2070 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2071 = load i32, i32* %2070, align 4
  %2072 = shl i32 %2071, 1
  %2073 = mul i32 %2072, 4
  %2074 = alloca i8, i32 %2073, align 16
  store i8* %2074, i8** %60, align 4
  %2075 = load i8*, i8** %60, align 4
  %2076 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2077 = load i8**, i8*** %2076, align 4
  %2078 = bitcast i8** %2077 to i8*
  %2079 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2080 = load i32, i32* %2079, align 4
  %2081 = mul i32 %2080, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %2075, i8* align 4 %2078, i32 %2081, i1 false)
  %2082 = load i8*, i8** %60, align 4
  %2083 = bitcast i8* %2082 to i8**
  %2084 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %2083, i8*** %2084, align 4
  %2085 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2086 = load i8**, i8*** %2085, align 4
  %2087 = icmp eq i8** %2086, null
  br i1 %2087, label %2088, label %2089

2088:                                             ; preds = %2069
  br label %2093

2089:                                             ; preds = %2069
  %2090 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2091 = load i32, i32* %2090, align 4
  %2092 = shl i32 %2091, 1
  store i32 %2092, i32* %2090, align 4
  br label %2093

2093:                                             ; preds = %2089, %2088
  %2094 = phi i32 [ 0, %2088 ], [ 1, %2089 ]
  %2095 = icmp ne i32 %2094, 0
  br i1 %2095, label %2097, label %2096

2096:                                             ; preds = %2093, %2068
  store i32 -2, i32* %9, align 4
  br label %3471

2097:                                             ; preds = %2093, %2068
  br label %2045

2098:                                             ; preds = %2045
  %2099 = load i32, i32* %31, align 4
  store i32 %2099, i32* %61, align 4
  br label %2100

2100:                                             ; preds = %2136, %2098
  %2101 = load i32, i32* %61, align 4
  %2102 = load i32, i32* %32, align 4
  %2103 = icmp ule i32 %2101, %2102
  br i1 %2103, label %2104, label %2139

2104:                                             ; preds = %2100
  %2105 = load i8**, i8*** %33, align 4
  %2106 = load i32, i32* %61, align 4
  %2107 = getelementptr inbounds i8*, i8** %2105, i32 %2106
  %2108 = load i8*, i8** %2107, align 4
  %2109 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2110 = load i8**, i8*** %2109, align 4
  %2111 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2112 = load i32, i32* %2111, align 4
  %2113 = add i32 %2112, 1
  store i32 %2113, i32* %2111, align 4
  %2114 = getelementptr inbounds i8*, i8** %2110, i32 %2112
  store i8* %2108, i8** %2114, align 4
  %2115 = load i8**, i8*** %34, align 4
  %2116 = load i32, i32* %61, align 4
  %2117 = getelementptr inbounds i8*, i8** %2115, i32 %2116
  %2118 = load i8*, i8** %2117, align 4
  %2119 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2120 = load i8**, i8*** %2119, align 4
  %2121 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2122 = load i32, i32* %2121, align 4
  %2123 = add i32 %2122, 1
  store i32 %2123, i32* %2121, align 4
  %2124 = getelementptr inbounds i8*, i8** %2120, i32 %2122
  store i8* %2118, i8** %2124, align 4
  %2125 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %2126 = load i32, i32* %61, align 4
  %2127 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %2125, i32 %2126
  %2128 = bitcast %union.register_info_type* %2127 to i8**
  %2129 = load i8*, i8** %2128, align 4
  %2130 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2131 = load i8**, i8*** %2130, align 4
  %2132 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2133 = load i32, i32* %2132, align 4
  %2134 = add i32 %2133, 1
  store i32 %2134, i32* %2132, align 4
  %2135 = getelementptr inbounds i8*, i8** %2131, i32 %2133
  store i8* %2129, i8** %2135, align 4
  br label %2136

2136:                                             ; preds = %2104
  %2137 = load i32, i32* %61, align 4
  %2138 = add nsw i32 %2137, 1
  store i32 %2138, i32* %61, align 4
  br label %2100

2139:                                             ; preds = %2100
  %2140 = load i32, i32* %31, align 4
  %2141 = inttoptr i32 %2140 to i8*
  %2142 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2143 = load i8**, i8*** %2142, align 4
  %2144 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2145 = load i32, i32* %2144, align 4
  %2146 = add i32 %2145, 1
  store i32 %2146, i32* %2144, align 4
  %2147 = getelementptr inbounds i8*, i8** %2143, i32 %2145
  store i8* %2141, i8** %2147, align 4
  %2148 = load i32, i32* %32, align 4
  %2149 = inttoptr i32 %2148 to i8*
  %2150 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2151 = load i8**, i8*** %2150, align 4
  %2152 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2153 = load i32, i32* %2152, align 4
  %2154 = add i32 %2153, 1
  store i32 %2154, i32* %2152, align 4
  %2155 = getelementptr inbounds i8*, i8** %2151, i32 %2153
  store i8* %2149, i8** %2155, align 4
  %2156 = load i8*, i8** %26, align 4
  %2157 = load i32, i32* %18, align 4
  %2158 = getelementptr inbounds i8, i8* %2156, i32 %2157
  %2159 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2160 = load i8**, i8*** %2159, align 4
  %2161 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2162 = load i32, i32* %2161, align 4
  %2163 = add i32 %2162, 1
  store i32 %2163, i32* %2161, align 4
  %2164 = getelementptr inbounds i8*, i8** %2160, i32 %2162
  store i8* %2158, i8** %2164, align 4
  %2165 = load i8*, i8** %24, align 4
  %2166 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2167 = load i8**, i8*** %2166, align 4
  %2168 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2169 = load i32, i32* %2168, align 4
  %2170 = add i32 %2169, 1
  store i32 %2170, i32* %2168, align 4
  %2171 = getelementptr inbounds i8*, i8** %2167, i32 %2169
  store i8* %2165, i8** %2171, align 4
  br label %2172

2172:                                             ; preds = %2139
  br label %3315

2173:                                             ; preds = %748
  br label %2174

2174:                                             ; preds = %2173
  br label %2175

2175:                                             ; preds = %2174
  %2176 = load i8*, i8** %26, align 4
  %2177 = load i8, i8* %2176, align 1
  %2178 = zext i8 %2177 to i32
  %2179 = and i32 %2178, 255
  store i32 %2179, i32* %18, align 4
  %2180 = load i8*, i8** %26, align 4
  %2181 = getelementptr inbounds i8, i8* %2180, i32 1
  %2182 = load i8, i8* %2181, align 1
  %2183 = sext i8 %2182 to i32
  %2184 = shl i32 %2183, 8
  %2185 = load i32, i32* %18, align 4
  %2186 = add nsw i32 %2185, %2184
  store i32 %2186, i32* %18, align 4
  br label %2187

2187:                                             ; preds = %2175
  %2188 = load i8*, i8** %26, align 4
  %2189 = getelementptr inbounds i8, i8* %2188, i32 2
  store i8* %2189, i8** %26, align 4
  br label %2190

2190:                                             ; preds = %2187
  %2191 = load i8*, i8** %26, align 4
  store i8* %2191, i8** %62, align 4
  br label %2192

2192:                                             ; preds = %2211, %2190
  %2193 = load i8*, i8** %62, align 4
  %2194 = getelementptr inbounds i8, i8* %2193, i32 2
  %2195 = load i8*, i8** %27, align 4
  %2196 = icmp ult i8* %2194, %2195
  br i1 %2196, label %2197, label %2209

2197:                                             ; preds = %2192
  %2198 = load i8*, i8** %62, align 4
  %2199 = load i8, i8* %2198, align 1
  %2200 = zext i8 %2199 to i32
  %2201 = icmp eq i32 %2200, 6
  br i1 %2201, label %2207, label %2202

2202:                                             ; preds = %2197
  %2203 = load i8*, i8** %62, align 4
  %2204 = load i8, i8* %2203, align 1
  %2205 = zext i8 %2204 to i32
  %2206 = icmp eq i32 %2205, 5
  br label %2207

2207:                                             ; preds = %2202, %2197
  %2208 = phi i1 [ true, %2197 ], [ %2206, %2202 ]
  br label %2209

2209:                                             ; preds = %2207, %2192
  %2210 = phi i1 [ false, %2192 ], [ %2208, %2207 ]
  br i1 %2210, label %2211, label %2214

2211:                                             ; preds = %2209
  %2212 = load i8*, i8** %62, align 4
  %2213 = getelementptr inbounds i8, i8* %2212, i32 3
  store i8* %2213, i8** %62, align 4
  br label %2192

2214:                                             ; preds = %2209
  %2215 = load i8*, i8** %62, align 4
  %2216 = load i8*, i8** %27, align 4
  %2217 = icmp eq i8* %2215, %2216
  br i1 %2217, label %2218, label %2221

2218:                                             ; preds = %2214
  %2219 = load i8*, i8** %26, align 4
  %2220 = getelementptr inbounds i8, i8* %2219, i32 -3
  store i8 16, i8* %2220, align 1
  br label %2330

2221:                                             ; preds = %2214
  %2222 = load i8*, i8** %62, align 4
  %2223 = load i8, i8* %2222, align 1
  %2224 = zext i8 %2223 to i32
  %2225 = icmp eq i32 %2224, 1
  br i1 %2225, label %2238, label %2226

2226:                                             ; preds = %2221
  %2227 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %10, align 4
  %2228 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2227, i32 0, i32 7
  %2229 = load i8, i8* %2228, align 4
  %2230 = lshr i8 %2229, 7
  %2231 = zext i8 %2230 to i32
  %2232 = icmp ne i32 %2231, 0
  br i1 %2232, label %2233, label %2329

2233:                                             ; preds = %2226
  %2234 = load i8*, i8** %62, align 4
  %2235 = load i8, i8* %2234, align 1
  %2236 = zext i8 %2235 to i32
  %2237 = icmp eq i32 %2236, 9
  br i1 %2237, label %2238, label %2329

2238:                                             ; preds = %2233, %2221
  %2239 = load i8*, i8** %62, align 4
  %2240 = load i8, i8* %2239, align 1
  %2241 = zext i8 %2240 to i32
  %2242 = icmp eq i32 %2241, 9
  br i1 %2242, label %2243, label %2244

2243:                                             ; preds = %2238
  br label %2249

2244:                                             ; preds = %2238
  %2245 = load i8*, i8** %62, align 4
  %2246 = getelementptr inbounds i8, i8* %2245, i32 2
  %2247 = load i8, i8* %2246, align 1
  %2248 = zext i8 %2247 to i32
  br label %2249

2249:                                             ; preds = %2244, %2243
  %2250 = phi i32 [ 10, %2243 ], [ %2248, %2244 ]
  %2251 = trunc i32 %2250 to i8
  store i8 %2251, i8* %63, align 1
  %2252 = load i8*, i8** %26, align 4
  %2253 = load i32, i32* %18, align 4
  %2254 = getelementptr inbounds i8, i8* %2252, i32 %2253
  store i8* %2254, i8** %19, align 4
  %2255 = load i8*, i8** %19, align 4
  %2256 = getelementptr inbounds i8, i8* %2255, i32 3
  %2257 = load i8, i8* %2256, align 1
  %2258 = zext i8 %2257 to i32
  %2259 = icmp eq i32 %2258, 1
  br i1 %2259, label %2260, label %2271

2260:                                             ; preds = %2249
  %2261 = load i8*, i8** %19, align 4
  %2262 = getelementptr inbounds i8, i8* %2261, i32 5
  %2263 = load i8, i8* %2262, align 1
  %2264 = zext i8 %2263 to i32
  %2265 = load i8, i8* %63, align 1
  %2266 = zext i8 %2265 to i32
  %2267 = icmp ne i32 %2264, %2266
  br i1 %2267, label %2268, label %2271

2268:                                             ; preds = %2260
  %2269 = load i8*, i8** %26, align 4
  %2270 = getelementptr inbounds i8, i8* %2269, i32 -3
  store i8 16, i8* %2270, align 1
  br label %2328

2271:                                             ; preds = %2260, %2249
  %2272 = load i8*, i8** %19, align 4
  %2273 = getelementptr inbounds i8, i8* %2272, i32 3
  %2274 = load i8, i8* %2273, align 1
  %2275 = zext i8 %2274 to i32
  %2276 = icmp eq i32 %2275, 3
  br i1 %2276, label %2283, label %2277

2277:                                             ; preds = %2271
  %2278 = load i8*, i8** %19, align 4
  %2279 = getelementptr inbounds i8, i8* %2278, i32 3
  %2280 = load i8, i8* %2279, align 1
  %2281 = zext i8 %2280 to i32
  %2282 = icmp eq i32 %2281, 4
  br i1 %2282, label %2283, label %2327

2283:                                             ; preds = %2277, %2271
  %2284 = load i8*, i8** %19, align 4
  %2285 = getelementptr inbounds i8, i8* %2284, i32 3
  %2286 = load i8, i8* %2285, align 1
  %2287 = zext i8 %2286 to i32
  %2288 = icmp eq i32 %2287, 4
  %2289 = zext i1 %2288 to i32
  store i32 %2289, i32* %64, align 4
  %2290 = load i8, i8* %63, align 1
  %2291 = zext i8 %2290 to i32
  %2292 = load i8*, i8** %19, align 4
  %2293 = getelementptr inbounds i8, i8* %2292, i32 4
  %2294 = load i8, i8* %2293, align 1
  %2295 = zext i8 %2294 to i32
  %2296 = mul nsw i32 %2295, 8
  %2297 = trunc i32 %2296 to i8
  %2298 = zext i8 %2297 to i32
  %2299 = icmp slt i32 %2291, %2298
  br i1 %2299, label %2300, label %2320

2300:                                             ; preds = %2283
  %2301 = load i8*, i8** %19, align 4
  %2302 = load i8, i8* %63, align 1
  %2303 = zext i8 %2302 to i32
  %2304 = sdiv i32 %2303, 8
  %2305 = add nsw i32 5, %2304
  %2306 = getelementptr inbounds i8, i8* %2301, i32 %2305
  %2307 = load i8, i8* %2306, align 1
  %2308 = zext i8 %2307 to i32
  %2309 = load i8, i8* %63, align 1
  %2310 = zext i8 %2309 to i32
  %2311 = srem i32 %2310, 8
  %2312 = shl i32 1, %2311
  %2313 = and i32 %2308, %2312
  %2314 = icmp ne i32 %2313, 0
  br i1 %2314, label %2315, label %2320

2315:                                             ; preds = %2300
  %2316 = load i32, i32* %64, align 4
  %2317 = icmp ne i32 %2316, 0
  %2318 = xor i1 %2317, true
  %2319 = zext i1 %2318 to i32
  store i32 %2319, i32* %64, align 4
  br label %2320

2320:                                             ; preds = %2315, %2300, %2283
  %2321 = load i32, i32* %64, align 4
  %2322 = icmp ne i32 %2321, 0
  br i1 %2322, label %2326, label %2323

2323:                                             ; preds = %2320
  %2324 = load i8*, i8** %26, align 4
  %2325 = getelementptr inbounds i8, i8* %2324, i32 -3
  store i8 16, i8* %2325, align 1
  br label %2326

2326:                                             ; preds = %2323, %2320
  br label %2327

2327:                                             ; preds = %2326, %2277
  br label %2328

2328:                                             ; preds = %2327, %2268
  br label %2329

2329:                                             ; preds = %2328, %2233, %2226
  br label %2330

2330:                                             ; preds = %2329, %2218
  %2331 = load i8*, i8** %26, align 4
  %2332 = getelementptr inbounds i8, i8* %2331, i32 -2
  store i8* %2332, i8** %26, align 4
  %2333 = load i8*, i8** %26, align 4
  %2334 = getelementptr inbounds i8, i8* %2333, i32 -1
  %2335 = load i8, i8* %2334, align 1
  %2336 = zext i8 %2335 to i32
  %2337 = icmp ne i32 %2336, 16
  br i1 %2337, label %2338, label %2341

2338:                                             ; preds = %2330
  %2339 = load i8*, i8** %26, align 4
  %2340 = getelementptr inbounds i8, i8* %2339, i32 -1
  store i8 12, i8* %2340, align 1
  br label %2420

2341:                                             ; preds = %2330
  br label %2342

2342:                                             ; preds = %748, %2341
  %2343 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2344 = load i8**, i8*** %2343, align 4
  %2345 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2346 = load i32, i32* %2345, align 4
  %2347 = add i32 %2346, -1
  store i32 %2347, i32* %2345, align 4
  %2348 = getelementptr inbounds i8*, i8** %2344, i32 %2347
  %2349 = load i8*, i8** %2348, align 4
  store i8* %2349, i8** %70, align 4
  %2350 = load i8*, i8** %70, align 4
  %2351 = icmp ne i8* %2350, null
  br i1 %2351, label %2352, label %2354

2352:                                             ; preds = %2342
  %2353 = load i8*, i8** %70, align 4
  store i8* %2353, i8** %68, align 4
  br label %2354

2354:                                             ; preds = %2352, %2342
  %2355 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2356 = load i8**, i8*** %2355, align 4
  %2357 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2358 = load i32, i32* %2357, align 4
  %2359 = add i32 %2358, -1
  store i32 %2359, i32* %2357, align 4
  %2360 = getelementptr inbounds i8*, i8** %2356, i32 %2359
  %2361 = load i8*, i8** %2360, align 4
  store i8* %2361, i8** %67, align 4
  %2362 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2363 = load i8**, i8*** %2362, align 4
  %2364 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2365 = load i32, i32* %2364, align 4
  %2366 = add i32 %2365, -1
  store i32 %2366, i32* %2364, align 4
  %2367 = getelementptr inbounds i8*, i8** %2363, i32 %2366
  %2368 = load i8*, i8** %2367, align 4
  %2369 = ptrtoint i8* %2368 to i32
  store i32 %2369, i32* %66, align 4
  %2370 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2371 = load i8**, i8*** %2370, align 4
  %2372 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2373 = load i32, i32* %2372, align 4
  %2374 = add i32 %2373, -1
  store i32 %2374, i32* %2372, align 4
  %2375 = getelementptr inbounds i8*, i8** %2371, i32 %2374
  %2376 = load i8*, i8** %2375, align 4
  %2377 = ptrtoint i8* %2376 to i32
  store i32 %2377, i32* %65, align 4
  %2378 = load i32, i32* %66, align 4
  store i32 %2378, i32* %69, align 4
  br label %2379

2379:                                             ; preds = %2415, %2354
  %2380 = load i32, i32* %69, align 4
  %2381 = load i32, i32* %65, align 4
  %2382 = icmp uge i32 %2380, %2381
  br i1 %2382, label %2383, label %2418

2383:                                             ; preds = %2379
  %2384 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2385 = load i8**, i8*** %2384, align 4
  %2386 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2387 = load i32, i32* %2386, align 4
  %2388 = add i32 %2387, -1
  store i32 %2388, i32* %2386, align 4
  %2389 = getelementptr inbounds i8*, i8** %2385, i32 %2388
  %2390 = load i8*, i8** %2389, align 4
  %2391 = load %union.register_info_type*, %union.register_info_type** %43, align 4
  %2392 = load i32, i32* %69, align 4
  %2393 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %2391, i32 %2392
  %2394 = bitcast %union.register_info_type* %2393 to i8**
  store i8* %2390, i8** %2394, align 4
  %2395 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2396 = load i8**, i8*** %2395, align 4
  %2397 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2398 = load i32, i32* %2397, align 4
  %2399 = add i32 %2398, -1
  store i32 %2399, i32* %2397, align 4
  %2400 = getelementptr inbounds i8*, i8** %2396, i32 %2399
  %2401 = load i8*, i8** %2400, align 4
  %2402 = load i8**, i8*** %42, align 4
  %2403 = load i32, i32* %69, align 4
  %2404 = getelementptr inbounds i8*, i8** %2402, i32 %2403
  store i8* %2401, i8** %2404, align 4
  %2405 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2406 = load i8**, i8*** %2405, align 4
  %2407 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2408 = load i32, i32* %2407, align 4
  %2409 = add i32 %2408, -1
  store i32 %2409, i32* %2407, align 4
  %2410 = getelementptr inbounds i8*, i8** %2406, i32 %2409
  %2411 = load i8*, i8** %2410, align 4
  %2412 = load i8**, i8*** %42, align 4
  %2413 = load i32, i32* %69, align 4
  %2414 = getelementptr inbounds i8*, i8** %2412, i32 %2413
  store i8* %2411, i8** %2414, align 4
  br label %2415

2415:                                             ; preds = %2383
  %2416 = load i32, i32* %69, align 4
  %2417 = add nsw i32 %2416, -1
  store i32 %2417, i32* %69, align 4
  br label %2379

2418:                                             ; preds = %2379
  br label %2419

2419:                                             ; preds = %748, %2418
  br label %2420

2420:                                             ; preds = %2777, %2567, %2441, %2419, %2338
  br label %2421

2421:                                             ; preds = %2420
  br label %2422

2422:                                             ; preds = %2421
  %2423 = load i8*, i8** %26, align 4
  %2424 = load i8, i8* %2423, align 1
  %2425 = zext i8 %2424 to i32
  %2426 = and i32 %2425, 255
  store i32 %2426, i32* %18, align 4
  %2427 = load i8*, i8** %26, align 4
  %2428 = getelementptr inbounds i8, i8* %2427, i32 1
  %2429 = load i8, i8* %2428, align 1
  %2430 = sext i8 %2429 to i32
  %2431 = shl i32 %2430, 8
  %2432 = load i32, i32* %18, align 4
  %2433 = add nsw i32 %2432, %2431
  store i32 %2433, i32* %18, align 4
  br label %2434

2434:                                             ; preds = %2422
  %2435 = load i8*, i8** %26, align 4
  %2436 = getelementptr inbounds i8, i8* %2435, i32 2
  store i8* %2436, i8** %26, align 4
  br label %2437

2437:                                             ; preds = %2434
  %2438 = load i32, i32* %18, align 4
  %2439 = load i8*, i8** %26, align 4
  %2440 = getelementptr inbounds i8, i8* %2439, i32 %2438
  store i8* %2440, i8** %26, align 4
  br label %3315

2441:                                             ; preds = %748
  br label %2420

2442:                                             ; preds = %748
  br label %2443

2443:                                             ; preds = %2442
  br label %2444

2444:                                             ; preds = %2496, %2443
  %2445 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2446 = load i32, i32* %2445, align 4
  %2447 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2448 = load i32, i32* %2447, align 4
  %2449 = sub i32 %2446, %2448
  %2450 = load i32, i32* %32, align 4
  %2451 = load i32, i32* %31, align 4
  %2452 = sub i32 %2450, %2451
  %2453 = add i32 %2452, 1
  %2454 = mul i32 %2453, 3
  %2455 = add i32 %2454, 4
  %2456 = icmp ult i32 %2449, %2455
  br i1 %2456, label %2457, label %2497

2457:                                             ; preds = %2444
  %2458 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2459 = load i32, i32* %2458, align 4
  %2460 = load i32, i32* @re_max_failures, align 4
  %2461 = load i32, i32* %30, align 4
  %2462 = sub i32 %2461, 1
  %2463 = mul i32 %2462, 3
  %2464 = add i32 %2463, 4
  %2465 = mul i32 %2460, %2464
  %2466 = icmp ugt i32 %2459, %2465
  br i1 %2466, label %2467, label %2468

2467:                                             ; preds = %2457
  br i1 false, label %2496, label %2495

2468:                                             ; preds = %2457
  %2469 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2470 = load i32, i32* %2469, align 4
  %2471 = shl i32 %2470, 1
  %2472 = mul i32 %2471, 4
  %2473 = alloca i8, i32 %2472, align 16
  store i8* %2473, i8** %71, align 4
  %2474 = load i8*, i8** %71, align 4
  %2475 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2476 = load i8**, i8*** %2475, align 4
  %2477 = bitcast i8** %2476 to i8*
  %2478 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2479 = load i32, i32* %2478, align 4
  %2480 = mul i32 %2479, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %2474, i8* align 4 %2477, i32 %2480, i1 false)
  %2481 = load i8*, i8** %71, align 4
  %2482 = bitcast i8* %2481 to i8**
  %2483 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %2482, i8*** %2483, align 4
  %2484 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2485 = load i8**, i8*** %2484, align 4
  %2486 = icmp eq i8** %2485, null
  br i1 %2486, label %2487, label %2488

2487:                                             ; preds = %2468
  br label %2492

2488:                                             ; preds = %2468
  %2489 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2490 = load i32, i32* %2489, align 4
  %2491 = shl i32 %2490, 1
  store i32 %2491, i32* %2489, align 4
  br label %2492

2492:                                             ; preds = %2488, %2487
  %2493 = phi i32 [ 0, %2487 ], [ 1, %2488 ]
  %2494 = icmp ne i32 %2493, 0
  br i1 %2494, label %2496, label %2495

2495:                                             ; preds = %2492, %2467
  store i32 -2, i32* %9, align 4
  br label %3471

2496:                                             ; preds = %2492, %2467
  br label %2444

2497:                                             ; preds = %2444
  %2498 = load i32, i32* %31, align 4
  store i32 %2498, i32* %72, align 4
  br label %2499

2499:                                             ; preds = %2535, %2497
  %2500 = load i32, i32* %72, align 4
  %2501 = load i32, i32* %32, align 4
  %2502 = icmp ule i32 %2500, %2501
  br i1 %2502, label %2503, label %2538

2503:                                             ; preds = %2499
  %2504 = load i8**, i8*** %33, align 4
  %2505 = load i32, i32* %72, align 4
  %2506 = getelementptr inbounds i8*, i8** %2504, i32 %2505
  %2507 = load i8*, i8** %2506, align 4
  %2508 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2509 = load i8**, i8*** %2508, align 4
  %2510 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2511 = load i32, i32* %2510, align 4
  %2512 = add i32 %2511, 1
  store i32 %2512, i32* %2510, align 4
  %2513 = getelementptr inbounds i8*, i8** %2509, i32 %2511
  store i8* %2507, i8** %2513, align 4
  %2514 = load i8**, i8*** %34, align 4
  %2515 = load i32, i32* %72, align 4
  %2516 = getelementptr inbounds i8*, i8** %2514, i32 %2515
  %2517 = load i8*, i8** %2516, align 4
  %2518 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2519 = load i8**, i8*** %2518, align 4
  %2520 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2521 = load i32, i32* %2520, align 4
  %2522 = add i32 %2521, 1
  store i32 %2522, i32* %2520, align 4
  %2523 = getelementptr inbounds i8*, i8** %2519, i32 %2521
  store i8* %2517, i8** %2523, align 4
  %2524 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %2525 = load i32, i32* %72, align 4
  %2526 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %2524, i32 %2525
  %2527 = bitcast %union.register_info_type* %2526 to i8**
  %2528 = load i8*, i8** %2527, align 4
  %2529 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2530 = load i8**, i8*** %2529, align 4
  %2531 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2532 = load i32, i32* %2531, align 4
  %2533 = add i32 %2532, 1
  store i32 %2533, i32* %2531, align 4
  %2534 = getelementptr inbounds i8*, i8** %2530, i32 %2532
  store i8* %2528, i8** %2534, align 4
  br label %2535

2535:                                             ; preds = %2503
  %2536 = load i32, i32* %72, align 4
  %2537 = add nsw i32 %2536, 1
  store i32 %2537, i32* %72, align 4
  br label %2499

2538:                                             ; preds = %2499
  %2539 = load i32, i32* %31, align 4
  %2540 = inttoptr i32 %2539 to i8*
  %2541 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2542 = load i8**, i8*** %2541, align 4
  %2543 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2544 = load i32, i32* %2543, align 4
  %2545 = add i32 %2544, 1
  store i32 %2545, i32* %2543, align 4
  %2546 = getelementptr inbounds i8*, i8** %2542, i32 %2544
  store i8* %2540, i8** %2546, align 4
  %2547 = load i32, i32* %32, align 4
  %2548 = inttoptr i32 %2547 to i8*
  %2549 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2550 = load i8**, i8*** %2549, align 4
  %2551 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2552 = load i32, i32* %2551, align 4
  %2553 = add i32 %2552, 1
  store i32 %2553, i32* %2551, align 4
  %2554 = getelementptr inbounds i8*, i8** %2550, i32 %2552
  store i8* %2548, i8** %2554, align 4
  %2555 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2556 = load i8**, i8*** %2555, align 4
  %2557 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2558 = load i32, i32* %2557, align 4
  %2559 = add i32 %2558, 1
  store i32 %2559, i32* %2557, align 4
  %2560 = getelementptr inbounds i8*, i8** %2556, i32 %2558
  store i8* null, i8** %2560, align 4
  %2561 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2562 = load i8**, i8*** %2561, align 4
  %2563 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2564 = load i32, i32* %2563, align 4
  %2565 = add i32 %2564, 1
  store i32 %2565, i32* %2563, align 4
  %2566 = getelementptr inbounds i8*, i8** %2562, i32 %2564
  store i8* null, i8** %2566, align 4
  br label %2567

2567:                                             ; preds = %2538
  br label %2420

2568:                                             ; preds = %748
  br label %2569

2569:                                             ; preds = %2568
  br label %2570

2570:                                             ; preds = %2622, %2569
  %2571 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2572 = load i32, i32* %2571, align 4
  %2573 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2574 = load i32, i32* %2573, align 4
  %2575 = sub i32 %2572, %2574
  %2576 = load i32, i32* %32, align 4
  %2577 = load i32, i32* %31, align 4
  %2578 = sub i32 %2576, %2577
  %2579 = add i32 %2578, 1
  %2580 = mul i32 %2579, 3
  %2581 = add i32 %2580, 4
  %2582 = icmp ult i32 %2575, %2581
  br i1 %2582, label %2583, label %2623

2583:                                             ; preds = %2570
  %2584 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2585 = load i32, i32* %2584, align 4
  %2586 = load i32, i32* @re_max_failures, align 4
  %2587 = load i32, i32* %30, align 4
  %2588 = sub i32 %2587, 1
  %2589 = mul i32 %2588, 3
  %2590 = add i32 %2589, 4
  %2591 = mul i32 %2586, %2590
  %2592 = icmp ugt i32 %2585, %2591
  br i1 %2592, label %2593, label %2594

2593:                                             ; preds = %2583
  br i1 false, label %2622, label %2621

2594:                                             ; preds = %2583
  %2595 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2596 = load i32, i32* %2595, align 4
  %2597 = shl i32 %2596, 1
  %2598 = mul i32 %2597, 4
  %2599 = alloca i8, i32 %2598, align 16
  store i8* %2599, i8** %73, align 4
  %2600 = load i8*, i8** %73, align 4
  %2601 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2602 = load i8**, i8*** %2601, align 4
  %2603 = bitcast i8** %2602 to i8*
  %2604 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2605 = load i32, i32* %2604, align 4
  %2606 = mul i32 %2605, 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %2600, i8* align 4 %2603, i32 %2606, i1 false)
  %2607 = load i8*, i8** %73, align 4
  %2608 = bitcast i8* %2607 to i8**
  %2609 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  store i8** %2608, i8*** %2609, align 4
  %2610 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2611 = load i8**, i8*** %2610, align 4
  %2612 = icmp eq i8** %2611, null
  br i1 %2612, label %2613, label %2614

2613:                                             ; preds = %2594
  br label %2618

2614:                                             ; preds = %2594
  %2615 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 1
  %2616 = load i32, i32* %2615, align 4
  %2617 = shl i32 %2616, 1
  store i32 %2617, i32* %2615, align 4
  br label %2618

2618:                                             ; preds = %2614, %2613
  %2619 = phi i32 [ 0, %2613 ], [ 1, %2614 ]
  %2620 = icmp ne i32 %2619, 0
  br i1 %2620, label %2622, label %2621

2621:                                             ; preds = %2618, %2593
  store i32 -2, i32* %9, align 4
  br label %3471

2622:                                             ; preds = %2618, %2593
  br label %2570

2623:                                             ; preds = %2570
  %2624 = load i32, i32* %31, align 4
  store i32 %2624, i32* %74, align 4
  br label %2625

2625:                                             ; preds = %2661, %2623
  %2626 = load i32, i32* %74, align 4
  %2627 = load i32, i32* %32, align 4
  %2628 = icmp ule i32 %2626, %2627
  br i1 %2628, label %2629, label %2664

2629:                                             ; preds = %2625
  %2630 = load i8**, i8*** %33, align 4
  %2631 = load i32, i32* %74, align 4
  %2632 = getelementptr inbounds i8*, i8** %2630, i32 %2631
  %2633 = load i8*, i8** %2632, align 4
  %2634 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2635 = load i8**, i8*** %2634, align 4
  %2636 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2637 = load i32, i32* %2636, align 4
  %2638 = add i32 %2637, 1
  store i32 %2638, i32* %2636, align 4
  %2639 = getelementptr inbounds i8*, i8** %2635, i32 %2637
  store i8* %2633, i8** %2639, align 4
  %2640 = load i8**, i8*** %34, align 4
  %2641 = load i32, i32* %74, align 4
  %2642 = getelementptr inbounds i8*, i8** %2640, i32 %2641
  %2643 = load i8*, i8** %2642, align 4
  %2644 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2645 = load i8**, i8*** %2644, align 4
  %2646 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2647 = load i32, i32* %2646, align 4
  %2648 = add i32 %2647, 1
  store i32 %2648, i32* %2646, align 4
  %2649 = getelementptr inbounds i8*, i8** %2645, i32 %2647
  store i8* %2643, i8** %2649, align 4
  %2650 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %2651 = load i32, i32* %74, align 4
  %2652 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %2650, i32 %2651
  %2653 = bitcast %union.register_info_type* %2652 to i8**
  %2654 = load i8*, i8** %2653, align 4
  %2655 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2656 = load i8**, i8*** %2655, align 4
  %2657 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2658 = load i32, i32* %2657, align 4
  %2659 = add i32 %2658, 1
  store i32 %2659, i32* %2657, align 4
  %2660 = getelementptr inbounds i8*, i8** %2656, i32 %2658
  store i8* %2654, i8** %2660, align 4
  br label %2661

2661:                                             ; preds = %2629
  %2662 = load i32, i32* %74, align 4
  %2663 = add nsw i32 %2662, 1
  store i32 %2663, i32* %74, align 4
  br label %2625

2664:                                             ; preds = %2625
  %2665 = load i32, i32* %31, align 4
  %2666 = inttoptr i32 %2665 to i8*
  %2667 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2668 = load i8**, i8*** %2667, align 4
  %2669 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2670 = load i32, i32* %2669, align 4
  %2671 = add i32 %2670, 1
  store i32 %2671, i32* %2669, align 4
  %2672 = getelementptr inbounds i8*, i8** %2668, i32 %2670
  store i8* %2666, i8** %2672, align 4
  %2673 = load i32, i32* %32, align 4
  %2674 = inttoptr i32 %2673 to i8*
  %2675 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2676 = load i8**, i8*** %2675, align 4
  %2677 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2678 = load i32, i32* %2677, align 4
  %2679 = add i32 %2678, 1
  store i32 %2679, i32* %2677, align 4
  %2680 = getelementptr inbounds i8*, i8** %2676, i32 %2678
  store i8* %2674, i8** %2680, align 4
  %2681 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2682 = load i8**, i8*** %2681, align 4
  %2683 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2684 = load i32, i32* %2683, align 4
  %2685 = add i32 %2684, 1
  store i32 %2685, i32* %2683, align 4
  %2686 = getelementptr inbounds i8*, i8** %2682, i32 %2684
  store i8* null, i8** %2686, align 4
  %2687 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %2688 = load i8**, i8*** %2687, align 4
  %2689 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %2690 = load i32, i32* %2689, align 4
  %2691 = add i32 %2690, 1
  store i32 %2691, i32* %2689, align 4
  %2692 = getelementptr inbounds i8*, i8** %2688, i32 %2690
  store i8* null, i8** %2692, align 4
  br label %2693

2693:                                             ; preds = %2664
  br label %3315

2694:                                             ; preds = %748
  br label %2695

2695:                                             ; preds = %2694
  %2696 = load i8*, i8** %26, align 4
  %2697 = getelementptr inbounds i8, i8* %2696, i32 2
  %2698 = load i8, i8* %2697, align 1
  %2699 = zext i8 %2698 to i32
  %2700 = and i32 %2699, 255
  store i32 %2700, i32* %18, align 4
  %2701 = load i8*, i8** %26, align 4
  %2702 = getelementptr inbounds i8, i8* %2701, i32 2
  %2703 = getelementptr inbounds i8, i8* %2702, i32 1
  %2704 = load i8, i8* %2703, align 1
  %2705 = sext i8 %2704 to i32
  %2706 = shl i32 %2705, 8
  %2707 = load i32, i32* %18, align 4
  %2708 = add nsw i32 %2707, %2706
  store i32 %2708, i32* %18, align 4
  br label %2709

2709:                                             ; preds = %2695
  %2710 = load i32, i32* %18, align 4
  %2711 = icmp sgt i32 %2710, 0
  br i1 %2711, label %2712, label %2733

2712:                                             ; preds = %2709
  %2713 = load i32, i32* %18, align 4
  %2714 = add nsw i32 %2713, -1
  store i32 %2714, i32* %18, align 4
  %2715 = load i8*, i8** %26, align 4
  %2716 = getelementptr inbounds i8, i8* %2715, i32 2
  store i8* %2716, i8** %26, align 4
  br label %2717

2717:                                             ; preds = %2712
  br label %2718

2718:                                             ; preds = %2717
  %2719 = load i32, i32* %18, align 4
  %2720 = and i32 %2719, 255
  %2721 = trunc i32 %2720 to i8
  %2722 = load i8*, i8** %26, align 4
  %2723 = getelementptr inbounds i8, i8* %2722, i32 0
  store i8 %2721, i8* %2723, align 1
  %2724 = load i32, i32* %18, align 4
  %2725 = ashr i32 %2724, 8
  %2726 = trunc i32 %2725 to i8
  %2727 = load i8*, i8** %26, align 4
  %2728 = getelementptr inbounds i8, i8* %2727, i32 1
  store i8 %2726, i8* %2728, align 1
  br label %2729

2729:                                             ; preds = %2718
  %2730 = load i8*, i8** %26, align 4
  %2731 = getelementptr inbounds i8, i8* %2730, i32 2
  store i8* %2731, i8** %26, align 4
  br label %2732

2732:                                             ; preds = %2729
  br label %2742

2733:                                             ; preds = %2709
  %2734 = load i32, i32* %18, align 4
  %2735 = icmp eq i32 %2734, 0
  br i1 %2735, label %2736, label %2741

2736:                                             ; preds = %2733
  %2737 = load i8*, i8** %26, align 4
  %2738 = getelementptr inbounds i8, i8* %2737, i32 2
  store i8 0, i8* %2738, align 1
  %2739 = load i8*, i8** %26, align 4
  %2740 = getelementptr inbounds i8, i8* %2739, i32 3
  store i8 0, i8* %2740, align 1
  br label %1983

2741:                                             ; preds = %2733
  br label %2742

2742:                                             ; preds = %2741, %2732
  br label %3315

2743:                                             ; preds = %748
  br label %2744

2744:                                             ; preds = %2743
  %2745 = load i8*, i8** %26, align 4
  %2746 = getelementptr inbounds i8, i8* %2745, i32 2
  %2747 = load i8, i8* %2746, align 1
  %2748 = zext i8 %2747 to i32
  %2749 = and i32 %2748, 255
  store i32 %2749, i32* %18, align 4
  %2750 = load i8*, i8** %26, align 4
  %2751 = getelementptr inbounds i8, i8* %2750, i32 2
  %2752 = getelementptr inbounds i8, i8* %2751, i32 1
  %2753 = load i8, i8* %2752, align 1
  %2754 = sext i8 %2753 to i32
  %2755 = shl i32 %2754, 8
  %2756 = load i32, i32* %18, align 4
  %2757 = add nsw i32 %2756, %2755
  store i32 %2757, i32* %18, align 4
  br label %2758

2758:                                             ; preds = %2744
  %2759 = load i32, i32* %18, align 4
  %2760 = icmp ne i32 %2759, 0
  br i1 %2760, label %2761, label %2778

2761:                                             ; preds = %2758
  %2762 = load i32, i32* %18, align 4
  %2763 = add nsw i32 %2762, -1
  store i32 %2763, i32* %18, align 4
  br label %2764

2764:                                             ; preds = %2761
  %2765 = load i32, i32* %18, align 4
  %2766 = and i32 %2765, 255
  %2767 = trunc i32 %2766 to i8
  %2768 = load i8*, i8** %26, align 4
  %2769 = getelementptr inbounds i8, i8* %2768, i32 2
  %2770 = getelementptr inbounds i8, i8* %2769, i32 0
  store i8 %2767, i8* %2770, align 1
  %2771 = load i32, i32* %18, align 4
  %2772 = ashr i32 %2771, 8
  %2773 = trunc i32 %2772 to i8
  %2774 = load i8*, i8** %26, align 4
  %2775 = getelementptr inbounds i8, i8* %2774, i32 2
  %2776 = getelementptr inbounds i8, i8* %2775, i32 1
  store i8 %2773, i8* %2776, align 1
  br label %2777

2777:                                             ; preds = %2764
  br label %2420

2778:                                             ; preds = %2758
  %2779 = load i8*, i8** %26, align 4
  %2780 = getelementptr inbounds i8, i8* %2779, i32 4
  store i8* %2780, i8** %26, align 4
  br label %2781

2781:                                             ; preds = %2778
  br label %3315

2782:                                             ; preds = %748
  br label %2783

2783:                                             ; preds = %2782
  br label %2784

2784:                                             ; preds = %2783
  %2785 = load i8*, i8** %26, align 4
  %2786 = load i8, i8* %2785, align 1
  %2787 = zext i8 %2786 to i32
  %2788 = and i32 %2787, 255
  store i32 %2788, i32* %18, align 4
  %2789 = load i8*, i8** %26, align 4
  %2790 = getelementptr inbounds i8, i8* %2789, i32 1
  %2791 = load i8, i8* %2790, align 1
  %2792 = sext i8 %2791 to i32
  %2793 = shl i32 %2792, 8
  %2794 = load i32, i32* %18, align 4
  %2795 = add nsw i32 %2794, %2793
  store i32 %2795, i32* %18, align 4
  br label %2796

2796:                                             ; preds = %2784
  %2797 = load i8*, i8** %26, align 4
  %2798 = getelementptr inbounds i8, i8* %2797, i32 2
  store i8* %2798, i8** %26, align 4
  br label %2799

2799:                                             ; preds = %2796
  %2800 = load i8*, i8** %26, align 4
  %2801 = load i32, i32* %18, align 4
  %2802 = getelementptr inbounds i8, i8* %2800, i32 %2801
  store i8* %2802, i8** %19, align 4
  br label %2803

2803:                                             ; preds = %2799
  br label %2804

2804:                                             ; preds = %2803
  %2805 = load i8*, i8** %26, align 4
  %2806 = load i8, i8* %2805, align 1
  %2807 = zext i8 %2806 to i32
  %2808 = and i32 %2807, 255
  store i32 %2808, i32* %18, align 4
  %2809 = load i8*, i8** %26, align 4
  %2810 = getelementptr inbounds i8, i8* %2809, i32 1
  %2811 = load i8, i8* %2810, align 1
  %2812 = sext i8 %2811 to i32
  %2813 = shl i32 %2812, 8
  %2814 = load i32, i32* %18, align 4
  %2815 = add nsw i32 %2814, %2813
  store i32 %2815, i32* %18, align 4
  br label %2816

2816:                                             ; preds = %2804
  %2817 = load i8*, i8** %26, align 4
  %2818 = getelementptr inbounds i8, i8* %2817, i32 2
  store i8* %2818, i8** %26, align 4
  br label %2819

2819:                                             ; preds = %2816
  br label %2820

2820:                                             ; preds = %2819
  %2821 = load i32, i32* %18, align 4
  %2822 = and i32 %2821, 255
  %2823 = trunc i32 %2822 to i8
  %2824 = load i8*, i8** %19, align 4
  %2825 = getelementptr inbounds i8, i8* %2824, i32 0
  store i8 %2823, i8* %2825, align 1
  %2826 = load i32, i32* %18, align 4
  %2827 = ashr i32 %2826, 8
  %2828 = trunc i32 %2827 to i8
  %2829 = load i8*, i8** %19, align 4
  %2830 = getelementptr inbounds i8, i8* %2829, i32 1
  store i8 %2828, i8* %2830, align 1
  br label %2831

2831:                                             ; preds = %2820
  br label %3315

2832:                                             ; preds = %748
  %2833 = load i8*, i8** %24, align 4
  %2834 = load i32, i32* %12, align 4
  %2835 = icmp ne i32 %2834, 0
  br i1 %2835, label %2836, label %2838

2836:                                             ; preds = %2832
  %2837 = load i8*, i8** %11, align 4
  br label %2840

2838:                                             ; preds = %2832
  %2839 = load i8*, i8** %13, align 4
  br label %2840

2840:                                             ; preds = %2838, %2836
  %2841 = phi i8* [ %2837, %2836 ], [ %2839, %2838 ]
  %2842 = icmp eq i8* %2833, %2841
  br i1 %2842, label %2915, label %2843

2843:                                             ; preds = %2840
  %2844 = load i32, i32* %14, align 4
  %2845 = icmp ne i32 %2844, 0
  br i1 %2845, label %2846, label %2915

2846:                                             ; preds = %2843
  %2847 = load i8*, i8** %24, align 4
  %2848 = load i8*, i8** %21, align 4
  %2849 = icmp eq i8* %2847, %2848
  br i1 %2849, label %2915, label %2850

2850:                                             ; preds = %2846
  %2851 = load i8*, i8** %24, align 4
  %2852 = getelementptr inbounds i8, i8* %2851, i32 -1
  %2853 = load i8*, i8** %20, align 4
  %2854 = icmp eq i8* %2852, %2853
  br i1 %2854, label %2855, label %2859

2855:                                             ; preds = %2850
  %2856 = load i8*, i8** %13, align 4
  %2857 = load i8, i8* %2856, align 1
  %2858 = sext i8 %2857 to i32
  br label %2877

2859:                                             ; preds = %2850
  %2860 = load i8*, i8** %24, align 4
  %2861 = getelementptr inbounds i8, i8* %2860, i32 -1
  %2862 = load i8*, i8** %13, align 4
  %2863 = getelementptr inbounds i8, i8* %2862, i32 -1
  %2864 = icmp eq i8* %2861, %2863
  br i1 %2864, label %2865, label %2870

2865:                                             ; preds = %2859
  %2866 = load i8*, i8** %20, align 4
  %2867 = getelementptr inbounds i8, i8* %2866, i32 -1
  %2868 = load i8, i8* %2867, align 1
  %2869 = sext i8 %2868 to i32
  br label %2875

2870:                                             ; preds = %2859
  %2871 = load i8*, i8** %24, align 4
  %2872 = getelementptr inbounds i8, i8* %2871, i32 -1
  %2873 = load i8, i8* %2872, align 1
  %2874 = sext i8 %2873 to i32
  br label %2875

2875:                                             ; preds = %2870, %2865
  %2876 = phi i32 [ %2869, %2865 ], [ %2874, %2870 ]
  br label %2877

2877:                                             ; preds = %2875, %2855
  %2878 = phi i32 [ %2858, %2855 ], [ %2876, %2875 ]
  %2879 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %2878
  %2880 = load i8, i8* %2879, align 1
  %2881 = sext i8 %2880 to i32
  %2882 = icmp eq i32 %2881, 1
  %2883 = zext i1 %2882 to i32
  %2884 = load i8*, i8** %24, align 4
  %2885 = load i8*, i8** %20, align 4
  %2886 = icmp eq i8* %2884, %2885
  br i1 %2886, label %2887, label %2891

2887:                                             ; preds = %2877
  %2888 = load i8*, i8** %13, align 4
  %2889 = load i8, i8* %2888, align 1
  %2890 = sext i8 %2889 to i32
  br label %2907

2891:                                             ; preds = %2877
  %2892 = load i8*, i8** %24, align 4
  %2893 = load i8*, i8** %13, align 4
  %2894 = getelementptr inbounds i8, i8* %2893, i32 -1
  %2895 = icmp eq i8* %2892, %2894
  br i1 %2895, label %2896, label %2901

2896:                                             ; preds = %2891
  %2897 = load i8*, i8** %20, align 4
  %2898 = getelementptr inbounds i8, i8* %2897, i32 -1
  %2899 = load i8, i8* %2898, align 1
  %2900 = sext i8 %2899 to i32
  br label %2905

2901:                                             ; preds = %2891
  %2902 = load i8*, i8** %24, align 4
  %2903 = load i8, i8* %2902, align 1
  %2904 = sext i8 %2903 to i32
  br label %2905

2905:                                             ; preds = %2901, %2896
  %2906 = phi i32 [ %2900, %2896 ], [ %2904, %2901 ]
  br label %2907

2907:                                             ; preds = %2905, %2887
  %2908 = phi i32 [ %2890, %2887 ], [ %2906, %2905 ]
  %2909 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %2908
  %2910 = load i8, i8* %2909, align 1
  %2911 = sext i8 %2910 to i32
  %2912 = icmp eq i32 %2911, 1
  %2913 = zext i1 %2912 to i32
  %2914 = icmp ne i32 %2883, %2913
  br i1 %2914, label %2915, label %2916

2915:                                             ; preds = %2907, %2846, %2843, %2840
  br label %3315

2916:                                             ; preds = %2907
  br label %3316

2917:                                             ; preds = %748
  %2918 = load i8*, i8** %24, align 4
  %2919 = load i32, i32* %12, align 4
  %2920 = icmp ne i32 %2919, 0
  br i1 %2920, label %2921, label %2923

2921:                                             ; preds = %2917
  %2922 = load i8*, i8** %11, align 4
  br label %2925

2923:                                             ; preds = %2917
  %2924 = load i8*, i8** %13, align 4
  br label %2925

2925:                                             ; preds = %2923, %2921
  %2926 = phi i8* [ %2922, %2921 ], [ %2924, %2923 ]
  %2927 = icmp eq i8* %2918, %2926
  br i1 %2927, label %3000, label %2928

2928:                                             ; preds = %2925
  %2929 = load i32, i32* %14, align 4
  %2930 = icmp ne i32 %2929, 0
  br i1 %2930, label %2931, label %3000

2931:                                             ; preds = %2928
  %2932 = load i8*, i8** %24, align 4
  %2933 = load i8*, i8** %21, align 4
  %2934 = icmp eq i8* %2932, %2933
  br i1 %2934, label %3000, label %2935

2935:                                             ; preds = %2931
  %2936 = load i8*, i8** %24, align 4
  %2937 = getelementptr inbounds i8, i8* %2936, i32 -1
  %2938 = load i8*, i8** %20, align 4
  %2939 = icmp eq i8* %2937, %2938
  br i1 %2939, label %2940, label %2944

2940:                                             ; preds = %2935
  %2941 = load i8*, i8** %13, align 4
  %2942 = load i8, i8* %2941, align 1
  %2943 = sext i8 %2942 to i32
  br label %2962

2944:                                             ; preds = %2935
  %2945 = load i8*, i8** %24, align 4
  %2946 = getelementptr inbounds i8, i8* %2945, i32 -1
  %2947 = load i8*, i8** %13, align 4
  %2948 = getelementptr inbounds i8, i8* %2947, i32 -1
  %2949 = icmp eq i8* %2946, %2948
  br i1 %2949, label %2950, label %2955

2950:                                             ; preds = %2944
  %2951 = load i8*, i8** %20, align 4
  %2952 = getelementptr inbounds i8, i8* %2951, i32 -1
  %2953 = load i8, i8* %2952, align 1
  %2954 = sext i8 %2953 to i32
  br label %2960

2955:                                             ; preds = %2944
  %2956 = load i8*, i8** %24, align 4
  %2957 = getelementptr inbounds i8, i8* %2956, i32 -1
  %2958 = load i8, i8* %2957, align 1
  %2959 = sext i8 %2958 to i32
  br label %2960

2960:                                             ; preds = %2955, %2950
  %2961 = phi i32 [ %2954, %2950 ], [ %2959, %2955 ]
  br label %2962

2962:                                             ; preds = %2960, %2940
  %2963 = phi i32 [ %2943, %2940 ], [ %2961, %2960 ]
  %2964 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %2963
  %2965 = load i8, i8* %2964, align 1
  %2966 = sext i8 %2965 to i32
  %2967 = icmp eq i32 %2966, 1
  %2968 = zext i1 %2967 to i32
  %2969 = load i8*, i8** %24, align 4
  %2970 = load i8*, i8** %20, align 4
  %2971 = icmp eq i8* %2969, %2970
  br i1 %2971, label %2972, label %2976

2972:                                             ; preds = %2962
  %2973 = load i8*, i8** %13, align 4
  %2974 = load i8, i8* %2973, align 1
  %2975 = sext i8 %2974 to i32
  br label %2992

2976:                                             ; preds = %2962
  %2977 = load i8*, i8** %24, align 4
  %2978 = load i8*, i8** %13, align 4
  %2979 = getelementptr inbounds i8, i8* %2978, i32 -1
  %2980 = icmp eq i8* %2977, %2979
  br i1 %2980, label %2981, label %2986

2981:                                             ; preds = %2976
  %2982 = load i8*, i8** %20, align 4
  %2983 = getelementptr inbounds i8, i8* %2982, i32 -1
  %2984 = load i8, i8* %2983, align 1
  %2985 = sext i8 %2984 to i32
  br label %2990

2986:                                             ; preds = %2976
  %2987 = load i8*, i8** %24, align 4
  %2988 = load i8, i8* %2987, align 1
  %2989 = sext i8 %2988 to i32
  br label %2990

2990:                                             ; preds = %2986, %2981
  %2991 = phi i32 [ %2985, %2981 ], [ %2989, %2986 ]
  br label %2992

2992:                                             ; preds = %2990, %2972
  %2993 = phi i32 [ %2975, %2972 ], [ %2991, %2990 ]
  %2994 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %2993
  %2995 = load i8, i8* %2994, align 1
  %2996 = sext i8 %2995 to i32
  %2997 = icmp eq i32 %2996, 1
  %2998 = zext i1 %2997 to i32
  %2999 = icmp ne i32 %2968, %2998
  br i1 %2999, label %3000, label %3001

3000:                                             ; preds = %2992, %2931, %2928, %2925
  br label %3316

3001:                                             ; preds = %2992
  br label %3315

3002:                                             ; preds = %748
  %3003 = load i8*, i8** %24, align 4
  %3004 = load i8*, i8** %20, align 4
  %3005 = icmp eq i8* %3003, %3004
  br i1 %3005, label %3006, label %3010

3006:                                             ; preds = %3002
  %3007 = load i8*, i8** %13, align 4
  %3008 = load i8, i8* %3007, align 1
  %3009 = sext i8 %3008 to i32
  br label %3026

3010:                                             ; preds = %3002
  %3011 = load i8*, i8** %24, align 4
  %3012 = load i8*, i8** %13, align 4
  %3013 = getelementptr inbounds i8, i8* %3012, i32 -1
  %3014 = icmp eq i8* %3011, %3013
  br i1 %3014, label %3015, label %3020

3015:                                             ; preds = %3010
  %3016 = load i8*, i8** %20, align 4
  %3017 = getelementptr inbounds i8, i8* %3016, i32 -1
  %3018 = load i8, i8* %3017, align 1
  %3019 = sext i8 %3018 to i32
  br label %3024

3020:                                             ; preds = %3010
  %3021 = load i8*, i8** %24, align 4
  %3022 = load i8, i8* %3021, align 1
  %3023 = sext i8 %3022 to i32
  br label %3024

3024:                                             ; preds = %3020, %3015
  %3025 = phi i32 [ %3019, %3015 ], [ %3023, %3020 ]
  br label %3026

3026:                                             ; preds = %3024, %3006
  %3027 = phi i32 [ %3009, %3006 ], [ %3025, %3024 ]
  %3028 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3027
  %3029 = load i8, i8* %3028, align 1
  %3030 = sext i8 %3029 to i32
  %3031 = icmp eq i32 %3030, 1
  br i1 %3031, label %3032, label %3080

3032:                                             ; preds = %3026
  %3033 = load i8*, i8** %24, align 4
  %3034 = load i32, i32* %12, align 4
  %3035 = icmp ne i32 %3034, 0
  br i1 %3035, label %3036, label %3038

3036:                                             ; preds = %3032
  %3037 = load i8*, i8** %11, align 4
  br label %3040

3038:                                             ; preds = %3032
  %3039 = load i8*, i8** %13, align 4
  br label %3040

3040:                                             ; preds = %3038, %3036
  %3041 = phi i8* [ %3037, %3036 ], [ %3039, %3038 ]
  %3042 = icmp eq i8* %3033, %3041
  br i1 %3042, label %3079, label %3043

3043:                                             ; preds = %3040
  %3044 = load i32, i32* %14, align 4
  %3045 = icmp ne i32 %3044, 0
  br i1 %3045, label %3046, label %3079

3046:                                             ; preds = %3043
  %3047 = load i8*, i8** %24, align 4
  %3048 = getelementptr inbounds i8, i8* %3047, i32 -1
  %3049 = load i8*, i8** %20, align 4
  %3050 = icmp eq i8* %3048, %3049
  br i1 %3050, label %3051, label %3055

3051:                                             ; preds = %3046
  %3052 = load i8*, i8** %13, align 4
  %3053 = load i8, i8* %3052, align 1
  %3054 = sext i8 %3053 to i32
  br label %3073

3055:                                             ; preds = %3046
  %3056 = load i8*, i8** %24, align 4
  %3057 = getelementptr inbounds i8, i8* %3056, i32 -1
  %3058 = load i8*, i8** %13, align 4
  %3059 = getelementptr inbounds i8, i8* %3058, i32 -1
  %3060 = icmp eq i8* %3057, %3059
  br i1 %3060, label %3061, label %3066

3061:                                             ; preds = %3055
  %3062 = load i8*, i8** %20, align 4
  %3063 = getelementptr inbounds i8, i8* %3062, i32 -1
  %3064 = load i8, i8* %3063, align 1
  %3065 = sext i8 %3064 to i32
  br label %3071

3066:                                             ; preds = %3055
  %3067 = load i8*, i8** %24, align 4
  %3068 = getelementptr inbounds i8, i8* %3067, i32 -1
  %3069 = load i8, i8* %3068, align 1
  %3070 = sext i8 %3069 to i32
  br label %3071

3071:                                             ; preds = %3066, %3061
  %3072 = phi i32 [ %3065, %3061 ], [ %3070, %3066 ]
  br label %3073

3073:                                             ; preds = %3071, %3051
  %3074 = phi i32 [ %3054, %3051 ], [ %3072, %3071 ]
  %3075 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3074
  %3076 = load i8, i8* %3075, align 1
  %3077 = sext i8 %3076 to i32
  %3078 = icmp eq i32 %3077, 1
  br i1 %3078, label %3080, label %3079

3079:                                             ; preds = %3073, %3043, %3040
  br label %3315

3080:                                             ; preds = %3073, %3026
  br label %3316

3081:                                             ; preds = %748
  %3082 = load i8*, i8** %24, align 4
  %3083 = load i32, i32* %12, align 4
  %3084 = icmp ne i32 %3083, 0
  br i1 %3084, label %3085, label %3087

3085:                                             ; preds = %3081
  %3086 = load i8*, i8** %11, align 4
  br label %3089

3087:                                             ; preds = %3081
  %3088 = load i8*, i8** %13, align 4
  br label %3089

3089:                                             ; preds = %3087, %3085
  %3090 = phi i8* [ %3086, %3085 ], [ %3088, %3087 ]
  %3091 = icmp eq i8* %3082, %3090
  br i1 %3091, label %3163, label %3092

3092:                                             ; preds = %3089
  %3093 = load i32, i32* %14, align 4
  %3094 = icmp ne i32 %3093, 0
  br i1 %3094, label %3095, label %3163

3095:                                             ; preds = %3092
  %3096 = load i8*, i8** %24, align 4
  %3097 = getelementptr inbounds i8, i8* %3096, i32 -1
  %3098 = load i8*, i8** %20, align 4
  %3099 = icmp eq i8* %3097, %3098
  br i1 %3099, label %3100, label %3104

3100:                                             ; preds = %3095
  %3101 = load i8*, i8** %13, align 4
  %3102 = load i8, i8* %3101, align 1
  %3103 = sext i8 %3102 to i32
  br label %3122

3104:                                             ; preds = %3095
  %3105 = load i8*, i8** %24, align 4
  %3106 = getelementptr inbounds i8, i8* %3105, i32 -1
  %3107 = load i8*, i8** %13, align 4
  %3108 = getelementptr inbounds i8, i8* %3107, i32 -1
  %3109 = icmp eq i8* %3106, %3108
  br i1 %3109, label %3110, label %3115

3110:                                             ; preds = %3104
  %3111 = load i8*, i8** %20, align 4
  %3112 = getelementptr inbounds i8, i8* %3111, i32 -1
  %3113 = load i8, i8* %3112, align 1
  %3114 = sext i8 %3113 to i32
  br label %3120

3115:                                             ; preds = %3104
  %3116 = load i8*, i8** %24, align 4
  %3117 = getelementptr inbounds i8, i8* %3116, i32 -1
  %3118 = load i8, i8* %3117, align 1
  %3119 = sext i8 %3118 to i32
  br label %3120

3120:                                             ; preds = %3115, %3110
  %3121 = phi i32 [ %3114, %3110 ], [ %3119, %3115 ]
  br label %3122

3122:                                             ; preds = %3120, %3100
  %3123 = phi i32 [ %3103, %3100 ], [ %3121, %3120 ]
  %3124 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3123
  %3125 = load i8, i8* %3124, align 1
  %3126 = sext i8 %3125 to i32
  %3127 = icmp eq i32 %3126, 1
  br i1 %3127, label %3128, label %3163

3128:                                             ; preds = %3122
  %3129 = load i8*, i8** %24, align 4
  %3130 = load i8*, i8** %20, align 4
  %3131 = icmp eq i8* %3129, %3130
  br i1 %3131, label %3132, label %3136

3132:                                             ; preds = %3128
  %3133 = load i8*, i8** %13, align 4
  %3134 = load i8, i8* %3133, align 1
  %3135 = sext i8 %3134 to i32
  br label %3152

3136:                                             ; preds = %3128
  %3137 = load i8*, i8** %24, align 4
  %3138 = load i8*, i8** %13, align 4
  %3139 = getelementptr inbounds i8, i8* %3138, i32 -1
  %3140 = icmp eq i8* %3137, %3139
  br i1 %3140, label %3141, label %3146

3141:                                             ; preds = %3136
  %3142 = load i8*, i8** %20, align 4
  %3143 = getelementptr inbounds i8, i8* %3142, i32 -1
  %3144 = load i8, i8* %3143, align 1
  %3145 = sext i8 %3144 to i32
  br label %3150

3146:                                             ; preds = %3136
  %3147 = load i8*, i8** %24, align 4
  %3148 = load i8, i8* %3147, align 1
  %3149 = sext i8 %3148 to i32
  br label %3150

3150:                                             ; preds = %3146, %3141
  %3151 = phi i32 [ %3145, %3141 ], [ %3149, %3146 ]
  br label %3152

3152:                                             ; preds = %3150, %3132
  %3153 = phi i32 [ %3135, %3132 ], [ %3151, %3150 ]
  %3154 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3153
  %3155 = load i8, i8* %3154, align 1
  %3156 = sext i8 %3155 to i32
  %3157 = icmp eq i32 %3156, 1
  br i1 %3157, label %3158, label %3162

3158:                                             ; preds = %3152
  %3159 = load i8*, i8** %24, align 4
  %3160 = load i8*, i8** %21, align 4
  %3161 = icmp eq i8* %3159, %3160
  br i1 %3161, label %3162, label %3163

3162:                                             ; preds = %3158, %3152
  br label %3315

3163:                                             ; preds = %3158, %3122, %3092, %3089
  br label %3316

3164:                                             ; preds = %748
  br label %3165

3165:                                             ; preds = %3174, %3164
  %3166 = load i8*, i8** %24, align 4
  %3167 = load i8*, i8** %25, align 4
  %3168 = icmp eq i8* %3166, %3167
  br i1 %3168, label %3169, label %3177

3169:                                             ; preds = %3165
  %3170 = load i8*, i8** %25, align 4
  %3171 = load i8*, i8** %23, align 4
  %3172 = icmp eq i8* %3170, %3171
  br i1 %3172, label %3173, label %3174

3173:                                             ; preds = %3169
  br label %3316

3174:                                             ; preds = %3169
  %3175 = load i8*, i8** %13, align 4
  store i8* %3175, i8** %24, align 4
  %3176 = load i8*, i8** %23, align 4
  store i8* %3176, i8** %25, align 4
  br label %3165

3177:                                             ; preds = %3165
  %3178 = load i8*, i8** %24, align 4
  %3179 = load i8*, i8** %20, align 4
  %3180 = icmp eq i8* %3178, %3179
  br i1 %3180, label %3181, label %3185

3181:                                             ; preds = %3177
  %3182 = load i8*, i8** %13, align 4
  %3183 = load i8, i8* %3182, align 1
  %3184 = sext i8 %3183 to i32
  br label %3201

3185:                                             ; preds = %3177
  %3186 = load i8*, i8** %24, align 4
  %3187 = load i8*, i8** %13, align 4
  %3188 = getelementptr inbounds i8, i8* %3187, i32 -1
  %3189 = icmp eq i8* %3186, %3188
  br i1 %3189, label %3190, label %3195

3190:                                             ; preds = %3185
  %3191 = load i8*, i8** %20, align 4
  %3192 = getelementptr inbounds i8, i8* %3191, i32 -1
  %3193 = load i8, i8* %3192, align 1
  %3194 = sext i8 %3193 to i32
  br label %3199

3195:                                             ; preds = %3185
  %3196 = load i8*, i8** %24, align 4
  %3197 = load i8, i8* %3196, align 1
  %3198 = sext i8 %3197 to i32
  br label %3199

3199:                                             ; preds = %3195, %3190
  %3200 = phi i32 [ %3194, %3190 ], [ %3198, %3195 ]
  br label %3201

3201:                                             ; preds = %3199, %3181
  %3202 = phi i32 [ %3184, %3181 ], [ %3200, %3199 ]
  %3203 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3202
  %3204 = load i8, i8* %3203, align 1
  %3205 = sext i8 %3204 to i32
  %3206 = icmp eq i32 %3205, 1
  br i1 %3206, label %3208, label %3207

3207:                                             ; preds = %3201
  br label %3316

3208:                                             ; preds = %3201
  br label %3209

3209:                                             ; preds = %3208
  %3210 = load i32, i32* %31, align 4
  store i32 %3210, i32* %75, align 4
  br label %3211

3211:                                             ; preds = %3232, %3209
  %3212 = load i32, i32* %75, align 4
  %3213 = load i32, i32* %32, align 4
  %3214 = icmp ule i32 %3212, %3213
  br i1 %3214, label %3215, label %3235

3215:                                             ; preds = %3211
  %3216 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %3217 = load i32, i32* %75, align 4
  %3218 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %3216, i32 %3217
  %3219 = bitcast %union.register_info_type* %3218 to %struct.anon.2*
  %3220 = bitcast %struct.anon.2* %3219 to i8*
  %3221 = load i8, i8* %3220, align 4
  %3222 = and i8 %3221, -17
  %3223 = or i8 %3222, 16
  store i8 %3223, i8* %3220, align 4
  %3224 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %3225 = load i32, i32* %75, align 4
  %3226 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %3224, i32 %3225
  %3227 = bitcast %union.register_info_type* %3226 to %struct.anon.2*
  %3228 = bitcast %struct.anon.2* %3227 to i8*
  %3229 = load i8, i8* %3228, align 4
  %3230 = and i8 %3229, -9
  %3231 = or i8 %3230, 8
  store i8 %3231, i8* %3228, align 4
  br label %3232

3232:                                             ; preds = %3215
  %3233 = load i32, i32* %75, align 4
  %3234 = add i32 %3233, 1
  store i32 %3234, i32* %75, align 4
  br label %3211

3235:                                             ; preds = %3211
  br label %3236

3236:                                             ; preds = %3235
  %3237 = load i8*, i8** %24, align 4
  %3238 = getelementptr inbounds i8, i8* %3237, i32 1
  store i8* %3238, i8** %24, align 4
  br label %3315

3239:                                             ; preds = %748
  br label %3240

3240:                                             ; preds = %3249, %3239
  %3241 = load i8*, i8** %24, align 4
  %3242 = load i8*, i8** %25, align 4
  %3243 = icmp eq i8* %3241, %3242
  br i1 %3243, label %3244, label %3252

3244:                                             ; preds = %3240
  %3245 = load i8*, i8** %25, align 4
  %3246 = load i8*, i8** %23, align 4
  %3247 = icmp eq i8* %3245, %3246
  br i1 %3247, label %3248, label %3249

3248:                                             ; preds = %3244
  br label %3316

3249:                                             ; preds = %3244
  %3250 = load i8*, i8** %13, align 4
  store i8* %3250, i8** %24, align 4
  %3251 = load i8*, i8** %23, align 4
  store i8* %3251, i8** %25, align 4
  br label %3240

3252:                                             ; preds = %3240
  %3253 = load i8*, i8** %24, align 4
  %3254 = load i8*, i8** %20, align 4
  %3255 = icmp eq i8* %3253, %3254
  br i1 %3255, label %3256, label %3260

3256:                                             ; preds = %3252
  %3257 = load i8*, i8** %13, align 4
  %3258 = load i8, i8* %3257, align 1
  %3259 = sext i8 %3258 to i32
  br label %3276

3260:                                             ; preds = %3252
  %3261 = load i8*, i8** %24, align 4
  %3262 = load i8*, i8** %13, align 4
  %3263 = getelementptr inbounds i8, i8* %3262, i32 -1
  %3264 = icmp eq i8* %3261, %3263
  br i1 %3264, label %3265, label %3270

3265:                                             ; preds = %3260
  %3266 = load i8*, i8** %20, align 4
  %3267 = getelementptr inbounds i8, i8* %3266, i32 -1
  %3268 = load i8, i8* %3267, align 1
  %3269 = sext i8 %3268 to i32
  br label %3274

3270:                                             ; preds = %3260
  %3271 = load i8*, i8** %24, align 4
  %3272 = load i8, i8* %3271, align 1
  %3273 = sext i8 %3272 to i32
  br label %3274

3274:                                             ; preds = %3270, %3265
  %3275 = phi i32 [ %3269, %3265 ], [ %3273, %3270 ]
  br label %3276

3276:                                             ; preds = %3274, %3256
  %3277 = phi i32 [ %3259, %3256 ], [ %3275, %3274 ]
  %3278 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %3277
  %3279 = load i8, i8* %3278, align 1
  %3280 = sext i8 %3279 to i32
  %3281 = icmp eq i32 %3280, 1
  br i1 %3281, label %3282, label %3283

3282:                                             ; preds = %3276
  br label %3316

3283:                                             ; preds = %3276
  br label %3284

3284:                                             ; preds = %3283
  %3285 = load i32, i32* %31, align 4
  store i32 %3285, i32* %76, align 4
  br label %3286

3286:                                             ; preds = %3307, %3284
  %3287 = load i32, i32* %76, align 4
  %3288 = load i32, i32* %32, align 4
  %3289 = icmp ule i32 %3287, %3288
  br i1 %3289, label %3290, label %3310

3290:                                             ; preds = %3286
  %3291 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %3292 = load i32, i32* %76, align 4
  %3293 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %3291, i32 %3292
  %3294 = bitcast %union.register_info_type* %3293 to %struct.anon.2*
  %3295 = bitcast %struct.anon.2* %3294 to i8*
  %3296 = load i8, i8* %3295, align 4
  %3297 = and i8 %3296, -17
  %3298 = or i8 %3297, 16
  store i8 %3298, i8* %3295, align 4
  %3299 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %3300 = load i32, i32* %76, align 4
  %3301 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %3299, i32 %3300
  %3302 = bitcast %union.register_info_type* %3301 to %struct.anon.2*
  %3303 = bitcast %struct.anon.2* %3302 to i8*
  %3304 = load i8, i8* %3303, align 4
  %3305 = and i8 %3304, -9
  %3306 = or i8 %3305, 8
  store i8 %3306, i8* %3303, align 4
  br label %3307

3307:                                             ; preds = %3290
  %3308 = load i32, i32* %76, align 4
  %3309 = add i32 %3308, 1
  store i32 %3309, i32* %76, align 4
  br label %3286

3310:                                             ; preds = %3286
  br label %3311

3311:                                             ; preds = %3310
  %3312 = load i8*, i8** %24, align 4
  %3313 = getelementptr inbounds i8, i8* %3312, i32 1
  store i8* %3313, i8** %24, align 4
  br label %3315

3314:                                             ; preds = %748
  call void @abort() #9
  unreachable

3315:                                             ; preds = %3311, %3236, %3162, %3079, %3001, %2915, %2831, %2781, %2742, %2693, %2437, %2172, %1981, %1834, %1828, %1811, %1787, %1772, %1757, %1734, %1572, %1166, %1053, %946, %855, %753
  br label %291

3316:                                             ; preds = %3448, %3399, %3282, %3248, %3207, %3173, %3163, %3080, %3000, %2916, %1835, %1829, %1813, %1774, %1726, %1687, %1591, %1570, %1024, %965, %917, %865, %820, %806, %789, %771, %368
  %3317 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3318 = load i32, i32* %3317, align 4
  %3319 = icmp eq i32 %3318, 0
  br i1 %3319, label %3463, label %3320

3320:                                             ; preds = %3316
  %3321 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3322 = load i8**, i8*** %3321, align 4
  %3323 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3324 = load i32, i32* %3323, align 4
  %3325 = add i32 %3324, -1
  store i32 %3325, i32* %3323, align 4
  %3326 = getelementptr inbounds i8*, i8** %3322, i32 %3325
  %3327 = load i8*, i8** %3326, align 4
  store i8* %3327, i8** %78, align 4
  %3328 = load i8*, i8** %78, align 4
  %3329 = icmp ne i8* %3328, null
  br i1 %3329, label %3330, label %3332

3330:                                             ; preds = %3320
  %3331 = load i8*, i8** %78, align 4
  store i8* %3331, i8** %24, align 4
  br label %3332

3332:                                             ; preds = %3330, %3320
  %3333 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3334 = load i8**, i8*** %3333, align 4
  %3335 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3336 = load i32, i32* %3335, align 4
  %3337 = add i32 %3336, -1
  store i32 %3337, i32* %3335, align 4
  %3338 = getelementptr inbounds i8*, i8** %3334, i32 %3337
  %3339 = load i8*, i8** %3338, align 4
  store i8* %3339, i8** %26, align 4
  %3340 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3341 = load i8**, i8*** %3340, align 4
  %3342 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3343 = load i32, i32* %3342, align 4
  %3344 = add i32 %3343, -1
  store i32 %3344, i32* %3342, align 4
  %3345 = getelementptr inbounds i8*, i8** %3341, i32 %3344
  %3346 = load i8*, i8** %3345, align 4
  %3347 = ptrtoint i8* %3346 to i32
  store i32 %3347, i32* %32, align 4
  %3348 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3349 = load i8**, i8*** %3348, align 4
  %3350 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3351 = load i32, i32* %3350, align 4
  %3352 = add i32 %3351, -1
  store i32 %3352, i32* %3350, align 4
  %3353 = getelementptr inbounds i8*, i8** %3349, i32 %3352
  %3354 = load i8*, i8** %3353, align 4
  %3355 = ptrtoint i8* %3354 to i32
  store i32 %3355, i32* %31, align 4
  %3356 = load i32, i32* %32, align 4
  store i32 %3356, i32* %77, align 4
  br label %3357

3357:                                             ; preds = %3393, %3332
  %3358 = load i32, i32* %77, align 4
  %3359 = load i32, i32* %31, align 4
  %3360 = icmp uge i32 %3358, %3359
  br i1 %3360, label %3361, label %3396

3361:                                             ; preds = %3357
  %3362 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3363 = load i8**, i8*** %3362, align 4
  %3364 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3365 = load i32, i32* %3364, align 4
  %3366 = add i32 %3365, -1
  store i32 %3366, i32* %3364, align 4
  %3367 = getelementptr inbounds i8*, i8** %3363, i32 %3366
  %3368 = load i8*, i8** %3367, align 4
  %3369 = load %union.register_info_type*, %union.register_info_type** %37, align 4
  %3370 = load i32, i32* %77, align 4
  %3371 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %3369, i32 %3370
  %3372 = bitcast %union.register_info_type* %3371 to i8**
  store i8* %3368, i8** %3372, align 4
  %3373 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3374 = load i8**, i8*** %3373, align 4
  %3375 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3376 = load i32, i32* %3375, align 4
  %3377 = add i32 %3376, -1
  store i32 %3377, i32* %3375, align 4
  %3378 = getelementptr inbounds i8*, i8** %3374, i32 %3377
  %3379 = load i8*, i8** %3378, align 4
  %3380 = load i8**, i8*** %34, align 4
  %3381 = load i32, i32* %77, align 4
  %3382 = getelementptr inbounds i8*, i8** %3380, i32 %3381
  store i8* %3379, i8** %3382, align 4
  %3383 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 0
  %3384 = load i8**, i8*** %3383, align 4
  %3385 = getelementptr inbounds %struct.fail_stack_type, %struct.fail_stack_type* %29, i32 0, i32 2
  %3386 = load i32, i32* %3385, align 4
  %3387 = add i32 %3386, -1
  store i32 %3387, i32* %3385, align 4
  %3388 = getelementptr inbounds i8*, i8** %3384, i32 %3387
  %3389 = load i8*, i8** %3388, align 4
  %3390 = load i8**, i8*** %33, align 4
  %3391 = load i32, i32* %77, align 4
  %3392 = getelementptr inbounds i8*, i8** %3390, i32 %3391
  store i8* %3389, i8** %3392, align 4
  br label %3393

3393:                                             ; preds = %3361
  %3394 = load i32, i32* %77, align 4
  %3395 = add nsw i32 %3394, -1
  store i32 %3395, i32* %77, align 4
  br label %3357

3396:                                             ; preds = %3357
  %3397 = load i8*, i8** %26, align 4
  %3398 = icmp ne i8* %3397, null
  br i1 %3398, label %3400, label %3399

3399:                                             ; preds = %3396
  br label %3316

3400:                                             ; preds = %3396
  %3401 = load i8*, i8** %26, align 4
  %3402 = load i8*, i8** %27, align 4
  %3403 = icmp ult i8* %3401, %3402
  br i1 %3403, label %3404, label %3452

3404:                                             ; preds = %3400
  store i8 0, i8* %79, align 1
  %3405 = load i8*, i8** %26, align 4
  %3406 = load i8, i8* %3405, align 1
  %3407 = zext i8 %3406 to i32
  switch i32 %3407, label %3450 [
    i32 21, label %3408
    i32 17, label %3409
    i32 16, label %3409
    i32 12, label %3409
  ]

3408:                                             ; preds = %3404
  store i8 1, i8* %79, align 1
  br label %3409

3409:                                             ; preds = %3404, %3404, %3404, %3408
  %3410 = load i8*, i8** %26, align 4
  %3411 = getelementptr inbounds i8, i8* %3410, i32 1
  store i8* %3411, i8** %19, align 4
  br label %3412

3412:                                             ; preds = %3409
  br label %3413

3413:                                             ; preds = %3412
  %3414 = load i8*, i8** %19, align 4
  %3415 = load i8, i8* %3414, align 1
  %3416 = zext i8 %3415 to i32
  %3417 = and i32 %3416, 255
  store i32 %3417, i32* %18, align 4
  %3418 = load i8*, i8** %19, align 4
  %3419 = getelementptr inbounds i8, i8* %3418, i32 1
  %3420 = load i8, i8* %3419, align 1
  %3421 = sext i8 %3420 to i32
  %3422 = shl i32 %3421, 8
  %3423 = load i32, i32* %18, align 4
  %3424 = add nsw i32 %3423, %3422
  store i32 %3424, i32* %18, align 4
  br label %3425

3425:                                             ; preds = %3413
  %3426 = load i8*, i8** %19, align 4
  %3427 = getelementptr inbounds i8, i8* %3426, i32 2
  store i8* %3427, i8** %19, align 4
  br label %3428

3428:                                             ; preds = %3425
  %3429 = load i32, i32* %18, align 4
  %3430 = load i8*, i8** %19, align 4
  %3431 = getelementptr inbounds i8, i8* %3430, i32 %3429
  store i8* %3431, i8** %19, align 4
  %3432 = load i8, i8* %79, align 1
  %3433 = sext i8 %3432 to i32
  %3434 = icmp ne i32 %3433, 0
  br i1 %3434, label %3435, label %3440

3435:                                             ; preds = %3428
  %3436 = load i8*, i8** %19, align 4
  %3437 = load i8, i8* %3436, align 1
  %3438 = zext i8 %3437 to i32
  %3439 = icmp eq i32 %3438, 20
  br i1 %3439, label %3448, label %3440

3440:                                             ; preds = %3435, %3428
  %3441 = load i8, i8* %79, align 1
  %3442 = icmp ne i8 %3441, 0
  br i1 %3442, label %3449, label %3443

3443:                                             ; preds = %3440
  %3444 = load i8*, i8** %19, align 4
  %3445 = load i8, i8* %3444, align 1
  %3446 = zext i8 %3445 to i32
  %3447 = icmp eq i32 %3446, 14
  br i1 %3447, label %3448, label %3449

3448:                                             ; preds = %3443, %3435
  br label %3316

3449:                                             ; preds = %3443, %3440
  br label %3451

3450:                                             ; preds = %3404
  br label %3451

3451:                                             ; preds = %3450, %3449
  br label %3452

3452:                                             ; preds = %3451, %3400
  %3453 = load i8*, i8** %24, align 4
  %3454 = load i8*, i8** %11, align 4
  %3455 = icmp uge i8* %3453, %3454
  br i1 %3455, label %3456, label %3462

3456:                                             ; preds = %3452
  %3457 = load i8*, i8** %24, align 4
  %3458 = load i8*, i8** %20, align 4
  %3459 = icmp ule i8* %3457, %3458
  br i1 %3459, label %3460, label %3462

3460:                                             ; preds = %3456
  %3461 = load i8*, i8** %22, align 4
  store i8* %3461, i8** %25, align 4
  br label %3462

3462:                                             ; preds = %3460, %3456, %3452
  br label %3464

3463:                                             ; preds = %3316
  br label %3465

3464:                                             ; preds = %3462
  br label %291

3465:                                             ; preds = %3463
  %3466 = load i32, i32* %38, align 4
  %3467 = icmp ne i32 %3466, 0
  br i1 %3467, label %3468, label %3469

3468:                                             ; preds = %3465
  br label %373

3469:                                             ; preds = %3465
  %3470 = alloca i8, i32 0, align 16
  store i32 -1, i32* %9, align 4
  br label %3471

3471:                                             ; preds = %3469, %2621, %2495, %2096, %1906, %1494, %742, %529, %469, %186, %174, %102
  %3472 = load i32, i32* %9, align 4
  ret i32 %3472
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @re_match(%struct.re_pattern_buffer*, i8*, i32, i32, %struct.re_registers*) #0 {
  %6 = alloca %struct.re_pattern_buffer*, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.re_registers*, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %6, align 4
  store i8* %1, i8** %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store %struct.re_registers* %4, %struct.re_registers** %10, align 4
  %11 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %6, align 4
  %12 = load i8*, i8** %7, align 4
  %13 = load i32, i32* %8, align 4
  %14 = load i32, i32* %9, align 4
  %15 = load %struct.re_registers*, %struct.re_registers** %10, align 4
  %16 = load i32, i32* %8, align 4
  %17 = call i32 @re_match_2(%struct.re_pattern_buffer* %11, i8* null, i32 0, i8* %12, i32 %13, i32 %14, %struct.re_registers* %15, i32 %16)
  ret i32 %17
}

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind optnone
define internal i32 @regex_compile(i8*, i32, i32, %struct.re_pattern_buffer*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.re_pattern_buffer*, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8*, align 4
  %13 = alloca i8*, align 4
  %14 = alloca %struct.compile_stack_type, align 4
  %15 = alloca i8*, align 4
  %16 = alloca i8*, align 4
  %17 = alloca i8*, align 4
  %18 = alloca i8*, align 4
  %19 = alloca i8*, align 4
  %20 = alloca i8*, align 4
  %21 = alloca i8*, align 4
  %22 = alloca i8*, align 4
  %23 = alloca i32, align 4
  %24 = alloca i8*, align 4
  %25 = alloca i8*, align 4
  %26 = alloca i8, align 1
  %27 = alloca i8, align 1
  %28 = alloca i8, align 1
  %29 = alloca i8*, align 4
  %30 = alloca i8*, align 4
  %31 = alloca i8*, align 4
  %32 = alloca i8*, align 4
  %33 = alloca i8, align 1
  %34 = alloca i8*, align 4
  %35 = alloca i8*, align 4
  %36 = alloca i8*, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca [7 x i8], align 1
  %40 = alloca i32, align 4
  %41 = alloca i8, align 1
  %42 = alloca i8, align 1
  %43 = alloca i8, align 1
  %44 = alloca i8, align 1
  %45 = alloca i8, align 1
  %46 = alloca i8, align 1
  %47 = alloca i8, align 1
  %48 = alloca i8, align 1
  %49 = alloca i8, align 1
  %50 = alloca i8, align 1
  %51 = alloca i8, align 1
  %52 = alloca i8, align 1
  %53 = alloca i8*, align 4
  %54 = alloca i8*, align 4
  %55 = alloca i32, align 4
  %56 = alloca i8*, align 4
  %57 = alloca i8*, align 4
  %58 = alloca i8*, align 4
  %59 = alloca i8*, align 4
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i8*, align 4
  %63 = alloca i32, align 4
  %64 = alloca i8*, align 4
  %65 = alloca i8*, align 4
  %66 = alloca i8*, align 4
  %67 = alloca i8*, align 4
  %68 = alloca i8*, align 4
  %69 = alloca i8*, align 4
  %70 = alloca i8*, align 4
  %71 = alloca i8*, align 4
  %72 = alloca i8*, align 4
  %73 = alloca i8*, align 4
  %74 = alloca i8*, align 4
  %75 = alloca i8*, align 4
  store i8* %0, i8** %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store %struct.re_pattern_buffer* %3, %struct.re_pattern_buffer** %9, align 4
  %76 = load i8*, i8** %6, align 4
  store i8* %76, i8** %15, align 4
  %77 = load i8*, i8** %6, align 4
  %78 = load i32, i32* %7, align 4
  %79 = getelementptr inbounds i8, i8* %77, i32 %78
  store i8* %79, i8** %16, align 4
  %80 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %81 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %80, i32 0, i32 5
  %82 = load i8*, i8** %81, align 4
  store i8* %82, i8** %17, align 4
  store i8* null, i8** %18, align 4
  store i8* null, i8** %19, align 4
  store i8* null, i8** %22, align 4
  store i32 0, i32* %23, align 4
  %83 = call noalias i8* @malloc(i32 640) #7
  %84 = bitcast i8* %83 to %struct.compile_stack_elt_t*
  %85 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  store %struct.compile_stack_elt_t* %84, %struct.compile_stack_elt_t** %85, align 4
  %86 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %87 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %86, align 4
  %88 = icmp eq %struct.compile_stack_elt_t* %87, null
  br i1 %88, label %89, label %90

89:                                               ; preds = %4
  store i32 12, i32* %5, align 4
  br label %5372

90:                                               ; preds = %4
  %91 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 1
  store i32 32, i32* %91, align 4
  %92 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  store i32 0, i32* %92, align 4
  %93 = load i32, i32* %8, align 4
  %94 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %95 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %94, i32 0, i32 3
  store i32 %93, i32* %95, align 4
  %96 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %97 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %96, i32 0, i32 7
  %98 = load i8, i8* %97, align 4
  %99 = and i8 %98, -9
  store i8 %99, i8* %97, align 4
  %100 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %101 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %100, i32 0, i32 7
  %102 = load i8, i8* %101, align 4
  %103 = and i8 %102, -65
  store i8 %103, i8* %101, align 4
  %104 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %105 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %104, i32 0, i32 7
  %106 = load i8, i8* %105, align 4
  %107 = and i8 %106, -33
  store i8 %107, i8* %105, align 4
  %108 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %109 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %108, i32 0, i32 2
  store i32 0, i32* %109, align 4
  %110 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %111 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %110, i32 0, i32 6
  store i32 0, i32* %111, align 4
  call void @init_syntax_once()
  %112 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %113 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %112, i32 0, i32 1
  %114 = load i32, i32* %113, align 4
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %141

116:                                              ; preds = %90
  %117 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %118 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %117, i32 0, i32 0
  %119 = load i8*, i8** %118, align 4
  %120 = icmp ne i8* %119, null
  br i1 %120, label %121, label %128

121:                                              ; preds = %116
  %122 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %123 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %122, i32 0, i32 0
  %124 = load i8*, i8** %123, align 4
  %125 = call i8* @realloc(i8* %124, i32 32) #7
  %126 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %127 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %126, i32 0, i32 0
  store i8* %125, i8** %127, align 4
  br label %132

128:                                              ; preds = %116
  %129 = call noalias i8* @malloc(i32 32) #7
  %130 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %131 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %130, i32 0, i32 0
  store i8* %129, i8** %131, align 4
  br label %132

132:                                              ; preds = %128, %121
  %133 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %134 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %133, i32 0, i32 0
  %135 = load i8*, i8** %134, align 4
  %136 = icmp ne i8* %135, null
  br i1 %136, label %138, label %137

137:                                              ; preds = %132
  store i32 12, i32* %5, align 4
  br label %5372

138:                                              ; preds = %132
  %139 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %140 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %139, i32 0, i32 1
  store i32 32, i32* %140, align 4
  br label %141

141:                                              ; preds = %138, %90
  %142 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %143 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %142, i32 0, i32 0
  %144 = load i8*, i8** %143, align 4
  store i8* %144, i8** %13, align 4
  store i8* %144, i8** %20, align 4
  br label %145

145:                                              ; preds = %5342, %141
  %146 = load i8*, i8** %15, align 4
  %147 = load i8*, i8** %16, align 4
  %148 = icmp ne i8* %146, %147
  br i1 %148, label %149, label %5343

149:                                              ; preds = %145
  br label %150

150:                                              ; preds = %149
  %151 = load i8*, i8** %15, align 4
  %152 = load i8*, i8** %16, align 4
  %153 = icmp eq i8* %151, %152
  br i1 %153, label %154, label %155

154:                                              ; preds = %150
  store i32 14, i32* %5, align 4
  br label %5372

155:                                              ; preds = %150
  %156 = load i8*, i8** %15, align 4
  %157 = getelementptr inbounds i8, i8* %156, i32 1
  store i8* %157, i8** %15, align 4
  %158 = load i8, i8* %156, align 1
  store i8 %158, i8* %10, align 1
  %159 = load i8*, i8** %17, align 4
  %160 = icmp ne i8* %159, null
  br i1 %160, label %161, label %167

161:                                              ; preds = %155
  %162 = load i8*, i8** %17, align 4
  %163 = load i8, i8* %10, align 1
  %164 = zext i8 %163 to i32
  %165 = getelementptr inbounds i8, i8* %162, i32 %164
  %166 = load i8, i8* %165, align 1
  store i8 %166, i8* %10, align 1
  br label %167

167:                                              ; preds = %161, %155
  br label %168

168:                                              ; preds = %167
  %169 = load i8, i8* %10, align 1
  %170 = zext i8 %169 to i32
  switch i32 %170, label %5005 [
    i32 94, label %171
    i32 36, label %311
    i32 43, label %450
    i32 63, label %450
    i32 42, label %461
    i32 46, label %1066
    i32 91, label %1189
    i32 40, label %2300
    i32 41, label %2306
    i32 10, label %2312
    i32 124, label %2318
    i32 123, label %2324
    i32 92, label %2334
  ]

171:                                              ; preds = %168
  %172 = load i8*, i8** %15, align 4
  %173 = load i8*, i8** %6, align 4
  %174 = getelementptr inbounds i8, i8* %173, i32 1
  %175 = icmp eq i8* %172, %174
  br i1 %175, label %187, label %176

176:                                              ; preds = %171
  %177 = load i32, i32* %8, align 4
  %178 = and i32 %177, 8
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %187, label %180

180:                                              ; preds = %176
  %181 = load i8*, i8** %6, align 4
  %182 = load i8*, i8** %15, align 4
  %183 = load i32, i32* %8, align 4
  %184 = call signext i8 @at_begline_loc_p(i8* %181, i8* %182, i32 %183)
  %185 = sext i8 %184 to i32
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %309

187:                                              ; preds = %180, %176, %171
  br label %188

188:                                              ; preds = %187
  br label %189

189:                                              ; preds = %304, %188
  %190 = load i8*, i8** %13, align 4
  %191 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %192 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %191, i32 0, i32 0
  %193 = load i8*, i8** %192, align 4
  %194 = ptrtoint i8* %190 to i32
  %195 = ptrtoint i8* %193 to i32
  %196 = sub i32 %194, %195
  %197 = add nsw i32 %196, 1
  %198 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %199 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %198, i32 0, i32 1
  %200 = load i32, i32* %199, align 4
  %201 = icmp ugt i32 %197, %200
  br i1 %201, label %202, label %305

202:                                              ; preds = %189
  br label %203

203:                                              ; preds = %202
  %204 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %205 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %204, i32 0, i32 0
  %206 = load i8*, i8** %205, align 4
  store i8* %206, i8** %24, align 4
  %207 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %208 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %207, i32 0, i32 1
  %209 = load i32, i32* %208, align 4
  %210 = icmp eq i32 %209, 65536
  br i1 %210, label %211, label %212

211:                                              ; preds = %203
  store i32 15, i32* %5, align 4
  br label %5372

212:                                              ; preds = %203
  %213 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %214 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %213, i32 0, i32 1
  %215 = load i32, i32* %214, align 4
  %216 = shl i32 %215, 1
  store i32 %216, i32* %214, align 4
  %217 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %218 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %217, i32 0, i32 1
  %219 = load i32, i32* %218, align 4
  %220 = icmp ugt i32 %219, 65536
  br i1 %220, label %221, label %224

221:                                              ; preds = %212
  %222 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %223 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %222, i32 0, i32 1
  store i32 65536, i32* %223, align 4
  br label %224

224:                                              ; preds = %221, %212
  %225 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %226 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %225, i32 0, i32 0
  %227 = load i8*, i8** %226, align 4
  %228 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %229 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %228, i32 0, i32 1
  %230 = load i32, i32* %229, align 4
  %231 = call i8* @realloc(i8* %227, i32 %230) #7
  %232 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %233 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %232, i32 0, i32 0
  store i8* %231, i8** %233, align 4
  %234 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %235 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %234, i32 0, i32 0
  %236 = load i8*, i8** %235, align 4
  %237 = icmp eq i8* %236, null
  br i1 %237, label %238, label %239

238:                                              ; preds = %224
  store i32 12, i32* %5, align 4
  br label %5372

239:                                              ; preds = %224
  %240 = load i8*, i8** %24, align 4
  %241 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %242 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %241, i32 0, i32 0
  %243 = load i8*, i8** %242, align 4
  %244 = icmp ne i8* %240, %243
  br i1 %244, label %245, label %303

245:                                              ; preds = %239
  %246 = load i8*, i8** %13, align 4
  %247 = load i8*, i8** %24, align 4
  %248 = ptrtoint i8* %246 to i32
  %249 = ptrtoint i8* %247 to i32
  %250 = sub i32 %248, %249
  %251 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %252 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %251, i32 0, i32 0
  %253 = load i8*, i8** %252, align 4
  %254 = getelementptr inbounds i8, i8* %253, i32 %250
  store i8* %254, i8** %13, align 4
  %255 = load i8*, i8** %20, align 4
  %256 = load i8*, i8** %24, align 4
  %257 = ptrtoint i8* %255 to i32
  %258 = ptrtoint i8* %256 to i32
  %259 = sub i32 %257, %258
  %260 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %261 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %260, i32 0, i32 0
  %262 = load i8*, i8** %261, align 4
  %263 = getelementptr inbounds i8, i8* %262, i32 %259
  store i8* %263, i8** %20, align 4
  %264 = load i8*, i8** %22, align 4
  %265 = icmp ne i8* %264, null
  br i1 %265, label %266, label %276

266:                                              ; preds = %245
  %267 = load i8*, i8** %22, align 4
  %268 = load i8*, i8** %24, align 4
  %269 = ptrtoint i8* %267 to i32
  %270 = ptrtoint i8* %268 to i32
  %271 = sub i32 %269, %270
  %272 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %273 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %272, i32 0, i32 0
  %274 = load i8*, i8** %273, align 4
  %275 = getelementptr inbounds i8, i8* %274, i32 %271
  store i8* %275, i8** %22, align 4
  br label %276

276:                                              ; preds = %266, %245
  %277 = load i8*, i8** %19, align 4
  %278 = icmp ne i8* %277, null
  br i1 %278, label %279, label %289

279:                                              ; preds = %276
  %280 = load i8*, i8** %19, align 4
  %281 = load i8*, i8** %24, align 4
  %282 = ptrtoint i8* %280 to i32
  %283 = ptrtoint i8* %281 to i32
  %284 = sub i32 %282, %283
  %285 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %286 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %285, i32 0, i32 0
  %287 = load i8*, i8** %286, align 4
  %288 = getelementptr inbounds i8, i8* %287, i32 %284
  store i8* %288, i8** %19, align 4
  br label %289

289:                                              ; preds = %279, %276
  %290 = load i8*, i8** %18, align 4
  %291 = icmp ne i8* %290, null
  br i1 %291, label %292, label %302

292:                                              ; preds = %289
  %293 = load i8*, i8** %18, align 4
  %294 = load i8*, i8** %24, align 4
  %295 = ptrtoint i8* %293 to i32
  %296 = ptrtoint i8* %294 to i32
  %297 = sub i32 %295, %296
  %298 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %299 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %298, i32 0, i32 0
  %300 = load i8*, i8** %299, align 4
  %301 = getelementptr inbounds i8, i8* %300, i32 %297
  store i8* %301, i8** %18, align 4
  br label %302

302:                                              ; preds = %292, %289
  br label %303

303:                                              ; preds = %302, %239
  br label %304

304:                                              ; preds = %303
  br label %189

305:                                              ; preds = %189
  %306 = load i8*, i8** %13, align 4
  %307 = getelementptr inbounds i8, i8* %306, i32 1
  store i8* %307, i8** %13, align 4
  store i8 8, i8* %306, align 1
  br label %308

308:                                              ; preds = %305
  br label %310

309:                                              ; preds = %180
  br label %5006

310:                                              ; preds = %308
  br label %5342

311:                                              ; preds = %168
  %312 = load i8*, i8** %15, align 4
  %313 = load i8*, i8** %16, align 4
  %314 = icmp eq i8* %312, %313
  br i1 %314, label %326, label %315

315:                                              ; preds = %311
  %316 = load i32, i32* %8, align 4
  %317 = and i32 %316, 8
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %326, label %319

319:                                              ; preds = %315
  %320 = load i8*, i8** %15, align 4
  %321 = load i8*, i8** %16, align 4
  %322 = load i32, i32* %8, align 4
  %323 = call signext i8 @at_endline_loc_p(i8* %320, i8* %321, i32 %322)
  %324 = sext i8 %323 to i32
  %325 = icmp ne i32 %324, 0
  br i1 %325, label %326, label %448

326:                                              ; preds = %319, %315, %311
  br label %327

327:                                              ; preds = %326
  br label %328

328:                                              ; preds = %443, %327
  %329 = load i8*, i8** %13, align 4
  %330 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %331 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %330, i32 0, i32 0
  %332 = load i8*, i8** %331, align 4
  %333 = ptrtoint i8* %329 to i32
  %334 = ptrtoint i8* %332 to i32
  %335 = sub i32 %333, %334
  %336 = add nsw i32 %335, 1
  %337 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %338 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %337, i32 0, i32 1
  %339 = load i32, i32* %338, align 4
  %340 = icmp ugt i32 %336, %339
  br i1 %340, label %341, label %444

341:                                              ; preds = %328
  br label %342

342:                                              ; preds = %341
  %343 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %344 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %343, i32 0, i32 0
  %345 = load i8*, i8** %344, align 4
  store i8* %345, i8** %25, align 4
  %346 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %347 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %346, i32 0, i32 1
  %348 = load i32, i32* %347, align 4
  %349 = icmp eq i32 %348, 65536
  br i1 %349, label %350, label %351

350:                                              ; preds = %342
  store i32 15, i32* %5, align 4
  br label %5372

351:                                              ; preds = %342
  %352 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %353 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %352, i32 0, i32 1
  %354 = load i32, i32* %353, align 4
  %355 = shl i32 %354, 1
  store i32 %355, i32* %353, align 4
  %356 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %357 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %356, i32 0, i32 1
  %358 = load i32, i32* %357, align 4
  %359 = icmp ugt i32 %358, 65536
  br i1 %359, label %360, label %363

360:                                              ; preds = %351
  %361 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %362 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %361, i32 0, i32 1
  store i32 65536, i32* %362, align 4
  br label %363

363:                                              ; preds = %360, %351
  %364 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %365 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %364, i32 0, i32 0
  %366 = load i8*, i8** %365, align 4
  %367 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %368 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %367, i32 0, i32 1
  %369 = load i32, i32* %368, align 4
  %370 = call i8* @realloc(i8* %366, i32 %369) #7
  %371 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %372 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %371, i32 0, i32 0
  store i8* %370, i8** %372, align 4
  %373 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %374 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %373, i32 0, i32 0
  %375 = load i8*, i8** %374, align 4
  %376 = icmp eq i8* %375, null
  br i1 %376, label %377, label %378

377:                                              ; preds = %363
  store i32 12, i32* %5, align 4
  br label %5372

378:                                              ; preds = %363
  %379 = load i8*, i8** %25, align 4
  %380 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %381 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %380, i32 0, i32 0
  %382 = load i8*, i8** %381, align 4
  %383 = icmp ne i8* %379, %382
  br i1 %383, label %384, label %442

384:                                              ; preds = %378
  %385 = load i8*, i8** %13, align 4
  %386 = load i8*, i8** %25, align 4
  %387 = ptrtoint i8* %385 to i32
  %388 = ptrtoint i8* %386 to i32
  %389 = sub i32 %387, %388
  %390 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %391 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %390, i32 0, i32 0
  %392 = load i8*, i8** %391, align 4
  %393 = getelementptr inbounds i8, i8* %392, i32 %389
  store i8* %393, i8** %13, align 4
  %394 = load i8*, i8** %20, align 4
  %395 = load i8*, i8** %25, align 4
  %396 = ptrtoint i8* %394 to i32
  %397 = ptrtoint i8* %395 to i32
  %398 = sub i32 %396, %397
  %399 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %400 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %399, i32 0, i32 0
  %401 = load i8*, i8** %400, align 4
  %402 = getelementptr inbounds i8, i8* %401, i32 %398
  store i8* %402, i8** %20, align 4
  %403 = load i8*, i8** %22, align 4
  %404 = icmp ne i8* %403, null
  br i1 %404, label %405, label %415

405:                                              ; preds = %384
  %406 = load i8*, i8** %22, align 4
  %407 = load i8*, i8** %25, align 4
  %408 = ptrtoint i8* %406 to i32
  %409 = ptrtoint i8* %407 to i32
  %410 = sub i32 %408, %409
  %411 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %412 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %411, i32 0, i32 0
  %413 = load i8*, i8** %412, align 4
  %414 = getelementptr inbounds i8, i8* %413, i32 %410
  store i8* %414, i8** %22, align 4
  br label %415

415:                                              ; preds = %405, %384
  %416 = load i8*, i8** %19, align 4
  %417 = icmp ne i8* %416, null
  br i1 %417, label %418, label %428

418:                                              ; preds = %415
  %419 = load i8*, i8** %19, align 4
  %420 = load i8*, i8** %25, align 4
  %421 = ptrtoint i8* %419 to i32
  %422 = ptrtoint i8* %420 to i32
  %423 = sub i32 %421, %422
  %424 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %425 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %424, i32 0, i32 0
  %426 = load i8*, i8** %425, align 4
  %427 = getelementptr inbounds i8, i8* %426, i32 %423
  store i8* %427, i8** %19, align 4
  br label %428

428:                                              ; preds = %418, %415
  %429 = load i8*, i8** %18, align 4
  %430 = icmp ne i8* %429, null
  br i1 %430, label %431, label %441

431:                                              ; preds = %428
  %432 = load i8*, i8** %18, align 4
  %433 = load i8*, i8** %25, align 4
  %434 = ptrtoint i8* %432 to i32
  %435 = ptrtoint i8* %433 to i32
  %436 = sub i32 %434, %435
  %437 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %438 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %437, i32 0, i32 0
  %439 = load i8*, i8** %438, align 4
  %440 = getelementptr inbounds i8, i8* %439, i32 %436
  store i8* %440, i8** %18, align 4
  br label %441

441:                                              ; preds = %431, %428
  br label %442

442:                                              ; preds = %441, %378
  br label %443

443:                                              ; preds = %442
  br label %328

444:                                              ; preds = %328
  %445 = load i8*, i8** %13, align 4
  %446 = getelementptr inbounds i8, i8* %445, i32 1
  store i8* %446, i8** %13, align 4
  store i8 9, i8* %445, align 1
  br label %447

447:                                              ; preds = %444
  br label %449

448:                                              ; preds = %319
  br label %5006

449:                                              ; preds = %447
  br label %5342

450:                                              ; preds = %168, %168
  %451 = load i32, i32* %8, align 4
  %452 = and i32 %451, 2
  %453 = icmp ne i32 %452, 0
  br i1 %453, label %458, label %454

454:                                              ; preds = %450
  %455 = load i32, i32* %8, align 4
  %456 = and i32 %455, 1024
  %457 = icmp ne i32 %456, 0
  br i1 %457, label %458, label %459

458:                                              ; preds = %454, %450
  br label %5006

459:                                              ; preds = %454
  br label %460

460:                                              ; preds = %4985, %459
  br label %461

461:                                              ; preds = %168, %460
  %462 = load i8*, i8** %19, align 4
  %463 = icmp ne i8* %462, null
  br i1 %463, label %476, label %464

464:                                              ; preds = %461
  %465 = load i32, i32* %8, align 4
  %466 = and i32 %465, 32
  %467 = icmp ne i32 %466, 0
  br i1 %467, label %468, label %469

468:                                              ; preds = %464
  store i32 13, i32* %5, align 4
  br label %5372

469:                                              ; preds = %464
  %470 = load i32, i32* %8, align 4
  %471 = and i32 %470, 16
  %472 = icmp ne i32 %471, 0
  br i1 %472, label %474, label %473

473:                                              ; preds = %469
  br label %5006

474:                                              ; preds = %469
  br label %475

475:                                              ; preds = %474
  br label %476

476:                                              ; preds = %475, %461
  store i8 0, i8* %26, align 1
  store i8 0, i8* %27, align 1
  store i8 0, i8* %28, align 1
  br label %477

477:                                              ; preds = %585, %476
  %478 = load i8, i8* %10, align 1
  %479 = zext i8 %478 to i32
  %480 = icmp ne i32 %479, 43
  %481 = zext i1 %480 to i32
  %482 = load i8, i8* %27, align 1
  %483 = sext i8 %482 to i32
  %484 = or i32 %483, %481
  %485 = trunc i32 %484 to i8
  store i8 %485, i8* %27, align 1
  %486 = load i8, i8* %10, align 1
  %487 = zext i8 %486 to i32
  %488 = icmp ne i32 %487, 63
  %489 = zext i1 %488 to i32
  %490 = load i8, i8* %28, align 1
  %491 = sext i8 %490 to i32
  %492 = or i32 %491, %489
  %493 = trunc i32 %492 to i8
  store i8 %493, i8* %28, align 1
  %494 = load i8*, i8** %15, align 4
  %495 = load i8*, i8** %16, align 4
  %496 = icmp eq i8* %494, %495
  br i1 %496, label %497, label %498

497:                                              ; preds = %477
  br label %586

498:                                              ; preds = %477
  br label %499

499:                                              ; preds = %498
  %500 = load i8*, i8** %15, align 4
  %501 = load i8*, i8** %16, align 4
  %502 = icmp eq i8* %500, %501
  br i1 %502, label %503, label %504

503:                                              ; preds = %499
  store i32 14, i32* %5, align 4
  br label %5372

504:                                              ; preds = %499
  %505 = load i8*, i8** %15, align 4
  %506 = getelementptr inbounds i8, i8* %505, i32 1
  store i8* %506, i8** %15, align 4
  %507 = load i8, i8* %505, align 1
  store i8 %507, i8* %10, align 1
  %508 = load i8*, i8** %17, align 4
  %509 = icmp ne i8* %508, null
  br i1 %509, label %510, label %516

510:                                              ; preds = %504
  %511 = load i8*, i8** %17, align 4
  %512 = load i8, i8* %10, align 1
  %513 = zext i8 %512 to i32
  %514 = getelementptr inbounds i8, i8* %511, i32 %513
  %515 = load i8, i8* %514, align 1
  store i8 %515, i8* %10, align 1
  br label %516

516:                                              ; preds = %510, %504
  br label %517

517:                                              ; preds = %516
  %518 = load i8, i8* %10, align 1
  %519 = zext i8 %518 to i32
  %520 = icmp eq i32 %519, 42
  br i1 %520, label %533, label %521

521:                                              ; preds = %517
  %522 = load i32, i32* %8, align 4
  %523 = and i32 %522, 2
  %524 = icmp ne i32 %523, 0
  br i1 %524, label %534, label %525

525:                                              ; preds = %521
  %526 = load i8, i8* %10, align 1
  %527 = zext i8 %526 to i32
  %528 = icmp eq i32 %527, 43
  br i1 %528, label %533, label %529

529:                                              ; preds = %525
  %530 = load i8, i8* %10, align 1
  %531 = zext i8 %530 to i32
  %532 = icmp eq i32 %531, 63
  br i1 %532, label %533, label %534

533:                                              ; preds = %529, %525, %517
  br label %585

534:                                              ; preds = %529, %521
  %535 = load i32, i32* %8, align 4
  %536 = and i32 %535, 2
  %537 = icmp ne i32 %536, 0
  br i1 %537, label %538, label %581

538:                                              ; preds = %534
  %539 = load i8, i8* %10, align 1
  %540 = zext i8 %539 to i32
  %541 = icmp eq i32 %540, 92
  br i1 %541, label %542, label %581

542:                                              ; preds = %538
  %543 = load i8*, i8** %15, align 4
  %544 = load i8*, i8** %16, align 4
  %545 = icmp eq i8* %543, %544
  br i1 %545, label %546, label %547

546:                                              ; preds = %542
  store i32 5, i32* %5, align 4
  br label %5372

547:                                              ; preds = %542
  br label %548

548:                                              ; preds = %547
  %549 = load i8*, i8** %15, align 4
  %550 = load i8*, i8** %16, align 4
  %551 = icmp eq i8* %549, %550
  br i1 %551, label %552, label %553

552:                                              ; preds = %548
  store i32 14, i32* %5, align 4
  br label %5372

553:                                              ; preds = %548
  %554 = load i8*, i8** %15, align 4
  %555 = getelementptr inbounds i8, i8* %554, i32 1
  store i8* %555, i8** %15, align 4
  %556 = load i8, i8* %554, align 1
  store i8 %556, i8* %11, align 1
  %557 = load i8*, i8** %17, align 4
  %558 = icmp ne i8* %557, null
  br i1 %558, label %559, label %565

559:                                              ; preds = %553
  %560 = load i8*, i8** %17, align 4
  %561 = load i8, i8* %11, align 1
  %562 = zext i8 %561 to i32
  %563 = getelementptr inbounds i8, i8* %560, i32 %562
  %564 = load i8, i8* %563, align 1
  store i8 %564, i8* %11, align 1
  br label %565

565:                                              ; preds = %559, %553
  br label %566

566:                                              ; preds = %565
  %567 = load i8, i8* %11, align 1
  %568 = zext i8 %567 to i32
  %569 = icmp eq i32 %568, 43
  br i1 %569, label %579, label %570

570:                                              ; preds = %566
  %571 = load i8, i8* %11, align 1
  %572 = zext i8 %571 to i32
  %573 = icmp eq i32 %572, 63
  br i1 %573, label %579, label %574

574:                                              ; preds = %570
  %575 = load i8*, i8** %15, align 4
  %576 = getelementptr inbounds i8, i8* %575, i32 -1
  store i8* %576, i8** %15, align 4
  %577 = load i8*, i8** %15, align 4
  %578 = getelementptr inbounds i8, i8* %577, i32 -1
  store i8* %578, i8** %15, align 4
  br label %586

579:                                              ; preds = %570, %566
  %580 = load i8, i8* %11, align 1
  store i8 %580, i8* %10, align 1
  br label %584

581:                                              ; preds = %538, %534
  %582 = load i8*, i8** %15, align 4
  %583 = getelementptr inbounds i8, i8* %582, i32 -1
  store i8* %583, i8** %15, align 4
  br label %586

584:                                              ; preds = %579
  br label %585

585:                                              ; preds = %584, %533
  br label %477

586:                                              ; preds = %581, %574, %497
  %587 = load i8*, i8** %19, align 4
  %588 = icmp ne i8* %587, null
  br i1 %588, label %590, label %589

589:                                              ; preds = %586
  br label %5342

590:                                              ; preds = %586
  %591 = load i8, i8* %28, align 1
  %592 = icmp ne i8 %591, 0
  br i1 %592, label %593, label %800

593:                                              ; preds = %590
  br label %594

594:                                              ; preds = %709, %593
  %595 = load i8*, i8** %13, align 4
  %596 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %597 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %596, i32 0, i32 0
  %598 = load i8*, i8** %597, align 4
  %599 = ptrtoint i8* %595 to i32
  %600 = ptrtoint i8* %598 to i32
  %601 = sub i32 %599, %600
  %602 = add nsw i32 %601, 3
  %603 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %604 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %603, i32 0, i32 1
  %605 = load i32, i32* %604, align 4
  %606 = icmp ugt i32 %602, %605
  br i1 %606, label %607, label %710

607:                                              ; preds = %594
  br label %608

608:                                              ; preds = %607
  %609 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %610 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %609, i32 0, i32 0
  %611 = load i8*, i8** %610, align 4
  store i8* %611, i8** %29, align 4
  %612 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %613 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %612, i32 0, i32 1
  %614 = load i32, i32* %613, align 4
  %615 = icmp eq i32 %614, 65536
  br i1 %615, label %616, label %617

616:                                              ; preds = %608
  store i32 15, i32* %5, align 4
  br label %5372

617:                                              ; preds = %608
  %618 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %619 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %618, i32 0, i32 1
  %620 = load i32, i32* %619, align 4
  %621 = shl i32 %620, 1
  store i32 %621, i32* %619, align 4
  %622 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %623 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %622, i32 0, i32 1
  %624 = load i32, i32* %623, align 4
  %625 = icmp ugt i32 %624, 65536
  br i1 %625, label %626, label %629

626:                                              ; preds = %617
  %627 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %628 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %627, i32 0, i32 1
  store i32 65536, i32* %628, align 4
  br label %629

629:                                              ; preds = %626, %617
  %630 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %631 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %630, i32 0, i32 0
  %632 = load i8*, i8** %631, align 4
  %633 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %634 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %633, i32 0, i32 1
  %635 = load i32, i32* %634, align 4
  %636 = call i8* @realloc(i8* %632, i32 %635) #7
  %637 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %638 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %637, i32 0, i32 0
  store i8* %636, i8** %638, align 4
  %639 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %640 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %639, i32 0, i32 0
  %641 = load i8*, i8** %640, align 4
  %642 = icmp eq i8* %641, null
  br i1 %642, label %643, label %644

643:                                              ; preds = %629
  store i32 12, i32* %5, align 4
  br label %5372

644:                                              ; preds = %629
  %645 = load i8*, i8** %29, align 4
  %646 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %647 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %646, i32 0, i32 0
  %648 = load i8*, i8** %647, align 4
  %649 = icmp ne i8* %645, %648
  br i1 %649, label %650, label %708

650:                                              ; preds = %644
  %651 = load i8*, i8** %13, align 4
  %652 = load i8*, i8** %29, align 4
  %653 = ptrtoint i8* %651 to i32
  %654 = ptrtoint i8* %652 to i32
  %655 = sub i32 %653, %654
  %656 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %657 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %656, i32 0, i32 0
  %658 = load i8*, i8** %657, align 4
  %659 = getelementptr inbounds i8, i8* %658, i32 %655
  store i8* %659, i8** %13, align 4
  %660 = load i8*, i8** %20, align 4
  %661 = load i8*, i8** %29, align 4
  %662 = ptrtoint i8* %660 to i32
  %663 = ptrtoint i8* %661 to i32
  %664 = sub i32 %662, %663
  %665 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %666 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %665, i32 0, i32 0
  %667 = load i8*, i8** %666, align 4
  %668 = getelementptr inbounds i8, i8* %667, i32 %664
  store i8* %668, i8** %20, align 4
  %669 = load i8*, i8** %22, align 4
  %670 = icmp ne i8* %669, null
  br i1 %670, label %671, label %681

671:                                              ; preds = %650
  %672 = load i8*, i8** %22, align 4
  %673 = load i8*, i8** %29, align 4
  %674 = ptrtoint i8* %672 to i32
  %675 = ptrtoint i8* %673 to i32
  %676 = sub i32 %674, %675
  %677 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %678 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %677, i32 0, i32 0
  %679 = load i8*, i8** %678, align 4
  %680 = getelementptr inbounds i8, i8* %679, i32 %676
  store i8* %680, i8** %22, align 4
  br label %681

681:                                              ; preds = %671, %650
  %682 = load i8*, i8** %19, align 4
  %683 = icmp ne i8* %682, null
  br i1 %683, label %684, label %694

684:                                              ; preds = %681
  %685 = load i8*, i8** %19, align 4
  %686 = load i8*, i8** %29, align 4
  %687 = ptrtoint i8* %685 to i32
  %688 = ptrtoint i8* %686 to i32
  %689 = sub i32 %687, %688
  %690 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %691 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %690, i32 0, i32 0
  %692 = load i8*, i8** %691, align 4
  %693 = getelementptr inbounds i8, i8* %692, i32 %689
  store i8* %693, i8** %19, align 4
  br label %694

694:                                              ; preds = %684, %681
  %695 = load i8*, i8** %18, align 4
  %696 = icmp ne i8* %695, null
  br i1 %696, label %697, label %707

697:                                              ; preds = %694
  %698 = load i8*, i8** %18, align 4
  %699 = load i8*, i8** %29, align 4
  %700 = ptrtoint i8* %698 to i32
  %701 = ptrtoint i8* %699 to i32
  %702 = sub i32 %700, %701
  %703 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %704 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %703, i32 0, i32 0
  %705 = load i8*, i8** %704, align 4
  %706 = getelementptr inbounds i8, i8* %705, i32 %702
  store i8* %706, i8** %18, align 4
  br label %707

707:                                              ; preds = %697, %694
  br label %708

708:                                              ; preds = %707, %644
  br label %709

709:                                              ; preds = %708
  br label %594

710:                                              ; preds = %594
  %711 = load i8*, i8** %17, align 4
  %712 = icmp ne i8* %711, null
  br i1 %712, label %713, label %722

713:                                              ; preds = %710
  %714 = load i8*, i8** %17, align 4
  %715 = load i8*, i8** %15, align 4
  %716 = getelementptr inbounds i8, i8* %715, i32 -2
  %717 = load i8, i8* %716, align 1
  %718 = zext i8 %717 to i32
  %719 = getelementptr inbounds i8, i8* %714, i32 %718
  %720 = load i8, i8* %719, align 1
  %721 = sext i8 %720 to i32
  br label %727

722:                                              ; preds = %710
  %723 = load i8*, i8** %15, align 4
  %724 = getelementptr inbounds i8, i8* %723, i32 -2
  %725 = load i8, i8* %724, align 1
  %726 = sext i8 %725 to i32
  br label %727

727:                                              ; preds = %722, %713
  %728 = phi i32 [ %721, %713 ], [ %726, %722 ]
  %729 = load i8*, i8** %17, align 4
  %730 = icmp ne i8* %729, null
  br i1 %730, label %731, label %736

731:                                              ; preds = %727
  %732 = load i8*, i8** %17, align 4
  %733 = getelementptr inbounds i8, i8* %732, i32 46
  %734 = load i8, i8* %733, align 1
  %735 = sext i8 %734 to i32
  br label %737

736:                                              ; preds = %727
  br label %737

737:                                              ; preds = %736, %731
  %738 = phi i32 [ %735, %731 ], [ 46, %736 ]
  %739 = icmp eq i32 %728, %738
  br i1 %739, label %740, label %788

740:                                              ; preds = %737
  %741 = load i8, i8* %27, align 1
  %742 = sext i8 %741 to i32
  %743 = icmp ne i32 %742, 0
  br i1 %743, label %744, label %788

744:                                              ; preds = %740
  %745 = load i8*, i8** %15, align 4
  %746 = load i8*, i8** %16, align 4
  %747 = icmp ult i8* %745, %746
  br i1 %747, label %748, label %788

748:                                              ; preds = %744
  %749 = load i8*, i8** %17, align 4
  %750 = icmp ne i8* %749, null
  br i1 %750, label %751, label %759

751:                                              ; preds = %748
  %752 = load i8*, i8** %17, align 4
  %753 = load i8*, i8** %15, align 4
  %754 = load i8, i8* %753, align 1
  %755 = zext i8 %754 to i32
  %756 = getelementptr inbounds i8, i8* %752, i32 %755
  %757 = load i8, i8* %756, align 1
  %758 = sext i8 %757 to i32
  br label %763

759:                                              ; preds = %748
  %760 = load i8*, i8** %15, align 4
  %761 = load i8, i8* %760, align 1
  %762 = sext i8 %761 to i32
  br label %763

763:                                              ; preds = %759, %751
  %764 = phi i32 [ %758, %751 ], [ %762, %759 ]
  %765 = load i8*, i8** %17, align 4
  %766 = icmp ne i8* %765, null
  br i1 %766, label %767, label %772

767:                                              ; preds = %763
  %768 = load i8*, i8** %17, align 4
  %769 = getelementptr inbounds i8, i8* %768, i32 10
  %770 = load i8, i8* %769, align 1
  %771 = sext i8 %770 to i32
  br label %773

772:                                              ; preds = %763
  br label %773

773:                                              ; preds = %772, %767
  %774 = phi i32 [ %771, %767 ], [ 10, %772 ]
  %775 = icmp eq i32 %764, %774
  br i1 %775, label %776, label %788

776:                                              ; preds = %773
  %777 = load i32, i32* %8, align 4
  %778 = and i32 %777, 64
  %779 = icmp ne i32 %778, 0
  br i1 %779, label %788, label %780

780:                                              ; preds = %776
  %781 = load i8*, i8** %13, align 4
  %782 = load i8*, i8** %19, align 4
  %783 = load i8*, i8** %13, align 4
  %784 = ptrtoint i8* %782 to i32
  %785 = ptrtoint i8* %783 to i32
  %786 = sub i32 %784, %785
  %787 = sub nsw i32 %786, 3
  call void @store_op1(i32 12, i8* %781, i32 %787)
  store i8 1, i8* %26, align 1
  br label %797

788:                                              ; preds = %776, %773, %744, %740, %737
  %789 = load i8*, i8** %13, align 4
  %790 = load i8*, i8** %19, align 4
  %791 = getelementptr inbounds i8, i8* %790, i32 -3
  %792 = load i8*, i8** %13, align 4
  %793 = ptrtoint i8* %791 to i32
  %794 = ptrtoint i8* %792 to i32
  %795 = sub i32 %793, %794
  %796 = sub nsw i32 %795, 3
  call void @store_op1(i32 17, i8* %789, i32 %796)
  br label %797

797:                                              ; preds = %788, %780
  %798 = load i8*, i8** %13, align 4
  %799 = getelementptr inbounds i8, i8* %798, i32 3
  store i8* %799, i8** %13, align 4
  br label %800

800:                                              ; preds = %797, %590
  br label %801

801:                                              ; preds = %916, %800
  %802 = load i8*, i8** %13, align 4
  %803 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %804 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %803, i32 0, i32 0
  %805 = load i8*, i8** %804, align 4
  %806 = ptrtoint i8* %802 to i32
  %807 = ptrtoint i8* %805 to i32
  %808 = sub i32 %806, %807
  %809 = add nsw i32 %808, 3
  %810 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %811 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %810, i32 0, i32 1
  %812 = load i32, i32* %811, align 4
  %813 = icmp ugt i32 %809, %812
  br i1 %813, label %814, label %917

814:                                              ; preds = %801
  br label %815

815:                                              ; preds = %814
  %816 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %817 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %816, i32 0, i32 0
  %818 = load i8*, i8** %817, align 4
  store i8* %818, i8** %30, align 4
  %819 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %820 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %819, i32 0, i32 1
  %821 = load i32, i32* %820, align 4
  %822 = icmp eq i32 %821, 65536
  br i1 %822, label %823, label %824

823:                                              ; preds = %815
  store i32 15, i32* %5, align 4
  br label %5372

824:                                              ; preds = %815
  %825 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %826 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %825, i32 0, i32 1
  %827 = load i32, i32* %826, align 4
  %828 = shl i32 %827, 1
  store i32 %828, i32* %826, align 4
  %829 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %830 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %829, i32 0, i32 1
  %831 = load i32, i32* %830, align 4
  %832 = icmp ugt i32 %831, 65536
  br i1 %832, label %833, label %836

833:                                              ; preds = %824
  %834 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %835 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %834, i32 0, i32 1
  store i32 65536, i32* %835, align 4
  br label %836

836:                                              ; preds = %833, %824
  %837 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %838 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %837, i32 0, i32 0
  %839 = load i8*, i8** %838, align 4
  %840 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %841 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %840, i32 0, i32 1
  %842 = load i32, i32* %841, align 4
  %843 = call i8* @realloc(i8* %839, i32 %842) #7
  %844 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %845 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %844, i32 0, i32 0
  store i8* %843, i8** %845, align 4
  %846 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %847 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %846, i32 0, i32 0
  %848 = load i8*, i8** %847, align 4
  %849 = icmp eq i8* %848, null
  br i1 %849, label %850, label %851

850:                                              ; preds = %836
  store i32 12, i32* %5, align 4
  br label %5372

851:                                              ; preds = %836
  %852 = load i8*, i8** %30, align 4
  %853 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %854 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %853, i32 0, i32 0
  %855 = load i8*, i8** %854, align 4
  %856 = icmp ne i8* %852, %855
  br i1 %856, label %857, label %915

857:                                              ; preds = %851
  %858 = load i8*, i8** %13, align 4
  %859 = load i8*, i8** %30, align 4
  %860 = ptrtoint i8* %858 to i32
  %861 = ptrtoint i8* %859 to i32
  %862 = sub i32 %860, %861
  %863 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %864 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %863, i32 0, i32 0
  %865 = load i8*, i8** %864, align 4
  %866 = getelementptr inbounds i8, i8* %865, i32 %862
  store i8* %866, i8** %13, align 4
  %867 = load i8*, i8** %20, align 4
  %868 = load i8*, i8** %30, align 4
  %869 = ptrtoint i8* %867 to i32
  %870 = ptrtoint i8* %868 to i32
  %871 = sub i32 %869, %870
  %872 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %873 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %872, i32 0, i32 0
  %874 = load i8*, i8** %873, align 4
  %875 = getelementptr inbounds i8, i8* %874, i32 %871
  store i8* %875, i8** %20, align 4
  %876 = load i8*, i8** %22, align 4
  %877 = icmp ne i8* %876, null
  br i1 %877, label %878, label %888

878:                                              ; preds = %857
  %879 = load i8*, i8** %22, align 4
  %880 = load i8*, i8** %30, align 4
  %881 = ptrtoint i8* %879 to i32
  %882 = ptrtoint i8* %880 to i32
  %883 = sub i32 %881, %882
  %884 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %885 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %884, i32 0, i32 0
  %886 = load i8*, i8** %885, align 4
  %887 = getelementptr inbounds i8, i8* %886, i32 %883
  store i8* %887, i8** %22, align 4
  br label %888

888:                                              ; preds = %878, %857
  %889 = load i8*, i8** %19, align 4
  %890 = icmp ne i8* %889, null
  br i1 %890, label %891, label %901

891:                                              ; preds = %888
  %892 = load i8*, i8** %19, align 4
  %893 = load i8*, i8** %30, align 4
  %894 = ptrtoint i8* %892 to i32
  %895 = ptrtoint i8* %893 to i32
  %896 = sub i32 %894, %895
  %897 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %898 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %897, i32 0, i32 0
  %899 = load i8*, i8** %898, align 4
  %900 = getelementptr inbounds i8, i8* %899, i32 %896
  store i8* %900, i8** %19, align 4
  br label %901

901:                                              ; preds = %891, %888
  %902 = load i8*, i8** %18, align 4
  %903 = icmp ne i8* %902, null
  br i1 %903, label %904, label %914

904:                                              ; preds = %901
  %905 = load i8*, i8** %18, align 4
  %906 = load i8*, i8** %30, align 4
  %907 = ptrtoint i8* %905 to i32
  %908 = ptrtoint i8* %906 to i32
  %909 = sub i32 %907, %908
  %910 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %911 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %910, i32 0, i32 0
  %912 = load i8*, i8** %911, align 4
  %913 = getelementptr inbounds i8, i8* %912, i32 %909
  store i8* %913, i8** %18, align 4
  br label %914

914:                                              ; preds = %904, %901
  br label %915

915:                                              ; preds = %914, %851
  br label %916

916:                                              ; preds = %915
  br label %801

917:                                              ; preds = %801
  %918 = load i8, i8* %26, align 1
  %919 = sext i8 %918 to i32
  %920 = icmp ne i32 %919, 0
  %921 = zext i1 %920 to i64
  %922 = select i1 %920, i32 15, i32 14
  %923 = load i8*, i8** %19, align 4
  %924 = load i8*, i8** %13, align 4
  %925 = getelementptr inbounds i8, i8* %924, i32 3
  %926 = load i8*, i8** %19, align 4
  %927 = ptrtoint i8* %925 to i32
  %928 = ptrtoint i8* %926 to i32
  %929 = sub i32 %927, %928
  %930 = sub nsw i32 %929, 3
  %931 = load i8*, i8** %13, align 4
  call void @insert_op1(i32 %922, i8* %923, i32 %930, i8* %931)
  store i8* null, i8** %18, align 4
  %932 = load i8*, i8** %13, align 4
  %933 = getelementptr inbounds i8, i8* %932, i32 3
  store i8* %933, i8** %13, align 4
  %934 = load i8, i8* %27, align 1
  %935 = icmp ne i8 %934, 0
  br i1 %935, label %1065, label %936

936:                                              ; preds = %917
  br label %937

937:                                              ; preds = %1052, %936
  %938 = load i8*, i8** %13, align 4
  %939 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %940 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %939, i32 0, i32 0
  %941 = load i8*, i8** %940, align 4
  %942 = ptrtoint i8* %938 to i32
  %943 = ptrtoint i8* %941 to i32
  %944 = sub i32 %942, %943
  %945 = add nsw i32 %944, 3
  %946 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %947 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %946, i32 0, i32 1
  %948 = load i32, i32* %947, align 4
  %949 = icmp ugt i32 %945, %948
  br i1 %949, label %950, label %1053

950:                                              ; preds = %937
  br label %951

951:                                              ; preds = %950
  %952 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %953 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %952, i32 0, i32 0
  %954 = load i8*, i8** %953, align 4
  store i8* %954, i8** %31, align 4
  %955 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %956 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %955, i32 0, i32 1
  %957 = load i32, i32* %956, align 4
  %958 = icmp eq i32 %957, 65536
  br i1 %958, label %959, label %960

959:                                              ; preds = %951
  store i32 15, i32* %5, align 4
  br label %5372

960:                                              ; preds = %951
  %961 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %962 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %961, i32 0, i32 1
  %963 = load i32, i32* %962, align 4
  %964 = shl i32 %963, 1
  store i32 %964, i32* %962, align 4
  %965 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %966 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %965, i32 0, i32 1
  %967 = load i32, i32* %966, align 4
  %968 = icmp ugt i32 %967, 65536
  br i1 %968, label %969, label %972

969:                                              ; preds = %960
  %970 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %971 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %970, i32 0, i32 1
  store i32 65536, i32* %971, align 4
  br label %972

972:                                              ; preds = %969, %960
  %973 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %974 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %973, i32 0, i32 0
  %975 = load i8*, i8** %974, align 4
  %976 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %977 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %976, i32 0, i32 1
  %978 = load i32, i32* %977, align 4
  %979 = call i8* @realloc(i8* %975, i32 %978) #7
  %980 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %981 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %980, i32 0, i32 0
  store i8* %979, i8** %981, align 4
  %982 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %983 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %982, i32 0, i32 0
  %984 = load i8*, i8** %983, align 4
  %985 = icmp eq i8* %984, null
  br i1 %985, label %986, label %987

986:                                              ; preds = %972
  store i32 12, i32* %5, align 4
  br label %5372

987:                                              ; preds = %972
  %988 = load i8*, i8** %31, align 4
  %989 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %990 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %989, i32 0, i32 0
  %991 = load i8*, i8** %990, align 4
  %992 = icmp ne i8* %988, %991
  br i1 %992, label %993, label %1051

993:                                              ; preds = %987
  %994 = load i8*, i8** %13, align 4
  %995 = load i8*, i8** %31, align 4
  %996 = ptrtoint i8* %994 to i32
  %997 = ptrtoint i8* %995 to i32
  %998 = sub i32 %996, %997
  %999 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1000 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %999, i32 0, i32 0
  %1001 = load i8*, i8** %1000, align 4
  %1002 = getelementptr inbounds i8, i8* %1001, i32 %998
  store i8* %1002, i8** %13, align 4
  %1003 = load i8*, i8** %20, align 4
  %1004 = load i8*, i8** %31, align 4
  %1005 = ptrtoint i8* %1003 to i32
  %1006 = ptrtoint i8* %1004 to i32
  %1007 = sub i32 %1005, %1006
  %1008 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1009 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1008, i32 0, i32 0
  %1010 = load i8*, i8** %1009, align 4
  %1011 = getelementptr inbounds i8, i8* %1010, i32 %1007
  store i8* %1011, i8** %20, align 4
  %1012 = load i8*, i8** %22, align 4
  %1013 = icmp ne i8* %1012, null
  br i1 %1013, label %1014, label %1024

1014:                                             ; preds = %993
  %1015 = load i8*, i8** %22, align 4
  %1016 = load i8*, i8** %31, align 4
  %1017 = ptrtoint i8* %1015 to i32
  %1018 = ptrtoint i8* %1016 to i32
  %1019 = sub i32 %1017, %1018
  %1020 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1021 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1020, i32 0, i32 0
  %1022 = load i8*, i8** %1021, align 4
  %1023 = getelementptr inbounds i8, i8* %1022, i32 %1019
  store i8* %1023, i8** %22, align 4
  br label %1024

1024:                                             ; preds = %1014, %993
  %1025 = load i8*, i8** %19, align 4
  %1026 = icmp ne i8* %1025, null
  br i1 %1026, label %1027, label %1037

1027:                                             ; preds = %1024
  %1028 = load i8*, i8** %19, align 4
  %1029 = load i8*, i8** %31, align 4
  %1030 = ptrtoint i8* %1028 to i32
  %1031 = ptrtoint i8* %1029 to i32
  %1032 = sub i32 %1030, %1031
  %1033 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1034 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1033, i32 0, i32 0
  %1035 = load i8*, i8** %1034, align 4
  %1036 = getelementptr inbounds i8, i8* %1035, i32 %1032
  store i8* %1036, i8** %19, align 4
  br label %1037

1037:                                             ; preds = %1027, %1024
  %1038 = load i8*, i8** %18, align 4
  %1039 = icmp ne i8* %1038, null
  br i1 %1039, label %1040, label %1050

1040:                                             ; preds = %1037
  %1041 = load i8*, i8** %18, align 4
  %1042 = load i8*, i8** %31, align 4
  %1043 = ptrtoint i8* %1041 to i32
  %1044 = ptrtoint i8* %1042 to i32
  %1045 = sub i32 %1043, %1044
  %1046 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1047 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1046, i32 0, i32 0
  %1048 = load i8*, i8** %1047, align 4
  %1049 = getelementptr inbounds i8, i8* %1048, i32 %1045
  store i8* %1049, i8** %18, align 4
  br label %1050

1050:                                             ; preds = %1040, %1037
  br label %1051

1051:                                             ; preds = %1050, %987
  br label %1052

1052:                                             ; preds = %1051
  br label %937

1053:                                             ; preds = %937
  %1054 = load i8*, i8** %19, align 4
  %1055 = load i8*, i8** %19, align 4
  %1056 = getelementptr inbounds i8, i8* %1055, i32 6
  %1057 = load i8*, i8** %19, align 4
  %1058 = ptrtoint i8* %1056 to i32
  %1059 = ptrtoint i8* %1057 to i32
  %1060 = sub i32 %1058, %1059
  %1061 = sub nsw i32 %1060, 3
  %1062 = load i8*, i8** %13, align 4
  call void @insert_op1(i32 18, i8* %1054, i32 %1061, i8* %1062)
  %1063 = load i8*, i8** %13, align 4
  %1064 = getelementptr inbounds i8, i8* %1063, i32 3
  store i8* %1064, i8** %13, align 4
  br label %1065

1065:                                             ; preds = %1053, %917
  br label %5342

1066:                                             ; preds = %168
  %1067 = load i8*, i8** %13, align 4
  store i8* %1067, i8** %19, align 4
  br label %1068

1068:                                             ; preds = %1066
  br label %1069

1069:                                             ; preds = %1184, %1068
  %1070 = load i8*, i8** %13, align 4
  %1071 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1072 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1071, i32 0, i32 0
  %1073 = load i8*, i8** %1072, align 4
  %1074 = ptrtoint i8* %1070 to i32
  %1075 = ptrtoint i8* %1073 to i32
  %1076 = sub i32 %1074, %1075
  %1077 = add nsw i32 %1076, 1
  %1078 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1079 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1078, i32 0, i32 1
  %1080 = load i32, i32* %1079, align 4
  %1081 = icmp ugt i32 %1077, %1080
  br i1 %1081, label %1082, label %1185

1082:                                             ; preds = %1069
  br label %1083

1083:                                             ; preds = %1082
  %1084 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1085 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1084, i32 0, i32 0
  %1086 = load i8*, i8** %1085, align 4
  store i8* %1086, i8** %32, align 4
  %1087 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1088 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1087, i32 0, i32 1
  %1089 = load i32, i32* %1088, align 4
  %1090 = icmp eq i32 %1089, 65536
  br i1 %1090, label %1091, label %1092

1091:                                             ; preds = %1083
  store i32 15, i32* %5, align 4
  br label %5372

1092:                                             ; preds = %1083
  %1093 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1094 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1093, i32 0, i32 1
  %1095 = load i32, i32* %1094, align 4
  %1096 = shl i32 %1095, 1
  store i32 %1096, i32* %1094, align 4
  %1097 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1098 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1097, i32 0, i32 1
  %1099 = load i32, i32* %1098, align 4
  %1100 = icmp ugt i32 %1099, 65536
  br i1 %1100, label %1101, label %1104

1101:                                             ; preds = %1092
  %1102 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1103 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1102, i32 0, i32 1
  store i32 65536, i32* %1103, align 4
  br label %1104

1104:                                             ; preds = %1101, %1092
  %1105 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1106 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1105, i32 0, i32 0
  %1107 = load i8*, i8** %1106, align 4
  %1108 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1109 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1108, i32 0, i32 1
  %1110 = load i32, i32* %1109, align 4
  %1111 = call i8* @realloc(i8* %1107, i32 %1110) #7
  %1112 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1113 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1112, i32 0, i32 0
  store i8* %1111, i8** %1113, align 4
  %1114 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1115 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1114, i32 0, i32 0
  %1116 = load i8*, i8** %1115, align 4
  %1117 = icmp eq i8* %1116, null
  br i1 %1117, label %1118, label %1119

1118:                                             ; preds = %1104
  store i32 12, i32* %5, align 4
  br label %5372

1119:                                             ; preds = %1104
  %1120 = load i8*, i8** %32, align 4
  %1121 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1122 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1121, i32 0, i32 0
  %1123 = load i8*, i8** %1122, align 4
  %1124 = icmp ne i8* %1120, %1123
  br i1 %1124, label %1125, label %1183

1125:                                             ; preds = %1119
  %1126 = load i8*, i8** %13, align 4
  %1127 = load i8*, i8** %32, align 4
  %1128 = ptrtoint i8* %1126 to i32
  %1129 = ptrtoint i8* %1127 to i32
  %1130 = sub i32 %1128, %1129
  %1131 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1132 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1131, i32 0, i32 0
  %1133 = load i8*, i8** %1132, align 4
  %1134 = getelementptr inbounds i8, i8* %1133, i32 %1130
  store i8* %1134, i8** %13, align 4
  %1135 = load i8*, i8** %20, align 4
  %1136 = load i8*, i8** %32, align 4
  %1137 = ptrtoint i8* %1135 to i32
  %1138 = ptrtoint i8* %1136 to i32
  %1139 = sub i32 %1137, %1138
  %1140 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1141 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1140, i32 0, i32 0
  %1142 = load i8*, i8** %1141, align 4
  %1143 = getelementptr inbounds i8, i8* %1142, i32 %1139
  store i8* %1143, i8** %20, align 4
  %1144 = load i8*, i8** %22, align 4
  %1145 = icmp ne i8* %1144, null
  br i1 %1145, label %1146, label %1156

1146:                                             ; preds = %1125
  %1147 = load i8*, i8** %22, align 4
  %1148 = load i8*, i8** %32, align 4
  %1149 = ptrtoint i8* %1147 to i32
  %1150 = ptrtoint i8* %1148 to i32
  %1151 = sub i32 %1149, %1150
  %1152 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1153 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1152, i32 0, i32 0
  %1154 = load i8*, i8** %1153, align 4
  %1155 = getelementptr inbounds i8, i8* %1154, i32 %1151
  store i8* %1155, i8** %22, align 4
  br label %1156

1156:                                             ; preds = %1146, %1125
  %1157 = load i8*, i8** %19, align 4
  %1158 = icmp ne i8* %1157, null
  br i1 %1158, label %1159, label %1169

1159:                                             ; preds = %1156
  %1160 = load i8*, i8** %19, align 4
  %1161 = load i8*, i8** %32, align 4
  %1162 = ptrtoint i8* %1160 to i32
  %1163 = ptrtoint i8* %1161 to i32
  %1164 = sub i32 %1162, %1163
  %1165 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1166 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1165, i32 0, i32 0
  %1167 = load i8*, i8** %1166, align 4
  %1168 = getelementptr inbounds i8, i8* %1167, i32 %1164
  store i8* %1168, i8** %19, align 4
  br label %1169

1169:                                             ; preds = %1159, %1156
  %1170 = load i8*, i8** %18, align 4
  %1171 = icmp ne i8* %1170, null
  br i1 %1171, label %1172, label %1182

1172:                                             ; preds = %1169
  %1173 = load i8*, i8** %18, align 4
  %1174 = load i8*, i8** %32, align 4
  %1175 = ptrtoint i8* %1173 to i32
  %1176 = ptrtoint i8* %1174 to i32
  %1177 = sub i32 %1175, %1176
  %1178 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1179 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1178, i32 0, i32 0
  %1180 = load i8*, i8** %1179, align 4
  %1181 = getelementptr inbounds i8, i8* %1180, i32 %1177
  store i8* %1181, i8** %18, align 4
  br label %1182

1182:                                             ; preds = %1172, %1169
  br label %1183

1183:                                             ; preds = %1182, %1119
  br label %1184

1184:                                             ; preds = %1183
  br label %1069

1185:                                             ; preds = %1069
  %1186 = load i8*, i8** %13, align 4
  %1187 = getelementptr inbounds i8, i8* %1186, i32 1
  store i8* %1187, i8** %13, align 4
  store i8 2, i8* %1186, align 1
  br label %1188

1188:                                             ; preds = %1185
  br label %5342

1189:                                             ; preds = %168
  store i8 0, i8* %33, align 1
  %1190 = load i8*, i8** %15, align 4
  %1191 = load i8*, i8** %16, align 4
  %1192 = icmp eq i8* %1190, %1191
  br i1 %1192, label %1193, label %1194

1193:                                             ; preds = %1189
  store i32 7, i32* %5, align 4
  br label %5372

1194:                                             ; preds = %1189
  br label %1195

1195:                                             ; preds = %1310, %1194
  %1196 = load i8*, i8** %13, align 4
  %1197 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1198 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1197, i32 0, i32 0
  %1199 = load i8*, i8** %1198, align 4
  %1200 = ptrtoint i8* %1196 to i32
  %1201 = ptrtoint i8* %1199 to i32
  %1202 = sub i32 %1200, %1201
  %1203 = add nsw i32 %1202, 34
  %1204 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1205 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1204, i32 0, i32 1
  %1206 = load i32, i32* %1205, align 4
  %1207 = icmp ugt i32 %1203, %1206
  br i1 %1207, label %1208, label %1311

1208:                                             ; preds = %1195
  br label %1209

1209:                                             ; preds = %1208
  %1210 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1211 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1210, i32 0, i32 0
  %1212 = load i8*, i8** %1211, align 4
  store i8* %1212, i8** %34, align 4
  %1213 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1214 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1213, i32 0, i32 1
  %1215 = load i32, i32* %1214, align 4
  %1216 = icmp eq i32 %1215, 65536
  br i1 %1216, label %1217, label %1218

1217:                                             ; preds = %1209
  store i32 15, i32* %5, align 4
  br label %5372

1218:                                             ; preds = %1209
  %1219 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1220 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1219, i32 0, i32 1
  %1221 = load i32, i32* %1220, align 4
  %1222 = shl i32 %1221, 1
  store i32 %1222, i32* %1220, align 4
  %1223 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1224 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1223, i32 0, i32 1
  %1225 = load i32, i32* %1224, align 4
  %1226 = icmp ugt i32 %1225, 65536
  br i1 %1226, label %1227, label %1230

1227:                                             ; preds = %1218
  %1228 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1229 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1228, i32 0, i32 1
  store i32 65536, i32* %1229, align 4
  br label %1230

1230:                                             ; preds = %1227, %1218
  %1231 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1232 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1231, i32 0, i32 0
  %1233 = load i8*, i8** %1232, align 4
  %1234 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1235 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1234, i32 0, i32 1
  %1236 = load i32, i32* %1235, align 4
  %1237 = call i8* @realloc(i8* %1233, i32 %1236) #7
  %1238 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1239 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1238, i32 0, i32 0
  store i8* %1237, i8** %1239, align 4
  %1240 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1241 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1240, i32 0, i32 0
  %1242 = load i8*, i8** %1241, align 4
  %1243 = icmp eq i8* %1242, null
  br i1 %1243, label %1244, label %1245

1244:                                             ; preds = %1230
  store i32 12, i32* %5, align 4
  br label %5372

1245:                                             ; preds = %1230
  %1246 = load i8*, i8** %34, align 4
  %1247 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1248 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1247, i32 0, i32 0
  %1249 = load i8*, i8** %1248, align 4
  %1250 = icmp ne i8* %1246, %1249
  br i1 %1250, label %1251, label %1309

1251:                                             ; preds = %1245
  %1252 = load i8*, i8** %13, align 4
  %1253 = load i8*, i8** %34, align 4
  %1254 = ptrtoint i8* %1252 to i32
  %1255 = ptrtoint i8* %1253 to i32
  %1256 = sub i32 %1254, %1255
  %1257 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1258 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1257, i32 0, i32 0
  %1259 = load i8*, i8** %1258, align 4
  %1260 = getelementptr inbounds i8, i8* %1259, i32 %1256
  store i8* %1260, i8** %13, align 4
  %1261 = load i8*, i8** %20, align 4
  %1262 = load i8*, i8** %34, align 4
  %1263 = ptrtoint i8* %1261 to i32
  %1264 = ptrtoint i8* %1262 to i32
  %1265 = sub i32 %1263, %1264
  %1266 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1267 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1266, i32 0, i32 0
  %1268 = load i8*, i8** %1267, align 4
  %1269 = getelementptr inbounds i8, i8* %1268, i32 %1265
  store i8* %1269, i8** %20, align 4
  %1270 = load i8*, i8** %22, align 4
  %1271 = icmp ne i8* %1270, null
  br i1 %1271, label %1272, label %1282

1272:                                             ; preds = %1251
  %1273 = load i8*, i8** %22, align 4
  %1274 = load i8*, i8** %34, align 4
  %1275 = ptrtoint i8* %1273 to i32
  %1276 = ptrtoint i8* %1274 to i32
  %1277 = sub i32 %1275, %1276
  %1278 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1279 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1278, i32 0, i32 0
  %1280 = load i8*, i8** %1279, align 4
  %1281 = getelementptr inbounds i8, i8* %1280, i32 %1277
  store i8* %1281, i8** %22, align 4
  br label %1282

1282:                                             ; preds = %1272, %1251
  %1283 = load i8*, i8** %19, align 4
  %1284 = icmp ne i8* %1283, null
  br i1 %1284, label %1285, label %1295

1285:                                             ; preds = %1282
  %1286 = load i8*, i8** %19, align 4
  %1287 = load i8*, i8** %34, align 4
  %1288 = ptrtoint i8* %1286 to i32
  %1289 = ptrtoint i8* %1287 to i32
  %1290 = sub i32 %1288, %1289
  %1291 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1292 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1291, i32 0, i32 0
  %1293 = load i8*, i8** %1292, align 4
  %1294 = getelementptr inbounds i8, i8* %1293, i32 %1290
  store i8* %1294, i8** %19, align 4
  br label %1295

1295:                                             ; preds = %1285, %1282
  %1296 = load i8*, i8** %18, align 4
  %1297 = icmp ne i8* %1296, null
  br i1 %1297, label %1298, label %1308

1298:                                             ; preds = %1295
  %1299 = load i8*, i8** %18, align 4
  %1300 = load i8*, i8** %34, align 4
  %1301 = ptrtoint i8* %1299 to i32
  %1302 = ptrtoint i8* %1300 to i32
  %1303 = sub i32 %1301, %1302
  %1304 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1305 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1304, i32 0, i32 0
  %1306 = load i8*, i8** %1305, align 4
  %1307 = getelementptr inbounds i8, i8* %1306, i32 %1303
  store i8* %1307, i8** %18, align 4
  br label %1308

1308:                                             ; preds = %1298, %1295
  br label %1309

1309:                                             ; preds = %1308, %1245
  br label %1310

1310:                                             ; preds = %1309
  br label %1195

1311:                                             ; preds = %1195
  %1312 = load i8*, i8** %13, align 4
  store i8* %1312, i8** %19, align 4
  br label %1313

1313:                                             ; preds = %1311
  br label %1314

1314:                                             ; preds = %1429, %1313
  %1315 = load i8*, i8** %13, align 4
  %1316 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1317 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1316, i32 0, i32 0
  %1318 = load i8*, i8** %1317, align 4
  %1319 = ptrtoint i8* %1315 to i32
  %1320 = ptrtoint i8* %1318 to i32
  %1321 = sub i32 %1319, %1320
  %1322 = add nsw i32 %1321, 1
  %1323 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1324 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1323, i32 0, i32 1
  %1325 = load i32, i32* %1324, align 4
  %1326 = icmp ugt i32 %1322, %1325
  br i1 %1326, label %1327, label %1430

1327:                                             ; preds = %1314
  br label %1328

1328:                                             ; preds = %1327
  %1329 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1330 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1329, i32 0, i32 0
  %1331 = load i8*, i8** %1330, align 4
  store i8* %1331, i8** %35, align 4
  %1332 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1333 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1332, i32 0, i32 1
  %1334 = load i32, i32* %1333, align 4
  %1335 = icmp eq i32 %1334, 65536
  br i1 %1335, label %1336, label %1337

1336:                                             ; preds = %1328
  store i32 15, i32* %5, align 4
  br label %5372

1337:                                             ; preds = %1328
  %1338 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1339 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1338, i32 0, i32 1
  %1340 = load i32, i32* %1339, align 4
  %1341 = shl i32 %1340, 1
  store i32 %1341, i32* %1339, align 4
  %1342 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1343 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1342, i32 0, i32 1
  %1344 = load i32, i32* %1343, align 4
  %1345 = icmp ugt i32 %1344, 65536
  br i1 %1345, label %1346, label %1349

1346:                                             ; preds = %1337
  %1347 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1348 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1347, i32 0, i32 1
  store i32 65536, i32* %1348, align 4
  br label %1349

1349:                                             ; preds = %1346, %1337
  %1350 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1351 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1350, i32 0, i32 0
  %1352 = load i8*, i8** %1351, align 4
  %1353 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1354 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1353, i32 0, i32 1
  %1355 = load i32, i32* %1354, align 4
  %1356 = call i8* @realloc(i8* %1352, i32 %1355) #7
  %1357 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1358 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1357, i32 0, i32 0
  store i8* %1356, i8** %1358, align 4
  %1359 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1360 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1359, i32 0, i32 0
  %1361 = load i8*, i8** %1360, align 4
  %1362 = icmp eq i8* %1361, null
  br i1 %1362, label %1363, label %1364

1363:                                             ; preds = %1349
  store i32 12, i32* %5, align 4
  br label %5372

1364:                                             ; preds = %1349
  %1365 = load i8*, i8** %35, align 4
  %1366 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1367 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1366, i32 0, i32 0
  %1368 = load i8*, i8** %1367, align 4
  %1369 = icmp ne i8* %1365, %1368
  br i1 %1369, label %1370, label %1428

1370:                                             ; preds = %1364
  %1371 = load i8*, i8** %13, align 4
  %1372 = load i8*, i8** %35, align 4
  %1373 = ptrtoint i8* %1371 to i32
  %1374 = ptrtoint i8* %1372 to i32
  %1375 = sub i32 %1373, %1374
  %1376 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1377 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1376, i32 0, i32 0
  %1378 = load i8*, i8** %1377, align 4
  %1379 = getelementptr inbounds i8, i8* %1378, i32 %1375
  store i8* %1379, i8** %13, align 4
  %1380 = load i8*, i8** %20, align 4
  %1381 = load i8*, i8** %35, align 4
  %1382 = ptrtoint i8* %1380 to i32
  %1383 = ptrtoint i8* %1381 to i32
  %1384 = sub i32 %1382, %1383
  %1385 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1386 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1385, i32 0, i32 0
  %1387 = load i8*, i8** %1386, align 4
  %1388 = getelementptr inbounds i8, i8* %1387, i32 %1384
  store i8* %1388, i8** %20, align 4
  %1389 = load i8*, i8** %22, align 4
  %1390 = icmp ne i8* %1389, null
  br i1 %1390, label %1391, label %1401

1391:                                             ; preds = %1370
  %1392 = load i8*, i8** %22, align 4
  %1393 = load i8*, i8** %35, align 4
  %1394 = ptrtoint i8* %1392 to i32
  %1395 = ptrtoint i8* %1393 to i32
  %1396 = sub i32 %1394, %1395
  %1397 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1398 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1397, i32 0, i32 0
  %1399 = load i8*, i8** %1398, align 4
  %1400 = getelementptr inbounds i8, i8* %1399, i32 %1396
  store i8* %1400, i8** %22, align 4
  br label %1401

1401:                                             ; preds = %1391, %1370
  %1402 = load i8*, i8** %19, align 4
  %1403 = icmp ne i8* %1402, null
  br i1 %1403, label %1404, label %1414

1404:                                             ; preds = %1401
  %1405 = load i8*, i8** %19, align 4
  %1406 = load i8*, i8** %35, align 4
  %1407 = ptrtoint i8* %1405 to i32
  %1408 = ptrtoint i8* %1406 to i32
  %1409 = sub i32 %1407, %1408
  %1410 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1411 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1410, i32 0, i32 0
  %1412 = load i8*, i8** %1411, align 4
  %1413 = getelementptr inbounds i8, i8* %1412, i32 %1409
  store i8* %1413, i8** %19, align 4
  br label %1414

1414:                                             ; preds = %1404, %1401
  %1415 = load i8*, i8** %18, align 4
  %1416 = icmp ne i8* %1415, null
  br i1 %1416, label %1417, label %1427

1417:                                             ; preds = %1414
  %1418 = load i8*, i8** %18, align 4
  %1419 = load i8*, i8** %35, align 4
  %1420 = ptrtoint i8* %1418 to i32
  %1421 = ptrtoint i8* %1419 to i32
  %1422 = sub i32 %1420, %1421
  %1423 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1424 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1423, i32 0, i32 0
  %1425 = load i8*, i8** %1424, align 4
  %1426 = getelementptr inbounds i8, i8* %1425, i32 %1422
  store i8* %1426, i8** %18, align 4
  br label %1427

1427:                                             ; preds = %1417, %1414
  br label %1428

1428:                                             ; preds = %1427, %1364
  br label %1429

1429:                                             ; preds = %1428
  br label %1314

1430:                                             ; preds = %1314
  %1431 = load i8*, i8** %15, align 4
  %1432 = load i8, i8* %1431, align 1
  %1433 = sext i8 %1432 to i32
  %1434 = icmp eq i32 %1433, 94
  %1435 = zext i1 %1434 to i64
  %1436 = select i1 %1434, i32 4, i32 3
  %1437 = trunc i32 %1436 to i8
  %1438 = load i8*, i8** %13, align 4
  %1439 = getelementptr inbounds i8, i8* %1438, i32 1
  store i8* %1439, i8** %13, align 4
  store i8 %1437, i8* %1438, align 1
  br label %1440

1440:                                             ; preds = %1430
  %1441 = load i8*, i8** %15, align 4
  %1442 = load i8, i8* %1441, align 1
  %1443 = sext i8 %1442 to i32
  %1444 = icmp eq i32 %1443, 94
  br i1 %1444, label %1445, label %1448

1445:                                             ; preds = %1440
  %1446 = load i8*, i8** %15, align 4
  %1447 = getelementptr inbounds i8, i8* %1446, i32 1
  store i8* %1447, i8** %15, align 4
  br label %1448

1448:                                             ; preds = %1445, %1440
  %1449 = load i8*, i8** %15, align 4
  store i8* %1449, i8** %12, align 4
  br label %1450

1450:                                             ; preds = %1448
  br label %1451

1451:                                             ; preds = %1566, %1450
  %1452 = load i8*, i8** %13, align 4
  %1453 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1454 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1453, i32 0, i32 0
  %1455 = load i8*, i8** %1454, align 4
  %1456 = ptrtoint i8* %1452 to i32
  %1457 = ptrtoint i8* %1455 to i32
  %1458 = sub i32 %1456, %1457
  %1459 = add nsw i32 %1458, 1
  %1460 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1461 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1460, i32 0, i32 1
  %1462 = load i32, i32* %1461, align 4
  %1463 = icmp ugt i32 %1459, %1462
  br i1 %1463, label %1464, label %1567

1464:                                             ; preds = %1451
  br label %1465

1465:                                             ; preds = %1464
  %1466 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1467 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1466, i32 0, i32 0
  %1468 = load i8*, i8** %1467, align 4
  store i8* %1468, i8** %36, align 4
  %1469 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1470 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1469, i32 0, i32 1
  %1471 = load i32, i32* %1470, align 4
  %1472 = icmp eq i32 %1471, 65536
  br i1 %1472, label %1473, label %1474

1473:                                             ; preds = %1465
  store i32 15, i32* %5, align 4
  br label %5372

1474:                                             ; preds = %1465
  %1475 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1476 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1475, i32 0, i32 1
  %1477 = load i32, i32* %1476, align 4
  %1478 = shl i32 %1477, 1
  store i32 %1478, i32* %1476, align 4
  %1479 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1480 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1479, i32 0, i32 1
  %1481 = load i32, i32* %1480, align 4
  %1482 = icmp ugt i32 %1481, 65536
  br i1 %1482, label %1483, label %1486

1483:                                             ; preds = %1474
  %1484 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1485 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1484, i32 0, i32 1
  store i32 65536, i32* %1485, align 4
  br label %1486

1486:                                             ; preds = %1483, %1474
  %1487 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1488 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1487, i32 0, i32 0
  %1489 = load i8*, i8** %1488, align 4
  %1490 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1491 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1490, i32 0, i32 1
  %1492 = load i32, i32* %1491, align 4
  %1493 = call i8* @realloc(i8* %1489, i32 %1492) #7
  %1494 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1495 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1494, i32 0, i32 0
  store i8* %1493, i8** %1495, align 4
  %1496 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1497 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1496, i32 0, i32 0
  %1498 = load i8*, i8** %1497, align 4
  %1499 = icmp eq i8* %1498, null
  br i1 %1499, label %1500, label %1501

1500:                                             ; preds = %1486
  store i32 12, i32* %5, align 4
  br label %5372

1501:                                             ; preds = %1486
  %1502 = load i8*, i8** %36, align 4
  %1503 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1504 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1503, i32 0, i32 0
  %1505 = load i8*, i8** %1504, align 4
  %1506 = icmp ne i8* %1502, %1505
  br i1 %1506, label %1507, label %1565

1507:                                             ; preds = %1501
  %1508 = load i8*, i8** %13, align 4
  %1509 = load i8*, i8** %36, align 4
  %1510 = ptrtoint i8* %1508 to i32
  %1511 = ptrtoint i8* %1509 to i32
  %1512 = sub i32 %1510, %1511
  %1513 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1514 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1513, i32 0, i32 0
  %1515 = load i8*, i8** %1514, align 4
  %1516 = getelementptr inbounds i8, i8* %1515, i32 %1512
  store i8* %1516, i8** %13, align 4
  %1517 = load i8*, i8** %20, align 4
  %1518 = load i8*, i8** %36, align 4
  %1519 = ptrtoint i8* %1517 to i32
  %1520 = ptrtoint i8* %1518 to i32
  %1521 = sub i32 %1519, %1520
  %1522 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1523 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1522, i32 0, i32 0
  %1524 = load i8*, i8** %1523, align 4
  %1525 = getelementptr inbounds i8, i8* %1524, i32 %1521
  store i8* %1525, i8** %20, align 4
  %1526 = load i8*, i8** %22, align 4
  %1527 = icmp ne i8* %1526, null
  br i1 %1527, label %1528, label %1538

1528:                                             ; preds = %1507
  %1529 = load i8*, i8** %22, align 4
  %1530 = load i8*, i8** %36, align 4
  %1531 = ptrtoint i8* %1529 to i32
  %1532 = ptrtoint i8* %1530 to i32
  %1533 = sub i32 %1531, %1532
  %1534 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1535 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1534, i32 0, i32 0
  %1536 = load i8*, i8** %1535, align 4
  %1537 = getelementptr inbounds i8, i8* %1536, i32 %1533
  store i8* %1537, i8** %22, align 4
  br label %1538

1538:                                             ; preds = %1528, %1507
  %1539 = load i8*, i8** %19, align 4
  %1540 = icmp ne i8* %1539, null
  br i1 %1540, label %1541, label %1551

1541:                                             ; preds = %1538
  %1542 = load i8*, i8** %19, align 4
  %1543 = load i8*, i8** %36, align 4
  %1544 = ptrtoint i8* %1542 to i32
  %1545 = ptrtoint i8* %1543 to i32
  %1546 = sub i32 %1544, %1545
  %1547 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1548 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1547, i32 0, i32 0
  %1549 = load i8*, i8** %1548, align 4
  %1550 = getelementptr inbounds i8, i8* %1549, i32 %1546
  store i8* %1550, i8** %19, align 4
  br label %1551

1551:                                             ; preds = %1541, %1538
  %1552 = load i8*, i8** %18, align 4
  %1553 = icmp ne i8* %1552, null
  br i1 %1553, label %1554, label %1564

1554:                                             ; preds = %1551
  %1555 = load i8*, i8** %18, align 4
  %1556 = load i8*, i8** %36, align 4
  %1557 = ptrtoint i8* %1555 to i32
  %1558 = ptrtoint i8* %1556 to i32
  %1559 = sub i32 %1557, %1558
  %1560 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %1561 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %1560, i32 0, i32 0
  %1562 = load i8*, i8** %1561, align 4
  %1563 = getelementptr inbounds i8, i8* %1562, i32 %1559
  store i8* %1563, i8** %18, align 4
  br label %1564

1564:                                             ; preds = %1554, %1551
  br label %1565

1565:                                             ; preds = %1564, %1501
  br label %1566

1566:                                             ; preds = %1565
  br label %1451

1567:                                             ; preds = %1451
  %1568 = load i8*, i8** %13, align 4
  %1569 = getelementptr inbounds i8, i8* %1568, i32 1
  store i8* %1569, i8** %13, align 4
  store i8 32, i8* %1568, align 1
  br label %1570

1570:                                             ; preds = %1567
  %1571 = load i8*, i8** %13, align 4
  call void @llvm.memset.p0i8.i32(i8* align 1 %1571, i8 0, i32 32, i1 false)
  %1572 = load i8*, i8** %13, align 4
  %1573 = getelementptr inbounds i8, i8* %1572, i32 -2
  %1574 = load i8, i8* %1573, align 1
  %1575 = zext i8 %1574 to i32
  %1576 = icmp eq i32 %1575, 4
  br i1 %1576, label %1577, label %1588

1577:                                             ; preds = %1570
  %1578 = load i32, i32* %8, align 4
  %1579 = and i32 %1578, 256
  %1580 = icmp ne i32 %1579, 0
  br i1 %1580, label %1581, label %1588

1581:                                             ; preds = %1577
  %1582 = load i8*, i8** %13, align 4
  %1583 = getelementptr inbounds i8, i8* %1582, i32 1
  %1584 = load i8, i8* %1583, align 1
  %1585 = zext i8 %1584 to i32
  %1586 = or i32 %1585, 4
  %1587 = trunc i32 %1586 to i8
  store i8 %1587, i8* %1583, align 1
  br label %1588

1588:                                             ; preds = %1581, %1577, %1570
  br label %1589

1589:                                             ; preds = %2267, %1645, %1588
  %1590 = load i8*, i8** %15, align 4
  %1591 = load i8*, i8** %16, align 4
  %1592 = icmp eq i8* %1590, %1591
  br i1 %1592, label %1593, label %1594

1593:                                             ; preds = %1589
  store i32 7, i32* %5, align 4
  br label %5372

1594:                                             ; preds = %1589
  br label %1595

1595:                                             ; preds = %1594
  %1596 = load i8*, i8** %15, align 4
  %1597 = load i8*, i8** %16, align 4
  %1598 = icmp eq i8* %1596, %1597
  br i1 %1598, label %1599, label %1600

1599:                                             ; preds = %1595
  store i32 14, i32* %5, align 4
  br label %5372

1600:                                             ; preds = %1595
  %1601 = load i8*, i8** %15, align 4
  %1602 = getelementptr inbounds i8, i8* %1601, i32 1
  store i8* %1602, i8** %15, align 4
  %1603 = load i8, i8* %1601, align 1
  store i8 %1603, i8* %10, align 1
  %1604 = load i8*, i8** %17, align 4
  %1605 = icmp ne i8* %1604, null
  br i1 %1605, label %1606, label %1612

1606:                                             ; preds = %1600
  %1607 = load i8*, i8** %17, align 4
  %1608 = load i8, i8* %10, align 1
  %1609 = zext i8 %1608 to i32
  %1610 = getelementptr inbounds i8, i8* %1607, i32 %1609
  %1611 = load i8, i8* %1610, align 1
  store i8 %1611, i8* %10, align 1
  br label %1612

1612:                                             ; preds = %1606, %1600
  br label %1613

1613:                                             ; preds = %1612
  %1614 = load i32, i32* %8, align 4
  %1615 = and i32 %1614, 1
  %1616 = icmp ne i32 %1615, 0
  br i1 %1616, label %1617, label %1659

1617:                                             ; preds = %1613
  %1618 = load i8, i8* %10, align 1
  %1619 = zext i8 %1618 to i32
  %1620 = icmp eq i32 %1619, 92
  br i1 %1620, label %1621, label %1659

1621:                                             ; preds = %1617
  %1622 = load i8*, i8** %15, align 4
  %1623 = load i8*, i8** %16, align 4
  %1624 = icmp eq i8* %1622, %1623
  br i1 %1624, label %1625, label %1626

1625:                                             ; preds = %1621
  store i32 5, i32* %5, align 4
  br label %5372

1626:                                             ; preds = %1621
  br label %1627

1627:                                             ; preds = %1626
  %1628 = load i8*, i8** %15, align 4
  %1629 = load i8*, i8** %16, align 4
  %1630 = icmp eq i8* %1628, %1629
  br i1 %1630, label %1631, label %1632

1631:                                             ; preds = %1627
  store i32 14, i32* %5, align 4
  br label %5372

1632:                                             ; preds = %1627
  %1633 = load i8*, i8** %15, align 4
  %1634 = getelementptr inbounds i8, i8* %1633, i32 1
  store i8* %1634, i8** %15, align 4
  %1635 = load i8, i8* %1633, align 1
  store i8 %1635, i8* %11, align 1
  %1636 = load i8*, i8** %17, align 4
  %1637 = icmp ne i8* %1636, null
  br i1 %1637, label %1638, label %1644

1638:                                             ; preds = %1632
  %1639 = load i8*, i8** %17, align 4
  %1640 = load i8, i8* %11, align 1
  %1641 = zext i8 %1640 to i32
  %1642 = getelementptr inbounds i8, i8* %1639, i32 %1641
  %1643 = load i8, i8* %1642, align 1
  store i8 %1643, i8* %11, align 1
  br label %1644

1644:                                             ; preds = %1638, %1632
  br label %1645

1645:                                             ; preds = %1644
  %1646 = load i8, i8* %11, align 1
  %1647 = zext i8 %1646 to i32
  %1648 = srem i32 %1647, 8
  %1649 = shl i32 1, %1648
  %1650 = load i8*, i8** %13, align 4
  %1651 = load i8, i8* %11, align 1
  %1652 = zext i8 %1651 to i32
  %1653 = sdiv i32 %1652, 8
  %1654 = getelementptr inbounds i8, i8* %1650, i32 %1653
  %1655 = load i8, i8* %1654, align 1
  %1656 = zext i8 %1655 to i32
  %1657 = or i32 %1656, %1649
  %1658 = trunc i32 %1657 to i8
  store i8 %1658, i8* %1654, align 1
  br label %1589

1659:                                             ; preds = %1617, %1613
  %1660 = load i8, i8* %10, align 1
  %1661 = zext i8 %1660 to i32
  %1662 = icmp eq i32 %1661, 93
  br i1 %1662, label %1663, label %1669

1663:                                             ; preds = %1659
  %1664 = load i8*, i8** %15, align 4
  %1665 = load i8*, i8** %12, align 4
  %1666 = getelementptr inbounds i8, i8* %1665, i32 1
  %1667 = icmp ne i8* %1664, %1666
  br i1 %1667, label %1668, label %1669

1668:                                             ; preds = %1663
  br label %2268

1669:                                             ; preds = %1663, %1659
  %1670 = load i8, i8* %33, align 1
  %1671 = sext i8 %1670 to i32
  %1672 = icmp ne i32 %1671, 0
  br i1 %1672, label %1673, label %1683

1673:                                             ; preds = %1669
  %1674 = load i8, i8* %10, align 1
  %1675 = zext i8 %1674 to i32
  %1676 = icmp eq i32 %1675, 45
  br i1 %1676, label %1677, label %1683

1677:                                             ; preds = %1673
  %1678 = load i8*, i8** %15, align 4
  %1679 = load i8, i8* %1678, align 1
  %1680 = sext i8 %1679 to i32
  %1681 = icmp ne i32 %1680, 93
  br i1 %1681, label %1682, label %1683

1682:                                             ; preds = %1677
  store i32 11, i32* %5, align 4
  br label %5372

1683:                                             ; preds = %1677, %1673, %1669
  %1684 = load i8, i8* %10, align 1
  %1685 = zext i8 %1684 to i32
  %1686 = icmp eq i32 %1685, 45
  br i1 %1686, label %1687, label %1731

1687:                                             ; preds = %1683
  %1688 = load i8*, i8** %15, align 4
  %1689 = getelementptr inbounds i8, i8* %1688, i32 -2
  %1690 = load i8*, i8** %6, align 4
  %1691 = icmp uge i8* %1689, %1690
  br i1 %1691, label %1692, label %1698

1692:                                             ; preds = %1687
  %1693 = load i8*, i8** %15, align 4
  %1694 = getelementptr inbounds i8, i8* %1693, i32 -2
  %1695 = load i8, i8* %1694, align 1
  %1696 = sext i8 %1695 to i32
  %1697 = icmp eq i32 %1696, 91
  br i1 %1697, label %1731, label %1698

1698:                                             ; preds = %1692, %1687
  %1699 = load i8*, i8** %15, align 4
  %1700 = getelementptr inbounds i8, i8* %1699, i32 -3
  %1701 = load i8*, i8** %6, align 4
  %1702 = icmp uge i8* %1700, %1701
  br i1 %1702, label %1703, label %1715

1703:                                             ; preds = %1698
  %1704 = load i8*, i8** %15, align 4
  %1705 = getelementptr inbounds i8, i8* %1704, i32 -3
  %1706 = load i8, i8* %1705, align 1
  %1707 = sext i8 %1706 to i32
  %1708 = icmp eq i32 %1707, 91
  br i1 %1708, label %1709, label %1715

1709:                                             ; preds = %1703
  %1710 = load i8*, i8** %15, align 4
  %1711 = getelementptr inbounds i8, i8* %1710, i32 -2
  %1712 = load i8, i8* %1711, align 1
  %1713 = sext i8 %1712 to i32
  %1714 = icmp eq i32 %1713, 94
  br i1 %1714, label %1731, label %1715

1715:                                             ; preds = %1709, %1703, %1698
  %1716 = load i8*, i8** %15, align 4
  %1717 = load i8, i8* %1716, align 1
  %1718 = sext i8 %1717 to i32
  %1719 = icmp ne i32 %1718, 93
  br i1 %1719, label %1720, label %1731

1720:                                             ; preds = %1715
  %1721 = load i8*, i8** %16, align 4
  %1722 = load i8*, i8** %17, align 4
  %1723 = load i32, i32* %8, align 4
  %1724 = load i8*, i8** %13, align 4
  %1725 = call i32 @compile_range(i8** %15, i8* %1721, i8* %1722, i32 %1723, i8* %1724)
  store i32 %1725, i32* %37, align 4
  %1726 = load i32, i32* %37, align 4
  %1727 = icmp ne i32 %1726, 0
  br i1 %1727, label %1728, label %1730

1728:                                             ; preds = %1720
  %1729 = load i32, i32* %37, align 4
  store i32 %1729, i32* %5, align 4
  br label %5372

1730:                                             ; preds = %1720
  br label %2267

1731:                                             ; preds = %1715, %1709, %1692, %1683
  %1732 = load i8*, i8** %15, align 4
  %1733 = getelementptr inbounds i8, i8* %1732, i32 0
  %1734 = load i8, i8* %1733, align 1
  %1735 = sext i8 %1734 to i32
  %1736 = icmp eq i32 %1735, 45
  br i1 %1736, label %1737, label %1773

1737:                                             ; preds = %1731
  %1738 = load i8*, i8** %15, align 4
  %1739 = getelementptr inbounds i8, i8* %1738, i32 1
  %1740 = load i8, i8* %1739, align 1
  %1741 = sext i8 %1740 to i32
  %1742 = icmp ne i32 %1741, 93
  br i1 %1742, label %1743, label %1773

1743:                                             ; preds = %1737
  br label %1744

1744:                                             ; preds = %1743
  %1745 = load i8*, i8** %15, align 4
  %1746 = load i8*, i8** %16, align 4
  %1747 = icmp eq i8* %1745, %1746
  br i1 %1747, label %1748, label %1749

1748:                                             ; preds = %1744
  store i32 14, i32* %5, align 4
  br label %5372

1749:                                             ; preds = %1744
  %1750 = load i8*, i8** %15, align 4
  %1751 = getelementptr inbounds i8, i8* %1750, i32 1
  store i8* %1751, i8** %15, align 4
  %1752 = load i8, i8* %1750, align 1
  store i8 %1752, i8* %11, align 1
  %1753 = load i8*, i8** %17, align 4
  %1754 = icmp ne i8* %1753, null
  br i1 %1754, label %1755, label %1761

1755:                                             ; preds = %1749
  %1756 = load i8*, i8** %17, align 4
  %1757 = load i8, i8* %11, align 1
  %1758 = zext i8 %1757 to i32
  %1759 = getelementptr inbounds i8, i8* %1756, i32 %1758
  %1760 = load i8, i8* %1759, align 1
  store i8 %1760, i8* %11, align 1
  br label %1761

1761:                                             ; preds = %1755, %1749
  br label %1762

1762:                                             ; preds = %1761
  %1763 = load i8*, i8** %16, align 4
  %1764 = load i8*, i8** %17, align 4
  %1765 = load i32, i32* %8, align 4
  %1766 = load i8*, i8** %13, align 4
  %1767 = call i32 @compile_range(i8** %15, i8* %1763, i8* %1764, i32 %1765, i8* %1766)
  store i32 %1767, i32* %38, align 4
  %1768 = load i32, i32* %38, align 4
  %1769 = icmp ne i32 %1768, 0
  br i1 %1769, label %1770, label %1772

1770:                                             ; preds = %1762
  %1771 = load i32, i32* %38, align 4
  store i32 %1771, i32* %5, align 4
  br label %5372

1772:                                             ; preds = %1762
  br label %2266

1773:                                             ; preds = %1737, %1731
  %1774 = load i32, i32* %8, align 4
  %1775 = and i32 %1774, 4
  %1776 = icmp ne i32 %1775, 0
  br i1 %1776, label %1777, label %2251

1777:                                             ; preds = %1773
  %1778 = load i8, i8* %10, align 1
  %1779 = zext i8 %1778 to i32
  %1780 = icmp eq i32 %1779, 91
  br i1 %1780, label %1781, label %2251

1781:                                             ; preds = %1777
  %1782 = load i8*, i8** %15, align 4
  %1783 = load i8, i8* %1782, align 1
  %1784 = sext i8 %1783 to i32
  %1785 = icmp eq i32 %1784, 58
  br i1 %1785, label %1786, label %2251

1786:                                             ; preds = %1781
  br label %1787

1787:                                             ; preds = %1786
  %1788 = load i8*, i8** %15, align 4
  %1789 = load i8*, i8** %16, align 4
  %1790 = icmp eq i8* %1788, %1789
  br i1 %1790, label %1791, label %1792

1791:                                             ; preds = %1787
  store i32 14, i32* %5, align 4
  br label %5372

1792:                                             ; preds = %1787
  %1793 = load i8*, i8** %15, align 4
  %1794 = getelementptr inbounds i8, i8* %1793, i32 1
  store i8* %1794, i8** %15, align 4
  %1795 = load i8, i8* %1793, align 1
  store i8 %1795, i8* %10, align 1
  %1796 = load i8*, i8** %17, align 4
  %1797 = icmp ne i8* %1796, null
  br i1 %1797, label %1798, label %1804

1798:                                             ; preds = %1792
  %1799 = load i8*, i8** %17, align 4
  %1800 = load i8, i8* %10, align 1
  %1801 = zext i8 %1800 to i32
  %1802 = getelementptr inbounds i8, i8* %1799, i32 %1801
  %1803 = load i8, i8* %1802, align 1
  store i8 %1803, i8* %10, align 1
  br label %1804

1804:                                             ; preds = %1798, %1792
  br label %1805

1805:                                             ; preds = %1804
  store i8 0, i8* %11, align 1
  %1806 = load i8*, i8** %15, align 4
  %1807 = load i8*, i8** %16, align 4
  %1808 = icmp eq i8* %1806, %1807
  br i1 %1808, label %1809, label %1810

1809:                                             ; preds = %1805
  store i32 7, i32* %5, align 4
  br label %5372

1810:                                             ; preds = %1805
  br label %1811

1811:                                             ; preds = %1847, %1810
  br label %1812

1812:                                             ; preds = %1811
  %1813 = load i8*, i8** %15, align 4
  %1814 = load i8*, i8** %16, align 4
  %1815 = icmp eq i8* %1813, %1814
  br i1 %1815, label %1816, label %1817

1816:                                             ; preds = %1812
  store i32 14, i32* %5, align 4
  br label %5372

1817:                                             ; preds = %1812
  %1818 = load i8*, i8** %15, align 4
  %1819 = getelementptr inbounds i8, i8* %1818, i32 1
  store i8* %1819, i8** %15, align 4
  %1820 = load i8, i8* %1818, align 1
  store i8 %1820, i8* %10, align 1
  %1821 = load i8*, i8** %17, align 4
  %1822 = icmp ne i8* %1821, null
  br i1 %1822, label %1823, label %1829

1823:                                             ; preds = %1817
  %1824 = load i8*, i8** %17, align 4
  %1825 = load i8, i8* %10, align 1
  %1826 = zext i8 %1825 to i32
  %1827 = getelementptr inbounds i8, i8* %1824, i32 %1826
  %1828 = load i8, i8* %1827, align 1
  store i8 %1828, i8* %10, align 1
  br label %1829

1829:                                             ; preds = %1823, %1817
  br label %1830

1830:                                             ; preds = %1829
  %1831 = load i8, i8* %10, align 1
  %1832 = zext i8 %1831 to i32
  %1833 = icmp eq i32 %1832, 58
  br i1 %1833, label %1846, label %1834

1834:                                             ; preds = %1830
  %1835 = load i8, i8* %10, align 1
  %1836 = zext i8 %1835 to i32
  %1837 = icmp eq i32 %1836, 93
  br i1 %1837, label %1846, label %1838

1838:                                             ; preds = %1834
  %1839 = load i8*, i8** %15, align 4
  %1840 = load i8*, i8** %16, align 4
  %1841 = icmp eq i8* %1839, %1840
  br i1 %1841, label %1846, label %1842

1842:                                             ; preds = %1838
  %1843 = load i8, i8* %11, align 1
  %1844 = zext i8 %1843 to i32
  %1845 = icmp eq i32 %1844, 6
  br i1 %1845, label %1846, label %1847

1846:                                             ; preds = %1842, %1838, %1834, %1830
  br label %1853

1847:                                             ; preds = %1842
  %1848 = load i8, i8* %10, align 1
  %1849 = load i8, i8* %11, align 1
  %1850 = add i8 %1849, 1
  store i8 %1850, i8* %11, align 1
  %1851 = zext i8 %1849 to i32
  %1852 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 %1851
  store i8 %1848, i8* %1852, align 1
  br label %1811

1853:                                             ; preds = %1846
  %1854 = load i8, i8* %11, align 1
  %1855 = zext i8 %1854 to i32
  %1856 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 %1855
  store i8 0, i8* %1856, align 1
  %1857 = load i8, i8* %10, align 1
  %1858 = zext i8 %1857 to i32
  %1859 = icmp eq i32 %1858, 58
  br i1 %1859, label %1860, label %2227

1860:                                             ; preds = %1853
  %1861 = load i8*, i8** %15, align 4
  %1862 = load i8, i8* %1861, align 1
  %1863 = sext i8 %1862 to i32
  %1864 = icmp eq i32 %1863, 93
  br i1 %1864, label %1865, label %2227

1865:                                             ; preds = %1860
  %1866 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1867 = call i32 @strcmp(i8* %1866, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0)) #8
  %1868 = icmp eq i32 %1867, 0
  %1869 = zext i1 %1868 to i32
  %1870 = trunc i32 %1869 to i8
  store i8 %1870, i8* %41, align 1
  %1871 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1872 = call i32 @strcmp(i8* %1871, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.58, i32 0, i32 0)) #8
  %1873 = icmp eq i32 %1872, 0
  %1874 = zext i1 %1873 to i32
  %1875 = trunc i32 %1874 to i8
  store i8 %1875, i8* %42, align 1
  %1876 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1877 = call i32 @strcmp(i8* %1876, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.59, i32 0, i32 0)) #8
  %1878 = icmp eq i32 %1877, 0
  %1879 = zext i1 %1878 to i32
  %1880 = trunc i32 %1879 to i8
  store i8 %1880, i8* %43, align 1
  %1881 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1882 = call i32 @strcmp(i8* %1881, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.60, i32 0, i32 0)) #8
  %1883 = icmp eq i32 %1882, 0
  %1884 = zext i1 %1883 to i32
  %1885 = trunc i32 %1884 to i8
  store i8 %1885, i8* %44, align 1
  %1886 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1887 = call i32 @strcmp(i8* %1886, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.61, i32 0, i32 0)) #8
  %1888 = icmp eq i32 %1887, 0
  %1889 = zext i1 %1888 to i32
  %1890 = trunc i32 %1889 to i8
  store i8 %1890, i8* %45, align 1
  %1891 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1892 = call i32 @strcmp(i8* %1891, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i32 0, i32 0)) #8
  %1893 = icmp eq i32 %1892, 0
  %1894 = zext i1 %1893 to i32
  %1895 = trunc i32 %1894 to i8
  store i8 %1895, i8* %46, align 1
  %1896 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1897 = call i32 @strcmp(i8* %1896, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.63, i32 0, i32 0)) #8
  %1898 = icmp eq i32 %1897, 0
  %1899 = zext i1 %1898 to i32
  %1900 = trunc i32 %1899 to i8
  store i8 %1900, i8* %47, align 1
  %1901 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1902 = call i32 @strcmp(i8* %1901, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.64, i32 0, i32 0)) #8
  %1903 = icmp eq i32 %1902, 0
  %1904 = zext i1 %1903 to i32
  %1905 = trunc i32 %1904 to i8
  store i8 %1905, i8* %48, align 1
  %1906 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1907 = call i32 @strcmp(i8* %1906, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.65, i32 0, i32 0)) #8
  %1908 = icmp eq i32 %1907, 0
  %1909 = zext i1 %1908 to i32
  %1910 = trunc i32 %1909 to i8
  store i8 %1910, i8* %49, align 1
  %1911 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1912 = call i32 @strcmp(i8* %1911, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.66, i32 0, i32 0)) #8
  %1913 = icmp eq i32 %1912, 0
  %1914 = zext i1 %1913 to i32
  %1915 = trunc i32 %1914 to i8
  store i8 %1915, i8* %50, align 1
  %1916 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1917 = call i32 @strcmp(i8* %1916, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.67, i32 0, i32 0)) #8
  %1918 = icmp eq i32 %1917, 0
  %1919 = zext i1 %1918 to i32
  %1920 = trunc i32 %1919 to i8
  store i8 %1920, i8* %51, align 1
  %1921 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1922 = call i32 @strcmp(i8* %1921, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.68, i32 0, i32 0)) #8
  %1923 = icmp eq i32 %1922, 0
  %1924 = zext i1 %1923 to i32
  %1925 = trunc i32 %1924 to i8
  store i8 %1925, i8* %52, align 1
  %1926 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1927 = call i32 @strcmp(i8* %1926, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.58, i32 0, i32 0)) #8
  %1928 = icmp eq i32 %1927, 0
  br i1 %1928, label %1974, label %1929

1929:                                             ; preds = %1865
  %1930 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1931 = call i32 @strcmp(i8* %1930, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.67, i32 0, i32 0)) #8
  %1932 = icmp eq i32 %1931, 0
  br i1 %1932, label %1974, label %1933

1933:                                             ; preds = %1929
  %1934 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1935 = call i32 @strcmp(i8* %1934, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.63, i32 0, i32 0)) #8
  %1936 = icmp eq i32 %1935, 0
  br i1 %1936, label %1974, label %1937

1937:                                             ; preds = %1933
  %1938 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1939 = call i32 @strcmp(i8* %1938, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.61, i32 0, i32 0)) #8
  %1940 = icmp eq i32 %1939, 0
  br i1 %1940, label %1974, label %1941

1941:                                             ; preds = %1937
  %1942 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1943 = call i32 @strcmp(i8* %1942, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0)) #8
  %1944 = icmp eq i32 %1943, 0
  br i1 %1944, label %1974, label %1945

1945:                                             ; preds = %1941
  %1946 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1947 = call i32 @strcmp(i8* %1946, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.68, i32 0, i32 0)) #8
  %1948 = icmp eq i32 %1947, 0
  br i1 %1948, label %1974, label %1949

1949:                                             ; preds = %1945
  %1950 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1951 = call i32 @strcmp(i8* %1950, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.66, i32 0, i32 0)) #8
  %1952 = icmp eq i32 %1951, 0
  br i1 %1952, label %1974, label %1953

1953:                                             ; preds = %1949
  %1954 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1955 = call i32 @strcmp(i8* %1954, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.64, i32 0, i32 0)) #8
  %1956 = icmp eq i32 %1955, 0
  br i1 %1956, label %1974, label %1957

1957:                                             ; preds = %1953
  %1958 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1959 = call i32 @strcmp(i8* %1958, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.65, i32 0, i32 0)) #8
  %1960 = icmp eq i32 %1959, 0
  br i1 %1960, label %1974, label %1961

1961:                                             ; preds = %1957
  %1962 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1963 = call i32 @strcmp(i8* %1962, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i32 0, i32 0)) #8
  %1964 = icmp eq i32 %1963, 0
  br i1 %1964, label %1974, label %1965

1965:                                             ; preds = %1961
  %1966 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1967 = call i32 @strcmp(i8* %1966, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.60, i32 0, i32 0)) #8
  %1968 = icmp eq i32 %1967, 0
  br i1 %1968, label %1974, label %1969

1969:                                             ; preds = %1965
  %1970 = getelementptr inbounds [7 x i8], [7 x i8]* %39, i32 0, i32 0
  %1971 = call i32 @strcmp(i8* %1970, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.59, i32 0, i32 0)) #8
  %1972 = icmp eq i32 %1971, 0
  br i1 %1972, label %1974, label %1973

1973:                                             ; preds = %1969
  store i32 4, i32* %5, align 4
  br label %5372

1974:                                             ; preds = %1969, %1965, %1961, %1957, %1953, %1949, %1945, %1941, %1937, %1933, %1929, %1865
  br label %1975

1975:                                             ; preds = %1974
  %1976 = load i8*, i8** %15, align 4
  %1977 = load i8*, i8** %16, align 4
  %1978 = icmp eq i8* %1976, %1977
  br i1 %1978, label %1979, label %1980

1979:                                             ; preds = %1975
  store i32 14, i32* %5, align 4
  br label %5372

1980:                                             ; preds = %1975
  %1981 = load i8*, i8** %15, align 4
  %1982 = getelementptr inbounds i8, i8* %1981, i32 1
  store i8* %1982, i8** %15, align 4
  %1983 = load i8, i8* %1981, align 1
  store i8 %1983, i8* %10, align 1
  %1984 = load i8*, i8** %17, align 4
  %1985 = icmp ne i8* %1984, null
  br i1 %1985, label %1986, label %1992

1986:                                             ; preds = %1980
  %1987 = load i8*, i8** %17, align 4
  %1988 = load i8, i8* %10, align 1
  %1989 = zext i8 %1988 to i32
  %1990 = getelementptr inbounds i8, i8* %1987, i32 %1989
  %1991 = load i8, i8* %1990, align 1
  store i8 %1991, i8* %10, align 1
  br label %1992

1992:                                             ; preds = %1986, %1980
  br label %1993

1993:                                             ; preds = %1992
  %1994 = load i8*, i8** %15, align 4
  %1995 = load i8*, i8** %16, align 4
  %1996 = icmp eq i8* %1994, %1995
  br i1 %1996, label %1997, label %1998

1997:                                             ; preds = %1993
  store i32 7, i32* %5, align 4
  br label %5372

1998:                                             ; preds = %1993
  store i32 0, i32* %40, align 4
  br label %1999

1999:                                             ; preds = %2223, %1998
  %2000 = load i32, i32* %40, align 4
  %2001 = icmp slt i32 %2000, 256
  br i1 %2001, label %2002, label %2226

2002:                                             ; preds = %1999
  %2003 = load i8, i8* %41, align 1
  %2004 = sext i8 %2003 to i32
  %2005 = icmp ne i32 %2004, 0
  br i1 %2005, label %2006, label %2019

2006:                                             ; preds = %2002
  %2007 = load i32, i32* %40, align 4
  %2008 = and i32 %2007, -128
  %2009 = icmp eq i32 %2008, 0
  br i1 %2009, label %2010, label %2019

2010:                                             ; preds = %2006
  %2011 = call i16** @__ctype_b_loc() #10
  %2012 = load i16*, i16** %2011, align 4
  %2013 = load i32, i32* %40, align 4
  %2014 = getelementptr inbounds i16, i16* %2012, i32 %2013
  %2015 = load i16, i16* %2014, align 2
  %2016 = zext i16 %2015 to i32
  %2017 = and i32 %2016, 8
  %2018 = icmp ne i32 %2017, 0
  br i1 %2018, label %2206, label %2019

2019:                                             ; preds = %2010, %2006, %2002
  %2020 = load i8, i8* %42, align 1
  %2021 = sext i8 %2020 to i32
  %2022 = icmp ne i32 %2021, 0
  br i1 %2022, label %2023, label %2036

2023:                                             ; preds = %2019
  %2024 = load i32, i32* %40, align 4
  %2025 = and i32 %2024, -128
  %2026 = icmp eq i32 %2025, 0
  br i1 %2026, label %2027, label %2036

2027:                                             ; preds = %2023
  %2028 = call i16** @__ctype_b_loc() #10
  %2029 = load i16*, i16** %2028, align 4
  %2030 = load i32, i32* %40, align 4
  %2031 = getelementptr inbounds i16, i16* %2029, i32 %2030
  %2032 = load i16, i16* %2031, align 2
  %2033 = zext i16 %2032 to i32
  %2034 = and i32 %2033, 1024
  %2035 = icmp ne i32 %2034, 0
  br i1 %2035, label %2206, label %2036

2036:                                             ; preds = %2027, %2023, %2019
  %2037 = load i8, i8* %43, align 1
  %2038 = sext i8 %2037 to i32
  %2039 = icmp ne i32 %2038, 0
  br i1 %2039, label %2040, label %2053

2040:                                             ; preds = %2036
  %2041 = load i32, i32* %40, align 4
  %2042 = and i32 %2041, -128
  %2043 = icmp eq i32 %2042, 0
  br i1 %2043, label %2044, label %2053

2044:                                             ; preds = %2040
  %2045 = call i16** @__ctype_b_loc() #10
  %2046 = load i16*, i16** %2045, align 4
  %2047 = load i32, i32* %40, align 4
  %2048 = getelementptr inbounds i16, i16* %2046, i32 %2047
  %2049 = load i16, i16* %2048, align 2
  %2050 = zext i16 %2049 to i32
  %2051 = and i32 %2050, 1
  %2052 = icmp ne i32 %2051, 0
  br i1 %2052, label %2206, label %2053

2053:                                             ; preds = %2044, %2040, %2036
  %2054 = load i8, i8* %44, align 1
  %2055 = sext i8 %2054 to i32
  %2056 = icmp ne i32 %2055, 0
  br i1 %2056, label %2057, label %2070

2057:                                             ; preds = %2053
  %2058 = load i32, i32* %40, align 4
  %2059 = and i32 %2058, -128
  %2060 = icmp eq i32 %2059, 0
  br i1 %2060, label %2061, label %2070

2061:                                             ; preds = %2057
  %2062 = call i16** @__ctype_b_loc() #10
  %2063 = load i16*, i16** %2062, align 4
  %2064 = load i32, i32* %40, align 4
  %2065 = getelementptr inbounds i16, i16* %2063, i32 %2064
  %2066 = load i16, i16* %2065, align 2
  %2067 = zext i16 %2066 to i32
  %2068 = and i32 %2067, 2
  %2069 = icmp ne i32 %2068, 0
  br i1 %2069, label %2206, label %2070

2070:                                             ; preds = %2061, %2057, %2053
  %2071 = load i8, i8* %45, align 1
  %2072 = sext i8 %2071 to i32
  %2073 = icmp ne i32 %2072, 0
  br i1 %2073, label %2074, label %2087

2074:                                             ; preds = %2070
  %2075 = load i32, i32* %40, align 4
  %2076 = and i32 %2075, -128
  %2077 = icmp eq i32 %2076, 0
  br i1 %2077, label %2078, label %2087

2078:                                             ; preds = %2074
  %2079 = call i16** @__ctype_b_loc() #10
  %2080 = load i16*, i16** %2079, align 4
  %2081 = load i32, i32* %40, align 4
  %2082 = getelementptr inbounds i16, i16* %2080, i32 %2081
  %2083 = load i16, i16* %2082, align 2
  %2084 = zext i16 %2083 to i32
  %2085 = and i32 %2084, 2048
  %2086 = icmp ne i32 %2085, 0
  br i1 %2086, label %2206, label %2087

2087:                                             ; preds = %2078, %2074, %2070
  %2088 = load i8, i8* %46, align 1
  %2089 = sext i8 %2088 to i32
  %2090 = icmp ne i32 %2089, 0
  br i1 %2090, label %2091, label %2104

2091:                                             ; preds = %2087
  %2092 = load i32, i32* %40, align 4
  %2093 = and i32 %2092, -128
  %2094 = icmp eq i32 %2093, 0
  br i1 %2094, label %2095, label %2104

2095:                                             ; preds = %2091
  %2096 = call i16** @__ctype_b_loc() #10
  %2097 = load i16*, i16** %2096, align 4
  %2098 = load i32, i32* %40, align 4
  %2099 = getelementptr inbounds i16, i16* %2097, i32 %2098
  %2100 = load i16, i16* %2099, align 2
  %2101 = zext i16 %2100 to i32
  %2102 = and i32 %2101, 32768
  %2103 = icmp ne i32 %2102, 0
  br i1 %2103, label %2206, label %2104

2104:                                             ; preds = %2095, %2091, %2087
  %2105 = load i8, i8* %47, align 1
  %2106 = sext i8 %2105 to i32
  %2107 = icmp ne i32 %2106, 0
  br i1 %2107, label %2108, label %2121

2108:                                             ; preds = %2104
  %2109 = load i32, i32* %40, align 4
  %2110 = and i32 %2109, -128
  %2111 = icmp eq i32 %2110, 0
  br i1 %2111, label %2112, label %2121

2112:                                             ; preds = %2108
  %2113 = call i16** @__ctype_b_loc() #10
  %2114 = load i16*, i16** %2113, align 4
  %2115 = load i32, i32* %40, align 4
  %2116 = getelementptr inbounds i16, i16* %2114, i32 %2115
  %2117 = load i16, i16* %2116, align 2
  %2118 = zext i16 %2117 to i32
  %2119 = and i32 %2118, 512
  %2120 = icmp ne i32 %2119, 0
  br i1 %2120, label %2206, label %2121

2121:                                             ; preds = %2112, %2108, %2104
  %2122 = load i8, i8* %48, align 1
  %2123 = sext i8 %2122 to i32
  %2124 = icmp ne i32 %2123, 0
  br i1 %2124, label %2125, label %2138

2125:                                             ; preds = %2121
  %2126 = load i32, i32* %40, align 4
  %2127 = and i32 %2126, -128
  %2128 = icmp eq i32 %2127, 0
  br i1 %2128, label %2129, label %2138

2129:                                             ; preds = %2125
  %2130 = call i16** @__ctype_b_loc() #10
  %2131 = load i16*, i16** %2130, align 4
  %2132 = load i32, i32* %40, align 4
  %2133 = getelementptr inbounds i16, i16* %2131, i32 %2132
  %2134 = load i16, i16* %2133, align 2
  %2135 = zext i16 %2134 to i32
  %2136 = and i32 %2135, 16384
  %2137 = icmp ne i32 %2136, 0
  br i1 %2137, label %2206, label %2138

2138:                                             ; preds = %2129, %2125, %2121
  %2139 = load i8, i8* %49, align 1
  %2140 = sext i8 %2139 to i32
  %2141 = icmp ne i32 %2140, 0
  br i1 %2141, label %2142, label %2155

2142:                                             ; preds = %2138
  %2143 = load i32, i32* %40, align 4
  %2144 = and i32 %2143, -128
  %2145 = icmp eq i32 %2144, 0
  br i1 %2145, label %2146, label %2155

2146:                                             ; preds = %2142
  %2147 = call i16** @__ctype_b_loc() #10
  %2148 = load i16*, i16** %2147, align 4
  %2149 = load i32, i32* %40, align 4
  %2150 = getelementptr inbounds i16, i16* %2148, i32 %2149
  %2151 = load i16, i16* %2150, align 2
  %2152 = zext i16 %2151 to i32
  %2153 = and i32 %2152, 4
  %2154 = icmp ne i32 %2153, 0
  br i1 %2154, label %2206, label %2155

2155:                                             ; preds = %2146, %2142, %2138
  %2156 = load i8, i8* %50, align 1
  %2157 = sext i8 %2156 to i32
  %2158 = icmp ne i32 %2157, 0
  br i1 %2158, label %2159, label %2172

2159:                                             ; preds = %2155
  %2160 = load i32, i32* %40, align 4
  %2161 = and i32 %2160, -128
  %2162 = icmp eq i32 %2161, 0
  br i1 %2162, label %2163, label %2172

2163:                                             ; preds = %2159
  %2164 = call i16** @__ctype_b_loc() #10
  %2165 = load i16*, i16** %2164, align 4
  %2166 = load i32, i32* %40, align 4
  %2167 = getelementptr inbounds i16, i16* %2165, i32 %2166
  %2168 = load i16, i16* %2167, align 2
  %2169 = zext i16 %2168 to i32
  %2170 = and i32 %2169, 8192
  %2171 = icmp ne i32 %2170, 0
  br i1 %2171, label %2206, label %2172

2172:                                             ; preds = %2163, %2159, %2155
  %2173 = load i8, i8* %51, align 1
  %2174 = sext i8 %2173 to i32
  %2175 = icmp ne i32 %2174, 0
  br i1 %2175, label %2176, label %2189

2176:                                             ; preds = %2172
  %2177 = load i32, i32* %40, align 4
  %2178 = and i32 %2177, -128
  %2179 = icmp eq i32 %2178, 0
  br i1 %2179, label %2180, label %2189

2180:                                             ; preds = %2176
  %2181 = call i16** @__ctype_b_loc() #10
  %2182 = load i16*, i16** %2181, align 4
  %2183 = load i32, i32* %40, align 4
  %2184 = getelementptr inbounds i16, i16* %2182, i32 %2183
  %2185 = load i16, i16* %2184, align 2
  %2186 = zext i16 %2185 to i32
  %2187 = and i32 %2186, 256
  %2188 = icmp ne i32 %2187, 0
  br i1 %2188, label %2206, label %2189

2189:                                             ; preds = %2180, %2176, %2172
  %2190 = load i8, i8* %52, align 1
  %2191 = sext i8 %2190 to i32
  %2192 = icmp ne i32 %2191, 0
  br i1 %2192, label %2193, label %2222

2193:                                             ; preds = %2189
  %2194 = load i32, i32* %40, align 4
  %2195 = and i32 %2194, -128
  %2196 = icmp eq i32 %2195, 0
  br i1 %2196, label %2197, label %2222

2197:                                             ; preds = %2193
  %2198 = call i16** @__ctype_b_loc() #10
  %2199 = load i16*, i16** %2198, align 4
  %2200 = load i32, i32* %40, align 4
  %2201 = getelementptr inbounds i16, i16* %2199, i32 %2200
  %2202 = load i16, i16* %2201, align 2
  %2203 = zext i16 %2202 to i32
  %2204 = and i32 %2203, 4096
  %2205 = icmp ne i32 %2204, 0
  br i1 %2205, label %2206, label %2222

2206:                                             ; preds = %2197, %2180, %2163, %2146, %2129, %2112, %2095, %2078, %2061, %2044, %2027, %2010
  %2207 = load i32, i32* %40, align 4
  %2208 = trunc i32 %2207 to i8
  %2209 = zext i8 %2208 to i32
  %2210 = srem i32 %2209, 8
  %2211 = shl i32 1, %2210
  %2212 = load i8*, i8** %13, align 4
  %2213 = load i32, i32* %40, align 4
  %2214 = trunc i32 %2213 to i8
  %2215 = zext i8 %2214 to i32
  %2216 = sdiv i32 %2215, 8
  %2217 = getelementptr inbounds i8, i8* %2212, i32 %2216
  %2218 = load i8, i8* %2217, align 1
  %2219 = zext i8 %2218 to i32
  %2220 = or i32 %2219, %2211
  %2221 = trunc i32 %2220 to i8
  store i8 %2221, i8* %2217, align 1
  br label %2222

2222:                                             ; preds = %2206, %2197, %2193, %2189
  br label %2223

2223:                                             ; preds = %2222
  %2224 = load i32, i32* %40, align 4
  %2225 = add nsw i32 %2224, 1
  store i32 %2225, i32* %40, align 4
  br label %1999

2226:                                             ; preds = %1999
  store i8 1, i8* %33, align 1
  br label %2250

2227:                                             ; preds = %1860, %1853
  %2228 = load i8, i8* %11, align 1
  %2229 = add i8 %2228, 1
  store i8 %2229, i8* %11, align 1
  br label %2230

2230:                                             ; preds = %2234, %2227
  %2231 = load i8, i8* %11, align 1
  %2232 = add i8 %2231, -1
  store i8 %2232, i8* %11, align 1
  %2233 = icmp ne i8 %2231, 0
  br i1 %2233, label %2234, label %2237

2234:                                             ; preds = %2230
  %2235 = load i8*, i8** %15, align 4
  %2236 = getelementptr inbounds i8, i8* %2235, i32 -1
  store i8* %2236, i8** %15, align 4
  br label %2230

2237:                                             ; preds = %2230
  %2238 = load i8*, i8** %13, align 4
  %2239 = getelementptr inbounds i8, i8* %2238, i32 11
  %2240 = load i8, i8* %2239, align 1
  %2241 = zext i8 %2240 to i32
  %2242 = or i32 %2241, 8
  %2243 = trunc i32 %2242 to i8
  store i8 %2243, i8* %2239, align 1
  %2244 = load i8*, i8** %13, align 4
  %2245 = getelementptr inbounds i8, i8* %2244, i32 7
  %2246 = load i8, i8* %2245, align 1
  %2247 = zext i8 %2246 to i32
  %2248 = or i32 %2247, 4
  %2249 = trunc i32 %2248 to i8
  store i8 %2249, i8* %2245, align 1
  store i8 0, i8* %33, align 1
  br label %2250

2250:                                             ; preds = %2237, %2226
  br label %2265

2251:                                             ; preds = %1781, %1777, %1773
  store i8 0, i8* %33, align 1
  %2252 = load i8, i8* %10, align 1
  %2253 = zext i8 %2252 to i32
  %2254 = srem i32 %2253, 8
  %2255 = shl i32 1, %2254
  %2256 = load i8*, i8** %13, align 4
  %2257 = load i8, i8* %10, align 1
  %2258 = zext i8 %2257 to i32
  %2259 = sdiv i32 %2258, 8
  %2260 = getelementptr inbounds i8, i8* %2256, i32 %2259
  %2261 = load i8, i8* %2260, align 1
  %2262 = zext i8 %2261 to i32
  %2263 = or i32 %2262, %2255
  %2264 = trunc i32 %2263 to i8
  store i8 %2264, i8* %2260, align 1
  br label %2265

2265:                                             ; preds = %2251, %2250
  br label %2266

2266:                                             ; preds = %2265, %1772
  br label %2267

2267:                                             ; preds = %2266, %1730
  br label %1589

2268:                                             ; preds = %1668
  br label %2269

2269:                                             ; preds = %2288, %2268
  %2270 = load i8*, i8** %13, align 4
  %2271 = getelementptr inbounds i8, i8* %2270, i32 -1
  %2272 = load i8, i8* %2271, align 1
  %2273 = zext i8 %2272 to i32
  %2274 = icmp sgt i32 %2273, 0
  br i1 %2274, label %2275, label %2286

2275:                                             ; preds = %2269
  %2276 = load i8*, i8** %13, align 4
  %2277 = load i8*, i8** %13, align 4
  %2278 = getelementptr inbounds i8, i8* %2277, i32 -1
  %2279 = load i8, i8* %2278, align 1
  %2280 = zext i8 %2279 to i32
  %2281 = sub nsw i32 %2280, 1
  %2282 = getelementptr inbounds i8, i8* %2276, i32 %2281
  %2283 = load i8, i8* %2282, align 1
  %2284 = zext i8 %2283 to i32
  %2285 = icmp eq i32 %2284, 0
  br label %2286

2286:                                             ; preds = %2275, %2269
  %2287 = phi i1 [ false, %2269 ], [ %2285, %2275 ]
  br i1 %2287, label %2288, label %2293

2288:                                             ; preds = %2286
  %2289 = load i8*, i8** %13, align 4
  %2290 = getelementptr inbounds i8, i8* %2289, i32 -1
  %2291 = load i8, i8* %2290, align 1
  %2292 = add i8 %2291, -1
  store i8 %2292, i8* %2290, align 1
  br label %2269

2293:                                             ; preds = %2286
  %2294 = load i8*, i8** %13, align 4
  %2295 = getelementptr inbounds i8, i8* %2294, i32 -1
  %2296 = load i8, i8* %2295, align 1
  %2297 = zext i8 %2296 to i32
  %2298 = load i8*, i8** %13, align 4
  %2299 = getelementptr inbounds i8, i8* %2298, i32 %2297
  store i8* %2299, i8** %13, align 4
  br label %5342

2300:                                             ; preds = %168
  %2301 = load i32, i32* %8, align 4
  %2302 = and i32 %2301, 8192
  %2303 = icmp ne i32 %2302, 0
  br i1 %2303, label %2304, label %2305

2304:                                             ; preds = %2300
  br label %2358

2305:                                             ; preds = %2300
  br label %5006

2306:                                             ; preds = %168
  %2307 = load i32, i32* %8, align 4
  %2308 = and i32 %2307, 8192
  %2309 = icmp ne i32 %2308, 0
  br i1 %2309, label %2310, label %2311

2310:                                             ; preds = %2306
  br label %2608

2311:                                             ; preds = %2306
  br label %5006

2312:                                             ; preds = %168
  %2313 = load i32, i32* %8, align 4
  %2314 = and i32 %2313, 2048
  %2315 = icmp ne i32 %2314, 0
  br i1 %2315, label %2316, label %2317

2316:                                             ; preds = %2312
  br label %2969

2317:                                             ; preds = %2312
  br label %5006

2318:                                             ; preds = %168
  %2319 = load i32, i32* %8, align 4
  %2320 = and i32 %2319, 32768
  %2321 = icmp ne i32 %2320, 0
  br i1 %2321, label %2322, label %2323

2322:                                             ; preds = %2318
  br label %2969

2323:                                             ; preds = %2318
  br label %5006

2324:                                             ; preds = %168
  %2325 = load i32, i32* %8, align 4
  %2326 = and i32 %2325, 512
  %2327 = icmp ne i32 %2326, 0
  br i1 %2327, label %2328, label %2333

2328:                                             ; preds = %2324
  %2329 = load i32, i32* %8, align 4
  %2330 = and i32 %2329, 4096
  %2331 = icmp ne i32 %2330, 0
  br i1 %2331, label %2332, label %2333

2332:                                             ; preds = %2328
  br label %3258

2333:                                             ; preds = %2328, %2324
  br label %5006

2334:                                             ; preds = %168
  %2335 = load i8*, i8** %15, align 4
  %2336 = load i8*, i8** %16, align 4
  %2337 = icmp eq i8* %2335, %2336
  br i1 %2337, label %2338, label %2339

2338:                                             ; preds = %2334
  store i32 5, i32* %5, align 4
  br label %5372

2339:                                             ; preds = %2334
  br label %2340

2340:                                             ; preds = %2339
  %2341 = load i8*, i8** %15, align 4
  %2342 = load i8*, i8** %16, align 4
  %2343 = icmp eq i8* %2341, %2342
  br i1 %2343, label %2344, label %2345

2344:                                             ; preds = %2340
  store i32 14, i32* %5, align 4
  br label %5372

2345:                                             ; preds = %2340
  %2346 = load i8*, i8** %15, align 4
  %2347 = getelementptr inbounds i8, i8* %2346, i32 1
  store i8* %2347, i8** %15, align 4
  %2348 = load i8, i8* %2346, align 1
  store i8 %2348, i8* %10, align 1
  br label %2349

2349:                                             ; preds = %2345
  %2350 = load i8, i8* %10, align 1
  %2351 = zext i8 %2350 to i32
  switch i32 %2351, label %4987 [
    i32 40, label %2352
    i32 41, label %2592
    i32 124, label %2959
    i32 123, label %3235
    i32 119, label %3850
    i32 87, label %3973
    i32 60, label %4096
    i32 62, label %4218
    i32 98, label %4340
    i32 66, label %4462
    i32 96, label %4584
    i32 39, label %4706
    i32 49, label %4828
    i32 50, label %4828
    i32 51, label %4828
    i32 52, label %4828
    i32 53, label %4828
    i32 54, label %4828
    i32 55, label %4828
    i32 56, label %4828
    i32 57, label %4828
    i32 43, label %4981
    i32 63, label %4981
  ]

2352:                                             ; preds = %2349
  %2353 = load i32, i32* %8, align 4
  %2354 = and i32 %2353, 8192
  %2355 = icmp ne i32 %2354, 0
  br i1 %2355, label %2356, label %2357

2356:                                             ; preds = %2352
  br label %4988

2357:                                             ; preds = %2352
  br label %2358

2358:                                             ; preds = %2357, %2304
  %2359 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2360 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2359, i32 0, i32 6
  %2361 = load i32, i32* %2360, align 4
  %2362 = add i32 %2361, 1
  store i32 %2362, i32* %2360, align 4
  %2363 = load i32, i32* %23, align 4
  %2364 = add i32 %2363, 1
  store i32 %2364, i32* %23, align 4
  %2365 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2366 = load i32, i32* %2365, align 4
  %2367 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 1
  %2368 = load i32, i32* %2367, align 4
  %2369 = icmp eq i32 %2366, %2368
  br i1 %2369, label %2370, label %2389

2370:                                             ; preds = %2358
  %2371 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2372 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2371, align 4
  %2373 = bitcast %struct.compile_stack_elt_t* %2372 to i8*
  %2374 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 1
  %2375 = load i32, i32* %2374, align 4
  %2376 = shl i32 %2375, 1
  %2377 = mul i32 %2376, 20
  %2378 = call i8* @realloc(i8* %2373, i32 %2377) #7
  %2379 = bitcast i8* %2378 to %struct.compile_stack_elt_t*
  %2380 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  store %struct.compile_stack_elt_t* %2379, %struct.compile_stack_elt_t** %2380, align 4
  %2381 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2382 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2381, align 4
  %2383 = icmp eq %struct.compile_stack_elt_t* %2382, null
  br i1 %2383, label %2384, label %2385

2384:                                             ; preds = %2370
  store i32 12, i32* %5, align 4
  br label %5372

2385:                                             ; preds = %2370
  %2386 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 1
  %2387 = load i32, i32* %2386, align 4
  %2388 = shl i32 %2387, 1
  store i32 %2388, i32* %2386, align 4
  br label %2389

2389:                                             ; preds = %2385, %2358
  %2390 = load i8*, i8** %20, align 4
  %2391 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2392 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2391, i32 0, i32 0
  %2393 = load i8*, i8** %2392, align 4
  %2394 = ptrtoint i8* %2390 to i32
  %2395 = ptrtoint i8* %2393 to i32
  %2396 = sub i32 %2394, %2395
  %2397 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2398 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2397, align 4
  %2399 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2400 = load i32, i32* %2399, align 4
  %2401 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2398, i32 %2400
  %2402 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2401, i32 0, i32 0
  store i32 %2396, i32* %2402, align 4
  %2403 = load i8*, i8** %22, align 4
  %2404 = icmp ne i8* %2403, null
  br i1 %2404, label %2405, label %2414

2405:                                             ; preds = %2389
  %2406 = load i8*, i8** %22, align 4
  %2407 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2408 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2407, i32 0, i32 0
  %2409 = load i8*, i8** %2408, align 4
  %2410 = ptrtoint i8* %2406 to i32
  %2411 = ptrtoint i8* %2409 to i32
  %2412 = sub i32 %2410, %2411
  %2413 = add nsw i32 %2412, 1
  br label %2415

2414:                                             ; preds = %2389
  br label %2415

2415:                                             ; preds = %2414, %2405
  %2416 = phi i32 [ %2413, %2405 ], [ 0, %2414 ]
  %2417 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2418 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2417, align 4
  %2419 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2420 = load i32, i32* %2419, align 4
  %2421 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2418, i32 %2420
  %2422 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2421, i32 0, i32 1
  store i32 %2416, i32* %2422, align 4
  %2423 = load i8*, i8** %13, align 4
  %2424 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2425 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2424, i32 0, i32 0
  %2426 = load i8*, i8** %2425, align 4
  %2427 = ptrtoint i8* %2423 to i32
  %2428 = ptrtoint i8* %2426 to i32
  %2429 = sub i32 %2427, %2428
  %2430 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2431 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2430, align 4
  %2432 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2433 = load i32, i32* %2432, align 4
  %2434 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2431, i32 %2433
  %2435 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2434, i32 0, i32 3
  store i32 %2429, i32* %2435, align 4
  %2436 = load i32, i32* %23, align 4
  %2437 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2438 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2437, align 4
  %2439 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2440 = load i32, i32* %2439, align 4
  %2441 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2438, i32 %2440
  %2442 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2441, i32 0, i32 4
  store i32 %2436, i32* %2442, align 4
  %2443 = load i32, i32* %23, align 4
  %2444 = icmp ule i32 %2443, 255
  br i1 %2444, label %2445, label %2587

2445:                                             ; preds = %2415
  %2446 = load i8*, i8** %13, align 4
  %2447 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2448 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2447, i32 0, i32 0
  %2449 = load i8*, i8** %2448, align 4
  %2450 = ptrtoint i8* %2446 to i32
  %2451 = ptrtoint i8* %2449 to i32
  %2452 = sub i32 %2450, %2451
  %2453 = add nsw i32 %2452, 2
  %2454 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2455 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2454, align 4
  %2456 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2457 = load i32, i32* %2456, align 4
  %2458 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2455, i32 %2457
  %2459 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2458, i32 0, i32 2
  store i32 %2453, i32* %2459, align 4
  br label %2460

2460:                                             ; preds = %2445
  br label %2461

2461:                                             ; preds = %2576, %2460
  %2462 = load i8*, i8** %13, align 4
  %2463 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2464 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2463, i32 0, i32 0
  %2465 = load i8*, i8** %2464, align 4
  %2466 = ptrtoint i8* %2462 to i32
  %2467 = ptrtoint i8* %2465 to i32
  %2468 = sub i32 %2466, %2467
  %2469 = add nsw i32 %2468, 3
  %2470 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2471 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2470, i32 0, i32 1
  %2472 = load i32, i32* %2471, align 4
  %2473 = icmp ugt i32 %2469, %2472
  br i1 %2473, label %2474, label %2577

2474:                                             ; preds = %2461
  br label %2475

2475:                                             ; preds = %2474
  %2476 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2477 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2476, i32 0, i32 0
  %2478 = load i8*, i8** %2477, align 4
  store i8* %2478, i8** %53, align 4
  %2479 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2480 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2479, i32 0, i32 1
  %2481 = load i32, i32* %2480, align 4
  %2482 = icmp eq i32 %2481, 65536
  br i1 %2482, label %2483, label %2484

2483:                                             ; preds = %2475
  store i32 15, i32* %5, align 4
  br label %5372

2484:                                             ; preds = %2475
  %2485 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2486 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2485, i32 0, i32 1
  %2487 = load i32, i32* %2486, align 4
  %2488 = shl i32 %2487, 1
  store i32 %2488, i32* %2486, align 4
  %2489 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2490 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2489, i32 0, i32 1
  %2491 = load i32, i32* %2490, align 4
  %2492 = icmp ugt i32 %2491, 65536
  br i1 %2492, label %2493, label %2496

2493:                                             ; preds = %2484
  %2494 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2495 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2494, i32 0, i32 1
  store i32 65536, i32* %2495, align 4
  br label %2496

2496:                                             ; preds = %2493, %2484
  %2497 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2498 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2497, i32 0, i32 0
  %2499 = load i8*, i8** %2498, align 4
  %2500 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2501 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2500, i32 0, i32 1
  %2502 = load i32, i32* %2501, align 4
  %2503 = call i8* @realloc(i8* %2499, i32 %2502) #7
  %2504 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2505 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2504, i32 0, i32 0
  store i8* %2503, i8** %2505, align 4
  %2506 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2507 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2506, i32 0, i32 0
  %2508 = load i8*, i8** %2507, align 4
  %2509 = icmp eq i8* %2508, null
  br i1 %2509, label %2510, label %2511

2510:                                             ; preds = %2496
  store i32 12, i32* %5, align 4
  br label %5372

2511:                                             ; preds = %2496
  %2512 = load i8*, i8** %53, align 4
  %2513 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2514 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2513, i32 0, i32 0
  %2515 = load i8*, i8** %2514, align 4
  %2516 = icmp ne i8* %2512, %2515
  br i1 %2516, label %2517, label %2575

2517:                                             ; preds = %2511
  %2518 = load i8*, i8** %13, align 4
  %2519 = load i8*, i8** %53, align 4
  %2520 = ptrtoint i8* %2518 to i32
  %2521 = ptrtoint i8* %2519 to i32
  %2522 = sub i32 %2520, %2521
  %2523 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2524 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2523, i32 0, i32 0
  %2525 = load i8*, i8** %2524, align 4
  %2526 = getelementptr inbounds i8, i8* %2525, i32 %2522
  store i8* %2526, i8** %13, align 4
  %2527 = load i8*, i8** %20, align 4
  %2528 = load i8*, i8** %53, align 4
  %2529 = ptrtoint i8* %2527 to i32
  %2530 = ptrtoint i8* %2528 to i32
  %2531 = sub i32 %2529, %2530
  %2532 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2533 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2532, i32 0, i32 0
  %2534 = load i8*, i8** %2533, align 4
  %2535 = getelementptr inbounds i8, i8* %2534, i32 %2531
  store i8* %2535, i8** %20, align 4
  %2536 = load i8*, i8** %22, align 4
  %2537 = icmp ne i8* %2536, null
  br i1 %2537, label %2538, label %2548

2538:                                             ; preds = %2517
  %2539 = load i8*, i8** %22, align 4
  %2540 = load i8*, i8** %53, align 4
  %2541 = ptrtoint i8* %2539 to i32
  %2542 = ptrtoint i8* %2540 to i32
  %2543 = sub i32 %2541, %2542
  %2544 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2545 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2544, i32 0, i32 0
  %2546 = load i8*, i8** %2545, align 4
  %2547 = getelementptr inbounds i8, i8* %2546, i32 %2543
  store i8* %2547, i8** %22, align 4
  br label %2548

2548:                                             ; preds = %2538, %2517
  %2549 = load i8*, i8** %19, align 4
  %2550 = icmp ne i8* %2549, null
  br i1 %2550, label %2551, label %2561

2551:                                             ; preds = %2548
  %2552 = load i8*, i8** %19, align 4
  %2553 = load i8*, i8** %53, align 4
  %2554 = ptrtoint i8* %2552 to i32
  %2555 = ptrtoint i8* %2553 to i32
  %2556 = sub i32 %2554, %2555
  %2557 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2558 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2557, i32 0, i32 0
  %2559 = load i8*, i8** %2558, align 4
  %2560 = getelementptr inbounds i8, i8* %2559, i32 %2556
  store i8* %2560, i8** %19, align 4
  br label %2561

2561:                                             ; preds = %2551, %2548
  %2562 = load i8*, i8** %18, align 4
  %2563 = icmp ne i8* %2562, null
  br i1 %2563, label %2564, label %2574

2564:                                             ; preds = %2561
  %2565 = load i8*, i8** %18, align 4
  %2566 = load i8*, i8** %53, align 4
  %2567 = ptrtoint i8* %2565 to i32
  %2568 = ptrtoint i8* %2566 to i32
  %2569 = sub i32 %2567, %2568
  %2570 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2571 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2570, i32 0, i32 0
  %2572 = load i8*, i8** %2571, align 4
  %2573 = getelementptr inbounds i8, i8* %2572, i32 %2569
  store i8* %2573, i8** %18, align 4
  br label %2574

2574:                                             ; preds = %2564, %2561
  br label %2575

2575:                                             ; preds = %2574, %2511
  br label %2576

2576:                                             ; preds = %2575
  br label %2461

2577:                                             ; preds = %2461
  %2578 = load i8*, i8** %13, align 4
  %2579 = getelementptr inbounds i8, i8* %2578, i32 1
  store i8* %2579, i8** %13, align 4
  store i8 5, i8* %2578, align 1
  %2580 = load i32, i32* %23, align 4
  %2581 = trunc i32 %2580 to i8
  %2582 = load i8*, i8** %13, align 4
  %2583 = getelementptr inbounds i8, i8* %2582, i32 1
  store i8* %2583, i8** %13, align 4
  store i8 %2581, i8* %2582, align 1
  %2584 = load i8*, i8** %13, align 4
  %2585 = getelementptr inbounds i8, i8* %2584, i32 1
  store i8* %2585, i8** %13, align 4
  store i8 0, i8* %2584, align 1
  br label %2586

2586:                                             ; preds = %2577
  br label %2587

2587:                                             ; preds = %2586, %2415
  %2588 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2589 = load i32, i32* %2588, align 4
  %2590 = add i32 %2589, 1
  store i32 %2590, i32* %2588, align 4
  store i8* null, i8** %22, align 4
  store i8* null, i8** %19, align 4
  %2591 = load i8*, i8** %13, align 4
  store i8* %2591, i8** %20, align 4
  store i8* null, i8** %18, align 4
  br label %5004

2592:                                             ; preds = %2349
  %2593 = load i32, i32* %8, align 4
  %2594 = and i32 %2593, 8192
  %2595 = icmp ne i32 %2594, 0
  br i1 %2595, label %2596, label %2597

2596:                                             ; preds = %2592
  br label %4988

2597:                                             ; preds = %2592
  %2598 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2599 = load i32, i32* %2598, align 4
  %2600 = icmp eq i32 %2599, 0
  br i1 %2600, label %2601, label %2607

2601:                                             ; preds = %2597
  %2602 = load i32, i32* %8, align 4
  %2603 = and i32 %2602, 131072
  %2604 = icmp ne i32 %2603, 0
  br i1 %2604, label %2605, label %2606

2605:                                             ; preds = %2601
  br label %4988

2606:                                             ; preds = %2601
  store i32 16, i32* %5, align 4
  br label %5372

2607:                                             ; preds = %2597
  br label %2608

2608:                                             ; preds = %2607, %2310
  %2609 = load i8*, i8** %22, align 4
  %2610 = icmp ne i8* %2609, null
  br i1 %2610, label %2611, label %2741

2611:                                             ; preds = %2608
  br label %2612

2612:                                             ; preds = %2611
  br label %2613

2613:                                             ; preds = %2728, %2612
  %2614 = load i8*, i8** %13, align 4
  %2615 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2616 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2615, i32 0, i32 0
  %2617 = load i8*, i8** %2616, align 4
  %2618 = ptrtoint i8* %2614 to i32
  %2619 = ptrtoint i8* %2617 to i32
  %2620 = sub i32 %2618, %2619
  %2621 = add nsw i32 %2620, 1
  %2622 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2623 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2622, i32 0, i32 1
  %2624 = load i32, i32* %2623, align 4
  %2625 = icmp ugt i32 %2621, %2624
  br i1 %2625, label %2626, label %2729

2626:                                             ; preds = %2613
  br label %2627

2627:                                             ; preds = %2626
  %2628 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2629 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2628, i32 0, i32 0
  %2630 = load i8*, i8** %2629, align 4
  store i8* %2630, i8** %54, align 4
  %2631 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2632 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2631, i32 0, i32 1
  %2633 = load i32, i32* %2632, align 4
  %2634 = icmp eq i32 %2633, 65536
  br i1 %2634, label %2635, label %2636

2635:                                             ; preds = %2627
  store i32 15, i32* %5, align 4
  br label %5372

2636:                                             ; preds = %2627
  %2637 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2638 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2637, i32 0, i32 1
  %2639 = load i32, i32* %2638, align 4
  %2640 = shl i32 %2639, 1
  store i32 %2640, i32* %2638, align 4
  %2641 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2642 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2641, i32 0, i32 1
  %2643 = load i32, i32* %2642, align 4
  %2644 = icmp ugt i32 %2643, 65536
  br i1 %2644, label %2645, label %2648

2645:                                             ; preds = %2636
  %2646 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2647 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2646, i32 0, i32 1
  store i32 65536, i32* %2647, align 4
  br label %2648

2648:                                             ; preds = %2645, %2636
  %2649 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2650 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2649, i32 0, i32 0
  %2651 = load i8*, i8** %2650, align 4
  %2652 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2653 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2652, i32 0, i32 1
  %2654 = load i32, i32* %2653, align 4
  %2655 = call i8* @realloc(i8* %2651, i32 %2654) #7
  %2656 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2657 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2656, i32 0, i32 0
  store i8* %2655, i8** %2657, align 4
  %2658 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2659 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2658, i32 0, i32 0
  %2660 = load i8*, i8** %2659, align 4
  %2661 = icmp eq i8* %2660, null
  br i1 %2661, label %2662, label %2663

2662:                                             ; preds = %2648
  store i32 12, i32* %5, align 4
  br label %5372

2663:                                             ; preds = %2648
  %2664 = load i8*, i8** %54, align 4
  %2665 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2666 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2665, i32 0, i32 0
  %2667 = load i8*, i8** %2666, align 4
  %2668 = icmp ne i8* %2664, %2667
  br i1 %2668, label %2669, label %2727

2669:                                             ; preds = %2663
  %2670 = load i8*, i8** %13, align 4
  %2671 = load i8*, i8** %54, align 4
  %2672 = ptrtoint i8* %2670 to i32
  %2673 = ptrtoint i8* %2671 to i32
  %2674 = sub i32 %2672, %2673
  %2675 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2676 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2675, i32 0, i32 0
  %2677 = load i8*, i8** %2676, align 4
  %2678 = getelementptr inbounds i8, i8* %2677, i32 %2674
  store i8* %2678, i8** %13, align 4
  %2679 = load i8*, i8** %20, align 4
  %2680 = load i8*, i8** %54, align 4
  %2681 = ptrtoint i8* %2679 to i32
  %2682 = ptrtoint i8* %2680 to i32
  %2683 = sub i32 %2681, %2682
  %2684 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2685 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2684, i32 0, i32 0
  %2686 = load i8*, i8** %2685, align 4
  %2687 = getelementptr inbounds i8, i8* %2686, i32 %2683
  store i8* %2687, i8** %20, align 4
  %2688 = load i8*, i8** %22, align 4
  %2689 = icmp ne i8* %2688, null
  br i1 %2689, label %2690, label %2700

2690:                                             ; preds = %2669
  %2691 = load i8*, i8** %22, align 4
  %2692 = load i8*, i8** %54, align 4
  %2693 = ptrtoint i8* %2691 to i32
  %2694 = ptrtoint i8* %2692 to i32
  %2695 = sub i32 %2693, %2694
  %2696 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2697 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2696, i32 0, i32 0
  %2698 = load i8*, i8** %2697, align 4
  %2699 = getelementptr inbounds i8, i8* %2698, i32 %2695
  store i8* %2699, i8** %22, align 4
  br label %2700

2700:                                             ; preds = %2690, %2669
  %2701 = load i8*, i8** %19, align 4
  %2702 = icmp ne i8* %2701, null
  br i1 %2702, label %2703, label %2713

2703:                                             ; preds = %2700
  %2704 = load i8*, i8** %19, align 4
  %2705 = load i8*, i8** %54, align 4
  %2706 = ptrtoint i8* %2704 to i32
  %2707 = ptrtoint i8* %2705 to i32
  %2708 = sub i32 %2706, %2707
  %2709 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2710 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2709, i32 0, i32 0
  %2711 = load i8*, i8** %2710, align 4
  %2712 = getelementptr inbounds i8, i8* %2711, i32 %2708
  store i8* %2712, i8** %19, align 4
  br label %2713

2713:                                             ; preds = %2703, %2700
  %2714 = load i8*, i8** %18, align 4
  %2715 = icmp ne i8* %2714, null
  br i1 %2715, label %2716, label %2726

2716:                                             ; preds = %2713
  %2717 = load i8*, i8** %18, align 4
  %2718 = load i8*, i8** %54, align 4
  %2719 = ptrtoint i8* %2717 to i32
  %2720 = ptrtoint i8* %2718 to i32
  %2721 = sub i32 %2719, %2720
  %2722 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2723 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2722, i32 0, i32 0
  %2724 = load i8*, i8** %2723, align 4
  %2725 = getelementptr inbounds i8, i8* %2724, i32 %2721
  store i8* %2725, i8** %18, align 4
  br label %2726

2726:                                             ; preds = %2716, %2713
  br label %2727

2727:                                             ; preds = %2726, %2663
  br label %2728

2728:                                             ; preds = %2727
  br label %2613

2729:                                             ; preds = %2613
  %2730 = load i8*, i8** %13, align 4
  %2731 = getelementptr inbounds i8, i8* %2730, i32 1
  store i8* %2731, i8** %13, align 4
  store i8 19, i8* %2730, align 1
  br label %2732

2732:                                             ; preds = %2729
  %2733 = load i8*, i8** %22, align 4
  %2734 = load i8*, i8** %13, align 4
  %2735 = getelementptr inbounds i8, i8* %2734, i32 -1
  %2736 = load i8*, i8** %22, align 4
  %2737 = ptrtoint i8* %2735 to i32
  %2738 = ptrtoint i8* %2736 to i32
  %2739 = sub i32 %2737, %2738
  %2740 = sub nsw i32 %2739, 3
  call void @store_op1(i32 13, i8* %2733, i32 %2740)
  br label %2741

2741:                                             ; preds = %2732, %2608
  %2742 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2743 = load i32, i32* %2742, align 4
  %2744 = icmp eq i32 %2743, 0
  br i1 %2744, label %2745, label %2751

2745:                                             ; preds = %2741
  %2746 = load i32, i32* %8, align 4
  %2747 = and i32 %2746, 131072
  %2748 = icmp ne i32 %2747, 0
  br i1 %2748, label %2749, label %2750

2749:                                             ; preds = %2745
  br label %5006

2750:                                             ; preds = %2745
  store i32 16, i32* %5, align 4
  br label %5372

2751:                                             ; preds = %2741
  %2752 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2753 = load i32, i32* %2752, align 4
  %2754 = add i32 %2753, -1
  store i32 %2754, i32* %2752, align 4
  %2755 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2756 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2755, i32 0, i32 0
  %2757 = load i8*, i8** %2756, align 4
  %2758 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2759 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2758, align 4
  %2760 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2761 = load i32, i32* %2760, align 4
  %2762 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2759, i32 %2761
  %2763 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2762, i32 0, i32 0
  %2764 = load i32, i32* %2763, align 4
  %2765 = getelementptr inbounds i8, i8* %2757, i32 %2764
  store i8* %2765, i8** %20, align 4
  %2766 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2767 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2766, align 4
  %2768 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2769 = load i32, i32* %2768, align 4
  %2770 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2767, i32 %2769
  %2771 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2770, i32 0, i32 1
  %2772 = load i32, i32* %2771, align 4
  %2773 = icmp ne i32 %2772, 0
  br i1 %2773, label %2774, label %2787

2774:                                             ; preds = %2751
  %2775 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2776 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2775, i32 0, i32 0
  %2777 = load i8*, i8** %2776, align 4
  %2778 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2779 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2778, align 4
  %2780 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2781 = load i32, i32* %2780, align 4
  %2782 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2779, i32 %2781
  %2783 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2782, i32 0, i32 1
  %2784 = load i32, i32* %2783, align 4
  %2785 = getelementptr inbounds i8, i8* %2777, i32 %2784
  %2786 = getelementptr inbounds i8, i8* %2785, i32 -1
  br label %2788

2787:                                             ; preds = %2751
  br label %2788

2788:                                             ; preds = %2787, %2774
  %2789 = phi i8* [ %2786, %2774 ], [ null, %2787 ]
  store i8* %2789, i8** %22, align 4
  %2790 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2791 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2790, i32 0, i32 0
  %2792 = load i8*, i8** %2791, align 4
  %2793 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2794 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2793, align 4
  %2795 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2796 = load i32, i32* %2795, align 4
  %2797 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2794, i32 %2796
  %2798 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2797, i32 0, i32 3
  %2799 = load i32, i32* %2798, align 4
  %2800 = getelementptr inbounds i8, i8* %2792, i32 %2799
  store i8* %2800, i8** %19, align 4
  %2801 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2802 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2801, align 4
  %2803 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2804 = load i32, i32* %2803, align 4
  %2805 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2802, i32 %2804
  %2806 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2805, i32 0, i32 4
  %2807 = load i32, i32* %2806, align 4
  store i32 %2807, i32* %55, align 4
  store i8* null, i8** %18, align 4
  %2808 = load i32, i32* %55, align 4
  %2809 = icmp ule i32 %2808, 255
  br i1 %2809, label %2810, label %2958

2810:                                             ; preds = %2788
  %2811 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2812 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2811, i32 0, i32 0
  %2813 = load i8*, i8** %2812, align 4
  %2814 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %2815 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %2814, align 4
  %2816 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %2817 = load i32, i32* %2816, align 4
  %2818 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2815, i32 %2817
  %2819 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %2818, i32 0, i32 2
  %2820 = load i32, i32* %2819, align 4
  %2821 = getelementptr inbounds i8, i8* %2813, i32 %2820
  store i8* %2821, i8** %56, align 4
  %2822 = load i32, i32* %23, align 4
  %2823 = load i32, i32* %55, align 4
  %2824 = sub i32 %2822, %2823
  %2825 = trunc i32 %2824 to i8
  %2826 = load i8*, i8** %56, align 4
  store i8 %2825, i8* %2826, align 1
  br label %2827

2827:                                             ; preds = %2810
  br label %2828

2828:                                             ; preds = %2943, %2827
  %2829 = load i8*, i8** %13, align 4
  %2830 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2831 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2830, i32 0, i32 0
  %2832 = load i8*, i8** %2831, align 4
  %2833 = ptrtoint i8* %2829 to i32
  %2834 = ptrtoint i8* %2832 to i32
  %2835 = sub i32 %2833, %2834
  %2836 = add nsw i32 %2835, 3
  %2837 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2838 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2837, i32 0, i32 1
  %2839 = load i32, i32* %2838, align 4
  %2840 = icmp ugt i32 %2836, %2839
  br i1 %2840, label %2841, label %2944

2841:                                             ; preds = %2828
  br label %2842

2842:                                             ; preds = %2841
  %2843 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2844 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2843, i32 0, i32 0
  %2845 = load i8*, i8** %2844, align 4
  store i8* %2845, i8** %57, align 4
  %2846 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2847 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2846, i32 0, i32 1
  %2848 = load i32, i32* %2847, align 4
  %2849 = icmp eq i32 %2848, 65536
  br i1 %2849, label %2850, label %2851

2850:                                             ; preds = %2842
  store i32 15, i32* %5, align 4
  br label %5372

2851:                                             ; preds = %2842
  %2852 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2853 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2852, i32 0, i32 1
  %2854 = load i32, i32* %2853, align 4
  %2855 = shl i32 %2854, 1
  store i32 %2855, i32* %2853, align 4
  %2856 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2857 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2856, i32 0, i32 1
  %2858 = load i32, i32* %2857, align 4
  %2859 = icmp ugt i32 %2858, 65536
  br i1 %2859, label %2860, label %2863

2860:                                             ; preds = %2851
  %2861 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2862 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2861, i32 0, i32 1
  store i32 65536, i32* %2862, align 4
  br label %2863

2863:                                             ; preds = %2860, %2851
  %2864 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2865 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2864, i32 0, i32 0
  %2866 = load i8*, i8** %2865, align 4
  %2867 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2868 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2867, i32 0, i32 1
  %2869 = load i32, i32* %2868, align 4
  %2870 = call i8* @realloc(i8* %2866, i32 %2869) #7
  %2871 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2872 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2871, i32 0, i32 0
  store i8* %2870, i8** %2872, align 4
  %2873 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2874 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2873, i32 0, i32 0
  %2875 = load i8*, i8** %2874, align 4
  %2876 = icmp eq i8* %2875, null
  br i1 %2876, label %2877, label %2878

2877:                                             ; preds = %2863
  store i32 12, i32* %5, align 4
  br label %5372

2878:                                             ; preds = %2863
  %2879 = load i8*, i8** %57, align 4
  %2880 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2881 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2880, i32 0, i32 0
  %2882 = load i8*, i8** %2881, align 4
  %2883 = icmp ne i8* %2879, %2882
  br i1 %2883, label %2884, label %2942

2884:                                             ; preds = %2878
  %2885 = load i8*, i8** %13, align 4
  %2886 = load i8*, i8** %57, align 4
  %2887 = ptrtoint i8* %2885 to i32
  %2888 = ptrtoint i8* %2886 to i32
  %2889 = sub i32 %2887, %2888
  %2890 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2891 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2890, i32 0, i32 0
  %2892 = load i8*, i8** %2891, align 4
  %2893 = getelementptr inbounds i8, i8* %2892, i32 %2889
  store i8* %2893, i8** %13, align 4
  %2894 = load i8*, i8** %20, align 4
  %2895 = load i8*, i8** %57, align 4
  %2896 = ptrtoint i8* %2894 to i32
  %2897 = ptrtoint i8* %2895 to i32
  %2898 = sub i32 %2896, %2897
  %2899 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2900 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2899, i32 0, i32 0
  %2901 = load i8*, i8** %2900, align 4
  %2902 = getelementptr inbounds i8, i8* %2901, i32 %2898
  store i8* %2902, i8** %20, align 4
  %2903 = load i8*, i8** %22, align 4
  %2904 = icmp ne i8* %2903, null
  br i1 %2904, label %2905, label %2915

2905:                                             ; preds = %2884
  %2906 = load i8*, i8** %22, align 4
  %2907 = load i8*, i8** %57, align 4
  %2908 = ptrtoint i8* %2906 to i32
  %2909 = ptrtoint i8* %2907 to i32
  %2910 = sub i32 %2908, %2909
  %2911 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2912 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2911, i32 0, i32 0
  %2913 = load i8*, i8** %2912, align 4
  %2914 = getelementptr inbounds i8, i8* %2913, i32 %2910
  store i8* %2914, i8** %22, align 4
  br label %2915

2915:                                             ; preds = %2905, %2884
  %2916 = load i8*, i8** %19, align 4
  %2917 = icmp ne i8* %2916, null
  br i1 %2917, label %2918, label %2928

2918:                                             ; preds = %2915
  %2919 = load i8*, i8** %19, align 4
  %2920 = load i8*, i8** %57, align 4
  %2921 = ptrtoint i8* %2919 to i32
  %2922 = ptrtoint i8* %2920 to i32
  %2923 = sub i32 %2921, %2922
  %2924 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2925 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2924, i32 0, i32 0
  %2926 = load i8*, i8** %2925, align 4
  %2927 = getelementptr inbounds i8, i8* %2926, i32 %2923
  store i8* %2927, i8** %19, align 4
  br label %2928

2928:                                             ; preds = %2918, %2915
  %2929 = load i8*, i8** %18, align 4
  %2930 = icmp ne i8* %2929, null
  br i1 %2930, label %2931, label %2941

2931:                                             ; preds = %2928
  %2932 = load i8*, i8** %18, align 4
  %2933 = load i8*, i8** %57, align 4
  %2934 = ptrtoint i8* %2932 to i32
  %2935 = ptrtoint i8* %2933 to i32
  %2936 = sub i32 %2934, %2935
  %2937 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2938 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2937, i32 0, i32 0
  %2939 = load i8*, i8** %2938, align 4
  %2940 = getelementptr inbounds i8, i8* %2939, i32 %2936
  store i8* %2940, i8** %18, align 4
  br label %2941

2941:                                             ; preds = %2931, %2928
  br label %2942

2942:                                             ; preds = %2941, %2878
  br label %2943

2943:                                             ; preds = %2942
  br label %2828

2944:                                             ; preds = %2828
  %2945 = load i8*, i8** %13, align 4
  %2946 = getelementptr inbounds i8, i8* %2945, i32 1
  store i8* %2946, i8** %13, align 4
  store i8 6, i8* %2945, align 1
  %2947 = load i32, i32* %55, align 4
  %2948 = trunc i32 %2947 to i8
  %2949 = load i8*, i8** %13, align 4
  %2950 = getelementptr inbounds i8, i8* %2949, i32 1
  store i8* %2950, i8** %13, align 4
  store i8 %2948, i8* %2949, align 1
  %2951 = load i32, i32* %23, align 4
  %2952 = load i32, i32* %55, align 4
  %2953 = sub i32 %2951, %2952
  %2954 = trunc i32 %2953 to i8
  %2955 = load i8*, i8** %13, align 4
  %2956 = getelementptr inbounds i8, i8* %2955, i32 1
  store i8* %2956, i8** %13, align 4
  store i8 %2954, i8* %2955, align 1
  br label %2957

2957:                                             ; preds = %2944
  br label %2958

2958:                                             ; preds = %2957, %2788
  br label %5004

2959:                                             ; preds = %2349
  %2960 = load i32, i32* %8, align 4
  %2961 = and i32 %2960, 1024
  %2962 = icmp ne i32 %2961, 0
  br i1 %2962, label %2967, label %2963

2963:                                             ; preds = %2959
  %2964 = load i32, i32* %8, align 4
  %2965 = and i32 %2964, 32768
  %2966 = icmp ne i32 %2965, 0
  br i1 %2966, label %2967, label %2968

2967:                                             ; preds = %2963, %2959
  br label %4988

2968:                                             ; preds = %2963
  br label %2969

2969:                                             ; preds = %2968, %2322, %2316
  %2970 = load i32, i32* %8, align 4
  %2971 = and i32 %2970, 1024
  %2972 = icmp ne i32 %2971, 0
  br i1 %2972, label %2973, label %2974

2973:                                             ; preds = %2969
  br label %5006

2974:                                             ; preds = %2969
  br label %2975

2975:                                             ; preds = %3090, %2974
  %2976 = load i8*, i8** %13, align 4
  %2977 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2978 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2977, i32 0, i32 0
  %2979 = load i8*, i8** %2978, align 4
  %2980 = ptrtoint i8* %2976 to i32
  %2981 = ptrtoint i8* %2979 to i32
  %2982 = sub i32 %2980, %2981
  %2983 = add nsw i32 %2982, 3
  %2984 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2985 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2984, i32 0, i32 1
  %2986 = load i32, i32* %2985, align 4
  %2987 = icmp ugt i32 %2983, %2986
  br i1 %2987, label %2988, label %3091

2988:                                             ; preds = %2975
  br label %2989

2989:                                             ; preds = %2988
  %2990 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2991 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2990, i32 0, i32 0
  %2992 = load i8*, i8** %2991, align 4
  store i8* %2992, i8** %58, align 4
  %2993 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %2994 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2993, i32 0, i32 1
  %2995 = load i32, i32* %2994, align 4
  %2996 = icmp eq i32 %2995, 65536
  br i1 %2996, label %2997, label %2998

2997:                                             ; preds = %2989
  store i32 15, i32* %5, align 4
  br label %5372

2998:                                             ; preds = %2989
  %2999 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3000 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %2999, i32 0, i32 1
  %3001 = load i32, i32* %3000, align 4
  %3002 = shl i32 %3001, 1
  store i32 %3002, i32* %3000, align 4
  %3003 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3004 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3003, i32 0, i32 1
  %3005 = load i32, i32* %3004, align 4
  %3006 = icmp ugt i32 %3005, 65536
  br i1 %3006, label %3007, label %3010

3007:                                             ; preds = %2998
  %3008 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3009 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3008, i32 0, i32 1
  store i32 65536, i32* %3009, align 4
  br label %3010

3010:                                             ; preds = %3007, %2998
  %3011 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3012 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3011, i32 0, i32 0
  %3013 = load i8*, i8** %3012, align 4
  %3014 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3015 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3014, i32 0, i32 1
  %3016 = load i32, i32* %3015, align 4
  %3017 = call i8* @realloc(i8* %3013, i32 %3016) #7
  %3018 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3019 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3018, i32 0, i32 0
  store i8* %3017, i8** %3019, align 4
  %3020 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3021 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3020, i32 0, i32 0
  %3022 = load i8*, i8** %3021, align 4
  %3023 = icmp eq i8* %3022, null
  br i1 %3023, label %3024, label %3025

3024:                                             ; preds = %3010
  store i32 12, i32* %5, align 4
  br label %5372

3025:                                             ; preds = %3010
  %3026 = load i8*, i8** %58, align 4
  %3027 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3028 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3027, i32 0, i32 0
  %3029 = load i8*, i8** %3028, align 4
  %3030 = icmp ne i8* %3026, %3029
  br i1 %3030, label %3031, label %3089

3031:                                             ; preds = %3025
  %3032 = load i8*, i8** %13, align 4
  %3033 = load i8*, i8** %58, align 4
  %3034 = ptrtoint i8* %3032 to i32
  %3035 = ptrtoint i8* %3033 to i32
  %3036 = sub i32 %3034, %3035
  %3037 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3038 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3037, i32 0, i32 0
  %3039 = load i8*, i8** %3038, align 4
  %3040 = getelementptr inbounds i8, i8* %3039, i32 %3036
  store i8* %3040, i8** %13, align 4
  %3041 = load i8*, i8** %20, align 4
  %3042 = load i8*, i8** %58, align 4
  %3043 = ptrtoint i8* %3041 to i32
  %3044 = ptrtoint i8* %3042 to i32
  %3045 = sub i32 %3043, %3044
  %3046 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3047 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3046, i32 0, i32 0
  %3048 = load i8*, i8** %3047, align 4
  %3049 = getelementptr inbounds i8, i8* %3048, i32 %3045
  store i8* %3049, i8** %20, align 4
  %3050 = load i8*, i8** %22, align 4
  %3051 = icmp ne i8* %3050, null
  br i1 %3051, label %3052, label %3062

3052:                                             ; preds = %3031
  %3053 = load i8*, i8** %22, align 4
  %3054 = load i8*, i8** %58, align 4
  %3055 = ptrtoint i8* %3053 to i32
  %3056 = ptrtoint i8* %3054 to i32
  %3057 = sub i32 %3055, %3056
  %3058 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3059 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3058, i32 0, i32 0
  %3060 = load i8*, i8** %3059, align 4
  %3061 = getelementptr inbounds i8, i8* %3060, i32 %3057
  store i8* %3061, i8** %22, align 4
  br label %3062

3062:                                             ; preds = %3052, %3031
  %3063 = load i8*, i8** %19, align 4
  %3064 = icmp ne i8* %3063, null
  br i1 %3064, label %3065, label %3075

3065:                                             ; preds = %3062
  %3066 = load i8*, i8** %19, align 4
  %3067 = load i8*, i8** %58, align 4
  %3068 = ptrtoint i8* %3066 to i32
  %3069 = ptrtoint i8* %3067 to i32
  %3070 = sub i32 %3068, %3069
  %3071 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3072 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3071, i32 0, i32 0
  %3073 = load i8*, i8** %3072, align 4
  %3074 = getelementptr inbounds i8, i8* %3073, i32 %3070
  store i8* %3074, i8** %19, align 4
  br label %3075

3075:                                             ; preds = %3065, %3062
  %3076 = load i8*, i8** %18, align 4
  %3077 = icmp ne i8* %3076, null
  br i1 %3077, label %3078, label %3088

3078:                                             ; preds = %3075
  %3079 = load i8*, i8** %18, align 4
  %3080 = load i8*, i8** %58, align 4
  %3081 = ptrtoint i8* %3079 to i32
  %3082 = ptrtoint i8* %3080 to i32
  %3083 = sub i32 %3081, %3082
  %3084 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3085 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3084, i32 0, i32 0
  %3086 = load i8*, i8** %3085, align 4
  %3087 = getelementptr inbounds i8, i8* %3086, i32 %3083
  store i8* %3087, i8** %18, align 4
  br label %3088

3088:                                             ; preds = %3078, %3075
  br label %3089

3089:                                             ; preds = %3088, %3025
  br label %3090

3090:                                             ; preds = %3089
  br label %2975

3091:                                             ; preds = %2975
  %3092 = load i8*, i8** %20, align 4
  %3093 = load i8*, i8** %13, align 4
  %3094 = getelementptr inbounds i8, i8* %3093, i32 6
  %3095 = load i8*, i8** %20, align 4
  %3096 = ptrtoint i8* %3094 to i32
  %3097 = ptrtoint i8* %3095 to i32
  %3098 = sub i32 %3096, %3097
  %3099 = sub nsw i32 %3098, 3
  %3100 = load i8*, i8** %13, align 4
  call void @insert_op1(i32 14, i8* %3092, i32 %3099, i8* %3100)
  store i8* null, i8** %18, align 4
  %3101 = load i8*, i8** %13, align 4
  %3102 = getelementptr inbounds i8, i8* %3101, i32 3
  store i8* %3102, i8** %13, align 4
  %3103 = load i8*, i8** %22, align 4
  %3104 = icmp ne i8* %3103, null
  br i1 %3104, label %3105, label %3113

3105:                                             ; preds = %3091
  %3106 = load i8*, i8** %22, align 4
  %3107 = load i8*, i8** %13, align 4
  %3108 = load i8*, i8** %22, align 4
  %3109 = ptrtoint i8* %3107 to i32
  %3110 = ptrtoint i8* %3108 to i32
  %3111 = sub i32 %3109, %3110
  %3112 = sub nsw i32 %3111, 3
  call void @store_op1(i32 13, i8* %3106, i32 %3112)
  br label %3113

3113:                                             ; preds = %3105, %3091
  %3114 = load i8*, i8** %13, align 4
  store i8* %3114, i8** %22, align 4
  br label %3115

3115:                                             ; preds = %3230, %3113
  %3116 = load i8*, i8** %13, align 4
  %3117 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3118 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3117, i32 0, i32 0
  %3119 = load i8*, i8** %3118, align 4
  %3120 = ptrtoint i8* %3116 to i32
  %3121 = ptrtoint i8* %3119 to i32
  %3122 = sub i32 %3120, %3121
  %3123 = add nsw i32 %3122, 3
  %3124 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3125 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3124, i32 0, i32 1
  %3126 = load i32, i32* %3125, align 4
  %3127 = icmp ugt i32 %3123, %3126
  br i1 %3127, label %3128, label %3231

3128:                                             ; preds = %3115
  br label %3129

3129:                                             ; preds = %3128
  %3130 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3131 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3130, i32 0, i32 0
  %3132 = load i8*, i8** %3131, align 4
  store i8* %3132, i8** %59, align 4
  %3133 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3134 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3133, i32 0, i32 1
  %3135 = load i32, i32* %3134, align 4
  %3136 = icmp eq i32 %3135, 65536
  br i1 %3136, label %3137, label %3138

3137:                                             ; preds = %3129
  store i32 15, i32* %5, align 4
  br label %5372

3138:                                             ; preds = %3129
  %3139 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3140 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3139, i32 0, i32 1
  %3141 = load i32, i32* %3140, align 4
  %3142 = shl i32 %3141, 1
  store i32 %3142, i32* %3140, align 4
  %3143 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3144 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3143, i32 0, i32 1
  %3145 = load i32, i32* %3144, align 4
  %3146 = icmp ugt i32 %3145, 65536
  br i1 %3146, label %3147, label %3150

3147:                                             ; preds = %3138
  %3148 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3149 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3148, i32 0, i32 1
  store i32 65536, i32* %3149, align 4
  br label %3150

3150:                                             ; preds = %3147, %3138
  %3151 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3152 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3151, i32 0, i32 0
  %3153 = load i8*, i8** %3152, align 4
  %3154 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3155 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3154, i32 0, i32 1
  %3156 = load i32, i32* %3155, align 4
  %3157 = call i8* @realloc(i8* %3153, i32 %3156) #7
  %3158 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3159 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3158, i32 0, i32 0
  store i8* %3157, i8** %3159, align 4
  %3160 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3161 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3160, i32 0, i32 0
  %3162 = load i8*, i8** %3161, align 4
  %3163 = icmp eq i8* %3162, null
  br i1 %3163, label %3164, label %3165

3164:                                             ; preds = %3150
  store i32 12, i32* %5, align 4
  br label %5372

3165:                                             ; preds = %3150
  %3166 = load i8*, i8** %59, align 4
  %3167 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3168 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3167, i32 0, i32 0
  %3169 = load i8*, i8** %3168, align 4
  %3170 = icmp ne i8* %3166, %3169
  br i1 %3170, label %3171, label %3229

3171:                                             ; preds = %3165
  %3172 = load i8*, i8** %13, align 4
  %3173 = load i8*, i8** %59, align 4
  %3174 = ptrtoint i8* %3172 to i32
  %3175 = ptrtoint i8* %3173 to i32
  %3176 = sub i32 %3174, %3175
  %3177 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3178 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3177, i32 0, i32 0
  %3179 = load i8*, i8** %3178, align 4
  %3180 = getelementptr inbounds i8, i8* %3179, i32 %3176
  store i8* %3180, i8** %13, align 4
  %3181 = load i8*, i8** %20, align 4
  %3182 = load i8*, i8** %59, align 4
  %3183 = ptrtoint i8* %3181 to i32
  %3184 = ptrtoint i8* %3182 to i32
  %3185 = sub i32 %3183, %3184
  %3186 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3187 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3186, i32 0, i32 0
  %3188 = load i8*, i8** %3187, align 4
  %3189 = getelementptr inbounds i8, i8* %3188, i32 %3185
  store i8* %3189, i8** %20, align 4
  %3190 = load i8*, i8** %22, align 4
  %3191 = icmp ne i8* %3190, null
  br i1 %3191, label %3192, label %3202

3192:                                             ; preds = %3171
  %3193 = load i8*, i8** %22, align 4
  %3194 = load i8*, i8** %59, align 4
  %3195 = ptrtoint i8* %3193 to i32
  %3196 = ptrtoint i8* %3194 to i32
  %3197 = sub i32 %3195, %3196
  %3198 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3199 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3198, i32 0, i32 0
  %3200 = load i8*, i8** %3199, align 4
  %3201 = getelementptr inbounds i8, i8* %3200, i32 %3197
  store i8* %3201, i8** %22, align 4
  br label %3202

3202:                                             ; preds = %3192, %3171
  %3203 = load i8*, i8** %19, align 4
  %3204 = icmp ne i8* %3203, null
  br i1 %3204, label %3205, label %3215

3205:                                             ; preds = %3202
  %3206 = load i8*, i8** %19, align 4
  %3207 = load i8*, i8** %59, align 4
  %3208 = ptrtoint i8* %3206 to i32
  %3209 = ptrtoint i8* %3207 to i32
  %3210 = sub i32 %3208, %3209
  %3211 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3212 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3211, i32 0, i32 0
  %3213 = load i8*, i8** %3212, align 4
  %3214 = getelementptr inbounds i8, i8* %3213, i32 %3210
  store i8* %3214, i8** %19, align 4
  br label %3215

3215:                                             ; preds = %3205, %3202
  %3216 = load i8*, i8** %18, align 4
  %3217 = icmp ne i8* %3216, null
  br i1 %3217, label %3218, label %3228

3218:                                             ; preds = %3215
  %3219 = load i8*, i8** %18, align 4
  %3220 = load i8*, i8** %59, align 4
  %3221 = ptrtoint i8* %3219 to i32
  %3222 = ptrtoint i8* %3220 to i32
  %3223 = sub i32 %3221, %3222
  %3224 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3225 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3224, i32 0, i32 0
  %3226 = load i8*, i8** %3225, align 4
  %3227 = getelementptr inbounds i8, i8* %3226, i32 %3223
  store i8* %3227, i8** %18, align 4
  br label %3228

3228:                                             ; preds = %3218, %3215
  br label %3229

3229:                                             ; preds = %3228, %3165
  br label %3230

3230:                                             ; preds = %3229
  br label %3115

3231:                                             ; preds = %3115
  %3232 = load i8*, i8** %13, align 4
  %3233 = getelementptr inbounds i8, i8* %3232, i32 3
  store i8* %3233, i8** %13, align 4
  store i8* null, i8** %19, align 4
  %3234 = load i8*, i8** %13, align 4
  store i8* %3234, i8** %20, align 4
  br label %5004

3235:                                             ; preds = %2349
  %3236 = load i32, i32* %8, align 4
  %3237 = and i32 %3236, 512
  %3238 = icmp ne i32 %3237, 0
  br i1 %3238, label %3239, label %3256

3239:                                             ; preds = %3235
  %3240 = load i32, i32* %8, align 4
  %3241 = and i32 %3240, 512
  %3242 = icmp ne i32 %3241, 0
  br i1 %3242, label %3243, label %3247

3243:                                             ; preds = %3239
  %3244 = load i32, i32* %8, align 4
  %3245 = and i32 %3244, 4096
  %3246 = icmp ne i32 %3245, 0
  br i1 %3246, label %3256, label %3247

3247:                                             ; preds = %3243, %3239
  %3248 = load i8*, i8** %15, align 4
  %3249 = getelementptr inbounds i8, i8* %3248, i32 -2
  %3250 = load i8*, i8** %6, align 4
  %3251 = icmp eq i8* %3249, %3250
  br i1 %3251, label %3252, label %3257

3252:                                             ; preds = %3247
  %3253 = load i8*, i8** %15, align 4
  %3254 = load i8*, i8** %16, align 4
  %3255 = icmp eq i8* %3253, %3254
  br i1 %3255, label %3256, label %3257

3256:                                             ; preds = %3252, %3243, %3235
  br label %4988

3257:                                             ; preds = %3252, %3247
  br label %3258

3258:                                             ; preds = %3257, %2332
  store i32 -1, i32* %60, align 4
  store i32 -1, i32* %61, align 4
  %3259 = load i8*, i8** %15, align 4
  %3260 = getelementptr inbounds i8, i8* %3259, i32 -1
  store i8* %3260, i8** %21, align 4
  %3261 = load i8*, i8** %15, align 4
  %3262 = load i8*, i8** %16, align 4
  %3263 = icmp eq i8* %3261, %3262
  br i1 %3263, label %3264, label %3270

3264:                                             ; preds = %3258
  %3265 = load i32, i32* %8, align 4
  %3266 = and i32 %3265, 4096
  %3267 = icmp ne i32 %3266, 0
  br i1 %3267, label %3268, label %3269

3268:                                             ; preds = %3264
  br label %3813

3269:                                             ; preds = %3264
  store i32 9, i32* %5, align 4
  br label %5372

3270:                                             ; preds = %3258
  %3271 = load i8*, i8** %15, align 4
  %3272 = load i8*, i8** %16, align 4
  %3273 = icmp ne i8* %3271, %3272
  br i1 %3273, label %3274, label %3347

3274:                                             ; preds = %3270
  br label %3275

3275:                                             ; preds = %3274
  %3276 = load i8*, i8** %15, align 4
  %3277 = load i8*, i8** %16, align 4
  %3278 = icmp eq i8* %3276, %3277
  br i1 %3278, label %3279, label %3280

3279:                                             ; preds = %3275
  store i32 14, i32* %5, align 4
  br label %5372

3280:                                             ; preds = %3275
  %3281 = load i8*, i8** %15, align 4
  %3282 = getelementptr inbounds i8, i8* %3281, i32 1
  store i8* %3282, i8** %15, align 4
  %3283 = load i8, i8* %3281, align 1
  store i8 %3283, i8* %10, align 1
  %3284 = load i8*, i8** %17, align 4
  %3285 = icmp ne i8* %3284, null
  br i1 %3285, label %3286, label %3292

3286:                                             ; preds = %3280
  %3287 = load i8*, i8** %17, align 4
  %3288 = load i8, i8* %10, align 1
  %3289 = zext i8 %3288 to i32
  %3290 = getelementptr inbounds i8, i8* %3287, i32 %3289
  %3291 = load i8, i8* %3290, align 1
  store i8 %3291, i8* %10, align 1
  br label %3292

3292:                                             ; preds = %3286, %3280
  br label %3293

3293:                                             ; preds = %3292
  br label %3294

3294:                                             ; preds = %3345, %3293
  %3295 = load i8, i8* %10, align 1
  %3296 = zext i8 %3295 to i32
  %3297 = and i32 %3296, -128
  %3298 = icmp eq i32 %3297, 0
  br i1 %3298, label %3299, label %3309

3299:                                             ; preds = %3294
  %3300 = call i16** @__ctype_b_loc() #10
  %3301 = load i16*, i16** %3300, align 4
  %3302 = load i8, i8* %10, align 1
  %3303 = zext i8 %3302 to i32
  %3304 = getelementptr inbounds i16, i16* %3301, i32 %3303
  %3305 = load i16, i16* %3304, align 2
  %3306 = zext i16 %3305 to i32
  %3307 = and i32 %3306, 2048
  %3308 = icmp ne i32 %3307, 0
  br label %3309

3309:                                             ; preds = %3299, %3294
  %3310 = phi i1 [ false, %3294 ], [ %3308, %3299 ]
  br i1 %3310, label %3311, label %3346

3311:                                             ; preds = %3309
  %3312 = load i32, i32* %60, align 4
  %3313 = icmp slt i32 %3312, 0
  br i1 %3313, label %3314, label %3315

3314:                                             ; preds = %3311
  store i32 0, i32* %60, align 4
  br label %3315

3315:                                             ; preds = %3314, %3311
  %3316 = load i32, i32* %60, align 4
  %3317 = mul nsw i32 %3316, 10
  %3318 = load i8, i8* %10, align 1
  %3319 = zext i8 %3318 to i32
  %3320 = add nsw i32 %3317, %3319
  %3321 = sub nsw i32 %3320, 48
  store i32 %3321, i32* %60, align 4
  %3322 = load i8*, i8** %15, align 4
  %3323 = load i8*, i8** %16, align 4
  %3324 = icmp eq i8* %3322, %3323
  br i1 %3324, label %3325, label %3326

3325:                                             ; preds = %3315
  br label %3346

3326:                                             ; preds = %3315
  br label %3327

3327:                                             ; preds = %3326
  %3328 = load i8*, i8** %15, align 4
  %3329 = load i8*, i8** %16, align 4
  %3330 = icmp eq i8* %3328, %3329
  br i1 %3330, label %3331, label %3332

3331:                                             ; preds = %3327
  store i32 14, i32* %5, align 4
  br label %5372

3332:                                             ; preds = %3327
  %3333 = load i8*, i8** %15, align 4
  %3334 = getelementptr inbounds i8, i8* %3333, i32 1
  store i8* %3334, i8** %15, align 4
  %3335 = load i8, i8* %3333, align 1
  store i8 %3335, i8* %10, align 1
  %3336 = load i8*, i8** %17, align 4
  %3337 = icmp ne i8* %3336, null
  br i1 %3337, label %3338, label %3344

3338:                                             ; preds = %3332
  %3339 = load i8*, i8** %17, align 4
  %3340 = load i8, i8* %10, align 1
  %3341 = zext i8 %3340 to i32
  %3342 = getelementptr inbounds i8, i8* %3339, i32 %3341
  %3343 = load i8, i8* %3342, align 1
  store i8 %3343, i8* %10, align 1
  br label %3344

3344:                                             ; preds = %3338, %3332
  br label %3345

3345:                                             ; preds = %3344
  br label %3294

3346:                                             ; preds = %3325, %3309
  br label %3347

3347:                                             ; preds = %3346, %3270
  %3348 = load i8, i8* %10, align 1
  %3349 = zext i8 %3348 to i32
  %3350 = icmp eq i32 %3349, 44
  br i1 %3350, label %3351, label %3433

3351:                                             ; preds = %3347
  %3352 = load i8*, i8** %15, align 4
  %3353 = load i8*, i8** %16, align 4
  %3354 = icmp ne i8* %3352, %3353
  br i1 %3354, label %3355, label %3428

3355:                                             ; preds = %3351
  br label %3356

3356:                                             ; preds = %3355
  %3357 = load i8*, i8** %15, align 4
  %3358 = load i8*, i8** %16, align 4
  %3359 = icmp eq i8* %3357, %3358
  br i1 %3359, label %3360, label %3361

3360:                                             ; preds = %3356
  store i32 14, i32* %5, align 4
  br label %5372

3361:                                             ; preds = %3356
  %3362 = load i8*, i8** %15, align 4
  %3363 = getelementptr inbounds i8, i8* %3362, i32 1
  store i8* %3363, i8** %15, align 4
  %3364 = load i8, i8* %3362, align 1
  store i8 %3364, i8* %10, align 1
  %3365 = load i8*, i8** %17, align 4
  %3366 = icmp ne i8* %3365, null
  br i1 %3366, label %3367, label %3373

3367:                                             ; preds = %3361
  %3368 = load i8*, i8** %17, align 4
  %3369 = load i8, i8* %10, align 1
  %3370 = zext i8 %3369 to i32
  %3371 = getelementptr inbounds i8, i8* %3368, i32 %3370
  %3372 = load i8, i8* %3371, align 1
  store i8 %3372, i8* %10, align 1
  br label %3373

3373:                                             ; preds = %3367, %3361
  br label %3374

3374:                                             ; preds = %3373
  br label %3375

3375:                                             ; preds = %3426, %3374
  %3376 = load i8, i8* %10, align 1
  %3377 = zext i8 %3376 to i32
  %3378 = and i32 %3377, -128
  %3379 = icmp eq i32 %3378, 0
  br i1 %3379, label %3380, label %3390

3380:                                             ; preds = %3375
  %3381 = call i16** @__ctype_b_loc() #10
  %3382 = load i16*, i16** %3381, align 4
  %3383 = load i8, i8* %10, align 1
  %3384 = zext i8 %3383 to i32
  %3385 = getelementptr inbounds i16, i16* %3382, i32 %3384
  %3386 = load i16, i16* %3385, align 2
  %3387 = zext i16 %3386 to i32
  %3388 = and i32 %3387, 2048
  %3389 = icmp ne i32 %3388, 0
  br label %3390

3390:                                             ; preds = %3380, %3375
  %3391 = phi i1 [ false, %3375 ], [ %3389, %3380 ]
  br i1 %3391, label %3392, label %3427

3392:                                             ; preds = %3390
  %3393 = load i32, i32* %61, align 4
  %3394 = icmp slt i32 %3393, 0
  br i1 %3394, label %3395, label %3396

3395:                                             ; preds = %3392
  store i32 0, i32* %61, align 4
  br label %3396

3396:                                             ; preds = %3395, %3392
  %3397 = load i32, i32* %61, align 4
  %3398 = mul nsw i32 %3397, 10
  %3399 = load i8, i8* %10, align 1
  %3400 = zext i8 %3399 to i32
  %3401 = add nsw i32 %3398, %3400
  %3402 = sub nsw i32 %3401, 48
  store i32 %3402, i32* %61, align 4
  %3403 = load i8*, i8** %15, align 4
  %3404 = load i8*, i8** %16, align 4
  %3405 = icmp eq i8* %3403, %3404
  br i1 %3405, label %3406, label %3407

3406:                                             ; preds = %3396
  br label %3427

3407:                                             ; preds = %3396
  br label %3408

3408:                                             ; preds = %3407
  %3409 = load i8*, i8** %15, align 4
  %3410 = load i8*, i8** %16, align 4
  %3411 = icmp eq i8* %3409, %3410
  br i1 %3411, label %3412, label %3413

3412:                                             ; preds = %3408
  store i32 14, i32* %5, align 4
  br label %5372

3413:                                             ; preds = %3408
  %3414 = load i8*, i8** %15, align 4
  %3415 = getelementptr inbounds i8, i8* %3414, i32 1
  store i8* %3415, i8** %15, align 4
  %3416 = load i8, i8* %3414, align 1
  store i8 %3416, i8* %10, align 1
  %3417 = load i8*, i8** %17, align 4
  %3418 = icmp ne i8* %3417, null
  br i1 %3418, label %3419, label %3425

3419:                                             ; preds = %3413
  %3420 = load i8*, i8** %17, align 4
  %3421 = load i8, i8* %10, align 1
  %3422 = zext i8 %3421 to i32
  %3423 = getelementptr inbounds i8, i8* %3420, i32 %3422
  %3424 = load i8, i8* %3423, align 1
  store i8 %3424, i8* %10, align 1
  br label %3425

3425:                                             ; preds = %3419, %3413
  br label %3426

3426:                                             ; preds = %3425
  br label %3375

3427:                                             ; preds = %3406, %3390
  br label %3428

3428:                                             ; preds = %3427, %3351
  %3429 = load i32, i32* %61, align 4
  %3430 = icmp slt i32 %3429, 0
  br i1 %3430, label %3431, label %3432

3431:                                             ; preds = %3428
  store i32 32767, i32* %61, align 4
  br label %3432

3432:                                             ; preds = %3431, %3428
  br label %3435

3433:                                             ; preds = %3347
  %3434 = load i32, i32* %60, align 4
  store i32 %3434, i32* %61, align 4
  br label %3435

3435:                                             ; preds = %3433, %3432
  %3436 = load i32, i32* %60, align 4
  %3437 = icmp slt i32 %3436, 0
  br i1 %3437, label %3445, label %3438

3438:                                             ; preds = %3435
  %3439 = load i32, i32* %61, align 4
  %3440 = icmp sgt i32 %3439, 32767
  br i1 %3440, label %3445, label %3441

3441:                                             ; preds = %3438
  %3442 = load i32, i32* %60, align 4
  %3443 = load i32, i32* %61, align 4
  %3444 = icmp sgt i32 %3442, %3443
  br i1 %3444, label %3445, label %3451

3445:                                             ; preds = %3441, %3438, %3435
  %3446 = load i32, i32* %8, align 4
  %3447 = and i32 %3446, 4096
  %3448 = icmp ne i32 %3447, 0
  br i1 %3448, label %3449, label %3450

3449:                                             ; preds = %3445
  br label %3813

3450:                                             ; preds = %3445
  store i32 10, i32* %5, align 4
  br label %5372

3451:                                             ; preds = %3441
  %3452 = load i32, i32* %8, align 4
  %3453 = and i32 %3452, 4096
  %3454 = icmp ne i32 %3453, 0
  br i1 %3454, label %3480, label %3455

3455:                                             ; preds = %3451
  %3456 = load i8, i8* %10, align 1
  %3457 = zext i8 %3456 to i32
  %3458 = icmp ne i32 %3457, 92
  br i1 %3458, label %3459, label %3460

3459:                                             ; preds = %3455
  store i32 9, i32* %5, align 4
  br label %5372

3460:                                             ; preds = %3455
  br label %3461

3461:                                             ; preds = %3460
  %3462 = load i8*, i8** %15, align 4
  %3463 = load i8*, i8** %16, align 4
  %3464 = icmp eq i8* %3462, %3463
  br i1 %3464, label %3465, label %3466

3465:                                             ; preds = %3461
  store i32 14, i32* %5, align 4
  br label %5372

3466:                                             ; preds = %3461
  %3467 = load i8*, i8** %15, align 4
  %3468 = getelementptr inbounds i8, i8* %3467, i32 1
  store i8* %3468, i8** %15, align 4
  %3469 = load i8, i8* %3467, align 1
  store i8 %3469, i8* %10, align 1
  %3470 = load i8*, i8** %17, align 4
  %3471 = icmp ne i8* %3470, null
  br i1 %3471, label %3472, label %3478

3472:                                             ; preds = %3466
  %3473 = load i8*, i8** %17, align 4
  %3474 = load i8, i8* %10, align 1
  %3475 = zext i8 %3474 to i32
  %3476 = getelementptr inbounds i8, i8* %3473, i32 %3475
  %3477 = load i8, i8* %3476, align 1
  store i8 %3477, i8* %10, align 1
  br label %3478

3478:                                             ; preds = %3472, %3466
  br label %3479

3479:                                             ; preds = %3478
  br label %3480

3480:                                             ; preds = %3479, %3451
  %3481 = load i8, i8* %10, align 1
  %3482 = zext i8 %3481 to i32
  %3483 = icmp ne i32 %3482, 125
  br i1 %3483, label %3484, label %3490

3484:                                             ; preds = %3480
  %3485 = load i32, i32* %8, align 4
  %3486 = and i32 %3485, 4096
  %3487 = icmp ne i32 %3486, 0
  br i1 %3487, label %3488, label %3489

3488:                                             ; preds = %3484
  br label %3813

3489:                                             ; preds = %3484
  store i32 10, i32* %5, align 4
  br label %5372

3490:                                             ; preds = %3480
  %3491 = load i8*, i8** %19, align 4
  %3492 = icmp ne i8* %3491, null
  br i1 %3492, label %3507, label %3493

3493:                                             ; preds = %3490
  %3494 = load i32, i32* %8, align 4
  %3495 = and i32 %3494, 32
  %3496 = icmp ne i32 %3495, 0
  br i1 %3496, label %3497, label %3498

3497:                                             ; preds = %3493
  store i32 13, i32* %5, align 4
  br label %5372

3498:                                             ; preds = %3493
  %3499 = load i32, i32* %8, align 4
  %3500 = and i32 %3499, 16
  %3501 = icmp ne i32 %3500, 0
  br i1 %3501, label %3502, label %3504

3502:                                             ; preds = %3498
  %3503 = load i8*, i8** %13, align 4
  store i8* %3503, i8** %19, align 4
  br label %3505

3504:                                             ; preds = %3498
  br label %3813

3505:                                             ; preds = %3502
  br label %3506

3506:                                             ; preds = %3505
  br label %3507

3507:                                             ; preds = %3506, %3490
  %3508 = load i32, i32* %61, align 4
  %3509 = icmp eq i32 %3508, 0
  br i1 %3509, label %3510, label %3639

3510:                                             ; preds = %3507
  br label %3511

3511:                                             ; preds = %3626, %3510
  %3512 = load i8*, i8** %13, align 4
  %3513 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3514 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3513, i32 0, i32 0
  %3515 = load i8*, i8** %3514, align 4
  %3516 = ptrtoint i8* %3512 to i32
  %3517 = ptrtoint i8* %3515 to i32
  %3518 = sub i32 %3516, %3517
  %3519 = add nsw i32 %3518, 3
  %3520 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3521 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3520, i32 0, i32 1
  %3522 = load i32, i32* %3521, align 4
  %3523 = icmp ugt i32 %3519, %3522
  br i1 %3523, label %3524, label %3627

3524:                                             ; preds = %3511
  br label %3525

3525:                                             ; preds = %3524
  %3526 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3527 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3526, i32 0, i32 0
  %3528 = load i8*, i8** %3527, align 4
  store i8* %3528, i8** %62, align 4
  %3529 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3530 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3529, i32 0, i32 1
  %3531 = load i32, i32* %3530, align 4
  %3532 = icmp eq i32 %3531, 65536
  br i1 %3532, label %3533, label %3534

3533:                                             ; preds = %3525
  store i32 15, i32* %5, align 4
  br label %5372

3534:                                             ; preds = %3525
  %3535 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3536 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3535, i32 0, i32 1
  %3537 = load i32, i32* %3536, align 4
  %3538 = shl i32 %3537, 1
  store i32 %3538, i32* %3536, align 4
  %3539 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3540 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3539, i32 0, i32 1
  %3541 = load i32, i32* %3540, align 4
  %3542 = icmp ugt i32 %3541, 65536
  br i1 %3542, label %3543, label %3546

3543:                                             ; preds = %3534
  %3544 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3545 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3544, i32 0, i32 1
  store i32 65536, i32* %3545, align 4
  br label %3546

3546:                                             ; preds = %3543, %3534
  %3547 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3548 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3547, i32 0, i32 0
  %3549 = load i8*, i8** %3548, align 4
  %3550 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3551 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3550, i32 0, i32 1
  %3552 = load i32, i32* %3551, align 4
  %3553 = call i8* @realloc(i8* %3549, i32 %3552) #7
  %3554 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3555 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3554, i32 0, i32 0
  store i8* %3553, i8** %3555, align 4
  %3556 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3557 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3556, i32 0, i32 0
  %3558 = load i8*, i8** %3557, align 4
  %3559 = icmp eq i8* %3558, null
  br i1 %3559, label %3560, label %3561

3560:                                             ; preds = %3546
  store i32 12, i32* %5, align 4
  br label %5372

3561:                                             ; preds = %3546
  %3562 = load i8*, i8** %62, align 4
  %3563 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3564 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3563, i32 0, i32 0
  %3565 = load i8*, i8** %3564, align 4
  %3566 = icmp ne i8* %3562, %3565
  br i1 %3566, label %3567, label %3625

3567:                                             ; preds = %3561
  %3568 = load i8*, i8** %13, align 4
  %3569 = load i8*, i8** %62, align 4
  %3570 = ptrtoint i8* %3568 to i32
  %3571 = ptrtoint i8* %3569 to i32
  %3572 = sub i32 %3570, %3571
  %3573 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3574 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3573, i32 0, i32 0
  %3575 = load i8*, i8** %3574, align 4
  %3576 = getelementptr inbounds i8, i8* %3575, i32 %3572
  store i8* %3576, i8** %13, align 4
  %3577 = load i8*, i8** %20, align 4
  %3578 = load i8*, i8** %62, align 4
  %3579 = ptrtoint i8* %3577 to i32
  %3580 = ptrtoint i8* %3578 to i32
  %3581 = sub i32 %3579, %3580
  %3582 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3583 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3582, i32 0, i32 0
  %3584 = load i8*, i8** %3583, align 4
  %3585 = getelementptr inbounds i8, i8* %3584, i32 %3581
  store i8* %3585, i8** %20, align 4
  %3586 = load i8*, i8** %22, align 4
  %3587 = icmp ne i8* %3586, null
  br i1 %3587, label %3588, label %3598

3588:                                             ; preds = %3567
  %3589 = load i8*, i8** %22, align 4
  %3590 = load i8*, i8** %62, align 4
  %3591 = ptrtoint i8* %3589 to i32
  %3592 = ptrtoint i8* %3590 to i32
  %3593 = sub i32 %3591, %3592
  %3594 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3595 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3594, i32 0, i32 0
  %3596 = load i8*, i8** %3595, align 4
  %3597 = getelementptr inbounds i8, i8* %3596, i32 %3593
  store i8* %3597, i8** %22, align 4
  br label %3598

3598:                                             ; preds = %3588, %3567
  %3599 = load i8*, i8** %19, align 4
  %3600 = icmp ne i8* %3599, null
  br i1 %3600, label %3601, label %3611

3601:                                             ; preds = %3598
  %3602 = load i8*, i8** %19, align 4
  %3603 = load i8*, i8** %62, align 4
  %3604 = ptrtoint i8* %3602 to i32
  %3605 = ptrtoint i8* %3603 to i32
  %3606 = sub i32 %3604, %3605
  %3607 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3608 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3607, i32 0, i32 0
  %3609 = load i8*, i8** %3608, align 4
  %3610 = getelementptr inbounds i8, i8* %3609, i32 %3606
  store i8* %3610, i8** %19, align 4
  br label %3611

3611:                                             ; preds = %3601, %3598
  %3612 = load i8*, i8** %18, align 4
  %3613 = icmp ne i8* %3612, null
  br i1 %3613, label %3614, label %3624

3614:                                             ; preds = %3611
  %3615 = load i8*, i8** %18, align 4
  %3616 = load i8*, i8** %62, align 4
  %3617 = ptrtoint i8* %3615 to i32
  %3618 = ptrtoint i8* %3616 to i32
  %3619 = sub i32 %3617, %3618
  %3620 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3621 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3620, i32 0, i32 0
  %3622 = load i8*, i8** %3621, align 4
  %3623 = getelementptr inbounds i8, i8* %3622, i32 %3619
  store i8* %3623, i8** %18, align 4
  br label %3624

3624:                                             ; preds = %3614, %3611
  br label %3625

3625:                                             ; preds = %3624, %3561
  br label %3626

3626:                                             ; preds = %3625
  br label %3511

3627:                                             ; preds = %3511
  %3628 = load i8*, i8** %19, align 4
  %3629 = load i8*, i8** %13, align 4
  %3630 = getelementptr inbounds i8, i8* %3629, i32 3
  %3631 = load i8*, i8** %19, align 4
  %3632 = ptrtoint i8* %3630 to i32
  %3633 = ptrtoint i8* %3631 to i32
  %3634 = sub i32 %3632, %3633
  %3635 = sub nsw i32 %3634, 3
  %3636 = load i8*, i8** %13, align 4
  call void @insert_op1(i32 12, i8* %3628, i32 %3635, i8* %3636)
  %3637 = load i8*, i8** %13, align 4
  %3638 = getelementptr inbounds i8, i8* %3637, i32 3
  store i8* %3638, i8** %13, align 4
  br label %3812

3639:                                             ; preds = %3507
  %3640 = load i32, i32* %61, align 4
  %3641 = icmp sgt i32 %3640, 1
  %3642 = zext i1 %3641 to i32
  %3643 = mul nsw i32 %3642, 10
  %3644 = add nsw i32 10, %3643
  store i32 %3644, i32* %63, align 4
  br label %3645

3645:                                             ; preds = %3761, %3639
  %3646 = load i8*, i8** %13, align 4
  %3647 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3648 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3647, i32 0, i32 0
  %3649 = load i8*, i8** %3648, align 4
  %3650 = ptrtoint i8* %3646 to i32
  %3651 = ptrtoint i8* %3649 to i32
  %3652 = sub i32 %3650, %3651
  %3653 = load i32, i32* %63, align 4
  %3654 = add i32 %3652, %3653
  %3655 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3656 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3655, i32 0, i32 1
  %3657 = load i32, i32* %3656, align 4
  %3658 = icmp ugt i32 %3654, %3657
  br i1 %3658, label %3659, label %3762

3659:                                             ; preds = %3645
  br label %3660

3660:                                             ; preds = %3659
  %3661 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3662 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3661, i32 0, i32 0
  %3663 = load i8*, i8** %3662, align 4
  store i8* %3663, i8** %64, align 4
  %3664 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3665 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3664, i32 0, i32 1
  %3666 = load i32, i32* %3665, align 4
  %3667 = icmp eq i32 %3666, 65536
  br i1 %3667, label %3668, label %3669

3668:                                             ; preds = %3660
  store i32 15, i32* %5, align 4
  br label %5372

3669:                                             ; preds = %3660
  %3670 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3671 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3670, i32 0, i32 1
  %3672 = load i32, i32* %3671, align 4
  %3673 = shl i32 %3672, 1
  store i32 %3673, i32* %3671, align 4
  %3674 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3675 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3674, i32 0, i32 1
  %3676 = load i32, i32* %3675, align 4
  %3677 = icmp ugt i32 %3676, 65536
  br i1 %3677, label %3678, label %3681

3678:                                             ; preds = %3669
  %3679 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3680 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3679, i32 0, i32 1
  store i32 65536, i32* %3680, align 4
  br label %3681

3681:                                             ; preds = %3678, %3669
  %3682 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3683 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3682, i32 0, i32 0
  %3684 = load i8*, i8** %3683, align 4
  %3685 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3686 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3685, i32 0, i32 1
  %3687 = load i32, i32* %3686, align 4
  %3688 = call i8* @realloc(i8* %3684, i32 %3687) #7
  %3689 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3690 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3689, i32 0, i32 0
  store i8* %3688, i8** %3690, align 4
  %3691 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3692 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3691, i32 0, i32 0
  %3693 = load i8*, i8** %3692, align 4
  %3694 = icmp eq i8* %3693, null
  br i1 %3694, label %3695, label %3696

3695:                                             ; preds = %3681
  store i32 12, i32* %5, align 4
  br label %5372

3696:                                             ; preds = %3681
  %3697 = load i8*, i8** %64, align 4
  %3698 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3699 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3698, i32 0, i32 0
  %3700 = load i8*, i8** %3699, align 4
  %3701 = icmp ne i8* %3697, %3700
  br i1 %3701, label %3702, label %3760

3702:                                             ; preds = %3696
  %3703 = load i8*, i8** %13, align 4
  %3704 = load i8*, i8** %64, align 4
  %3705 = ptrtoint i8* %3703 to i32
  %3706 = ptrtoint i8* %3704 to i32
  %3707 = sub i32 %3705, %3706
  %3708 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3709 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3708, i32 0, i32 0
  %3710 = load i8*, i8** %3709, align 4
  %3711 = getelementptr inbounds i8, i8* %3710, i32 %3707
  store i8* %3711, i8** %13, align 4
  %3712 = load i8*, i8** %20, align 4
  %3713 = load i8*, i8** %64, align 4
  %3714 = ptrtoint i8* %3712 to i32
  %3715 = ptrtoint i8* %3713 to i32
  %3716 = sub i32 %3714, %3715
  %3717 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3718 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3717, i32 0, i32 0
  %3719 = load i8*, i8** %3718, align 4
  %3720 = getelementptr inbounds i8, i8* %3719, i32 %3716
  store i8* %3720, i8** %20, align 4
  %3721 = load i8*, i8** %22, align 4
  %3722 = icmp ne i8* %3721, null
  br i1 %3722, label %3723, label %3733

3723:                                             ; preds = %3702
  %3724 = load i8*, i8** %22, align 4
  %3725 = load i8*, i8** %64, align 4
  %3726 = ptrtoint i8* %3724 to i32
  %3727 = ptrtoint i8* %3725 to i32
  %3728 = sub i32 %3726, %3727
  %3729 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3730 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3729, i32 0, i32 0
  %3731 = load i8*, i8** %3730, align 4
  %3732 = getelementptr inbounds i8, i8* %3731, i32 %3728
  store i8* %3732, i8** %22, align 4
  br label %3733

3733:                                             ; preds = %3723, %3702
  %3734 = load i8*, i8** %19, align 4
  %3735 = icmp ne i8* %3734, null
  br i1 %3735, label %3736, label %3746

3736:                                             ; preds = %3733
  %3737 = load i8*, i8** %19, align 4
  %3738 = load i8*, i8** %64, align 4
  %3739 = ptrtoint i8* %3737 to i32
  %3740 = ptrtoint i8* %3738 to i32
  %3741 = sub i32 %3739, %3740
  %3742 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3743 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3742, i32 0, i32 0
  %3744 = load i8*, i8** %3743, align 4
  %3745 = getelementptr inbounds i8, i8* %3744, i32 %3741
  store i8* %3745, i8** %19, align 4
  br label %3746

3746:                                             ; preds = %3736, %3733
  %3747 = load i8*, i8** %18, align 4
  %3748 = icmp ne i8* %3747, null
  br i1 %3748, label %3749, label %3759

3749:                                             ; preds = %3746
  %3750 = load i8*, i8** %18, align 4
  %3751 = load i8*, i8** %64, align 4
  %3752 = ptrtoint i8* %3750 to i32
  %3753 = ptrtoint i8* %3751 to i32
  %3754 = sub i32 %3752, %3753
  %3755 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3756 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3755, i32 0, i32 0
  %3757 = load i8*, i8** %3756, align 4
  %3758 = getelementptr inbounds i8, i8* %3757, i32 %3754
  store i8* %3758, i8** %18, align 4
  br label %3759

3759:                                             ; preds = %3749, %3746
  br label %3760

3760:                                             ; preds = %3759, %3696
  br label %3761

3761:                                             ; preds = %3760
  br label %3645

3762:                                             ; preds = %3645
  %3763 = load i8*, i8** %19, align 4
  %3764 = load i8*, i8** %13, align 4
  %3765 = getelementptr inbounds i8, i8* %3764, i32 5
  %3766 = load i32, i32* %61, align 4
  %3767 = icmp sgt i32 %3766, 1
  %3768 = zext i1 %3767 to i32
  %3769 = mul nsw i32 %3768, 5
  %3770 = getelementptr inbounds i8, i8* %3765, i32 %3769
  %3771 = load i8*, i8** %19, align 4
  %3772 = ptrtoint i8* %3770 to i32
  %3773 = ptrtoint i8* %3771 to i32
  %3774 = sub i32 %3772, %3773
  %3775 = sub nsw i32 %3774, 3
  %3776 = load i32, i32* %60, align 4
  %3777 = load i8*, i8** %13, align 4
  call void @insert_op2(i32 20, i8* %3763, i32 %3775, i32 %3776, i8* %3777)
  %3778 = load i8*, i8** %13, align 4
  %3779 = getelementptr inbounds i8, i8* %3778, i32 5
  store i8* %3779, i8** %13, align 4
  %3780 = load i8*, i8** %19, align 4
  %3781 = load i32, i32* %60, align 4
  %3782 = load i8*, i8** %13, align 4
  call void @insert_op2(i32 22, i8* %3780, i32 5, i32 %3781, i8* %3782)
  %3783 = load i8*, i8** %13, align 4
  %3784 = getelementptr inbounds i8, i8* %3783, i32 5
  store i8* %3784, i8** %13, align 4
  %3785 = load i32, i32* %61, align 4
  %3786 = icmp sgt i32 %3785, 1
  br i1 %3786, label %3787, label %3811

3787:                                             ; preds = %3762
  %3788 = load i8*, i8** %13, align 4
  %3789 = load i8*, i8** %19, align 4
  %3790 = getelementptr inbounds i8, i8* %3789, i32 5
  %3791 = load i8*, i8** %13, align 4
  %3792 = ptrtoint i8* %3790 to i32
  %3793 = ptrtoint i8* %3791 to i32
  %3794 = sub i32 %3792, %3793
  %3795 = sub nsw i32 %3794, 3
  %3796 = load i32, i32* %61, align 4
  %3797 = sub nsw i32 %3796, 1
  call void @store_op2(i32 21, i8* %3788, i32 %3795, i32 %3797)
  %3798 = load i8*, i8** %13, align 4
  %3799 = getelementptr inbounds i8, i8* %3798, i32 5
  store i8* %3799, i8** %13, align 4
  %3800 = load i8*, i8** %19, align 4
  %3801 = load i8*, i8** %13, align 4
  %3802 = load i8*, i8** %19, align 4
  %3803 = ptrtoint i8* %3801 to i32
  %3804 = ptrtoint i8* %3802 to i32
  %3805 = sub i32 %3803, %3804
  %3806 = load i32, i32* %61, align 4
  %3807 = sub nsw i32 %3806, 1
  %3808 = load i8*, i8** %13, align 4
  call void @insert_op2(i32 22, i8* %3800, i32 %3805, i32 %3807, i8* %3808)
  %3809 = load i8*, i8** %13, align 4
  %3810 = getelementptr inbounds i8, i8* %3809, i32 5
  store i8* %3810, i8** %13, align 4
  br label %3811

3811:                                             ; preds = %3787, %3762
  br label %3812

3812:                                             ; preds = %3811, %3627
  store i8* null, i8** %18, align 4
  store i8* null, i8** %21, align 4
  br label %5004

3813:                                             ; preds = %3504, %3488, %3449, %3268
  %3814 = load i8*, i8** %21, align 4
  store i8* %3814, i8** %15, align 4
  store i8* null, i8** %21, align 4
  br label %3815

3815:                                             ; preds = %3813
  %3816 = load i8*, i8** %15, align 4
  %3817 = load i8*, i8** %16, align 4
  %3818 = icmp eq i8* %3816, %3817
  br i1 %3818, label %3819, label %3820

3819:                                             ; preds = %3815
  store i32 14, i32* %5, align 4
  br label %5372

3820:                                             ; preds = %3815
  %3821 = load i8*, i8** %15, align 4
  %3822 = getelementptr inbounds i8, i8* %3821, i32 1
  store i8* %3822, i8** %15, align 4
  %3823 = load i8, i8* %3821, align 1
  store i8 %3823, i8* %10, align 1
  %3824 = load i8*, i8** %17, align 4
  %3825 = icmp ne i8* %3824, null
  br i1 %3825, label %3826, label %3832

3826:                                             ; preds = %3820
  %3827 = load i8*, i8** %17, align 4
  %3828 = load i8, i8* %10, align 1
  %3829 = zext i8 %3828 to i32
  %3830 = getelementptr inbounds i8, i8* %3827, i32 %3829
  %3831 = load i8, i8* %3830, align 1
  store i8 %3831, i8* %10, align 1
  br label %3832

3832:                                             ; preds = %3826, %3820
  br label %3833

3833:                                             ; preds = %3832
  %3834 = load i32, i32* %8, align 4
  %3835 = and i32 %3834, 4096
  %3836 = icmp ne i32 %3835, 0
  br i1 %3836, label %3849, label %3837

3837:                                             ; preds = %3833
  %3838 = load i8*, i8** %15, align 4
  %3839 = load i8*, i8** %6, align 4
  %3840 = icmp ugt i8* %3838, %3839
  br i1 %3840, label %3841, label %3848

3841:                                             ; preds = %3837
  %3842 = load i8*, i8** %15, align 4
  %3843 = getelementptr inbounds i8, i8* %3842, i32 -1
  %3844 = load i8, i8* %3843, align 1
  %3845 = sext i8 %3844 to i32
  %3846 = icmp eq i32 %3845, 92
  br i1 %3846, label %3847, label %3848

3847:                                             ; preds = %3841
  br label %4988

3848:                                             ; preds = %3841, %3837
  br label %3849

3849:                                             ; preds = %3848, %3833
  br label %5006

3850:                                             ; preds = %2349
  %3851 = load i8*, i8** %13, align 4
  store i8* %3851, i8** %19, align 4
  br label %3852

3852:                                             ; preds = %3850
  br label %3853

3853:                                             ; preds = %3968, %3852
  %3854 = load i8*, i8** %13, align 4
  %3855 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3856 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3855, i32 0, i32 0
  %3857 = load i8*, i8** %3856, align 4
  %3858 = ptrtoint i8* %3854 to i32
  %3859 = ptrtoint i8* %3857 to i32
  %3860 = sub i32 %3858, %3859
  %3861 = add nsw i32 %3860, 1
  %3862 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3863 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3862, i32 0, i32 1
  %3864 = load i32, i32* %3863, align 4
  %3865 = icmp ugt i32 %3861, %3864
  br i1 %3865, label %3866, label %3969

3866:                                             ; preds = %3853
  br label %3867

3867:                                             ; preds = %3866
  %3868 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3869 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3868, i32 0, i32 0
  %3870 = load i8*, i8** %3869, align 4
  store i8* %3870, i8** %65, align 4
  %3871 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3872 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3871, i32 0, i32 1
  %3873 = load i32, i32* %3872, align 4
  %3874 = icmp eq i32 %3873, 65536
  br i1 %3874, label %3875, label %3876

3875:                                             ; preds = %3867
  store i32 15, i32* %5, align 4
  br label %5372

3876:                                             ; preds = %3867
  %3877 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3878 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3877, i32 0, i32 1
  %3879 = load i32, i32* %3878, align 4
  %3880 = shl i32 %3879, 1
  store i32 %3880, i32* %3878, align 4
  %3881 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3882 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3881, i32 0, i32 1
  %3883 = load i32, i32* %3882, align 4
  %3884 = icmp ugt i32 %3883, 65536
  br i1 %3884, label %3885, label %3888

3885:                                             ; preds = %3876
  %3886 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3887 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3886, i32 0, i32 1
  store i32 65536, i32* %3887, align 4
  br label %3888

3888:                                             ; preds = %3885, %3876
  %3889 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3890 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3889, i32 0, i32 0
  %3891 = load i8*, i8** %3890, align 4
  %3892 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3893 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3892, i32 0, i32 1
  %3894 = load i32, i32* %3893, align 4
  %3895 = call i8* @realloc(i8* %3891, i32 %3894) #7
  %3896 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3897 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3896, i32 0, i32 0
  store i8* %3895, i8** %3897, align 4
  %3898 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3899 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3898, i32 0, i32 0
  %3900 = load i8*, i8** %3899, align 4
  %3901 = icmp eq i8* %3900, null
  br i1 %3901, label %3902, label %3903

3902:                                             ; preds = %3888
  store i32 12, i32* %5, align 4
  br label %5372

3903:                                             ; preds = %3888
  %3904 = load i8*, i8** %65, align 4
  %3905 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3906 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3905, i32 0, i32 0
  %3907 = load i8*, i8** %3906, align 4
  %3908 = icmp ne i8* %3904, %3907
  br i1 %3908, label %3909, label %3967

3909:                                             ; preds = %3903
  %3910 = load i8*, i8** %13, align 4
  %3911 = load i8*, i8** %65, align 4
  %3912 = ptrtoint i8* %3910 to i32
  %3913 = ptrtoint i8* %3911 to i32
  %3914 = sub i32 %3912, %3913
  %3915 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3916 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3915, i32 0, i32 0
  %3917 = load i8*, i8** %3916, align 4
  %3918 = getelementptr inbounds i8, i8* %3917, i32 %3914
  store i8* %3918, i8** %13, align 4
  %3919 = load i8*, i8** %20, align 4
  %3920 = load i8*, i8** %65, align 4
  %3921 = ptrtoint i8* %3919 to i32
  %3922 = ptrtoint i8* %3920 to i32
  %3923 = sub i32 %3921, %3922
  %3924 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3925 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3924, i32 0, i32 0
  %3926 = load i8*, i8** %3925, align 4
  %3927 = getelementptr inbounds i8, i8* %3926, i32 %3923
  store i8* %3927, i8** %20, align 4
  %3928 = load i8*, i8** %22, align 4
  %3929 = icmp ne i8* %3928, null
  br i1 %3929, label %3930, label %3940

3930:                                             ; preds = %3909
  %3931 = load i8*, i8** %22, align 4
  %3932 = load i8*, i8** %65, align 4
  %3933 = ptrtoint i8* %3931 to i32
  %3934 = ptrtoint i8* %3932 to i32
  %3935 = sub i32 %3933, %3934
  %3936 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3937 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3936, i32 0, i32 0
  %3938 = load i8*, i8** %3937, align 4
  %3939 = getelementptr inbounds i8, i8* %3938, i32 %3935
  store i8* %3939, i8** %22, align 4
  br label %3940

3940:                                             ; preds = %3930, %3909
  %3941 = load i8*, i8** %19, align 4
  %3942 = icmp ne i8* %3941, null
  br i1 %3942, label %3943, label %3953

3943:                                             ; preds = %3940
  %3944 = load i8*, i8** %19, align 4
  %3945 = load i8*, i8** %65, align 4
  %3946 = ptrtoint i8* %3944 to i32
  %3947 = ptrtoint i8* %3945 to i32
  %3948 = sub i32 %3946, %3947
  %3949 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3950 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3949, i32 0, i32 0
  %3951 = load i8*, i8** %3950, align 4
  %3952 = getelementptr inbounds i8, i8* %3951, i32 %3948
  store i8* %3952, i8** %19, align 4
  br label %3953

3953:                                             ; preds = %3943, %3940
  %3954 = load i8*, i8** %18, align 4
  %3955 = icmp ne i8* %3954, null
  br i1 %3955, label %3956, label %3966

3956:                                             ; preds = %3953
  %3957 = load i8*, i8** %18, align 4
  %3958 = load i8*, i8** %65, align 4
  %3959 = ptrtoint i8* %3957 to i32
  %3960 = ptrtoint i8* %3958 to i32
  %3961 = sub i32 %3959, %3960
  %3962 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3963 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3962, i32 0, i32 0
  %3964 = load i8*, i8** %3963, align 4
  %3965 = getelementptr inbounds i8, i8* %3964, i32 %3961
  store i8* %3965, i8** %18, align 4
  br label %3966

3966:                                             ; preds = %3956, %3953
  br label %3967

3967:                                             ; preds = %3966, %3903
  br label %3968

3968:                                             ; preds = %3967
  br label %3853

3969:                                             ; preds = %3853
  %3970 = load i8*, i8** %13, align 4
  %3971 = getelementptr inbounds i8, i8* %3970, i32 1
  store i8* %3971, i8** %13, align 4
  store i8 23, i8* %3970, align 1
  br label %3972

3972:                                             ; preds = %3969
  br label %5004

3973:                                             ; preds = %2349
  %3974 = load i8*, i8** %13, align 4
  store i8* %3974, i8** %19, align 4
  br label %3975

3975:                                             ; preds = %3973
  br label %3976

3976:                                             ; preds = %4091, %3975
  %3977 = load i8*, i8** %13, align 4
  %3978 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3979 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3978, i32 0, i32 0
  %3980 = load i8*, i8** %3979, align 4
  %3981 = ptrtoint i8* %3977 to i32
  %3982 = ptrtoint i8* %3980 to i32
  %3983 = sub i32 %3981, %3982
  %3984 = add nsw i32 %3983, 1
  %3985 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3986 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3985, i32 0, i32 1
  %3987 = load i32, i32* %3986, align 4
  %3988 = icmp ugt i32 %3984, %3987
  br i1 %3988, label %3989, label %4092

3989:                                             ; preds = %3976
  br label %3990

3990:                                             ; preds = %3989
  %3991 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3992 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3991, i32 0, i32 0
  %3993 = load i8*, i8** %3992, align 4
  store i8* %3993, i8** %66, align 4
  %3994 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %3995 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3994, i32 0, i32 1
  %3996 = load i32, i32* %3995, align 4
  %3997 = icmp eq i32 %3996, 65536
  br i1 %3997, label %3998, label %3999

3998:                                             ; preds = %3990
  store i32 15, i32* %5, align 4
  br label %5372

3999:                                             ; preds = %3990
  %4000 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4001 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4000, i32 0, i32 1
  %4002 = load i32, i32* %4001, align 4
  %4003 = shl i32 %4002, 1
  store i32 %4003, i32* %4001, align 4
  %4004 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4005 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4004, i32 0, i32 1
  %4006 = load i32, i32* %4005, align 4
  %4007 = icmp ugt i32 %4006, 65536
  br i1 %4007, label %4008, label %4011

4008:                                             ; preds = %3999
  %4009 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4010 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4009, i32 0, i32 1
  store i32 65536, i32* %4010, align 4
  br label %4011

4011:                                             ; preds = %4008, %3999
  %4012 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4013 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4012, i32 0, i32 0
  %4014 = load i8*, i8** %4013, align 4
  %4015 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4016 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4015, i32 0, i32 1
  %4017 = load i32, i32* %4016, align 4
  %4018 = call i8* @realloc(i8* %4014, i32 %4017) #7
  %4019 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4020 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4019, i32 0, i32 0
  store i8* %4018, i8** %4020, align 4
  %4021 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4022 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4021, i32 0, i32 0
  %4023 = load i8*, i8** %4022, align 4
  %4024 = icmp eq i8* %4023, null
  br i1 %4024, label %4025, label %4026

4025:                                             ; preds = %4011
  store i32 12, i32* %5, align 4
  br label %5372

4026:                                             ; preds = %4011
  %4027 = load i8*, i8** %66, align 4
  %4028 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4029 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4028, i32 0, i32 0
  %4030 = load i8*, i8** %4029, align 4
  %4031 = icmp ne i8* %4027, %4030
  br i1 %4031, label %4032, label %4090

4032:                                             ; preds = %4026
  %4033 = load i8*, i8** %13, align 4
  %4034 = load i8*, i8** %66, align 4
  %4035 = ptrtoint i8* %4033 to i32
  %4036 = ptrtoint i8* %4034 to i32
  %4037 = sub i32 %4035, %4036
  %4038 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4039 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4038, i32 0, i32 0
  %4040 = load i8*, i8** %4039, align 4
  %4041 = getelementptr inbounds i8, i8* %4040, i32 %4037
  store i8* %4041, i8** %13, align 4
  %4042 = load i8*, i8** %20, align 4
  %4043 = load i8*, i8** %66, align 4
  %4044 = ptrtoint i8* %4042 to i32
  %4045 = ptrtoint i8* %4043 to i32
  %4046 = sub i32 %4044, %4045
  %4047 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4048 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4047, i32 0, i32 0
  %4049 = load i8*, i8** %4048, align 4
  %4050 = getelementptr inbounds i8, i8* %4049, i32 %4046
  store i8* %4050, i8** %20, align 4
  %4051 = load i8*, i8** %22, align 4
  %4052 = icmp ne i8* %4051, null
  br i1 %4052, label %4053, label %4063

4053:                                             ; preds = %4032
  %4054 = load i8*, i8** %22, align 4
  %4055 = load i8*, i8** %66, align 4
  %4056 = ptrtoint i8* %4054 to i32
  %4057 = ptrtoint i8* %4055 to i32
  %4058 = sub i32 %4056, %4057
  %4059 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4060 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4059, i32 0, i32 0
  %4061 = load i8*, i8** %4060, align 4
  %4062 = getelementptr inbounds i8, i8* %4061, i32 %4058
  store i8* %4062, i8** %22, align 4
  br label %4063

4063:                                             ; preds = %4053, %4032
  %4064 = load i8*, i8** %19, align 4
  %4065 = icmp ne i8* %4064, null
  br i1 %4065, label %4066, label %4076

4066:                                             ; preds = %4063
  %4067 = load i8*, i8** %19, align 4
  %4068 = load i8*, i8** %66, align 4
  %4069 = ptrtoint i8* %4067 to i32
  %4070 = ptrtoint i8* %4068 to i32
  %4071 = sub i32 %4069, %4070
  %4072 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4073 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4072, i32 0, i32 0
  %4074 = load i8*, i8** %4073, align 4
  %4075 = getelementptr inbounds i8, i8* %4074, i32 %4071
  store i8* %4075, i8** %19, align 4
  br label %4076

4076:                                             ; preds = %4066, %4063
  %4077 = load i8*, i8** %18, align 4
  %4078 = icmp ne i8* %4077, null
  br i1 %4078, label %4079, label %4089

4079:                                             ; preds = %4076
  %4080 = load i8*, i8** %18, align 4
  %4081 = load i8*, i8** %66, align 4
  %4082 = ptrtoint i8* %4080 to i32
  %4083 = ptrtoint i8* %4081 to i32
  %4084 = sub i32 %4082, %4083
  %4085 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4086 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4085, i32 0, i32 0
  %4087 = load i8*, i8** %4086, align 4
  %4088 = getelementptr inbounds i8, i8* %4087, i32 %4084
  store i8* %4088, i8** %18, align 4
  br label %4089

4089:                                             ; preds = %4079, %4076
  br label %4090

4090:                                             ; preds = %4089, %4026
  br label %4091

4091:                                             ; preds = %4090
  br label %3976

4092:                                             ; preds = %3976
  %4093 = load i8*, i8** %13, align 4
  %4094 = getelementptr inbounds i8, i8* %4093, i32 1
  store i8* %4094, i8** %13, align 4
  store i8 24, i8* %4093, align 1
  br label %4095

4095:                                             ; preds = %4092
  br label %5004

4096:                                             ; preds = %2349
  br label %4097

4097:                                             ; preds = %4096
  br label %4098

4098:                                             ; preds = %4213, %4097
  %4099 = load i8*, i8** %13, align 4
  %4100 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4101 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4100, i32 0, i32 0
  %4102 = load i8*, i8** %4101, align 4
  %4103 = ptrtoint i8* %4099 to i32
  %4104 = ptrtoint i8* %4102 to i32
  %4105 = sub i32 %4103, %4104
  %4106 = add nsw i32 %4105, 1
  %4107 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4108 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4107, i32 0, i32 1
  %4109 = load i32, i32* %4108, align 4
  %4110 = icmp ugt i32 %4106, %4109
  br i1 %4110, label %4111, label %4214

4111:                                             ; preds = %4098
  br label %4112

4112:                                             ; preds = %4111
  %4113 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4114 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4113, i32 0, i32 0
  %4115 = load i8*, i8** %4114, align 4
  store i8* %4115, i8** %67, align 4
  %4116 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4117 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4116, i32 0, i32 1
  %4118 = load i32, i32* %4117, align 4
  %4119 = icmp eq i32 %4118, 65536
  br i1 %4119, label %4120, label %4121

4120:                                             ; preds = %4112
  store i32 15, i32* %5, align 4
  br label %5372

4121:                                             ; preds = %4112
  %4122 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4123 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4122, i32 0, i32 1
  %4124 = load i32, i32* %4123, align 4
  %4125 = shl i32 %4124, 1
  store i32 %4125, i32* %4123, align 4
  %4126 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4127 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4126, i32 0, i32 1
  %4128 = load i32, i32* %4127, align 4
  %4129 = icmp ugt i32 %4128, 65536
  br i1 %4129, label %4130, label %4133

4130:                                             ; preds = %4121
  %4131 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4132 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4131, i32 0, i32 1
  store i32 65536, i32* %4132, align 4
  br label %4133

4133:                                             ; preds = %4130, %4121
  %4134 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4135 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4134, i32 0, i32 0
  %4136 = load i8*, i8** %4135, align 4
  %4137 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4138 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4137, i32 0, i32 1
  %4139 = load i32, i32* %4138, align 4
  %4140 = call i8* @realloc(i8* %4136, i32 %4139) #7
  %4141 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4142 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4141, i32 0, i32 0
  store i8* %4140, i8** %4142, align 4
  %4143 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4144 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4143, i32 0, i32 0
  %4145 = load i8*, i8** %4144, align 4
  %4146 = icmp eq i8* %4145, null
  br i1 %4146, label %4147, label %4148

4147:                                             ; preds = %4133
  store i32 12, i32* %5, align 4
  br label %5372

4148:                                             ; preds = %4133
  %4149 = load i8*, i8** %67, align 4
  %4150 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4151 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4150, i32 0, i32 0
  %4152 = load i8*, i8** %4151, align 4
  %4153 = icmp ne i8* %4149, %4152
  br i1 %4153, label %4154, label %4212

4154:                                             ; preds = %4148
  %4155 = load i8*, i8** %13, align 4
  %4156 = load i8*, i8** %67, align 4
  %4157 = ptrtoint i8* %4155 to i32
  %4158 = ptrtoint i8* %4156 to i32
  %4159 = sub i32 %4157, %4158
  %4160 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4161 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4160, i32 0, i32 0
  %4162 = load i8*, i8** %4161, align 4
  %4163 = getelementptr inbounds i8, i8* %4162, i32 %4159
  store i8* %4163, i8** %13, align 4
  %4164 = load i8*, i8** %20, align 4
  %4165 = load i8*, i8** %67, align 4
  %4166 = ptrtoint i8* %4164 to i32
  %4167 = ptrtoint i8* %4165 to i32
  %4168 = sub i32 %4166, %4167
  %4169 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4170 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4169, i32 0, i32 0
  %4171 = load i8*, i8** %4170, align 4
  %4172 = getelementptr inbounds i8, i8* %4171, i32 %4168
  store i8* %4172, i8** %20, align 4
  %4173 = load i8*, i8** %22, align 4
  %4174 = icmp ne i8* %4173, null
  br i1 %4174, label %4175, label %4185

4175:                                             ; preds = %4154
  %4176 = load i8*, i8** %22, align 4
  %4177 = load i8*, i8** %67, align 4
  %4178 = ptrtoint i8* %4176 to i32
  %4179 = ptrtoint i8* %4177 to i32
  %4180 = sub i32 %4178, %4179
  %4181 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4182 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4181, i32 0, i32 0
  %4183 = load i8*, i8** %4182, align 4
  %4184 = getelementptr inbounds i8, i8* %4183, i32 %4180
  store i8* %4184, i8** %22, align 4
  br label %4185

4185:                                             ; preds = %4175, %4154
  %4186 = load i8*, i8** %19, align 4
  %4187 = icmp ne i8* %4186, null
  br i1 %4187, label %4188, label %4198

4188:                                             ; preds = %4185
  %4189 = load i8*, i8** %19, align 4
  %4190 = load i8*, i8** %67, align 4
  %4191 = ptrtoint i8* %4189 to i32
  %4192 = ptrtoint i8* %4190 to i32
  %4193 = sub i32 %4191, %4192
  %4194 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4195 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4194, i32 0, i32 0
  %4196 = load i8*, i8** %4195, align 4
  %4197 = getelementptr inbounds i8, i8* %4196, i32 %4193
  store i8* %4197, i8** %19, align 4
  br label %4198

4198:                                             ; preds = %4188, %4185
  %4199 = load i8*, i8** %18, align 4
  %4200 = icmp ne i8* %4199, null
  br i1 %4200, label %4201, label %4211

4201:                                             ; preds = %4198
  %4202 = load i8*, i8** %18, align 4
  %4203 = load i8*, i8** %67, align 4
  %4204 = ptrtoint i8* %4202 to i32
  %4205 = ptrtoint i8* %4203 to i32
  %4206 = sub i32 %4204, %4205
  %4207 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4208 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4207, i32 0, i32 0
  %4209 = load i8*, i8** %4208, align 4
  %4210 = getelementptr inbounds i8, i8* %4209, i32 %4206
  store i8* %4210, i8** %18, align 4
  br label %4211

4211:                                             ; preds = %4201, %4198
  br label %4212

4212:                                             ; preds = %4211, %4148
  br label %4213

4213:                                             ; preds = %4212
  br label %4098

4214:                                             ; preds = %4098
  %4215 = load i8*, i8** %13, align 4
  %4216 = getelementptr inbounds i8, i8* %4215, i32 1
  store i8* %4216, i8** %13, align 4
  store i8 25, i8* %4215, align 1
  br label %4217

4217:                                             ; preds = %4214
  br label %5004

4218:                                             ; preds = %2349
  br label %4219

4219:                                             ; preds = %4218
  br label %4220

4220:                                             ; preds = %4335, %4219
  %4221 = load i8*, i8** %13, align 4
  %4222 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4223 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4222, i32 0, i32 0
  %4224 = load i8*, i8** %4223, align 4
  %4225 = ptrtoint i8* %4221 to i32
  %4226 = ptrtoint i8* %4224 to i32
  %4227 = sub i32 %4225, %4226
  %4228 = add nsw i32 %4227, 1
  %4229 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4230 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4229, i32 0, i32 1
  %4231 = load i32, i32* %4230, align 4
  %4232 = icmp ugt i32 %4228, %4231
  br i1 %4232, label %4233, label %4336

4233:                                             ; preds = %4220
  br label %4234

4234:                                             ; preds = %4233
  %4235 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4236 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4235, i32 0, i32 0
  %4237 = load i8*, i8** %4236, align 4
  store i8* %4237, i8** %68, align 4
  %4238 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4239 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4238, i32 0, i32 1
  %4240 = load i32, i32* %4239, align 4
  %4241 = icmp eq i32 %4240, 65536
  br i1 %4241, label %4242, label %4243

4242:                                             ; preds = %4234
  store i32 15, i32* %5, align 4
  br label %5372

4243:                                             ; preds = %4234
  %4244 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4245 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4244, i32 0, i32 1
  %4246 = load i32, i32* %4245, align 4
  %4247 = shl i32 %4246, 1
  store i32 %4247, i32* %4245, align 4
  %4248 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4249 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4248, i32 0, i32 1
  %4250 = load i32, i32* %4249, align 4
  %4251 = icmp ugt i32 %4250, 65536
  br i1 %4251, label %4252, label %4255

4252:                                             ; preds = %4243
  %4253 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4254 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4253, i32 0, i32 1
  store i32 65536, i32* %4254, align 4
  br label %4255

4255:                                             ; preds = %4252, %4243
  %4256 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4257 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4256, i32 0, i32 0
  %4258 = load i8*, i8** %4257, align 4
  %4259 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4260 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4259, i32 0, i32 1
  %4261 = load i32, i32* %4260, align 4
  %4262 = call i8* @realloc(i8* %4258, i32 %4261) #7
  %4263 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4264 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4263, i32 0, i32 0
  store i8* %4262, i8** %4264, align 4
  %4265 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4266 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4265, i32 0, i32 0
  %4267 = load i8*, i8** %4266, align 4
  %4268 = icmp eq i8* %4267, null
  br i1 %4268, label %4269, label %4270

4269:                                             ; preds = %4255
  store i32 12, i32* %5, align 4
  br label %5372

4270:                                             ; preds = %4255
  %4271 = load i8*, i8** %68, align 4
  %4272 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4273 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4272, i32 0, i32 0
  %4274 = load i8*, i8** %4273, align 4
  %4275 = icmp ne i8* %4271, %4274
  br i1 %4275, label %4276, label %4334

4276:                                             ; preds = %4270
  %4277 = load i8*, i8** %13, align 4
  %4278 = load i8*, i8** %68, align 4
  %4279 = ptrtoint i8* %4277 to i32
  %4280 = ptrtoint i8* %4278 to i32
  %4281 = sub i32 %4279, %4280
  %4282 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4283 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4282, i32 0, i32 0
  %4284 = load i8*, i8** %4283, align 4
  %4285 = getelementptr inbounds i8, i8* %4284, i32 %4281
  store i8* %4285, i8** %13, align 4
  %4286 = load i8*, i8** %20, align 4
  %4287 = load i8*, i8** %68, align 4
  %4288 = ptrtoint i8* %4286 to i32
  %4289 = ptrtoint i8* %4287 to i32
  %4290 = sub i32 %4288, %4289
  %4291 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4292 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4291, i32 0, i32 0
  %4293 = load i8*, i8** %4292, align 4
  %4294 = getelementptr inbounds i8, i8* %4293, i32 %4290
  store i8* %4294, i8** %20, align 4
  %4295 = load i8*, i8** %22, align 4
  %4296 = icmp ne i8* %4295, null
  br i1 %4296, label %4297, label %4307

4297:                                             ; preds = %4276
  %4298 = load i8*, i8** %22, align 4
  %4299 = load i8*, i8** %68, align 4
  %4300 = ptrtoint i8* %4298 to i32
  %4301 = ptrtoint i8* %4299 to i32
  %4302 = sub i32 %4300, %4301
  %4303 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4304 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4303, i32 0, i32 0
  %4305 = load i8*, i8** %4304, align 4
  %4306 = getelementptr inbounds i8, i8* %4305, i32 %4302
  store i8* %4306, i8** %22, align 4
  br label %4307

4307:                                             ; preds = %4297, %4276
  %4308 = load i8*, i8** %19, align 4
  %4309 = icmp ne i8* %4308, null
  br i1 %4309, label %4310, label %4320

4310:                                             ; preds = %4307
  %4311 = load i8*, i8** %19, align 4
  %4312 = load i8*, i8** %68, align 4
  %4313 = ptrtoint i8* %4311 to i32
  %4314 = ptrtoint i8* %4312 to i32
  %4315 = sub i32 %4313, %4314
  %4316 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4317 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4316, i32 0, i32 0
  %4318 = load i8*, i8** %4317, align 4
  %4319 = getelementptr inbounds i8, i8* %4318, i32 %4315
  store i8* %4319, i8** %19, align 4
  br label %4320

4320:                                             ; preds = %4310, %4307
  %4321 = load i8*, i8** %18, align 4
  %4322 = icmp ne i8* %4321, null
  br i1 %4322, label %4323, label %4333

4323:                                             ; preds = %4320
  %4324 = load i8*, i8** %18, align 4
  %4325 = load i8*, i8** %68, align 4
  %4326 = ptrtoint i8* %4324 to i32
  %4327 = ptrtoint i8* %4325 to i32
  %4328 = sub i32 %4326, %4327
  %4329 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4330 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4329, i32 0, i32 0
  %4331 = load i8*, i8** %4330, align 4
  %4332 = getelementptr inbounds i8, i8* %4331, i32 %4328
  store i8* %4332, i8** %18, align 4
  br label %4333

4333:                                             ; preds = %4323, %4320
  br label %4334

4334:                                             ; preds = %4333, %4270
  br label %4335

4335:                                             ; preds = %4334
  br label %4220

4336:                                             ; preds = %4220
  %4337 = load i8*, i8** %13, align 4
  %4338 = getelementptr inbounds i8, i8* %4337, i32 1
  store i8* %4338, i8** %13, align 4
  store i8 26, i8* %4337, align 1
  br label %4339

4339:                                             ; preds = %4336
  br label %5004

4340:                                             ; preds = %2349
  br label %4341

4341:                                             ; preds = %4340
  br label %4342

4342:                                             ; preds = %4457, %4341
  %4343 = load i8*, i8** %13, align 4
  %4344 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4345 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4344, i32 0, i32 0
  %4346 = load i8*, i8** %4345, align 4
  %4347 = ptrtoint i8* %4343 to i32
  %4348 = ptrtoint i8* %4346 to i32
  %4349 = sub i32 %4347, %4348
  %4350 = add nsw i32 %4349, 1
  %4351 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4352 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4351, i32 0, i32 1
  %4353 = load i32, i32* %4352, align 4
  %4354 = icmp ugt i32 %4350, %4353
  br i1 %4354, label %4355, label %4458

4355:                                             ; preds = %4342
  br label %4356

4356:                                             ; preds = %4355
  %4357 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4358 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4357, i32 0, i32 0
  %4359 = load i8*, i8** %4358, align 4
  store i8* %4359, i8** %69, align 4
  %4360 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4361 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4360, i32 0, i32 1
  %4362 = load i32, i32* %4361, align 4
  %4363 = icmp eq i32 %4362, 65536
  br i1 %4363, label %4364, label %4365

4364:                                             ; preds = %4356
  store i32 15, i32* %5, align 4
  br label %5372

4365:                                             ; preds = %4356
  %4366 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4367 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4366, i32 0, i32 1
  %4368 = load i32, i32* %4367, align 4
  %4369 = shl i32 %4368, 1
  store i32 %4369, i32* %4367, align 4
  %4370 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4371 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4370, i32 0, i32 1
  %4372 = load i32, i32* %4371, align 4
  %4373 = icmp ugt i32 %4372, 65536
  br i1 %4373, label %4374, label %4377

4374:                                             ; preds = %4365
  %4375 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4376 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4375, i32 0, i32 1
  store i32 65536, i32* %4376, align 4
  br label %4377

4377:                                             ; preds = %4374, %4365
  %4378 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4379 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4378, i32 0, i32 0
  %4380 = load i8*, i8** %4379, align 4
  %4381 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4382 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4381, i32 0, i32 1
  %4383 = load i32, i32* %4382, align 4
  %4384 = call i8* @realloc(i8* %4380, i32 %4383) #7
  %4385 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4386 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4385, i32 0, i32 0
  store i8* %4384, i8** %4386, align 4
  %4387 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4388 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4387, i32 0, i32 0
  %4389 = load i8*, i8** %4388, align 4
  %4390 = icmp eq i8* %4389, null
  br i1 %4390, label %4391, label %4392

4391:                                             ; preds = %4377
  store i32 12, i32* %5, align 4
  br label %5372

4392:                                             ; preds = %4377
  %4393 = load i8*, i8** %69, align 4
  %4394 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4395 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4394, i32 0, i32 0
  %4396 = load i8*, i8** %4395, align 4
  %4397 = icmp ne i8* %4393, %4396
  br i1 %4397, label %4398, label %4456

4398:                                             ; preds = %4392
  %4399 = load i8*, i8** %13, align 4
  %4400 = load i8*, i8** %69, align 4
  %4401 = ptrtoint i8* %4399 to i32
  %4402 = ptrtoint i8* %4400 to i32
  %4403 = sub i32 %4401, %4402
  %4404 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4405 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4404, i32 0, i32 0
  %4406 = load i8*, i8** %4405, align 4
  %4407 = getelementptr inbounds i8, i8* %4406, i32 %4403
  store i8* %4407, i8** %13, align 4
  %4408 = load i8*, i8** %20, align 4
  %4409 = load i8*, i8** %69, align 4
  %4410 = ptrtoint i8* %4408 to i32
  %4411 = ptrtoint i8* %4409 to i32
  %4412 = sub i32 %4410, %4411
  %4413 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4414 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4413, i32 0, i32 0
  %4415 = load i8*, i8** %4414, align 4
  %4416 = getelementptr inbounds i8, i8* %4415, i32 %4412
  store i8* %4416, i8** %20, align 4
  %4417 = load i8*, i8** %22, align 4
  %4418 = icmp ne i8* %4417, null
  br i1 %4418, label %4419, label %4429

4419:                                             ; preds = %4398
  %4420 = load i8*, i8** %22, align 4
  %4421 = load i8*, i8** %69, align 4
  %4422 = ptrtoint i8* %4420 to i32
  %4423 = ptrtoint i8* %4421 to i32
  %4424 = sub i32 %4422, %4423
  %4425 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4426 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4425, i32 0, i32 0
  %4427 = load i8*, i8** %4426, align 4
  %4428 = getelementptr inbounds i8, i8* %4427, i32 %4424
  store i8* %4428, i8** %22, align 4
  br label %4429

4429:                                             ; preds = %4419, %4398
  %4430 = load i8*, i8** %19, align 4
  %4431 = icmp ne i8* %4430, null
  br i1 %4431, label %4432, label %4442

4432:                                             ; preds = %4429
  %4433 = load i8*, i8** %19, align 4
  %4434 = load i8*, i8** %69, align 4
  %4435 = ptrtoint i8* %4433 to i32
  %4436 = ptrtoint i8* %4434 to i32
  %4437 = sub i32 %4435, %4436
  %4438 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4439 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4438, i32 0, i32 0
  %4440 = load i8*, i8** %4439, align 4
  %4441 = getelementptr inbounds i8, i8* %4440, i32 %4437
  store i8* %4441, i8** %19, align 4
  br label %4442

4442:                                             ; preds = %4432, %4429
  %4443 = load i8*, i8** %18, align 4
  %4444 = icmp ne i8* %4443, null
  br i1 %4444, label %4445, label %4455

4445:                                             ; preds = %4442
  %4446 = load i8*, i8** %18, align 4
  %4447 = load i8*, i8** %69, align 4
  %4448 = ptrtoint i8* %4446 to i32
  %4449 = ptrtoint i8* %4447 to i32
  %4450 = sub i32 %4448, %4449
  %4451 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4452 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4451, i32 0, i32 0
  %4453 = load i8*, i8** %4452, align 4
  %4454 = getelementptr inbounds i8, i8* %4453, i32 %4450
  store i8* %4454, i8** %18, align 4
  br label %4455

4455:                                             ; preds = %4445, %4442
  br label %4456

4456:                                             ; preds = %4455, %4392
  br label %4457

4457:                                             ; preds = %4456
  br label %4342

4458:                                             ; preds = %4342
  %4459 = load i8*, i8** %13, align 4
  %4460 = getelementptr inbounds i8, i8* %4459, i32 1
  store i8* %4460, i8** %13, align 4
  store i8 27, i8* %4459, align 1
  br label %4461

4461:                                             ; preds = %4458
  br label %5004

4462:                                             ; preds = %2349
  br label %4463

4463:                                             ; preds = %4462
  br label %4464

4464:                                             ; preds = %4579, %4463
  %4465 = load i8*, i8** %13, align 4
  %4466 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4467 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4466, i32 0, i32 0
  %4468 = load i8*, i8** %4467, align 4
  %4469 = ptrtoint i8* %4465 to i32
  %4470 = ptrtoint i8* %4468 to i32
  %4471 = sub i32 %4469, %4470
  %4472 = add nsw i32 %4471, 1
  %4473 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4474 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4473, i32 0, i32 1
  %4475 = load i32, i32* %4474, align 4
  %4476 = icmp ugt i32 %4472, %4475
  br i1 %4476, label %4477, label %4580

4477:                                             ; preds = %4464
  br label %4478

4478:                                             ; preds = %4477
  %4479 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4480 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4479, i32 0, i32 0
  %4481 = load i8*, i8** %4480, align 4
  store i8* %4481, i8** %70, align 4
  %4482 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4483 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4482, i32 0, i32 1
  %4484 = load i32, i32* %4483, align 4
  %4485 = icmp eq i32 %4484, 65536
  br i1 %4485, label %4486, label %4487

4486:                                             ; preds = %4478
  store i32 15, i32* %5, align 4
  br label %5372

4487:                                             ; preds = %4478
  %4488 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4489 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4488, i32 0, i32 1
  %4490 = load i32, i32* %4489, align 4
  %4491 = shl i32 %4490, 1
  store i32 %4491, i32* %4489, align 4
  %4492 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4493 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4492, i32 0, i32 1
  %4494 = load i32, i32* %4493, align 4
  %4495 = icmp ugt i32 %4494, 65536
  br i1 %4495, label %4496, label %4499

4496:                                             ; preds = %4487
  %4497 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4498 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4497, i32 0, i32 1
  store i32 65536, i32* %4498, align 4
  br label %4499

4499:                                             ; preds = %4496, %4487
  %4500 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4501 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4500, i32 0, i32 0
  %4502 = load i8*, i8** %4501, align 4
  %4503 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4504 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4503, i32 0, i32 1
  %4505 = load i32, i32* %4504, align 4
  %4506 = call i8* @realloc(i8* %4502, i32 %4505) #7
  %4507 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4508 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4507, i32 0, i32 0
  store i8* %4506, i8** %4508, align 4
  %4509 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4510 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4509, i32 0, i32 0
  %4511 = load i8*, i8** %4510, align 4
  %4512 = icmp eq i8* %4511, null
  br i1 %4512, label %4513, label %4514

4513:                                             ; preds = %4499
  store i32 12, i32* %5, align 4
  br label %5372

4514:                                             ; preds = %4499
  %4515 = load i8*, i8** %70, align 4
  %4516 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4517 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4516, i32 0, i32 0
  %4518 = load i8*, i8** %4517, align 4
  %4519 = icmp ne i8* %4515, %4518
  br i1 %4519, label %4520, label %4578

4520:                                             ; preds = %4514
  %4521 = load i8*, i8** %13, align 4
  %4522 = load i8*, i8** %70, align 4
  %4523 = ptrtoint i8* %4521 to i32
  %4524 = ptrtoint i8* %4522 to i32
  %4525 = sub i32 %4523, %4524
  %4526 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4527 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4526, i32 0, i32 0
  %4528 = load i8*, i8** %4527, align 4
  %4529 = getelementptr inbounds i8, i8* %4528, i32 %4525
  store i8* %4529, i8** %13, align 4
  %4530 = load i8*, i8** %20, align 4
  %4531 = load i8*, i8** %70, align 4
  %4532 = ptrtoint i8* %4530 to i32
  %4533 = ptrtoint i8* %4531 to i32
  %4534 = sub i32 %4532, %4533
  %4535 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4536 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4535, i32 0, i32 0
  %4537 = load i8*, i8** %4536, align 4
  %4538 = getelementptr inbounds i8, i8* %4537, i32 %4534
  store i8* %4538, i8** %20, align 4
  %4539 = load i8*, i8** %22, align 4
  %4540 = icmp ne i8* %4539, null
  br i1 %4540, label %4541, label %4551

4541:                                             ; preds = %4520
  %4542 = load i8*, i8** %22, align 4
  %4543 = load i8*, i8** %70, align 4
  %4544 = ptrtoint i8* %4542 to i32
  %4545 = ptrtoint i8* %4543 to i32
  %4546 = sub i32 %4544, %4545
  %4547 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4548 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4547, i32 0, i32 0
  %4549 = load i8*, i8** %4548, align 4
  %4550 = getelementptr inbounds i8, i8* %4549, i32 %4546
  store i8* %4550, i8** %22, align 4
  br label %4551

4551:                                             ; preds = %4541, %4520
  %4552 = load i8*, i8** %19, align 4
  %4553 = icmp ne i8* %4552, null
  br i1 %4553, label %4554, label %4564

4554:                                             ; preds = %4551
  %4555 = load i8*, i8** %19, align 4
  %4556 = load i8*, i8** %70, align 4
  %4557 = ptrtoint i8* %4555 to i32
  %4558 = ptrtoint i8* %4556 to i32
  %4559 = sub i32 %4557, %4558
  %4560 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4561 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4560, i32 0, i32 0
  %4562 = load i8*, i8** %4561, align 4
  %4563 = getelementptr inbounds i8, i8* %4562, i32 %4559
  store i8* %4563, i8** %19, align 4
  br label %4564

4564:                                             ; preds = %4554, %4551
  %4565 = load i8*, i8** %18, align 4
  %4566 = icmp ne i8* %4565, null
  br i1 %4566, label %4567, label %4577

4567:                                             ; preds = %4564
  %4568 = load i8*, i8** %18, align 4
  %4569 = load i8*, i8** %70, align 4
  %4570 = ptrtoint i8* %4568 to i32
  %4571 = ptrtoint i8* %4569 to i32
  %4572 = sub i32 %4570, %4571
  %4573 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4574 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4573, i32 0, i32 0
  %4575 = load i8*, i8** %4574, align 4
  %4576 = getelementptr inbounds i8, i8* %4575, i32 %4572
  store i8* %4576, i8** %18, align 4
  br label %4577

4577:                                             ; preds = %4567, %4564
  br label %4578

4578:                                             ; preds = %4577, %4514
  br label %4579

4579:                                             ; preds = %4578
  br label %4464

4580:                                             ; preds = %4464
  %4581 = load i8*, i8** %13, align 4
  %4582 = getelementptr inbounds i8, i8* %4581, i32 1
  store i8* %4582, i8** %13, align 4
  store i8 28, i8* %4581, align 1
  br label %4583

4583:                                             ; preds = %4580
  br label %5004

4584:                                             ; preds = %2349
  br label %4585

4585:                                             ; preds = %4584
  br label %4586

4586:                                             ; preds = %4701, %4585
  %4587 = load i8*, i8** %13, align 4
  %4588 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4589 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4588, i32 0, i32 0
  %4590 = load i8*, i8** %4589, align 4
  %4591 = ptrtoint i8* %4587 to i32
  %4592 = ptrtoint i8* %4590 to i32
  %4593 = sub i32 %4591, %4592
  %4594 = add nsw i32 %4593, 1
  %4595 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4596 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4595, i32 0, i32 1
  %4597 = load i32, i32* %4596, align 4
  %4598 = icmp ugt i32 %4594, %4597
  br i1 %4598, label %4599, label %4702

4599:                                             ; preds = %4586
  br label %4600

4600:                                             ; preds = %4599
  %4601 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4602 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4601, i32 0, i32 0
  %4603 = load i8*, i8** %4602, align 4
  store i8* %4603, i8** %71, align 4
  %4604 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4605 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4604, i32 0, i32 1
  %4606 = load i32, i32* %4605, align 4
  %4607 = icmp eq i32 %4606, 65536
  br i1 %4607, label %4608, label %4609

4608:                                             ; preds = %4600
  store i32 15, i32* %5, align 4
  br label %5372

4609:                                             ; preds = %4600
  %4610 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4611 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4610, i32 0, i32 1
  %4612 = load i32, i32* %4611, align 4
  %4613 = shl i32 %4612, 1
  store i32 %4613, i32* %4611, align 4
  %4614 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4615 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4614, i32 0, i32 1
  %4616 = load i32, i32* %4615, align 4
  %4617 = icmp ugt i32 %4616, 65536
  br i1 %4617, label %4618, label %4621

4618:                                             ; preds = %4609
  %4619 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4620 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4619, i32 0, i32 1
  store i32 65536, i32* %4620, align 4
  br label %4621

4621:                                             ; preds = %4618, %4609
  %4622 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4623 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4622, i32 0, i32 0
  %4624 = load i8*, i8** %4623, align 4
  %4625 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4626 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4625, i32 0, i32 1
  %4627 = load i32, i32* %4626, align 4
  %4628 = call i8* @realloc(i8* %4624, i32 %4627) #7
  %4629 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4630 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4629, i32 0, i32 0
  store i8* %4628, i8** %4630, align 4
  %4631 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4632 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4631, i32 0, i32 0
  %4633 = load i8*, i8** %4632, align 4
  %4634 = icmp eq i8* %4633, null
  br i1 %4634, label %4635, label %4636

4635:                                             ; preds = %4621
  store i32 12, i32* %5, align 4
  br label %5372

4636:                                             ; preds = %4621
  %4637 = load i8*, i8** %71, align 4
  %4638 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4639 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4638, i32 0, i32 0
  %4640 = load i8*, i8** %4639, align 4
  %4641 = icmp ne i8* %4637, %4640
  br i1 %4641, label %4642, label %4700

4642:                                             ; preds = %4636
  %4643 = load i8*, i8** %13, align 4
  %4644 = load i8*, i8** %71, align 4
  %4645 = ptrtoint i8* %4643 to i32
  %4646 = ptrtoint i8* %4644 to i32
  %4647 = sub i32 %4645, %4646
  %4648 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4649 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4648, i32 0, i32 0
  %4650 = load i8*, i8** %4649, align 4
  %4651 = getelementptr inbounds i8, i8* %4650, i32 %4647
  store i8* %4651, i8** %13, align 4
  %4652 = load i8*, i8** %20, align 4
  %4653 = load i8*, i8** %71, align 4
  %4654 = ptrtoint i8* %4652 to i32
  %4655 = ptrtoint i8* %4653 to i32
  %4656 = sub i32 %4654, %4655
  %4657 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4658 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4657, i32 0, i32 0
  %4659 = load i8*, i8** %4658, align 4
  %4660 = getelementptr inbounds i8, i8* %4659, i32 %4656
  store i8* %4660, i8** %20, align 4
  %4661 = load i8*, i8** %22, align 4
  %4662 = icmp ne i8* %4661, null
  br i1 %4662, label %4663, label %4673

4663:                                             ; preds = %4642
  %4664 = load i8*, i8** %22, align 4
  %4665 = load i8*, i8** %71, align 4
  %4666 = ptrtoint i8* %4664 to i32
  %4667 = ptrtoint i8* %4665 to i32
  %4668 = sub i32 %4666, %4667
  %4669 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4670 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4669, i32 0, i32 0
  %4671 = load i8*, i8** %4670, align 4
  %4672 = getelementptr inbounds i8, i8* %4671, i32 %4668
  store i8* %4672, i8** %22, align 4
  br label %4673

4673:                                             ; preds = %4663, %4642
  %4674 = load i8*, i8** %19, align 4
  %4675 = icmp ne i8* %4674, null
  br i1 %4675, label %4676, label %4686

4676:                                             ; preds = %4673
  %4677 = load i8*, i8** %19, align 4
  %4678 = load i8*, i8** %71, align 4
  %4679 = ptrtoint i8* %4677 to i32
  %4680 = ptrtoint i8* %4678 to i32
  %4681 = sub i32 %4679, %4680
  %4682 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4683 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4682, i32 0, i32 0
  %4684 = load i8*, i8** %4683, align 4
  %4685 = getelementptr inbounds i8, i8* %4684, i32 %4681
  store i8* %4685, i8** %19, align 4
  br label %4686

4686:                                             ; preds = %4676, %4673
  %4687 = load i8*, i8** %18, align 4
  %4688 = icmp ne i8* %4687, null
  br i1 %4688, label %4689, label %4699

4689:                                             ; preds = %4686
  %4690 = load i8*, i8** %18, align 4
  %4691 = load i8*, i8** %71, align 4
  %4692 = ptrtoint i8* %4690 to i32
  %4693 = ptrtoint i8* %4691 to i32
  %4694 = sub i32 %4692, %4693
  %4695 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4696 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4695, i32 0, i32 0
  %4697 = load i8*, i8** %4696, align 4
  %4698 = getelementptr inbounds i8, i8* %4697, i32 %4694
  store i8* %4698, i8** %18, align 4
  br label %4699

4699:                                             ; preds = %4689, %4686
  br label %4700

4700:                                             ; preds = %4699, %4636
  br label %4701

4701:                                             ; preds = %4700
  br label %4586

4702:                                             ; preds = %4586
  %4703 = load i8*, i8** %13, align 4
  %4704 = getelementptr inbounds i8, i8* %4703, i32 1
  store i8* %4704, i8** %13, align 4
  store i8 10, i8* %4703, align 1
  br label %4705

4705:                                             ; preds = %4702
  br label %5004

4706:                                             ; preds = %2349
  br label %4707

4707:                                             ; preds = %4706
  br label %4708

4708:                                             ; preds = %4823, %4707
  %4709 = load i8*, i8** %13, align 4
  %4710 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4711 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4710, i32 0, i32 0
  %4712 = load i8*, i8** %4711, align 4
  %4713 = ptrtoint i8* %4709 to i32
  %4714 = ptrtoint i8* %4712 to i32
  %4715 = sub i32 %4713, %4714
  %4716 = add nsw i32 %4715, 1
  %4717 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4718 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4717, i32 0, i32 1
  %4719 = load i32, i32* %4718, align 4
  %4720 = icmp ugt i32 %4716, %4719
  br i1 %4720, label %4721, label %4824

4721:                                             ; preds = %4708
  br label %4722

4722:                                             ; preds = %4721
  %4723 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4724 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4723, i32 0, i32 0
  %4725 = load i8*, i8** %4724, align 4
  store i8* %4725, i8** %72, align 4
  %4726 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4727 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4726, i32 0, i32 1
  %4728 = load i32, i32* %4727, align 4
  %4729 = icmp eq i32 %4728, 65536
  br i1 %4729, label %4730, label %4731

4730:                                             ; preds = %4722
  store i32 15, i32* %5, align 4
  br label %5372

4731:                                             ; preds = %4722
  %4732 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4733 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4732, i32 0, i32 1
  %4734 = load i32, i32* %4733, align 4
  %4735 = shl i32 %4734, 1
  store i32 %4735, i32* %4733, align 4
  %4736 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4737 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4736, i32 0, i32 1
  %4738 = load i32, i32* %4737, align 4
  %4739 = icmp ugt i32 %4738, 65536
  br i1 %4739, label %4740, label %4743

4740:                                             ; preds = %4731
  %4741 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4742 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4741, i32 0, i32 1
  store i32 65536, i32* %4742, align 4
  br label %4743

4743:                                             ; preds = %4740, %4731
  %4744 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4745 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4744, i32 0, i32 0
  %4746 = load i8*, i8** %4745, align 4
  %4747 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4748 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4747, i32 0, i32 1
  %4749 = load i32, i32* %4748, align 4
  %4750 = call i8* @realloc(i8* %4746, i32 %4749) #7
  %4751 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4752 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4751, i32 0, i32 0
  store i8* %4750, i8** %4752, align 4
  %4753 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4754 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4753, i32 0, i32 0
  %4755 = load i8*, i8** %4754, align 4
  %4756 = icmp eq i8* %4755, null
  br i1 %4756, label %4757, label %4758

4757:                                             ; preds = %4743
  store i32 12, i32* %5, align 4
  br label %5372

4758:                                             ; preds = %4743
  %4759 = load i8*, i8** %72, align 4
  %4760 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4761 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4760, i32 0, i32 0
  %4762 = load i8*, i8** %4761, align 4
  %4763 = icmp ne i8* %4759, %4762
  br i1 %4763, label %4764, label %4822

4764:                                             ; preds = %4758
  %4765 = load i8*, i8** %13, align 4
  %4766 = load i8*, i8** %72, align 4
  %4767 = ptrtoint i8* %4765 to i32
  %4768 = ptrtoint i8* %4766 to i32
  %4769 = sub i32 %4767, %4768
  %4770 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4771 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4770, i32 0, i32 0
  %4772 = load i8*, i8** %4771, align 4
  %4773 = getelementptr inbounds i8, i8* %4772, i32 %4769
  store i8* %4773, i8** %13, align 4
  %4774 = load i8*, i8** %20, align 4
  %4775 = load i8*, i8** %72, align 4
  %4776 = ptrtoint i8* %4774 to i32
  %4777 = ptrtoint i8* %4775 to i32
  %4778 = sub i32 %4776, %4777
  %4779 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4780 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4779, i32 0, i32 0
  %4781 = load i8*, i8** %4780, align 4
  %4782 = getelementptr inbounds i8, i8* %4781, i32 %4778
  store i8* %4782, i8** %20, align 4
  %4783 = load i8*, i8** %22, align 4
  %4784 = icmp ne i8* %4783, null
  br i1 %4784, label %4785, label %4795

4785:                                             ; preds = %4764
  %4786 = load i8*, i8** %22, align 4
  %4787 = load i8*, i8** %72, align 4
  %4788 = ptrtoint i8* %4786 to i32
  %4789 = ptrtoint i8* %4787 to i32
  %4790 = sub i32 %4788, %4789
  %4791 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4792 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4791, i32 0, i32 0
  %4793 = load i8*, i8** %4792, align 4
  %4794 = getelementptr inbounds i8, i8* %4793, i32 %4790
  store i8* %4794, i8** %22, align 4
  br label %4795

4795:                                             ; preds = %4785, %4764
  %4796 = load i8*, i8** %19, align 4
  %4797 = icmp ne i8* %4796, null
  br i1 %4797, label %4798, label %4808

4798:                                             ; preds = %4795
  %4799 = load i8*, i8** %19, align 4
  %4800 = load i8*, i8** %72, align 4
  %4801 = ptrtoint i8* %4799 to i32
  %4802 = ptrtoint i8* %4800 to i32
  %4803 = sub i32 %4801, %4802
  %4804 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4805 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4804, i32 0, i32 0
  %4806 = load i8*, i8** %4805, align 4
  %4807 = getelementptr inbounds i8, i8* %4806, i32 %4803
  store i8* %4807, i8** %19, align 4
  br label %4808

4808:                                             ; preds = %4798, %4795
  %4809 = load i8*, i8** %18, align 4
  %4810 = icmp ne i8* %4809, null
  br i1 %4810, label %4811, label %4821

4811:                                             ; preds = %4808
  %4812 = load i8*, i8** %18, align 4
  %4813 = load i8*, i8** %72, align 4
  %4814 = ptrtoint i8* %4812 to i32
  %4815 = ptrtoint i8* %4813 to i32
  %4816 = sub i32 %4814, %4815
  %4817 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4818 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4817, i32 0, i32 0
  %4819 = load i8*, i8** %4818, align 4
  %4820 = getelementptr inbounds i8, i8* %4819, i32 %4816
  store i8* %4820, i8** %18, align 4
  br label %4821

4821:                                             ; preds = %4811, %4808
  br label %4822

4822:                                             ; preds = %4821, %4758
  br label %4823

4823:                                             ; preds = %4822
  br label %4708

4824:                                             ; preds = %4708
  %4825 = load i8*, i8** %13, align 4
  %4826 = getelementptr inbounds i8, i8* %4825, i32 1
  store i8* %4826, i8** %13, align 4
  store i8 11, i8* %4825, align 1
  br label %4827

4827:                                             ; preds = %4824
  br label %5004

4828:                                             ; preds = %2349, %2349, %2349, %2349, %2349, %2349, %2349, %2349, %2349
  %4829 = load i32, i32* %8, align 4
  %4830 = and i32 %4829, 16384
  %4831 = icmp ne i32 %4830, 0
  br i1 %4831, label %4832, label %4833

4832:                                             ; preds = %4828
  br label %5006

4833:                                             ; preds = %4828
  %4834 = load i8, i8* %10, align 1
  %4835 = zext i8 %4834 to i32
  %4836 = sub nsw i32 %4835, 48
  %4837 = trunc i32 %4836 to i8
  store i8 %4837, i8* %11, align 1
  %4838 = load i8, i8* %11, align 1
  %4839 = zext i8 %4838 to i32
  %4840 = load i32, i32* %23, align 4
  %4841 = icmp ugt i32 %4839, %4840
  br i1 %4841, label %4842, label %4843

4842:                                             ; preds = %4833
  store i32 6, i32* %5, align 4
  br label %5372

4843:                                             ; preds = %4833
  %4844 = load i8, i8* %11, align 1
  %4845 = zext i8 %4844 to i32
  %4846 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %4847 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %4846, align 4
  %4848 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 1
  %4849 = load i32, i32* %4848, align 4
  %4850 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %4851 = load i32, i32* %4850, align 4
  %4852 = call signext i8 @group_in_compile_stack(%struct.compile_stack_elt_t* %4847, i32 %4849, i32 %4851, i32 %4845)
  %4853 = icmp ne i8 %4852, 0
  br i1 %4853, label %4854, label %4855

4854:                                             ; preds = %4843
  br label %5006

4855:                                             ; preds = %4843
  %4856 = load i8*, i8** %13, align 4
  store i8* %4856, i8** %19, align 4
  br label %4857

4857:                                             ; preds = %4855
  br label %4858

4858:                                             ; preds = %4973, %4857
  %4859 = load i8*, i8** %13, align 4
  %4860 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4861 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4860, i32 0, i32 0
  %4862 = load i8*, i8** %4861, align 4
  %4863 = ptrtoint i8* %4859 to i32
  %4864 = ptrtoint i8* %4862 to i32
  %4865 = sub i32 %4863, %4864
  %4866 = add nsw i32 %4865, 2
  %4867 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4868 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4867, i32 0, i32 1
  %4869 = load i32, i32* %4868, align 4
  %4870 = icmp ugt i32 %4866, %4869
  br i1 %4870, label %4871, label %4974

4871:                                             ; preds = %4858
  br label %4872

4872:                                             ; preds = %4871
  %4873 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4874 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4873, i32 0, i32 0
  %4875 = load i8*, i8** %4874, align 4
  store i8* %4875, i8** %73, align 4
  %4876 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4877 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4876, i32 0, i32 1
  %4878 = load i32, i32* %4877, align 4
  %4879 = icmp eq i32 %4878, 65536
  br i1 %4879, label %4880, label %4881

4880:                                             ; preds = %4872
  store i32 15, i32* %5, align 4
  br label %5372

4881:                                             ; preds = %4872
  %4882 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4883 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4882, i32 0, i32 1
  %4884 = load i32, i32* %4883, align 4
  %4885 = shl i32 %4884, 1
  store i32 %4885, i32* %4883, align 4
  %4886 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4887 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4886, i32 0, i32 1
  %4888 = load i32, i32* %4887, align 4
  %4889 = icmp ugt i32 %4888, 65536
  br i1 %4889, label %4890, label %4893

4890:                                             ; preds = %4881
  %4891 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4892 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4891, i32 0, i32 1
  store i32 65536, i32* %4892, align 4
  br label %4893

4893:                                             ; preds = %4890, %4881
  %4894 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4895 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4894, i32 0, i32 0
  %4896 = load i8*, i8** %4895, align 4
  %4897 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4898 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4897, i32 0, i32 1
  %4899 = load i32, i32* %4898, align 4
  %4900 = call i8* @realloc(i8* %4896, i32 %4899) #7
  %4901 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4902 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4901, i32 0, i32 0
  store i8* %4900, i8** %4902, align 4
  %4903 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4904 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4903, i32 0, i32 0
  %4905 = load i8*, i8** %4904, align 4
  %4906 = icmp eq i8* %4905, null
  br i1 %4906, label %4907, label %4908

4907:                                             ; preds = %4893
  store i32 12, i32* %5, align 4
  br label %5372

4908:                                             ; preds = %4893
  %4909 = load i8*, i8** %73, align 4
  %4910 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4911 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4910, i32 0, i32 0
  %4912 = load i8*, i8** %4911, align 4
  %4913 = icmp ne i8* %4909, %4912
  br i1 %4913, label %4914, label %4972

4914:                                             ; preds = %4908
  %4915 = load i8*, i8** %13, align 4
  %4916 = load i8*, i8** %73, align 4
  %4917 = ptrtoint i8* %4915 to i32
  %4918 = ptrtoint i8* %4916 to i32
  %4919 = sub i32 %4917, %4918
  %4920 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4921 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4920, i32 0, i32 0
  %4922 = load i8*, i8** %4921, align 4
  %4923 = getelementptr inbounds i8, i8* %4922, i32 %4919
  store i8* %4923, i8** %13, align 4
  %4924 = load i8*, i8** %20, align 4
  %4925 = load i8*, i8** %73, align 4
  %4926 = ptrtoint i8* %4924 to i32
  %4927 = ptrtoint i8* %4925 to i32
  %4928 = sub i32 %4926, %4927
  %4929 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4930 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4929, i32 0, i32 0
  %4931 = load i8*, i8** %4930, align 4
  %4932 = getelementptr inbounds i8, i8* %4931, i32 %4928
  store i8* %4932, i8** %20, align 4
  %4933 = load i8*, i8** %22, align 4
  %4934 = icmp ne i8* %4933, null
  br i1 %4934, label %4935, label %4945

4935:                                             ; preds = %4914
  %4936 = load i8*, i8** %22, align 4
  %4937 = load i8*, i8** %73, align 4
  %4938 = ptrtoint i8* %4936 to i32
  %4939 = ptrtoint i8* %4937 to i32
  %4940 = sub i32 %4938, %4939
  %4941 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4942 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4941, i32 0, i32 0
  %4943 = load i8*, i8** %4942, align 4
  %4944 = getelementptr inbounds i8, i8* %4943, i32 %4940
  store i8* %4944, i8** %22, align 4
  br label %4945

4945:                                             ; preds = %4935, %4914
  %4946 = load i8*, i8** %19, align 4
  %4947 = icmp ne i8* %4946, null
  br i1 %4947, label %4948, label %4958

4948:                                             ; preds = %4945
  %4949 = load i8*, i8** %19, align 4
  %4950 = load i8*, i8** %73, align 4
  %4951 = ptrtoint i8* %4949 to i32
  %4952 = ptrtoint i8* %4950 to i32
  %4953 = sub i32 %4951, %4952
  %4954 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4955 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4954, i32 0, i32 0
  %4956 = load i8*, i8** %4955, align 4
  %4957 = getelementptr inbounds i8, i8* %4956, i32 %4953
  store i8* %4957, i8** %19, align 4
  br label %4958

4958:                                             ; preds = %4948, %4945
  %4959 = load i8*, i8** %18, align 4
  %4960 = icmp ne i8* %4959, null
  br i1 %4960, label %4961, label %4971

4961:                                             ; preds = %4958
  %4962 = load i8*, i8** %18, align 4
  %4963 = load i8*, i8** %73, align 4
  %4964 = ptrtoint i8* %4962 to i32
  %4965 = ptrtoint i8* %4963 to i32
  %4966 = sub i32 %4964, %4965
  %4967 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %4968 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %4967, i32 0, i32 0
  %4969 = load i8*, i8** %4968, align 4
  %4970 = getelementptr inbounds i8, i8* %4969, i32 %4966
  store i8* %4970, i8** %18, align 4
  br label %4971

4971:                                             ; preds = %4961, %4958
  br label %4972

4972:                                             ; preds = %4971, %4908
  br label %4973

4973:                                             ; preds = %4972
  br label %4858

4974:                                             ; preds = %4858
  %4975 = load i8*, i8** %13, align 4
  %4976 = getelementptr inbounds i8, i8* %4975, i32 1
  store i8* %4976, i8** %13, align 4
  store i8 7, i8* %4975, align 1
  %4977 = load i8, i8* %11, align 1
  %4978 = load i8*, i8** %13, align 4
  %4979 = getelementptr inbounds i8, i8* %4978, i32 1
  store i8* %4979, i8** %13, align 4
  store i8 %4977, i8* %4978, align 1
  br label %4980

4980:                                             ; preds = %4974
  br label %5004

4981:                                             ; preds = %2349, %2349
  %4982 = load i32, i32* %8, align 4
  %4983 = and i32 %4982, 2
  %4984 = icmp ne i32 %4983, 0
  br i1 %4984, label %4985, label %4986

4985:                                             ; preds = %4981
  br label %460

4986:                                             ; preds = %4981
  br label %4988

4987:                                             ; preds = %2349
  br label %4988

4988:                                             ; preds = %4987, %4986, %3847, %3256, %2967, %2605, %2596, %2356
  %4989 = load i8*, i8** %17, align 4
  %4990 = icmp ne i8* %4989, null
  br i1 %4990, label %4991, label %4998

4991:                                             ; preds = %4988
  %4992 = load i8*, i8** %17, align 4
  %4993 = load i8, i8* %10, align 1
  %4994 = zext i8 %4993 to i32
  %4995 = getelementptr inbounds i8, i8* %4992, i32 %4994
  %4996 = load i8, i8* %4995, align 1
  %4997 = sext i8 %4996 to i32
  br label %5001

4998:                                             ; preds = %4988
  %4999 = load i8, i8* %10, align 1
  %5000 = zext i8 %4999 to i32
  br label %5001

5001:                                             ; preds = %4998, %4991
  %5002 = phi i32 [ %4997, %4991 ], [ %5000, %4998 ]
  %5003 = trunc i32 %5002 to i8
  store i8 %5003, i8* %10, align 1
  br label %5006

5004:                                             ; preds = %4980, %4827, %4705, %4583, %4461, %4339, %4217, %4095, %3972, %3812, %3231, %2958, %2587
  br label %5342

5005:                                             ; preds = %168
  br label %5006

5006:                                             ; preds = %5005, %5001, %4854, %4832, %3849, %2973, %2749, %2333, %2323, %2317, %2311, %2305, %473, %458, %448, %309
  %5007 = load i8*, i8** %18, align 4
  %5008 = icmp ne i8* %5007, null
  br i1 %5008, label %5009, label %5089

5009:                                             ; preds = %5006
  %5010 = load i8*, i8** %18, align 4
  %5011 = load i8*, i8** %18, align 4
  %5012 = load i8, i8* %5011, align 1
  %5013 = zext i8 %5012 to i32
  %5014 = getelementptr inbounds i8, i8* %5010, i32 %5013
  %5015 = getelementptr inbounds i8, i8* %5014, i32 1
  %5016 = load i8*, i8** %13, align 4
  %5017 = icmp ne i8* %5015, %5016
  br i1 %5017, label %5089, label %5018

5018:                                             ; preds = %5009
  %5019 = load i8*, i8** %18, align 4
  %5020 = load i8, i8* %5019, align 1
  %5021 = zext i8 %5020 to i32
  %5022 = icmp eq i32 %5021, 255
  br i1 %5022, label %5089, label %5023

5023:                                             ; preds = %5018
  %5024 = load i8*, i8** %15, align 4
  %5025 = load i8, i8* %5024, align 1
  %5026 = sext i8 %5025 to i32
  %5027 = icmp eq i32 %5026, 42
  br i1 %5027, label %5089, label %5028

5028:                                             ; preds = %5023
  %5029 = load i8*, i8** %15, align 4
  %5030 = load i8, i8* %5029, align 1
  %5031 = sext i8 %5030 to i32
  %5032 = icmp eq i32 %5031, 94
  br i1 %5032, label %5089, label %5033

5033:                                             ; preds = %5028
  %5034 = load i32, i32* %8, align 4
  %5035 = and i32 %5034, 2
  %5036 = icmp ne i32 %5035, 0
  br i1 %5036, label %5037, label %5054

5037:                                             ; preds = %5033
  %5038 = load i8*, i8** %15, align 4
  %5039 = load i8, i8* %5038, align 1
  %5040 = sext i8 %5039 to i32
  %5041 = icmp eq i32 %5040, 92
  br i1 %5041, label %5042, label %5064

5042:                                             ; preds = %5037
  %5043 = load i8*, i8** %15, align 4
  %5044 = getelementptr inbounds i8, i8* %5043, i32 1
  %5045 = load i8, i8* %5044, align 1
  %5046 = sext i8 %5045 to i32
  %5047 = icmp eq i32 %5046, 43
  br i1 %5047, label %5089, label %5048

5048:                                             ; preds = %5042
  %5049 = load i8*, i8** %15, align 4
  %5050 = getelementptr inbounds i8, i8* %5049, i32 1
  %5051 = load i8, i8* %5050, align 1
  %5052 = sext i8 %5051 to i32
  %5053 = icmp eq i32 %5052, 63
  br i1 %5053, label %5089, label %5064

5054:                                             ; preds = %5033
  %5055 = load i8*, i8** %15, align 4
  %5056 = load i8, i8* %5055, align 1
  %5057 = sext i8 %5056 to i32
  %5058 = icmp eq i32 %5057, 43
  br i1 %5058, label %5089, label %5059

5059:                                             ; preds = %5054
  %5060 = load i8*, i8** %15, align 4
  %5061 = load i8, i8* %5060, align 1
  %5062 = sext i8 %5061 to i32
  %5063 = icmp eq i32 %5062, 63
  br i1 %5063, label %5089, label %5064

5064:                                             ; preds = %5059, %5048, %5037
  %5065 = load i32, i32* %8, align 4
  %5066 = and i32 %5065, 512
  %5067 = icmp ne i32 %5066, 0
  br i1 %5067, label %5068, label %5216

5068:                                             ; preds = %5064
  %5069 = load i32, i32* %8, align 4
  %5070 = and i32 %5069, 4096
  %5071 = icmp ne i32 %5070, 0
  br i1 %5071, label %5072, label %5077

5072:                                             ; preds = %5068
  %5073 = load i8*, i8** %15, align 4
  %5074 = load i8, i8* %5073, align 1
  %5075 = sext i8 %5074 to i32
  %5076 = icmp eq i32 %5075, 123
  br i1 %5076, label %5089, label %5216

5077:                                             ; preds = %5068
  %5078 = load i8*, i8** %15, align 4
  %5079 = getelementptr inbounds i8, i8* %5078, i32 0
  %5080 = load i8, i8* %5079, align 1
  %5081 = sext i8 %5080 to i32
  %5082 = icmp eq i32 %5081, 92
  br i1 %5082, label %5083, label %5216

5083:                                             ; preds = %5077
  %5084 = load i8*, i8** %15, align 4
  %5085 = getelementptr inbounds i8, i8* %5084, i32 1
  %5086 = load i8, i8* %5085, align 1
  %5087 = sext i8 %5086 to i32
  %5088 = icmp eq i32 %5087, 123
  br i1 %5088, label %5089, label %5216

5089:                                             ; preds = %5083, %5072, %5059, %5054, %5048, %5042, %5028, %5023, %5018, %5009, %5006
  %5090 = load i8*, i8** %13, align 4
  store i8* %5090, i8** %19, align 4
  br label %5091

5091:                                             ; preds = %5089
  br label %5092

5092:                                             ; preds = %5207, %5091
  %5093 = load i8*, i8** %13, align 4
  %5094 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5095 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5094, i32 0, i32 0
  %5096 = load i8*, i8** %5095, align 4
  %5097 = ptrtoint i8* %5093 to i32
  %5098 = ptrtoint i8* %5096 to i32
  %5099 = sub i32 %5097, %5098
  %5100 = add nsw i32 %5099, 2
  %5101 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5102 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5101, i32 0, i32 1
  %5103 = load i32, i32* %5102, align 4
  %5104 = icmp ugt i32 %5100, %5103
  br i1 %5104, label %5105, label %5208

5105:                                             ; preds = %5092
  br label %5106

5106:                                             ; preds = %5105
  %5107 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5108 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5107, i32 0, i32 0
  %5109 = load i8*, i8** %5108, align 4
  store i8* %5109, i8** %74, align 4
  %5110 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5111 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5110, i32 0, i32 1
  %5112 = load i32, i32* %5111, align 4
  %5113 = icmp eq i32 %5112, 65536
  br i1 %5113, label %5114, label %5115

5114:                                             ; preds = %5106
  store i32 15, i32* %5, align 4
  br label %5372

5115:                                             ; preds = %5106
  %5116 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5117 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5116, i32 0, i32 1
  %5118 = load i32, i32* %5117, align 4
  %5119 = shl i32 %5118, 1
  store i32 %5119, i32* %5117, align 4
  %5120 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5121 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5120, i32 0, i32 1
  %5122 = load i32, i32* %5121, align 4
  %5123 = icmp ugt i32 %5122, 65536
  br i1 %5123, label %5124, label %5127

5124:                                             ; preds = %5115
  %5125 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5126 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5125, i32 0, i32 1
  store i32 65536, i32* %5126, align 4
  br label %5127

5127:                                             ; preds = %5124, %5115
  %5128 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5129 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5128, i32 0, i32 0
  %5130 = load i8*, i8** %5129, align 4
  %5131 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5132 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5131, i32 0, i32 1
  %5133 = load i32, i32* %5132, align 4
  %5134 = call i8* @realloc(i8* %5130, i32 %5133) #7
  %5135 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5136 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5135, i32 0, i32 0
  store i8* %5134, i8** %5136, align 4
  %5137 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5138 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5137, i32 0, i32 0
  %5139 = load i8*, i8** %5138, align 4
  %5140 = icmp eq i8* %5139, null
  br i1 %5140, label %5141, label %5142

5141:                                             ; preds = %5127
  store i32 12, i32* %5, align 4
  br label %5372

5142:                                             ; preds = %5127
  %5143 = load i8*, i8** %74, align 4
  %5144 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5145 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5144, i32 0, i32 0
  %5146 = load i8*, i8** %5145, align 4
  %5147 = icmp ne i8* %5143, %5146
  br i1 %5147, label %5148, label %5206

5148:                                             ; preds = %5142
  %5149 = load i8*, i8** %13, align 4
  %5150 = load i8*, i8** %74, align 4
  %5151 = ptrtoint i8* %5149 to i32
  %5152 = ptrtoint i8* %5150 to i32
  %5153 = sub i32 %5151, %5152
  %5154 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5155 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5154, i32 0, i32 0
  %5156 = load i8*, i8** %5155, align 4
  %5157 = getelementptr inbounds i8, i8* %5156, i32 %5153
  store i8* %5157, i8** %13, align 4
  %5158 = load i8*, i8** %20, align 4
  %5159 = load i8*, i8** %74, align 4
  %5160 = ptrtoint i8* %5158 to i32
  %5161 = ptrtoint i8* %5159 to i32
  %5162 = sub i32 %5160, %5161
  %5163 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5164 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5163, i32 0, i32 0
  %5165 = load i8*, i8** %5164, align 4
  %5166 = getelementptr inbounds i8, i8* %5165, i32 %5162
  store i8* %5166, i8** %20, align 4
  %5167 = load i8*, i8** %22, align 4
  %5168 = icmp ne i8* %5167, null
  br i1 %5168, label %5169, label %5179

5169:                                             ; preds = %5148
  %5170 = load i8*, i8** %22, align 4
  %5171 = load i8*, i8** %74, align 4
  %5172 = ptrtoint i8* %5170 to i32
  %5173 = ptrtoint i8* %5171 to i32
  %5174 = sub i32 %5172, %5173
  %5175 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5176 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5175, i32 0, i32 0
  %5177 = load i8*, i8** %5176, align 4
  %5178 = getelementptr inbounds i8, i8* %5177, i32 %5174
  store i8* %5178, i8** %22, align 4
  br label %5179

5179:                                             ; preds = %5169, %5148
  %5180 = load i8*, i8** %19, align 4
  %5181 = icmp ne i8* %5180, null
  br i1 %5181, label %5182, label %5192

5182:                                             ; preds = %5179
  %5183 = load i8*, i8** %19, align 4
  %5184 = load i8*, i8** %74, align 4
  %5185 = ptrtoint i8* %5183 to i32
  %5186 = ptrtoint i8* %5184 to i32
  %5187 = sub i32 %5185, %5186
  %5188 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5189 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5188, i32 0, i32 0
  %5190 = load i8*, i8** %5189, align 4
  %5191 = getelementptr inbounds i8, i8* %5190, i32 %5187
  store i8* %5191, i8** %19, align 4
  br label %5192

5192:                                             ; preds = %5182, %5179
  %5193 = load i8*, i8** %18, align 4
  %5194 = icmp ne i8* %5193, null
  br i1 %5194, label %5195, label %5205

5195:                                             ; preds = %5192
  %5196 = load i8*, i8** %18, align 4
  %5197 = load i8*, i8** %74, align 4
  %5198 = ptrtoint i8* %5196 to i32
  %5199 = ptrtoint i8* %5197 to i32
  %5200 = sub i32 %5198, %5199
  %5201 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5202 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5201, i32 0, i32 0
  %5203 = load i8*, i8** %5202, align 4
  %5204 = getelementptr inbounds i8, i8* %5203, i32 %5200
  store i8* %5204, i8** %18, align 4
  br label %5205

5205:                                             ; preds = %5195, %5192
  br label %5206

5206:                                             ; preds = %5205, %5142
  br label %5207

5207:                                             ; preds = %5206
  br label %5092

5208:                                             ; preds = %5092
  %5209 = load i8*, i8** %13, align 4
  %5210 = getelementptr inbounds i8, i8* %5209, i32 1
  store i8* %5210, i8** %13, align 4
  store i8 1, i8* %5209, align 1
  %5211 = load i8*, i8** %13, align 4
  %5212 = getelementptr inbounds i8, i8* %5211, i32 1
  store i8* %5212, i8** %13, align 4
  store i8 0, i8* %5211, align 1
  br label %5213

5213:                                             ; preds = %5208
  %5214 = load i8*, i8** %13, align 4
  %5215 = getelementptr inbounds i8, i8* %5214, i32 -1
  store i8* %5215, i8** %18, align 4
  br label %5216

5216:                                             ; preds = %5213, %5083, %5077, %5072, %5064
  br label %5217

5217:                                             ; preds = %5216
  br label %5218

5218:                                             ; preds = %5333, %5217
  %5219 = load i8*, i8** %13, align 4
  %5220 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5221 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5220, i32 0, i32 0
  %5222 = load i8*, i8** %5221, align 4
  %5223 = ptrtoint i8* %5219 to i32
  %5224 = ptrtoint i8* %5222 to i32
  %5225 = sub i32 %5223, %5224
  %5226 = add nsw i32 %5225, 1
  %5227 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5228 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5227, i32 0, i32 1
  %5229 = load i32, i32* %5228, align 4
  %5230 = icmp ugt i32 %5226, %5229
  br i1 %5230, label %5231, label %5334

5231:                                             ; preds = %5218
  br label %5232

5232:                                             ; preds = %5231
  %5233 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5234 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5233, i32 0, i32 0
  %5235 = load i8*, i8** %5234, align 4
  store i8* %5235, i8** %75, align 4
  %5236 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5237 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5236, i32 0, i32 1
  %5238 = load i32, i32* %5237, align 4
  %5239 = icmp eq i32 %5238, 65536
  br i1 %5239, label %5240, label %5241

5240:                                             ; preds = %5232
  store i32 15, i32* %5, align 4
  br label %5372

5241:                                             ; preds = %5232
  %5242 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5243 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5242, i32 0, i32 1
  %5244 = load i32, i32* %5243, align 4
  %5245 = shl i32 %5244, 1
  store i32 %5245, i32* %5243, align 4
  %5246 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5247 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5246, i32 0, i32 1
  %5248 = load i32, i32* %5247, align 4
  %5249 = icmp ugt i32 %5248, 65536
  br i1 %5249, label %5250, label %5253

5250:                                             ; preds = %5241
  %5251 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5252 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5251, i32 0, i32 1
  store i32 65536, i32* %5252, align 4
  br label %5253

5253:                                             ; preds = %5250, %5241
  %5254 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5255 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5254, i32 0, i32 0
  %5256 = load i8*, i8** %5255, align 4
  %5257 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5258 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5257, i32 0, i32 1
  %5259 = load i32, i32* %5258, align 4
  %5260 = call i8* @realloc(i8* %5256, i32 %5259) #7
  %5261 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5262 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5261, i32 0, i32 0
  store i8* %5260, i8** %5262, align 4
  %5263 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5264 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5263, i32 0, i32 0
  %5265 = load i8*, i8** %5264, align 4
  %5266 = icmp eq i8* %5265, null
  br i1 %5266, label %5267, label %5268

5267:                                             ; preds = %5253
  store i32 12, i32* %5, align 4
  br label %5372

5268:                                             ; preds = %5253
  %5269 = load i8*, i8** %75, align 4
  %5270 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5271 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5270, i32 0, i32 0
  %5272 = load i8*, i8** %5271, align 4
  %5273 = icmp ne i8* %5269, %5272
  br i1 %5273, label %5274, label %5332

5274:                                             ; preds = %5268
  %5275 = load i8*, i8** %13, align 4
  %5276 = load i8*, i8** %75, align 4
  %5277 = ptrtoint i8* %5275 to i32
  %5278 = ptrtoint i8* %5276 to i32
  %5279 = sub i32 %5277, %5278
  %5280 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5281 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5280, i32 0, i32 0
  %5282 = load i8*, i8** %5281, align 4
  %5283 = getelementptr inbounds i8, i8* %5282, i32 %5279
  store i8* %5283, i8** %13, align 4
  %5284 = load i8*, i8** %20, align 4
  %5285 = load i8*, i8** %75, align 4
  %5286 = ptrtoint i8* %5284 to i32
  %5287 = ptrtoint i8* %5285 to i32
  %5288 = sub i32 %5286, %5287
  %5289 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5290 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5289, i32 0, i32 0
  %5291 = load i8*, i8** %5290, align 4
  %5292 = getelementptr inbounds i8, i8* %5291, i32 %5288
  store i8* %5292, i8** %20, align 4
  %5293 = load i8*, i8** %22, align 4
  %5294 = icmp ne i8* %5293, null
  br i1 %5294, label %5295, label %5305

5295:                                             ; preds = %5274
  %5296 = load i8*, i8** %22, align 4
  %5297 = load i8*, i8** %75, align 4
  %5298 = ptrtoint i8* %5296 to i32
  %5299 = ptrtoint i8* %5297 to i32
  %5300 = sub i32 %5298, %5299
  %5301 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5302 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5301, i32 0, i32 0
  %5303 = load i8*, i8** %5302, align 4
  %5304 = getelementptr inbounds i8, i8* %5303, i32 %5300
  store i8* %5304, i8** %22, align 4
  br label %5305

5305:                                             ; preds = %5295, %5274
  %5306 = load i8*, i8** %19, align 4
  %5307 = icmp ne i8* %5306, null
  br i1 %5307, label %5308, label %5318

5308:                                             ; preds = %5305
  %5309 = load i8*, i8** %19, align 4
  %5310 = load i8*, i8** %75, align 4
  %5311 = ptrtoint i8* %5309 to i32
  %5312 = ptrtoint i8* %5310 to i32
  %5313 = sub i32 %5311, %5312
  %5314 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5315 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5314, i32 0, i32 0
  %5316 = load i8*, i8** %5315, align 4
  %5317 = getelementptr inbounds i8, i8* %5316, i32 %5313
  store i8* %5317, i8** %19, align 4
  br label %5318

5318:                                             ; preds = %5308, %5305
  %5319 = load i8*, i8** %18, align 4
  %5320 = icmp ne i8* %5319, null
  br i1 %5320, label %5321, label %5331

5321:                                             ; preds = %5318
  %5322 = load i8*, i8** %18, align 4
  %5323 = load i8*, i8** %75, align 4
  %5324 = ptrtoint i8* %5322 to i32
  %5325 = ptrtoint i8* %5323 to i32
  %5326 = sub i32 %5324, %5325
  %5327 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5328 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5327, i32 0, i32 0
  %5329 = load i8*, i8** %5328, align 4
  %5330 = getelementptr inbounds i8, i8* %5329, i32 %5326
  store i8* %5330, i8** %18, align 4
  br label %5331

5331:                                             ; preds = %5321, %5318
  br label %5332

5332:                                             ; preds = %5331, %5268
  br label %5333

5333:                                             ; preds = %5332
  br label %5218

5334:                                             ; preds = %5218
  %5335 = load i8, i8* %10, align 1
  %5336 = load i8*, i8** %13, align 4
  %5337 = getelementptr inbounds i8, i8* %5336, i32 1
  store i8* %5337, i8** %13, align 4
  store i8 %5335, i8* %5336, align 1
  br label %5338

5338:                                             ; preds = %5334
  %5339 = load i8*, i8** %18, align 4
  %5340 = load i8, i8* %5339, align 1
  %5341 = add i8 %5340, 1
  store i8 %5341, i8* %5339, align 1
  br label %5342

5342:                                             ; preds = %5338, %5004, %2293, %1188, %1065, %589, %449, %310
  br label %145

5343:                                             ; preds = %145
  %5344 = load i8*, i8** %22, align 4
  %5345 = icmp ne i8* %5344, null
  br i1 %5345, label %5346, label %5354

5346:                                             ; preds = %5343
  %5347 = load i8*, i8** %22, align 4
  %5348 = load i8*, i8** %13, align 4
  %5349 = load i8*, i8** %22, align 4
  %5350 = ptrtoint i8* %5348 to i32
  %5351 = ptrtoint i8* %5349 to i32
  %5352 = sub i32 %5350, %5351
  %5353 = sub nsw i32 %5352, 3
  call void @store_op1(i32 13, i8* %5347, i32 %5353)
  br label %5354

5354:                                             ; preds = %5346, %5343
  %5355 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 2
  %5356 = load i32, i32* %5355, align 4
  %5357 = icmp eq i32 %5356, 0
  br i1 %5357, label %5359, label %5358

5358:                                             ; preds = %5354
  store i32 8, i32* %5, align 4
  br label %5372

5359:                                             ; preds = %5354
  %5360 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %14, i32 0, i32 0
  %5361 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %5360, align 4
  %5362 = bitcast %struct.compile_stack_elt_t* %5361 to i8*
  call void @free(i8* %5362) #7
  %5363 = load i8*, i8** %13, align 4
  %5364 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5365 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5364, i32 0, i32 0
  %5366 = load i8*, i8** %5365, align 4
  %5367 = ptrtoint i8* %5363 to i32
  %5368 = ptrtoint i8* %5366 to i32
  %5369 = sub i32 %5367, %5368
  %5370 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %9, align 4
  %5371 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %5370, i32 0, i32 2
  store i32 %5369, i32* %5371, align 4
  store i32 0, i32* %5, align 4
  br label %5372

5372:                                             ; preds = %5359, %5358, %5267, %5240, %5141, %5114, %4907, %4880, %4842, %4757, %4730, %4635, %4608, %4513, %4486, %4391, %4364, %4269, %4242, %4147, %4120, %4025, %3998, %3902, %3875, %3819, %3695, %3668, %3560, %3533, %3497, %3489, %3465, %3459, %3450, %3412, %3360, %3331, %3279, %3269, %3164, %3137, %3024, %2997, %2877, %2850, %2750, %2662, %2635, %2606, %2510, %2483, %2384, %2344, %2338, %1997, %1979, %1973, %1816, %1809, %1791, %1770, %1748, %1728, %1682, %1631, %1625, %1599, %1593, %1500, %1473, %1363, %1336, %1244, %1217, %1193, %1118, %1091, %986, %959, %850, %823, %643, %616, %552, %546, %503, %468, %377, %350, %238, %211, %154, %137, %89
  %5373 = load i32, i32* %5, align 4
  ret i32 %5373
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @regcomp(%struct.re_pattern_buffer*, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.re_pattern_buffer*, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %5, align 4
  store i8* %1, i8** %6, align 4
  store i32 %2, i32* %7, align 4
  %11 = load i32, i32* %7, align 4
  %12 = and i32 %11, 1
  %13 = icmp ne i32 %12, 0
  %14 = zext i1 %13 to i64
  %15 = select i1 %13, i32 242396, i32 66246
  store i32 %15, i32* %9, align 4
  %16 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %17 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %16, i32 0, i32 0
  store i8* null, i8** %17, align 4
  %18 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %19 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %18, i32 0, i32 1
  store i32 0, i32* %19, align 4
  %20 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %21 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %20, i32 0, i32 4
  store i8* null, i8** %21, align 4
  %22 = load i32, i32* %7, align 4
  %23 = and i32 %22, 2
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %68

25:                                               ; preds = %3
  %26 = call noalias i8* @malloc(i32 256) #7
  %27 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %28 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %27, i32 0, i32 5
  store i8* %26, i8** %28, align 4
  %29 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %30 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %29, i32 0, i32 5
  %31 = load i8*, i8** %30, align 4
  %32 = icmp eq i8* %31, null
  br i1 %32, label %33, label %34

33:                                               ; preds = %25
  store i32 12, i32* %4, align 4
  br label %117

34:                                               ; preds = %25
  store i32 0, i32* %10, align 4
  br label %35

35:                                               ; preds = %64, %34
  %36 = load i32, i32* %10, align 4
  %37 = icmp ult i32 %36, 256
  br i1 %37, label %38, label %67

38:                                               ; preds = %35
  %39 = load i32, i32* %10, align 4
  %40 = and i32 %39, -128
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %54

42:                                               ; preds = %38
  %43 = call i16** @__ctype_b_loc() #10
  %44 = load i16*, i16** %43, align 4
  %45 = load i32, i32* %10, align 4
  %46 = getelementptr inbounds i16, i16* %44, i32 %45
  %47 = load i16, i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 256
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %54

51:                                               ; preds = %42
  %52 = load i32, i32* %10, align 4
  %53 = call i32 @tolower(i32 %52) #8
  br label %56

54:                                               ; preds = %42, %38
  %55 = load i32, i32* %10, align 4
  br label %56

56:                                               ; preds = %54, %51
  %57 = phi i32 [ %53, %51 ], [ %55, %54 ]
  %58 = trunc i32 %57 to i8
  %59 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %60 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %59, i32 0, i32 5
  %61 = load i8*, i8** %60, align 4
  %62 = load i32, i32* %10, align 4
  %63 = getelementptr inbounds i8, i8* %61, i32 %62
  store i8 %58, i8* %63, align 1
  br label %64

64:                                               ; preds = %56
  %65 = load i32, i32* %10, align 4
  %66 = add i32 %65, 1
  store i32 %66, i32* %10, align 4
  br label %35

67:                                               ; preds = %35
  br label %71

68:                                               ; preds = %3
  %69 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %70 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %69, i32 0, i32 5
  store i8* null, i8** %70, align 4
  br label %71

71:                                               ; preds = %68, %67
  %72 = load i32, i32* %7, align 4
  %73 = and i32 %72, 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %85

75:                                               ; preds = %71
  %76 = load i32, i32* %9, align 4
  %77 = and i32 %76, -65
  store i32 %77, i32* %9, align 4
  %78 = load i32, i32* %9, align 4
  %79 = or i32 %78, 256
  store i32 %79, i32* %9, align 4
  %80 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %81 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %80, i32 0, i32 7
  %82 = load i8, i8* %81, align 4
  %83 = and i8 %82, 127
  %84 = or i8 %83, -128
  store i8 %84, i8* %81, align 4
  br label %90

85:                                               ; preds = %71
  %86 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %87 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %86, i32 0, i32 7
  %88 = load i8, i8* %87, align 4
  %89 = and i8 %88, 127
  store i8 %89, i8* %87, align 4
  br label %90

90:                                               ; preds = %85, %75
  %91 = load i32, i32* %7, align 4
  %92 = and i32 %91, 8
  %93 = icmp ne i32 %92, 0
  %94 = xor i1 %93, true
  %95 = xor i1 %94, true
  %96 = zext i1 %95 to i32
  %97 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %98 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %97, i32 0, i32 7
  %99 = trunc i32 %96 to i8
  %100 = load i8, i8* %98, align 4
  %101 = and i8 %99, 1
  %102 = shl i8 %101, 4
  %103 = and i8 %100, -17
  %104 = or i8 %103, %102
  store i8 %104, i8* %98, align 4
  %105 = zext i8 %101 to i32
  %106 = load i8*, i8** %6, align 4
  %107 = load i8*, i8** %6, align 4
  %108 = call i32 @strlen(i8* %107) #8
  %109 = load i32, i32* %9, align 4
  %110 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %5, align 4
  %111 = call i32 @regex_compile(i8* %106, i32 %108, i32 %109, %struct.re_pattern_buffer* %110)
  store i32 %111, i32* %8, align 4
  %112 = load i32, i32* %8, align 4
  %113 = icmp eq i32 %112, 16
  br i1 %113, label %114, label %115

114:                                              ; preds = %90
  store i32 8, i32* %8, align 4
  br label %115

115:                                              ; preds = %114, %90
  %116 = load i32, i32* %8, align 4
  store i32 %116, i32* %4, align 4
  br label %117

117:                                              ; preds = %115, %33
  %118 = load i32, i32* %4, align 4
  ret i32 %118
}

; Function Attrs: nounwind readonly
declare dso_local i32 @tolower(i32) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @regexec(%struct.re_pattern_buffer*, i8*, i32, %struct.regmatch_t*, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.re_pattern_buffer*, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.regmatch_t*, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.re_registers, align 4
  %14 = alloca %struct.re_pattern_buffer, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8, align 1
  %17 = alloca i32, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %7, align 4
  store i8* %1, i8** %8, align 4
  store i32 %2, i32* %9, align 4
  store %struct.regmatch_t* %3, %struct.regmatch_t** %10, align 4
  store i32 %4, i32* %11, align 4
  %18 = load i8*, i8** %8, align 4
  %19 = call i32 @strlen(i8* %18) #8
  store i32 %19, i32* %15, align 4
  %20 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %7, align 4
  %21 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %20, i32 0, i32 7
  %22 = load i8, i8* %21, align 4
  %23 = lshr i8 %22, 4
  %24 = and i8 %23, 1
  %25 = zext i8 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %5
  %28 = load i32, i32* %9, align 4
  %29 = icmp ugt i32 %28, 0
  br label %30

30:                                               ; preds = %27, %5
  %31 = phi i1 [ false, %5 ], [ %29, %27 ]
  %32 = zext i1 %31 to i32
  %33 = trunc i32 %32 to i8
  store i8 %33, i8* %16, align 1
  %34 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %7, align 4
  %35 = bitcast %struct.re_pattern_buffer* %14 to i8*
  %36 = bitcast %struct.re_pattern_buffer* %34 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %35, i8* align 4 %36, i32 32, i1 false)
  %37 = load i32, i32* %11, align 4
  %38 = and i32 %37, 1
  %39 = icmp ne i32 %38, 0
  %40 = xor i1 %39, true
  %41 = xor i1 %40, true
  %42 = zext i1 %41 to i32
  %43 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %14, i32 0, i32 7
  %44 = trunc i32 %42 to i8
  %45 = load i8, i8* %43, align 4
  %46 = and i8 %44, 1
  %47 = shl i8 %46, 5
  %48 = and i8 %45, -33
  %49 = or i8 %48, %47
  store i8 %49, i8* %43, align 4
  %50 = zext i8 %46 to i32
  %51 = load i32, i32* %11, align 4
  %52 = and i32 %51, 2
  %53 = icmp ne i32 %52, 0
  %54 = xor i1 %53, true
  %55 = xor i1 %54, true
  %56 = zext i1 %55 to i32
  %57 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %14, i32 0, i32 7
  %58 = trunc i32 %56 to i8
  %59 = load i8, i8* %57, align 4
  %60 = and i8 %58, 1
  %61 = shl i8 %60, 6
  %62 = and i8 %59, -65
  %63 = or i8 %62, %61
  store i8 %63, i8* %57, align 4
  %64 = zext i8 %60 to i32
  %65 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %14, i32 0, i32 7
  %66 = load i8, i8* %65, align 4
  %67 = and i8 %66, -7
  %68 = or i8 %67, 4
  store i8 %68, i8* %65, align 4
  %69 = load i8, i8* %16, align 1
  %70 = icmp ne i8 %69, 0
  br i1 %70, label %71, label %93

71:                                               ; preds = %30
  %72 = load i32, i32* %9, align 4
  %73 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 0
  store i32 %72, i32* %73, align 4
  %74 = load i32, i32* %9, align 4
  %75 = mul i32 %74, 4
  %76 = call noalias i8* @malloc(i32 %75) #7
  %77 = bitcast i8* %76 to i32*
  %78 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 1
  store i32* %77, i32** %78, align 4
  %79 = load i32, i32* %9, align 4
  %80 = mul i32 %79, 4
  %81 = call noalias i8* @malloc(i32 %80) #7
  %82 = bitcast i8* %81 to i32*
  %83 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 2
  store i32* %82, i32** %83, align 4
  %84 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 1
  %85 = load i32*, i32** %84, align 4
  %86 = icmp eq i32* %85, null
  br i1 %86, label %91, label %87

87:                                               ; preds = %71
  %88 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 2
  %89 = load i32*, i32** %88, align 4
  %90 = icmp eq i32* %89, null
  br i1 %90, label %91, label %92

91:                                               ; preds = %87, %71
  store i32 1, i32* %6, align 4
  br label %150

92:                                               ; preds = %87
  br label %93

93:                                               ; preds = %92, %30
  %94 = load i8*, i8** %8, align 4
  %95 = load i32, i32* %15, align 4
  %96 = load i32, i32* %15, align 4
  %97 = load i8, i8* %16, align 1
  %98 = sext i8 %97 to i32
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %93
  br label %102

101:                                              ; preds = %93
  br label %102

102:                                              ; preds = %101, %100
  %103 = phi %struct.re_registers* [ %13, %100 ], [ null, %101 ]
  %104 = call i32 @re_search(%struct.re_pattern_buffer* %14, i8* %94, i32 %95, i32 0, i32 %96, %struct.re_registers* %103)
  store i32 %104, i32* %12, align 4
  %105 = load i8, i8* %16, align 1
  %106 = icmp ne i8 %105, 0
  br i1 %106, label %107, label %145

107:                                              ; preds = %102
  %108 = load i32, i32* %12, align 4
  %109 = icmp sge i32 %108, 0
  br i1 %109, label %110, label %138

110:                                              ; preds = %107
  store i32 0, i32* %17, align 4
  br label %111

111:                                              ; preds = %134, %110
  %112 = load i32, i32* %17, align 4
  %113 = load i32, i32* %9, align 4
  %114 = icmp ult i32 %112, %113
  br i1 %114, label %115, label %137

115:                                              ; preds = %111
  %116 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 1
  %117 = load i32*, i32** %116, align 4
  %118 = load i32, i32* %17, align 4
  %119 = getelementptr inbounds i32, i32* %117, i32 %118
  %120 = load i32, i32* %119, align 4
  %121 = load %struct.regmatch_t*, %struct.regmatch_t** %10, align 4
  %122 = load i32, i32* %17, align 4
  %123 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %121, i32 %122
  %124 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %123, i32 0, i32 0
  store i32 %120, i32* %124, align 4
  %125 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 2
  %126 = load i32*, i32** %125, align 4
  %127 = load i32, i32* %17, align 4
  %128 = getelementptr inbounds i32, i32* %126, i32 %127
  %129 = load i32, i32* %128, align 4
  %130 = load %struct.regmatch_t*, %struct.regmatch_t** %10, align 4
  %131 = load i32, i32* %17, align 4
  %132 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %130, i32 %131
  %133 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %132, i32 0, i32 1
  store i32 %129, i32* %133, align 4
  br label %134

134:                                              ; preds = %115
  %135 = load i32, i32* %17, align 4
  %136 = add i32 %135, 1
  store i32 %136, i32* %17, align 4
  br label %111

137:                                              ; preds = %111
  br label %138

138:                                              ; preds = %137, %107
  %139 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 1
  %140 = load i32*, i32** %139, align 4
  %141 = bitcast i32* %140 to i8*
  call void @free(i8* %141) #7
  %142 = getelementptr inbounds %struct.re_registers, %struct.re_registers* %13, i32 0, i32 2
  %143 = load i32*, i32** %142, align 4
  %144 = bitcast i32* %143 to i8*
  call void @free(i8* %144) #7
  br label %145

145:                                              ; preds = %138, %102
  %146 = load i32, i32* %12, align 4
  %147 = icmp sge i32 %146, 0
  %148 = zext i1 %147 to i64
  %149 = select i1 %147, i32 0, i32 1
  store i32 %149, i32* %6, align 4
  br label %150

150:                                              ; preds = %145, %91
  %151 = load i32, i32* %6, align 4
  ret i32 %151
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @regerror(i32, %struct.re_pattern_buffer*, i8*, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.re_pattern_buffer*, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store %struct.re_pattern_buffer* %1, %struct.re_pattern_buffer** %6, align 4
  store i8* %2, i8** %7, align 4
  store i32 %3, i32* %8, align 4
  %11 = load i32, i32* %5, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load i32, i32* %5, align 4
  %15 = icmp uge i32 %14, 17
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  call void @abort() #9
  unreachable

17:                                               ; preds = %13
  %18 = load i32, i32* %5, align 4
  %19 = getelementptr inbounds [17 x i8*], [17 x i8*]* @re_error_msg, i32 0, i32 %18
  %20 = load i8*, i8** %19, align 4
  store i8* %20, i8** %9, align 4
  %21 = load i8*, i8** %9, align 4
  %22 = icmp ne i8* %21, null
  br i1 %22, label %24, label %23

23:                                               ; preds = %17
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.50, i32 0, i32 0), i8** %9, align 4
  br label %24

24:                                               ; preds = %23, %17
  %25 = load i8*, i8** %9, align 4
  %26 = call i32 @strlen(i8* %25) #8
  %27 = add i32 %26, 1
  store i32 %27, i32* %10, align 4
  %28 = load i32, i32* %8, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %49

30:                                               ; preds = %24
  %31 = load i32, i32* %10, align 4
  %32 = load i32, i32* %8, align 4
  %33 = icmp ugt i32 %31, %32
  br i1 %33, label %34, label %44

34:                                               ; preds = %30
  %35 = load i8*, i8** %7, align 4
  %36 = load i8*, i8** %9, align 4
  %37 = load i32, i32* %8, align 4
  %38 = sub i32 %37, 1
  %39 = call i8* @strncpy(i8* %35, i8* %36, i32 %38) #7
  %40 = load i8*, i8** %7, align 4
  %41 = load i32, i32* %8, align 4
  %42 = sub i32 %41, 1
  %43 = getelementptr inbounds i8, i8* %40, i32 %42
  store i8 0, i8* %43, align 1
  br label %48

44:                                               ; preds = %30
  %45 = load i8*, i8** %7, align 4
  %46 = load i8*, i8** %9, align 4
  %47 = call i8* @strcpy(i8* %45, i8* %46) #7
  br label %48

48:                                               ; preds = %44, %34
  br label %49

49:                                               ; preds = %48, %24
  %50 = load i32, i32* %10, align 4
  ret i32 %50
}

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i32) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @regfree(%struct.re_pattern_buffer*) #0 {
  %2 = alloca %struct.re_pattern_buffer*, align 4
  store %struct.re_pattern_buffer* %0, %struct.re_pattern_buffer** %2, align 4
  %3 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %4 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %3, i32 0, i32 0
  %5 = load i8*, i8** %4, align 4
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %9 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %8, i32 0, i32 0
  %10 = load i8*, i8** %9, align 4
  call void @free(i8* %10) #7
  br label %11

11:                                               ; preds = %7, %1
  %12 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %13 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %12, i32 0, i32 0
  store i8* null, i8** %13, align 4
  %14 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %15 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %14, i32 0, i32 1
  store i32 0, i32* %15, align 4
  %16 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %17 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %16, i32 0, i32 2
  store i32 0, i32* %17, align 4
  %18 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %19 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %18, i32 0, i32 4
  %20 = load i8*, i8** %19, align 4
  %21 = icmp ne i8* %20, null
  br i1 %21, label %22, label %26

22:                                               ; preds = %11
  %23 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %24 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %23, i32 0, i32 4
  %25 = load i8*, i8** %24, align 4
  call void @free(i8* %25) #7
  br label %26

26:                                               ; preds = %22, %11
  %27 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %28 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %27, i32 0, i32 4
  store i8* null, i8** %28, align 4
  %29 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %30 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %29, i32 0, i32 7
  %31 = load i8, i8* %30, align 4
  %32 = and i8 %31, -9
  store i8 %32, i8* %30, align 4
  %33 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %34 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %33, i32 0, i32 5
  %35 = load i8*, i8** %34, align 4
  %36 = icmp ne i8* %35, null
  br i1 %36, label %37, label %41

37:                                               ; preds = %26
  %38 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %39 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %38, i32 0, i32 5
  %40 = load i8*, i8** %39, align 4
  call void @free(i8* %40) #7
  br label %41

41:                                               ; preds = %37, %26
  %42 = load %struct.re_pattern_buffer*, %struct.re_pattern_buffer** %2, align 4
  %43 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %42, i32 0, i32 5
  store i8* null, i8** %43, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @group_match_null_string_p(i8**, i8*, %union.register_info_type*) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8**, align 4
  %6 = alloca i8*, align 4
  %7 = alloca %union.register_info_type*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  store i8** %0, i8*** %5, align 4
  store i8* %1, i8** %6, align 4
  store %union.register_info_type* %2, %union.register_info_type** %7, align 4
  %10 = load i8**, i8*** %5, align 4
  %11 = load i8*, i8** %10, align 4
  %12 = getelementptr inbounds i8, i8* %11, i32 2
  store i8* %12, i8** %9, align 4
  br label %13

13:                                               ; preds = %142, %3
  %14 = load i8*, i8** %9, align 4
  %15 = load i8*, i8** %6, align 4
  %16 = icmp ult i8* %14, %15
  br i1 %16, label %17, label %143

17:                                               ; preds = %13
  %18 = load i8*, i8** %9, align 4
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  switch i32 %20, label %135 [
    i32 14, label %21
    i32 6, label %131
  ]

21:                                               ; preds = %17
  %22 = load i8*, i8** %9, align 4
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %9, align 4
  br label %24

24:                                               ; preds = %21
  br label %25

25:                                               ; preds = %24
  %26 = load i8*, i8** %9, align 4
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = and i32 %28, 255
  store i32 %29, i32* %8, align 4
  %30 = load i8*, i8** %9, align 4
  %31 = getelementptr inbounds i8, i8* %30, i32 1
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = shl i32 %33, 8
  %35 = load i32, i32* %8, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, i32* %8, align 4
  br label %37

37:                                               ; preds = %25
  %38 = load i8*, i8** %9, align 4
  %39 = getelementptr inbounds i8, i8* %38, i32 2
  store i8* %39, i8** %9, align 4
  br label %40

40:                                               ; preds = %37
  %41 = load i32, i32* %8, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %130

43:                                               ; preds = %40
  br label %44

44:                                               ; preds = %101, %43
  %45 = load i8*, i8** %9, align 4
  %46 = load i32, i32* %8, align 4
  %47 = sub nsw i32 %46, 3
  %48 = getelementptr inbounds i8, i8* %45, i32 %47
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 13
  br i1 %51, label %52, label %102

52:                                               ; preds = %44
  %53 = load i8*, i8** %9, align 4
  %54 = load i8*, i8** %9, align 4
  %55 = load i32, i32* %8, align 4
  %56 = getelementptr inbounds i8, i8* %54, i32 %55
  %57 = getelementptr inbounds i8, i8* %56, i32 -3
  %58 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %59 = call signext i8 @alt_match_null_string_p(i8* %53, i8* %57, %union.register_info_type* %58)
  %60 = icmp ne i8 %59, 0
  br i1 %60, label %62, label %61

61:                                               ; preds = %52
  store i8 0, i8* %4, align 1
  br label %144

62:                                               ; preds = %52
  %63 = load i32, i32* %8, align 4
  %64 = load i8*, i8** %9, align 4
  %65 = getelementptr inbounds i8, i8* %64, i32 %63
  store i8* %65, i8** %9, align 4
  %66 = load i8*, i8** %9, align 4
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = icmp ne i32 %68, 14
  br i1 %69, label %70, label %71

70:                                               ; preds = %62
  br label %102

71:                                               ; preds = %62
  %72 = load i8*, i8** %9, align 4
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %9, align 4
  br label %74

74:                                               ; preds = %71
  br label %75

75:                                               ; preds = %74
  %76 = load i8*, i8** %9, align 4
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = and i32 %78, 255
  store i32 %79, i32* %8, align 4
  %80 = load i8*, i8** %9, align 4
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  %82 = load i8, i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = shl i32 %83, 8
  %85 = load i32, i32* %8, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, i32* %8, align 4
  br label %87

87:                                               ; preds = %75
  %88 = load i8*, i8** %9, align 4
  %89 = getelementptr inbounds i8, i8* %88, i32 2
  store i8* %89, i8** %9, align 4
  br label %90

90:                                               ; preds = %87
  %91 = load i8*, i8** %9, align 4
  %92 = load i32, i32* %8, align 4
  %93 = sub nsw i32 %92, 3
  %94 = getelementptr inbounds i8, i8* %91, i32 %93
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = icmp ne i32 %96, 13
  br i1 %97, label %98, label %101

98:                                               ; preds = %90
  %99 = load i8*, i8** %9, align 4
  %100 = getelementptr inbounds i8, i8* %99, i32 -3
  store i8* %100, i8** %9, align 4
  br label %102

101:                                              ; preds = %90
  br label %44

102:                                              ; preds = %98, %70, %44
  br label %103

103:                                              ; preds = %102
  %104 = load i8*, i8** %9, align 4
  %105 = getelementptr inbounds i8, i8* %104, i32 -2
  %106 = load i8, i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = and i32 %107, 255
  store i32 %108, i32* %8, align 4
  %109 = load i8*, i8** %9, align 4
  %110 = getelementptr inbounds i8, i8* %109, i32 -2
  %111 = getelementptr inbounds i8, i8* %110, i32 1
  %112 = load i8, i8* %111, align 1
  %113 = sext i8 %112 to i32
  %114 = shl i32 %113, 8
  %115 = load i32, i32* %8, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, i32* %8, align 4
  br label %117

117:                                              ; preds = %103
  %118 = load i8*, i8** %9, align 4
  %119 = load i8*, i8** %9, align 4
  %120 = load i32, i32* %8, align 4
  %121 = getelementptr inbounds i8, i8* %119, i32 %120
  %122 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %123 = call signext i8 @alt_match_null_string_p(i8* %118, i8* %121, %union.register_info_type* %122)
  %124 = icmp ne i8 %123, 0
  br i1 %124, label %126, label %125

125:                                              ; preds = %117
  store i8 0, i8* %4, align 1
  br label %144

126:                                              ; preds = %117
  %127 = load i32, i32* %8, align 4
  %128 = load i8*, i8** %9, align 4
  %129 = getelementptr inbounds i8, i8* %128, i32 %127
  store i8* %129, i8** %9, align 4
  br label %130

130:                                              ; preds = %126, %40
  br label %142

131:                                              ; preds = %17
  %132 = load i8*, i8** %9, align 4
  %133 = getelementptr inbounds i8, i8* %132, i32 2
  %134 = load i8**, i8*** %5, align 4
  store i8* %133, i8** %134, align 4
  store i8 1, i8* %4, align 1
  br label %144

135:                                              ; preds = %17
  %136 = load i8*, i8** %6, align 4
  %137 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %138 = call signext i8 @common_op_match_null_string_p(i8** %9, i8* %136, %union.register_info_type* %137)
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %141, label %140

140:                                              ; preds = %135
  store i8 0, i8* %4, align 1
  br label %144

141:                                              ; preds = %135
  br label %142

142:                                              ; preds = %141, %130
  br label %13

143:                                              ; preds = %13
  store i8 0, i8* %4, align 1
  br label %144

144:                                              ; preds = %143, %140, %131, %125, %61
  %145 = load i8, i8* %4, align 1
  ret i8 %145
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @alt_match_null_string_p(i8*, i8*, %union.register_info_type*) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 4
  %6 = alloca i8*, align 4
  %7 = alloca %union.register_info_type*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  store i8* %0, i8** %5, align 4
  store i8* %1, i8** %6, align 4
  store %union.register_info_type* %2, %union.register_info_type** %7, align 4
  %10 = load i8*, i8** %5, align 4
  store i8* %10, i8** %9, align 4
  br label %11

11:                                               ; preds = %49, %3
  %12 = load i8*, i8** %9, align 4
  %13 = load i8*, i8** %6, align 4
  %14 = icmp ult i8* %12, %13
  br i1 %14, label %15, label %50

15:                                               ; preds = %11
  %16 = load i8*, i8** %9, align 4
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  switch i32 %18, label %42 [
    i32 14, label %19
  ]

19:                                               ; preds = %15
  %20 = load i8*, i8** %9, align 4
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %21, i8** %9, align 4
  br label %22

22:                                               ; preds = %19
  br label %23

23:                                               ; preds = %22
  %24 = load i8*, i8** %9, align 4
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = and i32 %26, 255
  store i32 %27, i32* %8, align 4
  %28 = load i8*, i8** %9, align 4
  %29 = getelementptr inbounds i8, i8* %28, i32 1
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = shl i32 %31, 8
  %33 = load i32, i32* %8, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, i32* %8, align 4
  br label %35

35:                                               ; preds = %23
  %36 = load i8*, i8** %9, align 4
  %37 = getelementptr inbounds i8, i8* %36, i32 2
  store i8* %37, i8** %9, align 4
  br label %38

38:                                               ; preds = %35
  %39 = load i32, i32* %8, align 4
  %40 = load i8*, i8** %9, align 4
  %41 = getelementptr inbounds i8, i8* %40, i32 %39
  store i8* %41, i8** %9, align 4
  br label %49

42:                                               ; preds = %15
  %43 = load i8*, i8** %6, align 4
  %44 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %45 = call signext i8 @common_op_match_null_string_p(i8** %9, i8* %43, %union.register_info_type* %44)
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %48, label %47

47:                                               ; preds = %42
  store i8 0, i8* %4, align 1
  br label %51

48:                                               ; preds = %42
  br label %49

49:                                               ; preds = %48, %38
  br label %11

50:                                               ; preds = %11
  store i8 1, i8* %4, align 1
  br label %51

51:                                               ; preds = %50, %47
  %52 = load i8, i8* %4, align 1
  ret i8 %52
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @common_op_match_null_string_p(i8**, i8*, %union.register_info_type*) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8**, align 4
  %6 = alloca i8*, align 4
  %7 = alloca %union.register_info_type*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 4
  store i8** %0, i8*** %5, align 4
  store i8* %1, i8** %6, align 4
  store %union.register_info_type* %2, %union.register_info_type** %7, align 4
  %12 = load i8**, i8*** %5, align 4
  %13 = load i8*, i8** %12, align 4
  store i8* %13, i8** %11, align 4
  %14 = load i8*, i8** %11, align 4
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %11, align 4
  %16 = load i8, i8* %14, align 1
  %17 = zext i8 %16 to i32
  switch i32 %17, label %144 [
    i32 0, label %18
    i32 8, label %18
    i32 9, label %18
    i32 10, label %18
    i32 11, label %18
    i32 25, label %18
    i32 26, label %18
    i32 27, label %18
    i32 28, label %18
    i32 5, label %19
    i32 12, label %54
    i32 20, label %80
    i32 7, label %127
    i32 22, label %141
  ]

18:                                               ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3
  br label %145

19:                                               ; preds = %3
  %20 = load i8*, i8** %11, align 4
  %21 = load i8, i8* %20, align 1
  %22 = zext i8 %21 to i32
  store i32 %22, i32* %10, align 4
  %23 = load i8*, i8** %6, align 4
  %24 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %25 = call signext i8 @group_match_null_string_p(i8** %11, i8* %23, %union.register_info_type* %24)
  store i8 %25, i8* %9, align 1
  %26 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %27 = load i32, i32* %10, align 4
  %28 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %26, i32 %27
  %29 = bitcast %union.register_info_type* %28 to %struct.anon.2*
  %30 = bitcast %struct.anon.2* %29 to i8*
  %31 = load i8, i8* %30, align 4
  %32 = and i8 %31, 3
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 3
  br i1 %34, label %35, label %49

35:                                               ; preds = %19
  %36 = load i8, i8* %9, align 1
  %37 = sext i8 %36 to i32
  %38 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %39 = load i32, i32* %10, align 4
  %40 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %38, i32 %39
  %41 = bitcast %union.register_info_type* %40 to %struct.anon.2*
  %42 = bitcast %struct.anon.2* %41 to i8*
  %43 = trunc i32 %37 to i8
  %44 = load i8, i8* %42, align 4
  %45 = and i8 %43, 3
  %46 = and i8 %44, -4
  %47 = or i8 %46, %45
  store i8 %47, i8* %42, align 4
  %48 = zext i8 %45 to i32
  br label %49

49:                                               ; preds = %35, %19
  %50 = load i8, i8* %9, align 1
  %51 = icmp ne i8 %50, 0
  br i1 %51, label %53, label %52

52:                                               ; preds = %49
  store i8 0, i8* %4, align 1
  br label %148

53:                                               ; preds = %49
  br label %145

54:                                               ; preds = %3
  br label %55

55:                                               ; preds = %54
  br label %56

56:                                               ; preds = %55
  %57 = load i8*, i8** %11, align 4
  %58 = load i8, i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = and i32 %59, 255
  store i32 %60, i32* %8, align 4
  %61 = load i8*, i8** %11, align 4
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = load i32, i32* %8, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, i32* %8, align 4
  br label %68

68:                                               ; preds = %56
  %69 = load i8*, i8** %11, align 4
  %70 = getelementptr inbounds i8, i8* %69, i32 2
  store i8* %70, i8** %11, align 4
  br label %71

71:                                               ; preds = %68
  %72 = load i32, i32* %8, align 4
  %73 = icmp sge i32 %72, 0
  br i1 %73, label %74, label %78

74:                                               ; preds = %71
  %75 = load i32, i32* %8, align 4
  %76 = load i8*, i8** %11, align 4
  %77 = getelementptr inbounds i8, i8* %76, i32 %75
  store i8* %77, i8** %11, align 4
  br label %79

78:                                               ; preds = %71
  store i8 0, i8* %4, align 1
  br label %148

79:                                               ; preds = %74
  br label %145

80:                                               ; preds = %3
  %81 = load i8*, i8** %11, align 4
  %82 = getelementptr inbounds i8, i8* %81, i32 2
  store i8* %82, i8** %11, align 4
  br label %83

83:                                               ; preds = %80
  br label %84

84:                                               ; preds = %83
  %85 = load i8*, i8** %11, align 4
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = and i32 %87, 255
  store i32 %88, i32* %8, align 4
  %89 = load i8*, i8** %11, align 4
  %90 = getelementptr inbounds i8, i8* %89, i32 1
  %91 = load i8, i8* %90, align 1
  %92 = sext i8 %91 to i32
  %93 = shl i32 %92, 8
  %94 = load i32, i32* %8, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %8, align 4
  br label %96

96:                                               ; preds = %84
  %97 = load i8*, i8** %11, align 4
  %98 = getelementptr inbounds i8, i8* %97, i32 2
  store i8* %98, i8** %11, align 4
  br label %99

99:                                               ; preds = %96
  %100 = load i32, i32* %8, align 4
  %101 = icmp eq i32 %100, 0
  br i1 %101, label %102, label %125

102:                                              ; preds = %99
  %103 = load i8*, i8** %11, align 4
  %104 = getelementptr inbounds i8, i8* %103, i32 -4
  store i8* %104, i8** %11, align 4
  br label %105

105:                                              ; preds = %102
  br label %106

106:                                              ; preds = %105
  %107 = load i8*, i8** %11, align 4
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = and i32 %109, 255
  store i32 %110, i32* %8, align 4
  %111 = load i8*, i8** %11, align 4
  %112 = getelementptr inbounds i8, i8* %111, i32 1
  %113 = load i8, i8* %112, align 1
  %114 = sext i8 %113 to i32
  %115 = shl i32 %114, 8
  %116 = load i32, i32* %8, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, i32* %8, align 4
  br label %118

118:                                              ; preds = %106
  %119 = load i8*, i8** %11, align 4
  %120 = getelementptr inbounds i8, i8* %119, i32 2
  store i8* %120, i8** %11, align 4
  br label %121

121:                                              ; preds = %118
  %122 = load i32, i32* %8, align 4
  %123 = load i8*, i8** %11, align 4
  %124 = getelementptr inbounds i8, i8* %123, i32 %122
  store i8* %124, i8** %11, align 4
  br label %126

125:                                              ; preds = %99
  store i8 0, i8* %4, align 1
  br label %148

126:                                              ; preds = %121
  br label %145

127:                                              ; preds = %3
  %128 = load %union.register_info_type*, %union.register_info_type** %7, align 4
  %129 = load i8*, i8** %11, align 4
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = getelementptr inbounds %union.register_info_type, %union.register_info_type* %128, i32 %131
  %133 = bitcast %union.register_info_type* %132 to %struct.anon.2*
  %134 = bitcast %struct.anon.2* %133 to i8*
  %135 = load i8, i8* %134, align 4
  %136 = and i8 %135, 3
  %137 = zext i8 %136 to i32
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %140, label %139

139:                                              ; preds = %127
  store i8 0, i8* %4, align 1
  br label %148

140:                                              ; preds = %127
  br label %145

141:                                              ; preds = %3
  %142 = load i8*, i8** %11, align 4
  %143 = getelementptr inbounds i8, i8* %142, i32 4
  store i8* %143, i8** %11, align 4
  br label %144

144:                                              ; preds = %3, %141
  store i8 0, i8* %4, align 1
  br label %148

145:                                              ; preds = %140, %126, %79, %53, %18
  %146 = load i8*, i8** %11, align 4
  %147 = load i8**, i8*** %5, align 4
  store i8* %146, i8** %147, align 4
  store i8 1, i8* %4, align 1
  br label %148

148:                                              ; preds = %145, %144, %139, %125, %78, %52
  %149 = load i8, i8* %4, align 1
  ret i8 %149
}

; Function Attrs: noinline nounwind optnone
define internal i32 @bcmp_translate(i8*, i8*, i32, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i8*, align 4
  store i8* %0, i8** %6, align 4
  store i8* %1, i8** %7, align 4
  store i32 %2, i32* %8, align 4
  store i8* %3, i8** %9, align 4
  %12 = load i8*, i8** %6, align 4
  store i8* %12, i8** %10, align 4
  %13 = load i8*, i8** %7, align 4
  store i8* %13, i8** %11, align 4
  br label %14

14:                                               ; preds = %36, %4
  %15 = load i32, i32* %8, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %39

17:                                               ; preds = %14
  %18 = load i8*, i8** %9, align 4
  %19 = load i8*, i8** %10, align 4
  %20 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %20, i8** %10, align 4
  %21 = load i8, i8* %19, align 1
  %22 = zext i8 %21 to i32
  %23 = getelementptr inbounds i8, i8* %18, i32 %22
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = load i8*, i8** %9, align 4
  %27 = load i8*, i8** %11, align 4
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %11, align 4
  %29 = load i8, i8* %27, align 1
  %30 = zext i8 %29 to i32
  %31 = getelementptr inbounds i8, i8* %26, i32 %30
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %25, %33
  br i1 %34, label %35, label %36

35:                                               ; preds = %17
  store i32 1, i32* %5, align 4
  br label %40

36:                                               ; preds = %17
  %37 = load i32, i32* %8, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, i32* %8, align 4
  br label %14

39:                                               ; preds = %14
  store i32 0, i32* %5, align 4
  br label %40

40:                                               ; preds = %39, %35
  %41 = load i32, i32* %5, align 4
  ret i32 %41
}

; Function Attrs: noinline nounwind optnone
define internal void @init_syntax_once() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @init_syntax_once.done, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  br label %36

5:                                                ; preds = %0
  call void @llvm.memset.p0i8.i32(i8* align 1 getelementptr inbounds ([256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 0), i8 0, i32 256, i1 false)
  store i32 97, i32* %1, align 4
  br label %6

6:                                                ; preds = %12, %5
  %7 = load i32, i32* %1, align 4
  %8 = icmp sle i32 %7, 122
  br i1 %8, label %9, label %15

9:                                                ; preds = %6
  %10 = load i32, i32* %1, align 4
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %10
  store i8 1, i8* %11, align 1
  br label %12

12:                                               ; preds = %9
  %13 = load i32, i32* %1, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %1, align 4
  br label %6

15:                                               ; preds = %6
  store i32 65, i32* %1, align 4
  br label %16

16:                                               ; preds = %22, %15
  %17 = load i32, i32* %1, align 4
  %18 = icmp sle i32 %17, 90
  br i1 %18, label %19, label %25

19:                                               ; preds = %16
  %20 = load i32, i32* %1, align 4
  %21 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %20
  store i8 1, i8* %21, align 1
  br label %22

22:                                               ; preds = %19
  %23 = load i32, i32* %1, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %1, align 4
  br label %16

25:                                               ; preds = %16
  store i32 48, i32* %1, align 4
  br label %26

26:                                               ; preds = %32, %25
  %27 = load i32, i32* %1, align 4
  %28 = icmp sle i32 %27, 57
  br i1 %28, label %29, label %35

29:                                               ; preds = %26
  %30 = load i32, i32* %1, align 4
  %31 = getelementptr inbounds [256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 %30
  store i8 1, i8* %31, align 1
  br label %32

32:                                               ; preds = %29
  %33 = load i32, i32* %1, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %1, align 4
  br label %26

35:                                               ; preds = %26
  store i8 1, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @re_syntax_table, i32 0, i32 95), align 1
  store i32 1, i32* @init_syntax_once.done, align 4
  br label %36

36:                                               ; preds = %35, %4
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @at_begline_loc_p(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i8, align 1
  store i8* %0, i8** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = load i8*, i8** %5, align 4
  %10 = getelementptr inbounds i8, i8* %9, i32 -2
  store i8* %10, i8** %7, align 4
  %11 = load i8*, i8** %7, align 4
  %12 = load i8*, i8** %4, align 4
  %13 = icmp ugt i8* %11, %12
  br i1 %13, label %14, label %20

14:                                               ; preds = %3
  %15 = load i8*, i8** %7, align 4
  %16 = getelementptr inbounds i8, i8* %15, i32 -1
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 92
  br label %20

20:                                               ; preds = %14, %3
  %21 = phi i1 [ false, %3 ], [ %19, %14 ]
  %22 = zext i1 %21 to i32
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %8, align 1
  %24 = load i8*, i8** %7, align 4
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 40
  br i1 %27, label %28, label %36

28:                                               ; preds = %20
  %29 = load i32, i32* %6, align 4
  %30 = and i32 %29, 8192
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %53, label %32

32:                                               ; preds = %28
  %33 = load i8, i8* %8, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %53, label %36

36:                                               ; preds = %32, %20
  %37 = load i8*, i8** %7, align 4
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 124
  br i1 %40, label %41, label %51

41:                                               ; preds = %36
  %42 = load i32, i32* %6, align 4
  %43 = and i32 %42, 32768
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %49, label %45

45:                                               ; preds = %41
  %46 = load i8, i8* %8, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp ne i32 %47, 0
  br label %49

49:                                               ; preds = %45, %41
  %50 = phi i1 [ true, %41 ], [ %48, %45 ]
  br label %51

51:                                               ; preds = %49, %36
  %52 = phi i1 [ false, %36 ], [ %50, %49 ]
  br label %53

53:                                               ; preds = %51, %32, %28
  %54 = phi i1 [ true, %32 ], [ true, %28 ], [ %52, %51 ]
  %55 = zext i1 %54 to i32
  %56 = trunc i32 %55 to i8
  ret i8 %56
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @at_endline_loc_p(i8*, i8*, i32) #0 {
  %4 = alloca i8*, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i8, align 1
  %9 = alloca i8*, align 4
  store i8* %0, i8** %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i8*, i8** %4, align 4
  store i8* %10, i8** %7, align 4
  %11 = load i8*, i8** %7, align 4
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 92
  %15 = zext i1 %14 to i32
  %16 = trunc i32 %15 to i8
  store i8 %16, i8* %8, align 1
  %17 = load i8*, i8** %4, align 4
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  %19 = load i8*, i8** %5, align 4
  %20 = icmp ult i8* %18, %19
  br i1 %20, label %21, label %24

21:                                               ; preds = %3
  %22 = load i8*, i8** %4, align 4
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  br label %25

24:                                               ; preds = %3
  br label %25

25:                                               ; preds = %24, %21
  %26 = phi i8* [ %23, %21 ], [ null, %24 ]
  store i8* %26, i8** %9, align 4
  %27 = load i32, i32* %6, align 4
  %28 = and i32 %27, 8192
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %35

30:                                               ; preds = %25
  %31 = load i8*, i8** %7, align 4
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 41
  br i1 %34, label %75, label %47

35:                                               ; preds = %25
  %36 = load i8, i8* %8, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %47

39:                                               ; preds = %35
  %40 = load i8*, i8** %9, align 4
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = load i8*, i8** %9, align 4
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 41
  br i1 %46, label %75, label %47

47:                                               ; preds = %42, %39, %35, %30
  %48 = load i32, i32* %6, align 4
  %49 = and i32 %48, 32768
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %57

51:                                               ; preds = %47
  %52 = load i8*, i8** %7, align 4
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp eq i32 %54, 124
  %56 = zext i1 %55 to i32
  br label %72

57:                                               ; preds = %47
  %58 = load i8, i8* %8, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %69

61:                                               ; preds = %57
  %62 = load i8*, i8** %9, align 4
  %63 = icmp ne i8* %62, null
  br i1 %63, label %64, label %69

64:                                               ; preds = %61
  %65 = load i8*, i8** %9, align 4
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp eq i32 %67, 124
  br label %69

69:                                               ; preds = %64, %61, %57
  %70 = phi i1 [ false, %61 ], [ false, %57 ], [ %68, %64 ]
  %71 = zext i1 %70 to i32
  br label %72

72:                                               ; preds = %69, %51
  %73 = phi i32 [ %56, %51 ], [ %71, %69 ]
  %74 = icmp ne i32 %73, 0
  br label %75

75:                                               ; preds = %72, %42, %30
  %76 = phi i1 [ true, %42 ], [ true, %30 ], [ %74, %72 ]
  %77 = zext i1 %76 to i32
  %78 = trunc i32 %77 to i8
  ret i8 %78
}

; Function Attrs: noinline nounwind optnone
define internal void @store_op1(i32, i8*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8* %1, i8** %5, align 4
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %4, align 4
  %8 = trunc i32 %7 to i8
  %9 = load i8*, i8** %5, align 4
  store i8 %8, i8* %9, align 1
  br label %10

10:                                               ; preds = %3
  %11 = load i32, i32* %6, align 4
  %12 = and i32 %11, 255
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %5, align 4
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  %16 = getelementptr inbounds i8, i8* %15, i32 0
  store i8 %13, i8* %16, align 1
  %17 = load i32, i32* %6, align 4
  %18 = ashr i32 %17, 8
  %19 = trunc i32 %18 to i8
  %20 = load i8*, i8** %5, align 4
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  %22 = getelementptr inbounds i8, i8* %21, i32 1
  store i8 %19, i8* %22, align 1
  br label %23

23:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @insert_op1(i32, i8*, i32, i8*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i8*, align 4
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 4
  store i32 %2, i32* %7, align 4
  store i8* %3, i8** %8, align 4
  %11 = load i8*, i8** %8, align 4
  store i8* %11, i8** %9, align 4
  %12 = load i8*, i8** %8, align 4
  %13 = getelementptr inbounds i8, i8* %12, i32 3
  store i8* %13, i8** %10, align 4
  br label %14

14:                                               ; preds = %18, %4
  %15 = load i8*, i8** %9, align 4
  %16 = load i8*, i8** %6, align 4
  %17 = icmp ne i8* %15, %16
  br i1 %17, label %18, label %24

18:                                               ; preds = %14
  %19 = load i8*, i8** %9, align 4
  %20 = getelementptr inbounds i8, i8* %19, i32 -1
  store i8* %20, i8** %9, align 4
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %10, align 4
  %23 = getelementptr inbounds i8, i8* %22, i32 -1
  store i8* %23, i8** %10, align 4
  store i8 %21, i8* %23, align 1
  br label %14

24:                                               ; preds = %14
  %25 = load i32, i32* %5, align 4
  %26 = load i8*, i8** %6, align 4
  %27 = load i32, i32* %7, align 4
  call void @store_op1(i32 %25, i8* %26, i32 %27)
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal i32 @compile_range(i8**, i8*, i8*, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8**, align 4
  %8 = alloca i8*, align 4
  %9 = alloca i8*, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i8** %0, i8*** %7, align 4
  store i8* %1, i8** %8, align 4
  store i8* %2, i8** %9, align 4
  store i32 %3, i32* %10, align 4
  store i8* %4, i8** %11, align 4
  %16 = load i8**, i8*** %7, align 4
  %17 = load i8*, i8** %16, align 4
  store i8* %17, i8** %13, align 4
  %18 = load i8*, i8** %13, align 4
  %19 = load i8*, i8** %8, align 4
  %20 = icmp eq i8* %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %5
  store i32 11, i32* %6, align 4
  br label %95

22:                                               ; preds = %5
  %23 = load i8*, i8** %13, align 4
  %24 = getelementptr inbounds i8, i8* %23, i32 -2
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  store i32 %26, i32* %14, align 4
  %27 = load i8*, i8** %13, align 4
  %28 = getelementptr inbounds i8, i8* %27, i32 0
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i32
  store i32 %30, i32* %15, align 4
  %31 = load i8**, i8*** %7, align 4
  %32 = load i8*, i8** %31, align 4
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %31, align 4
  %34 = load i32, i32* %14, align 4
  %35 = load i32, i32* %15, align 4
  %36 = icmp sgt i32 %34, %35
  br i1 %36, label %37, label %43

37:                                               ; preds = %22
  %38 = load i32, i32* %10, align 4
  %39 = and i32 %38, 65536
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i64
  %42 = select i1 %40, i32 11, i32 0
  store i32 %42, i32* %6, align 4
  br label %95

43:                                               ; preds = %22
  %44 = load i32, i32* %14, align 4
  store i32 %44, i32* %12, align 4
  br label %45

45:                                               ; preds = %91, %43
  %46 = load i32, i32* %12, align 4
  %47 = load i32, i32* %15, align 4
  %48 = icmp ule i32 %46, %47
  br i1 %48, label %49, label %94

49:                                               ; preds = %45
  %50 = load i8*, i8** %9, align 4
  %51 = icmp ne i8* %50, null
  br i1 %51, label %52, label %60

52:                                               ; preds = %49
  %53 = load i8*, i8** %9, align 4
  %54 = load i32, i32* %12, align 4
  %55 = trunc i32 %54 to i8
  %56 = zext i8 %55 to i32
  %57 = getelementptr inbounds i8, i8* %53, i32 %56
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  br label %62

60:                                               ; preds = %49
  %61 = load i32, i32* %12, align 4
  br label %62

62:                                               ; preds = %60, %52
  %63 = phi i32 [ %59, %52 ], [ %61, %60 ]
  %64 = trunc i32 %63 to i8
  %65 = zext i8 %64 to i32
  %66 = srem i32 %65, 8
  %67 = shl i32 1, %66
  %68 = load i8*, i8** %11, align 4
  %69 = load i8*, i8** %9, align 4
  %70 = icmp ne i8* %69, null
  br i1 %70, label %71, label %79

71:                                               ; preds = %62
  %72 = load i8*, i8** %9, align 4
  %73 = load i32, i32* %12, align 4
  %74 = trunc i32 %73 to i8
  %75 = zext i8 %74 to i32
  %76 = getelementptr inbounds i8, i8* %72, i32 %75
  %77 = load i8, i8* %76, align 1
  %78 = sext i8 %77 to i32
  br label %81

79:                                               ; preds = %62
  %80 = load i32, i32* %12, align 4
  br label %81

81:                                               ; preds = %79, %71
  %82 = phi i32 [ %78, %71 ], [ %80, %79 ]
  %83 = trunc i32 %82 to i8
  %84 = zext i8 %83 to i32
  %85 = sdiv i32 %84, 8
  %86 = getelementptr inbounds i8, i8* %68, i32 %85
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = or i32 %88, %67
  %90 = trunc i32 %89 to i8
  store i8 %90, i8* %86, align 1
  br label %91

91:                                               ; preds = %81
  %92 = load i32, i32* %12, align 4
  %93 = add i32 %92, 1
  store i32 %93, i32* %12, align 4
  br label %45

94:                                               ; preds = %45
  store i32 0, i32* %6, align 4
  br label %95

95:                                               ; preds = %94, %37, %21
  %96 = load i32, i32* %6, align 4
  ret i32 %96
}

; Function Attrs: noinline nounwind optnone
define internal void @insert_op2(i32, i8*, i32, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 4
  %11 = alloca i8*, align 4
  %12 = alloca i8*, align 4
  store i32 %0, i32* %6, align 4
  store i8* %1, i8** %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i8* %4, i8** %10, align 4
  %13 = load i8*, i8** %10, align 4
  store i8* %13, i8** %11, align 4
  %14 = load i8*, i8** %10, align 4
  %15 = getelementptr inbounds i8, i8* %14, i32 5
  store i8* %15, i8** %12, align 4
  br label %16

16:                                               ; preds = %20, %5
  %17 = load i8*, i8** %11, align 4
  %18 = load i8*, i8** %7, align 4
  %19 = icmp ne i8* %17, %18
  br i1 %19, label %20, label %26

20:                                               ; preds = %16
  %21 = load i8*, i8** %11, align 4
  %22 = getelementptr inbounds i8, i8* %21, i32 -1
  store i8* %22, i8** %11, align 4
  %23 = load i8, i8* %22, align 1
  %24 = load i8*, i8** %12, align 4
  %25 = getelementptr inbounds i8, i8* %24, i32 -1
  store i8* %25, i8** %12, align 4
  store i8 %23, i8* %25, align 1
  br label %16

26:                                               ; preds = %16
  %27 = load i32, i32* %6, align 4
  %28 = load i8*, i8** %7, align 4
  %29 = load i32, i32* %8, align 4
  %30 = load i32, i32* %9, align 4
  call void @store_op2(i32 %27, i8* %28, i32 %29, i32 %30)
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal void @store_op2(i32, i8*, i32, i32) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %5, align 4
  store i8* %1, i8** %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %9 = load i32, i32* %5, align 4
  %10 = trunc i32 %9 to i8
  %11 = load i8*, i8** %6, align 4
  store i8 %10, i8* %11, align 1
  br label %12

12:                                               ; preds = %4
  %13 = load i32, i32* %7, align 4
  %14 = and i32 %13, 255
  %15 = trunc i32 %14 to i8
  %16 = load i8*, i8** %6, align 4
  %17 = getelementptr inbounds i8, i8* %16, i32 1
  %18 = getelementptr inbounds i8, i8* %17, i32 0
  store i8 %15, i8* %18, align 1
  %19 = load i32, i32* %7, align 4
  %20 = ashr i32 %19, 8
  %21 = trunc i32 %20 to i8
  %22 = load i8*, i8** %6, align 4
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8 %21, i8* %24, align 1
  br label %25

25:                                               ; preds = %12
  br label %26

26:                                               ; preds = %25
  %27 = load i32, i32* %8, align 4
  %28 = and i32 %27, 255
  %29 = trunc i32 %28 to i8
  %30 = load i8*, i8** %6, align 4
  %31 = getelementptr inbounds i8, i8* %30, i32 3
  %32 = getelementptr inbounds i8, i8* %31, i32 0
  store i8 %29, i8* %32, align 1
  %33 = load i32, i32* %8, align 4
  %34 = ashr i32 %33, 8
  %35 = trunc i32 %34 to i8
  %36 = load i8*, i8** %6, align 4
  %37 = getelementptr inbounds i8, i8* %36, i32 3
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8 %35, i8* %38, align 1
  br label %39

39:                                               ; preds = %26
  ret void
}

; Function Attrs: noinline nounwind optnone
define internal signext i8 @group_in_compile_stack(%struct.compile_stack_elt_t*, i32, i32, i32) #0 {
  %5 = alloca i8, align 1
  %6 = alloca %struct.compile_stack_type, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %6, i32 0, i32 0
  store %struct.compile_stack_elt_t* %0, %struct.compile_stack_elt_t** %9, align 4
  %10 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %6, i32 0, i32 1
  store i32 %1, i32* %10, align 4
  %11 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %6, i32 0, i32 2
  store i32 %2, i32* %11, align 4
  store i32 %3, i32* %7, align 4
  %12 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %6, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = sub i32 %13, 1
  store i32 %14, i32* %8, align 4
  br label %15

15:                                               ; preds = %29, %4
  %16 = load i32, i32* %8, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %32

18:                                               ; preds = %15
  %19 = getelementptr inbounds %struct.compile_stack_type, %struct.compile_stack_type* %6, i32 0, i32 0
  %20 = load %struct.compile_stack_elt_t*, %struct.compile_stack_elt_t** %19, align 4
  %21 = load i32, i32* %8, align 4
  %22 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %20, i32 %21
  %23 = getelementptr inbounds %struct.compile_stack_elt_t, %struct.compile_stack_elt_t* %22, i32 0, i32 4
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %7, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %28

27:                                               ; preds = %18
  store i8 1, i8* %5, align 1
  br label %33

28:                                               ; preds = %18
  br label %29

29:                                               ; preds = %28
  %30 = load i32, i32* %8, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* %8, align 4
  br label %15

32:                                               ; preds = %15
  store i8 0, i8* %5, align 1
  br label %33

33:                                               ; preds = %32, %27
  %34 = load i8, i8* %5, align 1
  ret i8 %34
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readnone }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 9.0.1 "}
