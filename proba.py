import numpy as np
import matplotlib.pyplot as plt

# Este arquivo é unha proba para ver como facer commits en github

def f( x ):
    return( np.sin(x) )

x = np.linspace( 1, 10, 10 )
y = f( x )

fig, ax = plt.subplots( 1, 1 )

ax.plot( x, y, color = "k" )
plt.show()
