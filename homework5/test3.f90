
program test3

    use quadrature3, only: trapezoid, error_table

    implicit none
    real(kind=8) :: a,b,k,int_true
    integer :: nvals(12), i

    a = 0.d0
    b = 2.d0
    k=1000
    int_true = (b-a) + (b**4 - a**4) / 4. - (1./k) * (cos(k*b) - cos(k*a))

    print 10, int_true
 10 format("true integral: ", es22.14)
    print *, " "  ! blank line

    ! values of n to test:
    do i=1,12
        nvals(i) = 5 * 2**(i-1)
        enddo

    call error_table(f2, a, b, nvals, int_true)

contains

    real(kind=8) function f2(x)
        implicit none
        real(kind=8), intent(in) :: x 
        real(kind=8) :: k
	k=1000
        f2 = 1.d0 + x**3 + sin(k*x)
    end function f2

end program test3
