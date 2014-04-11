import matplotlib.pyplot as plt
import numpy as np 


def quad_interp(xi,yi):
	""" does a little quadractic interpolation returning the coefficient array c"""	
	error_message = "xi, yi need to be type numpy.ndarray"
	assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message
	error_message = "You need 3 points!"
	assert (len(xi)==3) and (len(yi)==3), error_message
	error_message = "The xi points have to be unique!"
	assert (xi[0] != xi[1]) and (xi[0] != xi[2]) and (xi[1] != xi[2]), error_message

	A = np.vstack([np.ones(3), xi, xi**2]).T
	c= np.linalg.solve(A,yi)
	return c

def cubic_interp(xi,yi):
	""" does a little cubic interpolation returning the coefficient array c"""	
	error_message = "xi, yi need to be type numpy.ndarray"
	assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message
	error_message = "You need 4 points!"
	assert (len(xi)==4) and (len(yi)==4), error_message
	error_message = "The xi points have to be unique!"
	assert (len(xi) == len(np.unique(xi))), error_message

	A = np.vstack([np.ones(4), xi, xi**2,xi**3]).T
	c= np.linalg.solve(A,yi)
	return c

def poly_interp(xi,yi):
	""" does a little cubic interpolation returning the coefficient array c"""	
	error_message = "xi, yi need to be type numpy.ndarray"
	assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message
	n = len(xi)
	error_message = "You need the same number points"
	assert (len(xi)==n) and (len(yi)==n), error_message
	error_message = "The xi points have to be unique!"
	assert (len(xi) == len(np.unique(xi))), error_message

	xstack = [ xi**i for i in xrange(0,n)]
	A = np.vstack(xstack).T
	c= np.linalg.solve(A,yi)
	return c

def test_quad1():
	""" This tests quad_interp with a specific set of points"""
	xi = np.array([-1.,  0.,  2.])
	yi = np.array([ 1., -1.,  7.])
	c = quad_interp(xi,yi)
	x = np.linspace(-10,10,1000)
	y = c[0] + c[1]*x + c[2]*(x**2)
	plt.plot(x,y)
	print "ok!"

def test_quad2():
	""" This tests quad_interp with a random set of points"""
	xi = -10 +np.random.sample(3)*20
	yi = -10 +np.random.sample(3)*20
	plot_quad(xi,yi)
	print "ok!"

def test_cubic():
	""" This tests cubic_interp with a random set of points"""
	xi = -10 +np.random.sample(4)*20
	yi = -10 +np.random.sample(4)*20
	plot_cubic(xi,yi)
	print "ok!"
def test_poly():
	number_of_points = np.random.randint(4,10)
	""" This tests poly_interp with a random set of points"""
	xi = -10 +np.random.sample(number_of_points)*20
	yi = -10 +np.random.sample(number_of_points)*20
	plot_poly(xi,yi)
	print "ok!"

def plot_quad(xi,yi):
	"""plot the stuff"""
	plt.figure(1)
	plt.clf()  
	c = quad_interp(xi,yi)
	x = np.linspace(xi.min() - 1,  xi.max() + 1, 1000)
	y = c[0] + c[1]*x + c[2]*(x**2)
	plt.plot(x,y)
	plt.plot(xi,yi,'ro')
	plt.savefig('quadractic.png')

def plot_cubic(xi,yi):
	"""plot the stuff"""
	plt.figure(1)
	plt.clf()  
	c = cubic_interp(xi,yi)
	x = np.linspace(xi.min() - 1,  xi.max() + 1, 1000)
	y = c[0] + c[1]*x + c[2]*(x**2) +c[3]*(x**3)
	plt.plot(x,y)
	plt.plot(xi,yi,'ro')
	plt.savefig('cubic.png')

def plot_poly(xi,yi):
	n = len(xi)
	"""plot the stuff"""
	plt.figure(1)
	plt.clf()  
	c = poly_interp(xi,yi)
	x = np.linspace(xi.min() - 1,  xi.max() + 1, 1000)
	y = c[n-1]
	for j in range(n-1,0,-1):
		y=y*x + c[j-1]
	plt.plot(x,y)
	plt.plot(xi,yi,'ro')
	plt.savefig('poly.png')


if __name__=="__main__":
	print "Running test..."
	test_quad1()




