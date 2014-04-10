import matplotlib.pyplot as plt
import numpy as np 


def quad_interp(xi,yi):
	A = np.vstack([np.ones(3), xi, xi**2]).T
	c= np.linalg.solve(A,yi)
	return c

def test_quad1():
	""" This tests quad_interp with a set of points"""
	xi = np.array([-1.,  0.,  2.])
	yi = np.array([ 1., -1.,  7.])
	c = quad_interp(xi,yi)
	x = np.linspace(-10,10,1000)
	y = c[0] + c[1]*x + c[2]*(x**2)
	plt.plot(x,y)
	print "ok!"


if __name__=="__main__":
	print "Running test..."
	test_quad1()




