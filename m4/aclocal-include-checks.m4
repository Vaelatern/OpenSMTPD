AC_DEFUN([INCLUDE_CHECKS], [{

	AC_CHECK_HEADERS([ \
		bsd/libutil.h \
		crypt.h \
		dirent.h \
		fcntl.h \
		getopt.h \
		libgen.h \
		libutil.h \
		limits.h \
		maillock.h \
		mach/mach_time.h \
		ndir.h \
		netdb.h \
		pam/pam_appl.h \
		paths.h \
		security/pam_appl.h \
		shadow.h \
		sys/cdefs.h \
		sys/dir.h \
		sys/file.h \
		sys/mount.h \
		sys/ndir.h \
		sys/pstat.h \
		sys/statfs.h \
		sys/time.h \
		sys/un.h \
		time.h \
		ucred.h \
		util.h \
		utime.h \
		vis.h
	])

	AC_CHECK_HEADERS([login_cap.h], [], [], [
	#include <sys/types.h>
	])
	AC_CHECK_HEADERS([sys/mount.h], [], [], [
	#include <sys/param.h>
	])
}])
