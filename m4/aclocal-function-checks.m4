AC_DEFUN([FUNCTION_CHECKS], [{
AC_CHECK_FUNCS([ \
	arc4random \
	arc4random_buf \
	arc4random_stir \
	arc4random_uniform \
	asprintf \
	b64_ntop \
	__b64_ntop \
	b64_pton \
	__b64_pton \
	bcopy \
	chflags \
	closefrom \
	dirfd \
	dirname \
	endgrent \
	explicit_bzero \
	fgetln \
	freeaddrinfo \
	getaddrinfo \
	getnameinfo \
	getopt \
	getpeereid \
	getspnam \
	inet_aton \
	inet_ntoa \
	inet_ntop \
	isblank \
	memmove \
	nsleep \
	pidfile \
	pw_dup \
	reallocarray \
	setenv \
	setlinebuf \
	setproctitle \
	setregid \
	setreuid \
	setsid \
	sigaction \
	socketpair \
	strdup \
	strerror \
	strlcat \
	strlcpy \
	strnvis \
	strmode \
	strtonum \
	sysconf \
	tcgetpgrp \
	truncate \
	vasprintf \
	vsnprintf \
	waitpid
])

	AC_SEARCH_LIBS([clock_gettime], [rt],
		[AC_DEFINE([HAVE_CLOCK_GETTIME], [1], [Have clock_gettime])])

}])

