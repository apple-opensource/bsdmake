#	@(#)Makefile	5.2 (Berkeley) 12/28/90
#	$Id: Makefile,v 1.8 2004/11/19 19:34:23 jkh Exp $
# $FreeBSD: src/usr.bin/make/Makefile,v 1.33 2004/08/12 11:49:55 harti Exp $

PROG=	make
CFLAGS+=-I${.CURDIR} -mdynamic-no-pic
SRCS=	arch.c buf.c compat.c cond.c dir.c for.c hash.c job.c main.c \
	make.c parse.c str.c suff.c targ.c util.c var.c var_modify.c
SRCS+=	lstAppend.c lstAtEnd.c lstAtFront.c lstClose.c lstConcat.c \
	lstDatum.c lstDeQueue.c lstDestroy.c lstDupl.c lstEnQueue.c \
	lstFind.c lstFindFrom.c lstFirst.c lstForEach.c lstForEachFrom.c \
	lstInit.c lstInsert.c lstIsAtEnd.c lstIsEmpty.c lstLast.c \
	lstMember.c lstNext.c lstOpen.c lstRemove.c lstReplace.c lstSucc.c
.PATH:	${.CURDIR}/lst.lib

CFLAGS+=-DMAKE_VERSION=\"5200408120\"
#CFLAGS+=-DUSE_KQUEUE

main.o: Makefile

# Set the shell which make(1) uses.  Bourne is the default, but a decent
# Korn shell works fine, and much faster.  Using the C shell for this
# will almost certainly break everything, but it's Unix tradition to
# allow you to shoot yourself in the foot if you want to :-)

MAKE_SHELL?=	sh
.if ${MAKE_SHELL} == "csh"
CFLAGS+=	-DDEFSHELL=0
.elif ${MAKE_SHELL} == "sh"
CFLAGS+=	-DDEFSHELL=1
.elif ${MAKE_SHELL} == "ksh"
CFLAGS+=	-DDEFSHELL=2
.else
.error "MAKE_SHELL must be set to one of \"csh\", \"sh\" or \"ksh\"."
.endif

.include <bsd.prog.mk>
