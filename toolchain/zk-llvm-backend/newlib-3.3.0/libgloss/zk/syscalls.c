/* FR30 system call emulation code
   Copyright (C) 1998, 2010 Free Software Foundation, Inc.
   Contributed by Cygnus Solutions.  */

#include <sys/stat.h>
#include <errno.h>
#include "../syscall.h"
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <sys/times.h>
#include <stdio.h>

#undef errno
extern int errno;

int gloA = 1;

int
_read (file, ptr, len)
     int    file;
     char * ptr;
     int    len;
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tCOPYR\t%%TMP1, %1\n\
\tCOPYR\t%%OFF, %2\n\
\tVMCALL\t1\n\
              "
		 :
		 :"r"(file), "r"(ptr), "r"(len));

	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));
	for (int i = 0; i < res; i++)
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(ptr[i]));
	return res;		
}

int
_lseek (file, ptr, dir)
     int file;
     int ptr;
     int dir;
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tCOPYR\t%%TMP1, %1\n\
\tCOPYR\t%%OFF, %2\n\
\tVMCALL\t16\n\
              "
		 :
		 :"r"(file), "r"(ptr), "r"(dir));

	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));	
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}	
	return res;
}

__attribute__((noinline))
__attribute__((optnone))
static void
outbyte(char c)
{
	__asm__ __volatile__
		("OUTPUT\t%0"
		 :
		 :"r"(c));
}


__attribute__((optnone))
int
_write (int file, char * ptr, int len)
{
	/* __asm__ __volatile__ */
	/* 	("COPYI\t%RT1, 9999\n\ */
    /*       \tOUTPUT\t%RT1"); */
	/* __asm__ __volatile__ */
	/* 	("OUTPUT\t%0" */
	/* 	 : */
	/* 	 :"r"(file)); */
	for (int i = 0; i < len; i++)
	{
		__asm__ __volatile__
			("OUTPUT\t%0"
			 :
			 :"r"(ptr[i]));
	}
	/* for (int i = 0; i < len; i++) */
	/* { */
	/* 	outbyte(ptr[i]); */
	/* } */
	/* for (int i = 0; i < len; i++) */
	/* 	__asm__ __volatile__ */
	/* 		("OUTPUT\t%0" */
	/* 		 : */
	/* 		 :"r"(ptr[i])); */
	/* __asm__ __volatile__ */
	/* 	("COPYI\t%%RT0, 11\n\ */
    /*       \tOUTPUT\t%%RT0\n\ */
    /*       \tCOPYR\t%%RT0, %0\n\ */
    /*       \tOUTPUT\t%%RT0" */
	/* 	 : */
	/* 	 :"r"(len)); */
	return len;
}

int
_open (const char *name,
	   int flags,
	   int mode)
{

	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tCOPYR\t%%TMP1, %1\n\
\tCOPYR\t%%OFF, %2\n\
\tVMCALL\t0\n\
              "
		 :
		 :"r"(name), "r"(flags), "r"(mode));
	int ret;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(ret));
	if (ret == -1)
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
	return ret;
}

int
_isatty (fd)
     int fd;
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tVMCALL\t15\n\
              "
		 :
		 :"r"(fd));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));	
	if (res == 0)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return 0;
	}	
	return 1;
}

int
_close (file)
     int file;
{
	if (_isatty(file) == 1) // stdin, stdout, stderr
	{
		return 0;
	}
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tVMCALL\t14\n\
              "
		 :
		 :"r"(file));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));	
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}	
	return 0;
}

void
_exit (n)
     int n;
{
  	__asm__ __volatile__
	("COPYR\t%%RT0, %0\n\
      \tOUTPUT\t%0\n\
      \tHALT\t"
	 :
	 :"r"(n));
}


