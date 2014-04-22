import matplotlib.pyplot as plt
import numpy as np
import test_code 


def solve(fvals,x0,debug=False):
	""" Iterative newtons method x_k+1 =x_k -f(x_k)/f'(x_k)
		return (approx,iteration)"""	

	i=0
	tol = 10**-6
	f= np.empty((100),dtype=float)
	x= np.empty((100),dtype=float)
	x[0]=x0
	f,fp = fvals(x[0])
	if(debug==True):
		print "Initial guess: x = %22.15e " % x[0]
	
	while(abs(f) > tol):
		(f,fp)= fvals(x[i])
		x[i+1] = x[i] - (f/fp)
		i+=1
		if(debug==True):
			print "After %i iterations, x = %22.15e" % (i,x[i])
	return (x[i],i)



def fvals_sqrt(x):
    """
    Return f(x) and f'(x) for applying Newton to find a square root.
    """
    f = x**2 - 4.
    fp = 2.*x
    return f, fp

def test1(debug_solve=False):
    """
    Test Newton iteration for the square root with different initial
    conditions.
    """
    from numpy import sqrt
    for x0 in [1., 2., 100.]:
        print " "  # blank line
        x,iters = solve(fvals_sqrt, x0, debug=debug_solve)
        print "solve returns x = %22.15e after %i iterations " % (x,iters)
        fx,fpx = fvals_sqrt(x)
        print "the value of f(x) is %22.15e" % fx
        assert abs(x-2.) < 1e-14, "*** Unexpected result: x = %22.15e"  % x

if __name__=="__main__":
	print "Running test..."
	test_code.test1()




