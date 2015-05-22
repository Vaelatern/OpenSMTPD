AC_DEFUN([DEFINE_CHECKS], [{
	AC_CHECK_DECL([LLONG_MAX], [have_llong_max=1], , [#include <limits.h>])
}])
