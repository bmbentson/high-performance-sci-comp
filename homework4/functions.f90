! $UWHPSC/codes/fortran/newton/functions.f90

module functions

REAL, PARAMETER:: PI = 3.1415927 

contains

real(kind=8) function f_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x

    f_sqrt = x**2 - 4.d0

end function f_sqrt


real(kind=8) function fprime_sqrt(x)
    implicit none
    real(kind=8), intent(in) :: x
    
    fprime_sqrt = 2.d0 * x

end function fprime_sqrt



real(kind=8) function f_int(x)
    implicit none

    real(kind=8), intent(in) :: x

    f_int = x*cos(PI*x) -1 + .6*x**2

end function f_int

real(kind=8) function fprime_int(x)
    implicit none
    real(kind=8), intent(in) :: x
    
    fprime_int = cos(PI*x) -x*PI*sin(PI*x) + 1.2*x

end function fprime_int



end module functions
