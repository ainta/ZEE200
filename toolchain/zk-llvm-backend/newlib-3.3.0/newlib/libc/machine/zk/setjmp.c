#include <setjmp.h>


/* __attribute__((used)) */
/* __attribute__((noinline)) */
/* __attribute__((optnone)) */
/* void */
/* setjmp_assembly() */
/* { */
/* 	__asm__ __volatile__ */
/* 	(".globl\tsetjmp\n\ */
/*       \t.type\tsetjmp,@function\n\ */
/* setjmp NOP\n\ */
/*       \tSTORE\t%GR0, 0(%GR1)\n\ */
/*       \tSTORE\t%GR1, 4(%GR1)\n\ */
/*       \tSTORE\t%GR2, 8(%GR1)\n\ */
/*       \tSTORE\t%GR3, 12(%GR1)\n\ */
/*       \tSTORE\t%GR4, 16(%GR1)\n\ */
/*       \tSTORE\t%GR5, 20(%GR1)\n\ */
/*       \tSTORE\t%GR6, 24(%GR1)\n\ */
/*       \tSTORE\t%GR7, 28(%GR1)\n\ */
/*       \tLOAD\t%RT0, 0(%GR7)\n\ */
/*       \tSTORE\t%RT0, 32(%GR1)\n\ */
/*       \tCOPYI\t%RT0, 0\n\ */
/*       \tRET"); */
/* } */


/* __attribute__((used)) */
/* __attribute__((noinline)) */
/* __attribute__((optnone)) */
/* void */
/* longjmp_assembly() */
/* { */
/* 	__asm__ __volatile__ */
/* 	(".globl\tlongjmp\n\ */
/*       \t.type\tlongjmp,@function\n\ */
/* longjmp NOP\n\ */
/*       \tCOPYR\t%RT0, %GR2\n\ */
/*       \tLOAD\t%GR0, 0(%GR1)\n\ */
/*       \tLOAD\t%GR2, 8(%GR1)\n\ */
/*       \tLOAD\t%GR3, 12(%GR1)\n\ */
/*       \tLOAD\t%GR4, 16(%GR1)\n\ */
/*       \tLOAD\t%GR5, 20(%GR1)\n\ */
/*       \tLOAD\t%GR6, 24(%GR1)\n\ */
/*       \tLOAD\t%GR7, 28(%GR1)\n\ */
/*       \tLOAD\t%RT1, 32(%GR1)\n\ */
/*       \tLOAD\t%GR1, 4(%GR1)\n\ */
/*       \tSTORE\t%RT1, 0(%GR7)\n\ */
/*       \tRET"); */
/* } */


__attribute__((noinline))
__attribute__((optnone))
int
setjmp(jmp_buf buf)
{
	int ret;
	__asm__ __volatile__
	("STORE\t%%GR0, 0(%%GR1)\n\
      \tSTORE\t%%GR1, 4(%%GR1)\n\
      \tSTORE\t%%GR2, 8(%%GR1)\n\
      \tSTORE\t%%GR3, 12(%%GR1)\n\
      \tSTORE\t%%GR4, 16(%%GR1)\n\
      \tSTORE\t%%GR5, 20(%%GR1)\n\
      \tSTORE\t%%GR6, 24(%%GR1)\n\
      \tSTORE\t%%GR7, 28(%%GR1)\n\
      \tLOAD\t%%RT0, 8(%%GR7)\n\
      \tSTORE\t%%RT0, 32(%%GR1)\n\
      \tCOPYI\t%0, 0"
	 :"=r"(ret));
	return ret;
}


__attribute__((noinline))
__attribute__((optnone))
void
longjmp(jmp_buf buf, int val)
{
	__asm__ __volatile__
	("COPYR\t%RT0, %GR2\n\
      \tLOAD\t%GR0, 0(%GR1)\n\
      \tLOAD\t%GR2, 8(%GR1)\n\
      \tLOAD\t%GR3, 12(%GR1)\n\
      \tLOAD\t%GR4, 16(%GR1)\n\
      \tLOAD\t%GR5, 20(%GR1)\n\
      \tLOAD\t%GR6, 24(%GR1)\n\
      \tLOAD\t%GR7, 28(%GR1)\n\
      \tLOAD\t%RT1, 32(%GR1)\n\
      \tLOAD\t%GR1, 4(%GR1)\n\
      \tADDI\t%GR7, %GR7, 8\n\
      \tSTORE\t%RT1, 0(%GR7)\n\
      \tRET");
}
