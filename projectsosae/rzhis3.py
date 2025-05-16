import numpy as np
import matplotlib.pyplot as plt
import sympy as sp
from mpl_toolkits.mplot3d import Axes3D

# Define symbolic variables
x, y = sp.symbols('x y')

# Define the swapped equation
lhs = sp.cos(x * y) * sp.sin(-1/12)
rhs = sp.tan((-1/12) * (x / y))

# Extract real parts (for plotting)
lhs_real = sp.re(lhs)
rhs_real = sp.re(rhs)

# Convert to numerical functions
lhs_real_func = sp.lambdify((x, y), lhs_real, "numpy")
rhs_real_func = sp.lambdify((x, y), rhs_real, "numpy")

# Create meshgrid for plotting
X = np.linspace(-5, 5, 200)  # Higher resolution
Y = np.linspace(-5, 5, 200)
X, Y = np.meshgrid(X, Y)

# Compute function values safely
Z_real_lhs = lhs_real_func(X, Y)
Z_real_rhs = np.where(np.abs(np.cos((-1/12) * (X/Y))) > 1e-6, rhs_real_func(X, Y), np.nan)  # Avoid singularities

# 3D Plot
fig = plt.figure(figsize=(12, 6))
ax = fig.add_subplot(111, projection='3d')

# Plot both sides
ax.plot_surface(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7, edgecolor='k')
ax.plot_surface(X, Y, Z_real_rhs, cmap='plasma', alpha=0.7, edgecolor='k')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z (Real Part)')
ax.set_title('3D Plot of cos(XY) * sin(-1/12) = tan(-1/12 * (x/y))')

plt.show()

# 2D Contour Plot - Handling NaN values
plt.figure(figsize=(8, 6))
plt.contourf(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7)
plt.colorbar()
plt.title('2D Contour of cos(XY) * sin(-1/12) (Real Part)')
plt.xlabel('X')
plt.ylabel('Y')

plt.show()
