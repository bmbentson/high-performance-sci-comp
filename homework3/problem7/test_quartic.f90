! $UWHPSC/codes/fortran/newton/test_quadratic.f90

program test_quartic

    use newton, only: solve, tol
    use functions, only: f_quartic, fprime_quartic, epsilon

    implicit none
    real(kind=8) :: x, x0, fx, xstar
    real(kind=8) :: tolvals(3)
    real(kind=8) :: epsilonvals(3)
    integer :: iters, itest, jtest
	logical :: debug         ! set to .true. or .false.

    debug = .false.
    x0=4.d0
    print 12, x0
12  format(' Starting with initial guess ',e22.15)
    print *, '  ' !blank line
    print *, '    epsilon        tol    iters          x                 f(x)        x-xstar' 
  
    tolvals = (/1.0d-5, 1.0d-10, 1.0d-15/) 
    epsilonvals = (/1.0d-4, 1.0d-8, 1.0d-12/)
    do itest=1,3
      epsilon = epsilonvals(itest)
    do jtest=1,3
        tol = tolvals(jtest)
        call solve(f_quartic, fprime_quartic, x0, x, iters, debug)
        fx = f_quartic(x)
        xstar = 1.d0+epsilon**(.25)
        print 11, epsilon, tol, iters, x, fx, x-xstar
11      format(2es13.3, i4, es24.15, 2es13.3)
        enddo
        print *, '  ' !blank line
	enddo

end program test_quartic
