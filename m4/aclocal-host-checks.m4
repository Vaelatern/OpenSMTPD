AC_DEFUN([HOST_CHECKS], [{
case "$host" in
*-*-aix*)
	check_for_aix_broken_getaddrinfo=1
	AC_DEFINE([BROKEN_REALPATH], [1], [Define if you have a broken realpath.])
	AC_DEFINE([SETEUID_BREAKS_SETUID], [1],
	    [Define if your platform breaks doing a seteuid before a setuid])
	AC_DEFINE([BROKEN_SETREUID], [1], [Define if your setreuid() is broken])
	AC_DEFINE([BROKEN_SETREGID], [1], [Define if your setregid() is broken])
	AC_DEFINE([SPT_TYPE], [SPT_REUSEARGV],
		[Define to a Set Process Title type if your system is
		supported by bsd-setproctitle.c])
	;;
*-*-darwin*)
	use_pie=auto
	AC_MSG_CHECKING([if we have working getaddrinfo])
	AC_RUN_IFELSE([AC_LANG_SOURCE([[ #include <mach-o/dyld.h>
main() { if (NSVersionOfRunTimeLibrary("System") >= (60 << 16))
		exit(0);
	else
		exit(1);
}
			]])],
	[AC_MSG_RESULT([working])],
	[AC_MSG_RESULT([buggy])
	AC_DEFINE([BROKEN_GETADDRINFO], [1],
		[getaddrinfo is broken (if present)])
	],
	[AC_MSG_RESULT([assume it is working])])
	AC_DEFINE([SETEUID_BREAKS_SETUID])
	AC_DEFINE([BROKEN_SETREUID])
	AC_DEFINE([BROKEN_SETREGID])
	AC_DEFINE([BROKEN_GLOB], [1], [OS X glob does not do what we expect])
	AC_DEFINE([SPT_TYPE], [SPT_REUSEARGV],
		[Define to a Set Process Title type if your system is
		supported by bsd-setproctitle.c])
	;;
*-*-dragonfly*)
	SMTPDLIBS="$SMTPDLIBS -lcrypt"
	;;
*-*-linux* | *-gnu* | *-k*bsd*-gnu* )
	use_pie=auto
	check_for_libcrypt_later=1
	AC_DEFINE([SPT_TYPE], [SPT_REUSEARGV])
	case `uname -r` in
	1.*|2.0.*)
		AC_DEFINE(BROKEN_CMSG_TYPE, 1,
			[Define if cmsg_type is not passed correctly])
		;;
	esac
	;;
*-*-netbsd*)
	check_for_libcrypt_before=1
	if test "x$withval" != "xno" ; then
		need_dash_r=1
	fi
	AC_DEFINE([BROKEN_STRNVIS], [1],
	    [NetBSD strnvis argument order is swapped compared to OpenBSD])
	;;
*-*-freebsd*)
	check_for_libcrypt_later=1
	AC_DEFINE([BROKEN_GLOB], [1], [FreeBSD glob does not do what we need])
	AC_DEFINE([BROKEN_STRNVIS], [1],
	    [FreeBSD strnvis argument order is swapped compared to OpenBSD])
	;;
*-*-openbsd*)
	use_pie=auto
	AC_DEFINE([HAVE_ATTRIBUTE__SENTINEL__], [1], [OpenBSD's gcc has sentinel])
	AC_DEFINE([HAVE_ATTRIBUTE__BOUNDED__], [1], [OpenBSD's gcc has bounded])
	echo "######################################################"
	echo "# YOU ARE BUILDING PORTABLE BRANCH ON OPENBSD.       #"
	echo "# THERE WILL BE DRAGONS.                             #"
	echo "# YOU WILL BE ON YOUR OWN.                           #"
	echo "# USE -CURRENT OR NATIVE VERSION FROM OUR MAIN SITE. #"
	echo "#                                                    #"
	echo "#     https://www.OpenSMTPD.org                      #"
	echo "#                                                    #"
	echo "######################################################"
	sleep 10
	AC_DEFINE([BROKEN_STRNVIS], [0],
	    [FreeBSD strnvis argument order is swapped compared to OpenBSD])
	YACC='yacc'
	ASR_LIB=
	AC_DEFINE([NOOP_ASR_FREEADDRINFO], [0], [OpenBSD doesn't need ASR_FREEADDRINFO])
	;;
esac
}])

