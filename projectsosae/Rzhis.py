import numpy as np
import matplotlib.pyplot as plt
import sympy as sp
from mpl_toolkits.mplot3d import Axes3D

# Define symbolic variables
x, y = sp.symbols('x y')

# Define the given equation
lhs = sp.sin(x * y) * sp.cos(-1/12)
rhs = sp.tan((-1/12) * (x / y))

# Extract real parts (for plotting)
lhs_real = sp.re(lhs)
rhs_real = sp.re(rhs)

# Convert to numerical functions
lhs_real_func = sp.lambdify((x, y), lhs_real, "numpy")
rhs_real_func = sp.lambdify((x, y), rhs_real, "numpy")

# Create meshgrid for plotting
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)

# Compute function values
Z_real_lhs = lhs_real_func(X, Y)
Z_real_rhs = rhs_real_func(X, Y)

# 3D Plot
fig = plt.figure(figsize=(12, 6))
ax = fig.add_subplot(111, projection='3d')

# Plot both sides
ax.plot_surface(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7, edgecolor='k', label="LHS")
ax.plot_surface(X, Y, Z_real_rhs, cmap='plasma', alpha=0.7, edgecolor='k', label="RHS")

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z (Real Part)')
ax.set_title('3D Plot of sin(XY) * cos(-1/12) = tan(-1/12 * (x/y))')

plt.show()

# 2D Contour Plot
plt.figure(figsize=(8, 6))
plt.contourf(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7)
plt.colorbar()
plt.title('2D Contour of sin(XY) * cos(-1/12) (Real Part)')
plt.xlabel('X')
plt.ylabel('Y')

plt.show()
