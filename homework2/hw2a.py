# -*- coding: utf-8 -*-
# <nbformat>2</nbformat>

# <codecell>

import numpy as np
import matplotlib.pyplot as plt

# <codecell>

xi = np.array([-1.,1.,2.])
yi = np.array([1.,-1.,7.])

# <codecell>

A = np.vstack([np.ones(3), xi, xi**2]).T

# <codecell>

A

# <codecell>

c= np.linalg.solve(A,yi)

# <codecell>

c

# <codecell>

x = np.linspace(-10,10,1000)

# <codecell>

y = c[0] + c[1]*x + c[2]*(x**2)

# <codecell>

plt.plot(x,y)

# <codecell>


