
program test2

    use functions, only: f, gevals
    use quadrature, only: trapezoid, error_table

    implicit none
    real(kind=8) :: a,b,k,int_true
    integer :: nvals(12), i
   
    a = 0.d0
    b = 2.d0
    k=1000
    int_true = -1*(sin(b+4) -sin(b+1)) + (sin(a+4) -sin(a+1))

    print 10, int_true
 10 format("true integral: ", es22.14)
    print *, " "  ! blank line

    ! values of n to test:
    do i=1,12
        nvals(i) = 5 * 2**(i-1)
        enddo

    call error_table(f, a, b, nvals, int_true)


end program test2
