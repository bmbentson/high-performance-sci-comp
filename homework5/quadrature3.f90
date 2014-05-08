
module quadrature3

REAL, PARAMETER:: PI = 3.1415927 

contains

real(kind=8) function trapezoid(f,a,b,n)
    !trapezoid function to return estimate of the integral of a function using trapezoid-method
    implicit none
    real(kind=8), intent(in) :: a
    real(kind=8), intent(in) :: b
    integer, intent(in) :: n
 
    real(kind=8) ::  xj(0:n-1),fj(0:n-1)
    real(kind=8) :: h
    integer :: j

    real(kind=8), external :: f

    h= (b-a)/(n-1)
    trapezoid =0d0

    do j=0,(n-1)
    	xj(j) = a + j*h
	fj(j) = f(xj(j))
    	trapezoid = trapezoid + h* fj(j)
	enddo

    trapezoid = trapezoid - .5*h*(fj(0) +fj(n-1))    

end function trapezoid

subroutine error_table(f,a,b,nvals,int_true)
    use omp_lib
    real(kind=8), external :: f

    real(kind=8), intent(in) :: a
    real(kind=8), intent(in) :: b
    real(kind=8), intent(in) :: int_true

    integer, dimension(:), intent(in) :: nvals
    integer  :: i
    real(kind=8) :: int_trap,error,ratio,last_error


    print *, "    n         trapezoid            error       ratio"
    last_error = 0d0
    !$omp parallel do firstprivate(last_error) private(n,error, int_trap,ratio) &
    !$omp          schedule(dynamic)
    do i=size(nvals),1,-1
	n= nvals(i)
	int_trap = trapezoid(f,a,b,n)
	error = abs(int_trap - int_true)
	ratio = last_error /error
	last_error = error
    print 11, n, int_trap, error, ratio
11     format(i8, es22.14, es13.3, es13.3)
    enddo
end subroutine error_table
end module quadrature3


