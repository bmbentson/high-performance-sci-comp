import matplotlib.pyplot as plt
from matplotlib import rc
import numpy as np 
from newton import solve




def g1(x):
	return x *np.cos(np.pi *x)

def g2(x):
	return 1-.6*(x**2)	

def fval_g1_g2(x):
	f = g1(x)-g2(x)
	fp= np.cos(np.pi*x) + -1*np.pi*x*np.sin(np.pi*x) + 1.2*(x)
	return f,fp


if __name__=="__main__":
	print "Running test..."
	x_guess = [-2,-1.6,-0.8,1.4]
	xfinal=[]

	plt.figure(1)
	plt.clf()
	x = np.linspace(-5,5,1000)
	y1 = g1(x)
	y2 = g2(x)
	g1plot, =plt.plot(x,y1,label = r"$xcos(\pi x)$")
	g2plot, =plt.plot(x,y2,label = r"$1-.6x^2$")
	
	
	

	for x0 in x_guess:
		print "With initial guess x0 = %22.16e " % x0
		(xf,i) =solve(fval_g1_g2,x0)
		print " \t solve returns x = %22.16e after %i iterations \n" % (xf, i)
		xfinal.append(xf)

	plt.plot(xfinal,map(g1,xfinal),'ro',label = 'intersection')

	plt.grid()
	
	plt.legend()
	plt.savefig('intersections.png')