void *
_sbrk (incr)
     int incr;
{
	void * ret;
	__asm__ __volatile__
		("COPYR\t%%RT1, %%HP\n\
          \tADD\t%%HP, %%HP, %0"
		 :
		 :"r"(incr));
	/* __asm__ __volatile__ */
	/* 	("OUTPUT\t%0" */
	/* 	 : */
	/* 	 :"r"(12345678)); */
	/* __asm__ __volatile__ */
	/* 	("OUTPUT\t%0" */
	/* 	 : */
	/* 	 :"r"(incr)); */
	/* __asm__ __volatile__ */
	/* 	("OUTPUT\t%HP"); */
	__asm__ __volatile__
		("COPYR\t%0, %%RT1"
		 :"=r"(ret));
	return ret;
/*   extern char   end asm ("_end");	/\* Defined by the linker *\/ */
/*   extern int    __stack;                /\* Defined by linker script.  *\/ */
/*   static char * heap_end; */
/*   char *        prev_heap_end; */

/*   if (heap_end == NULL) */
/*     heap_end = & end; */
  
/*   prev_heap_end = heap_end; */
/* #if 0   */
/*   if (heap_end + incr > __stack) */
/*     { */
/*       _write ( 1, "_sbrk: Heap and stack collision\n", 32); */
/*       abort (); */
/*     } */
/* #endif */
/*   heap_end += incr; */

/*   return (caddr_t) prev_heap_end; */
}

int
_fstat (file, st)
     int file;
     struct stat * st;
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tVMCALL\t11\n\
              "
		 :
		 :"r"(file));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_ctime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_mtime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_atime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_blocks));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_blksize));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_size));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_rdev));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_gid));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_uid));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_nlink));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_mode));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_ino));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_dev));
	return 0;
}

int
_stat (char *file,
	   struct stat *st)
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tVMCALL\t10\n\
              "
		 :
		 :"r"(file));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_ctime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_mtime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_atime));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_blocks));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_blksize));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_size));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_rdev));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_gid));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_uid));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_nlink));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_mode));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_ino));
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(st->st_dev));
	return 0;
}
/* _stat () */

int chmod(const char *pathname, mode_t mode)
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tCOPYR\t%%TMP1, %1\n\
\tVMCALL\t13\n\
              "
		 :
		 :"r"(pathname), "r"(mode));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}
	return 0;
}

int
_unlink (char *name)
{
	__asm__ __volatile__
		("COPYR\t%%TMP0, %0\n\
\tVMCALL\t12\n\
              "
		 :
		 :"r"(name));
	int res;
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(res));
	if (res == -1)
	{
		__asm__ __volatile__
			("INPUT\t%0"
			 :"=r"(errno));
		return -1;
	}
	return 0;
}

int
_times (struct tms *buf)
{
	errno = EACCES;
	return -1;
	/* __asm__ __volatile__ */
	/* 	("COPYI\t%RT0, 99\n\ */
    /*       \tOUTPUT\t%RT0\n\ */
    /*       \tHALT\t"); */
	/* return 0; */
}

int
_kill (pid, sig)
     int pid;
     int sig;
{
	errno = EINVAL;
	return -1;
	/* __asm__ __volatile__ */
	/* 	("COPYI\t%RT0, 111\n\ */
    /*       \tOUTPUT\t%RT0\n\ */
    /*       \tHALT\t"); */
	/* return 0; */
}

int
_getpid (void)
{
	return 1;
}

int
_gettimeofday (struct timeval *tp, void *tzvp)
{
	struct timezone *tzp = tzvp;
	if (tp)
    {
		/* Ask the host for the seconds since the Unix epoch.  */
		__asm__ __volatile__
			("VMCALL\t9");
	__asm__ __volatile__
		("INPUT\t%0"
		 :"=r"(tp->tv_sec));		
		tp->tv_usec = 0;
    }

	/* Return fixed data for the timezone.  */
	if (tzp)
    {
		tzp->tz_minuteswest = 0;
		tzp->tz_dsttime = 0;
    }

	return 0;
}
