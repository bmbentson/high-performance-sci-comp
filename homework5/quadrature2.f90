
module quadrature2

REAL, PARAMETER:: PI = 3.1415927 

contains

real(kind=8) function trapezoid(f,a,b,n)
    !trapezoid function to return estimate of the integral of a function using trapezoid-method
    use omp_lib
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
   

  !$omp parallel do reduction(+ : trapezoid) 
    do j=0,(n-1)
    	xj(j) = a + j*h
	fj(j) = f(xj(j))
    	trapezoid = trapezoid + h* fj(j)
	enddo
     
  
    trapezoid = trapezoid - .5*h*(fj(0) +fj(n-1))    

end function trapezoid

real(kind=8) function simpson(f,a,b,n)
    !trapezoid function to return estimate of the integral of a function using trapezoid-method
    use omp_lib
    implicit none
    real(kind=8), intent(in) :: a
    real(kind=8), intent(in) :: b
    integer, intent(in) :: n
 
    real(kind=8) ::  xj(0:n),fj(0:n)
    real(kind=8) :: h
    integer :: j

    real(kind=8), external :: f

    h= (b-a)/(n)
    simpson =0d0
   

  !$omp parallel do private(xj,fj) reduction(+ : simpson) 
    do j=1,(n/2)
    	xj(2*j) = a + (2*j*h)
	xj(2*j-1) = a + ((2*j-1)*h)
	xj(2*j-2) = a + ((2*j-2)*h)
	
	fj(2*j) = f(xj(2*j))
	fj(2*j-1)= f(xj(2*j-1))
	fj(2*j-2)= f(xj(2*j-2))
    	simpson = simpson + h/3 * (fj(2*j) + (4d0 * fj(2*j-1)) + fj(2*j-2))
	enddo
       

end function simpson

subroutine error_table(f,a,b,nvals,int_true)
    real(kind=8), external :: f

    real(kind=8), intent(in) :: a
    real(kind=8), intent(in) :: b
    real(kind=8), intent(in) :: int_true

    integer, dimension(:), intent(in) :: nvals
    integer  :: i
    real(kind=8) :: int_trap,error,ratio,last_error


    print *, "    n         trapezoid            error       ratio"
    last_error = 0d0
    do i=1,size(nvals)
	n= nvals(i)
	int_trap = simpson(f,a,b,n)
	error = abs(int_trap - int_true)
	ratio = last_error /error
	last_error = error
    print 11, n, int_trap, error, ratio
11     format(i8, es22.14, es13.3, es13.3)
    enddo
end subroutine error_table
end module quadrature2


