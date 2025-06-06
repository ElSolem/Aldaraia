import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y, z = sp.symbols('x y z')

# Define equation without i
lhs = sp.sin(x * y) * z
rhs = sp.cos(x / y) / z

# Convert to numerical functions
lhs_func = sp.lambdify((x, y, z), lhs, "numpy")
rhs_func = sp.lambdify((x, y, z), rhs, "numpy")

# Create meshgrid
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)
Z_lhs = lhs_func(X, Y, 1)  # Fix z = 1 for visualization
Z_rhs = rhs_func(X, Y, 1)

# 3D Plot
fig = plt.figure(figsize=(12, 6))
ax = fig.add_subplot(121, projection='3d')
ax.plot_surface(X, Y, Z_lhs, cmap='viridis', alpha=0.7, edgecolor='k')
ax.plot_surface(X, Y, Z_rhs, cmap='plasma', alpha=0.7, edgecolor='k')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('3D Plot of sin(XY)Z = cos(X/Y)/Z')

# 2D Contour Plot
ax2 = fig.add_subplot(122)
contour = ax2.contourf(X, Y, Z_lhs - Z_rhs, cmap='coolwarm', levels=50)
fig.colorbar(contour, ax=ax2)
ax2.set_title('2D Contour of Difference')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')

plt.show()
