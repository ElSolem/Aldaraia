import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y, z = sp.symbols('x y z')

# Define the equation (keeping both sides separate)
lhs = sp.sin((x * y * z) ** sp.pi)
rhs = sp.cos(((x / y) ** z) / sp.pi)

# Extract real parts to ensure proper plotting
lhs_real, rhs_real = sp.re(lhs), sp.re(rhs)

# Convert symbolic expressions to numerical functions
lhs_real_func = sp.lambdify((x, y, z), lhs_real, "numpy")
rhs_real_func = sp.lambdify((x, y, z), rhs_real, "numpy")

# Create meshgrid for plotting
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)

# Fix z = 1 for visualization (since it's a 3-variable function)
Z_real_lhs = lhs_real_func(X, Y, 1)
Z_real_rhs = rhs_real_func(X, Y, 1)

# Create figure for plotting
fig = plt.figure(figsize=(12, 6))
ax = fig.add_subplot(111, projection='3d')

# LHS plot
ax.plot_surface(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7, edgecolor='k')

# RHS plot
ax.plot_surface(X, Y, Z_real_rhs, cmap='plasma', alpha=0.7, edgecolor='k')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z (Real Part)')
ax.set_title("3D Plot of sin((xyz)^π) = cos(((x/y)^z)/π)")

plt.show()
