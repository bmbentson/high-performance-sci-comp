
module functions

REAL, PARAMETER:: PI = 3.1415927 
REAL ::  gevals=0

contains

real(kind=8) function f(x)
    !trapezoid function to return estimate of the integral of a function using trapezoid-method
    implicit none
    real(kind=8) :: a
    real(kind=8) :: b
    real(kind=8), intent(in) :: x
    integer :: n
 
    real(kind=8) ::  yj(0:1000-1), gj(0:1000-1)
    real(kind=8) :: h
    integer :: j



    n=1000
    a=1d0
    b=4d0
    
    h= (b-a)/(n-1)
    f =0d0

    do j=0,(n-1)
    	yj(j) = a + j*h
	gj(j) = g(x,yj(j))
    	f = f + h* gj(j)
	enddo

    f = f - .5*h*(gj(0) +gj(n-1))    

end function f

real(kind=8) function g(x,y)
    !g function to be called by f
    implicit none
    real(kind=8), intent(in) :: x
    real(kind=8), intent(in) :: y

    g = sin(x+y)
    gevals = gevals+1

end function g


end module functions


