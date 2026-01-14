#
#

DESTDIR =
VPATH = /tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/libgloss/zk /tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/libgloss/zk/..
srcdir = /tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/libgloss/zk
objdir = .
srcroot = $(srcdir)/../..
objroot = $(objdir)/../..

prefix = /usr/local
exec_prefix = ${prefix}

host_alias = zk
target_alias = zk

bindir = ${exec_prefix}/bin
libdir = ${exec_prefix}/lib
tooldir = $(exec_prefix)/$(target_alias)

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = /usr/bin/install -c
INSTALL_DATA = /usr/bin/install -c -m 644

# Multilib support variables.
# TOP is used instead of MULTI{BUILD,SRC}TOP.
MULTIDIRS =
MULTISUBDIR =

SHELL =	/bin/sh

CC = clang-10 -m32 -D_FORTIFY_SOURCE=0 -D__GLIBC_USE\(...\)=0 -B/tight-zkvm/toolchain/zknewlib/zk/newlib/ -isystem /tight-zkvm/toolchain/zknewlib/zk/newlib/targ-include -isystem /tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/newlib/libc/include -B/tight-zkvm/toolchain/zknewlib/zk/libgloss/zk -L/tight-zkvm/toolchain/zknewlib/zk/libgloss/libnosys -L/tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/libgloss/zk   

AS = llvm-as-10
AR = llvm-ar-10
LD = zk-ld
RANLIB = llvm-ranlib-10

OBJDUMP = `if [ -f ${objroot}/../binutils/objdump ] ; \
	then echo ${objroot}/../binutils/objdump ; \
	else t='$(program_transform_name)'; echo objdump | sed -e $$t ; fi`
OBJCOPY = `if [ -f ${objroot}/../binutils/objcopy ] ; \
	then echo ${objroot}/../binutils/objcopy ; \
	else t='$(program_transform_name)'; echo objcopy | sed -e $$t ; fi`

OBJS		= putnum.o unlink.o
CFLAGS		= -g
SCRIPTS		= 

# Here is all of the simulator stuff
SIM_SCRIPTS	=
SIM_LDFLAGS	=
SIM_BSP		= libsim.a
SIM_CRT0	= crt0.o
SIM_OBJS	= syscalls.o
SIM_TEST	= sim-test
SIM_INSTALL	= install-sim

# Here is all of the mon960 stuff
MON_LDFLAGS	=
MON_BSP		= libmon960.a
MON_CRT0	= crt0.o
MON_OBJS	= 
MON_SCRIPTS	= mon960.ld
MON_TEST	=
MON_INSTALL	= install-mon

# Host specific makefile fragment comes in here.
NEWLIB_CFLAGS = `if [ -d ${objroot}/newlib ]; then echo -I${objroot}/newlib/targ-include -I${srcroot}/newlib/libc/include; fi`
NEWLIB_LDFLAGS = `if [ -d ${objroot}/newlib ]; then echo -B${objroot}/newlib/ -L${objroot}/newlib/; fi`

INCLUDES = -I. -I$(srcdir)/..
# Note that when building the library, ${MULTILIB} is not the way multilib
# options are passed; they're passed in $(CFLAGS).
CFLAGS_FOR_TARGET = -O2 -g ${MULTILIB} ${INCLUDES} ${NEWLIB_CFLAGS}
LDFLAGS_FOR_TARGET = ${MULTILIB} ${NEWLIB_LDFLAGS}
AR_FLAGS = rc

.c.o:
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(INCLUDES) -c $(CFLAGS) $<

.C.o:
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(INCLUDES) -c $(CFLAGS) $<
.s.o:
	$(AS) $(ASFLAGS_FOR_TARGET) $(INCLUDES) $(ASFLAGS) -o $*.o $<

#
# GCC knows to run the preprocessor on .S files before it assembles them.
#
.S.o:
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) $(CFLAGS) -c $<

#
# this is a bogus target that'll produce an assembler from the
# C source with the right compiler options. this is so we can
# track down code generation or debug symbol bugs.
#
.c.s:
	$(CC) $(CFLAGS_FOR_TARGET) -S $(INCLUDES) $(CFLAGS) $<

#
# build a test program for each target board. Just trying to get
# it to link is a good test, so we ignore all the errors for now.
#
# all: ${MON_CRT0} ${MON_BSP}
all: ${SIM_CRT0} ${SIM_BSP}

#
# here's where we build the board support packages for each target
#
${SIM_BSP}: ${OBJS} ${SIM_OBJS}
	${AR} ${ARFLAGS} ${SIM_BSP} ${SIM_OBJS} ${OBJS}
	${RANLIB} ${SIM_BSP}

${MON_BSP}: ${OBJS} ${MON_OBJS}
	${AR} ${ARFLAGS} ${MON_BSP} ${MON_OBJS} ${OBJS}
	${RANLIB} ${MON_BSP}

#
# here's where we build the test programs for each target
#
.PHONY: test
test:	${SIM_TEST} ${MVME_TEST} ${EVM_TEST} 

sim-test:	sim-test.x sim-test.dis

sim-test.x:	test.o ${SIM_CRT0} ${SIM_BSP}
	${CC} ${LDFLAGS_FOR_TARGET} -L${objdir} \
	${SIM_CRT0} test.o \
	-o sim-test.x ${LIBS_FOR_TARGET} -lc ${SIM_BSP}

sim-test.dis:	sim-test.x
	${OBJDUMP} -d sim-test.x > sim-test.dis


#
#
#
.c.S:
	${CC} ${CFLAGS_FOR_TARGET} -c $<

simulator.o: simulator.S
sim-crt0.o: sim-crt0.S
mvme-crt0.o: mvme-crt0.S
mvme-exit.o: mvme-exit.S
mvme-inbyte.o: mvme-inbyte.S
mvme-outbyte.o: mvme-outbyte.S

clean mostlyclean:
	rm -f a.out core *.i *.o *-test *.srec *.dis *.x $(SIM_BSP) $(MON_BSP)

distclean maintainer-clean realclean: clean
	rm -f Makefile config.status *~

.PHONY: install info install-info clean-info
install: ${SIM_INSTALL}

install-mon:
	set -e; for x in ${MON_CRT0} ${MON_BSP}; do ${INSTALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
	set -e; for x in ${MON_SCRIPTS}; do ${INSTALL_DATA} ${srcdir}/$$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done

install-sim:
	set -e; for x in ${SIM_CRT0} ${SIM_BSP} ${SIM_SCRIPTS}; do ${INSTALL_DATA} $$x $(DESTDIR)${tooldir}/lib/$$x; done

doc:
info:
install-info:
clean-info:

Makefile: Makefile.in config.status /tight-zkvm/toolchain/zk-llvm-backend/newlib-3.3.0/libgloss/zk/../config/default.mh
	$(SHELL) config.status

config.status: configure
	$(SHELL) config.status --recheck
