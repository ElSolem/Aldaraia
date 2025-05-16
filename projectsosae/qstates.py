import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y = sp.symbols('x y')

# Define left-hand side (LHS) and right-hand side (RHS) of the equation
lhs = sp.sin(x) * sp.cos(y)
rhs = sp.tan(x / y)

# Convert symbolic expressions to numerical functions
lhs_func = sp.lambdify((x, y), lhs, "numpy")
rhs_func = sp.lambdify((x, y), rhs, "numpy")

# Define the plotting range
X = np.linspace(-5, 5, 400)
Y = np.linspace(-5, 5, 400)
X, Y = np.meshgrid(X, Y)

# Avoid division by zero for RHS
Y[Y == 0] = 1e-6

# Compute function values
Z_lhs = lhs_func(X, Y)
Z_rhs = rhs_func(X, Y)

# **2D Contour Plot**
fig, ax = plt.subplots(figsize=(8, 6))
contour_lhs = ax.contourf(X, Y, Z_lhs, levels=100, cmap='viridis', alpha=0.7)
contour_rhs = ax.contourf(X, Y, Z_rhs, levels=100, cmap='plasma', alpha=0.5)
plt.colorbar(contour_lhs, label='LHS: sin(x) * cos(y)')
plt.colorbar(contour_rhs, label='RHS: tan(x/y)')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_title(r'$ \sin(x) \cos(y) = \tan(x/y) $ (2D Contour Plot)')

# **3D Surface Plot**
fig = plt.figure(figsize=(10, 6))
ax = fig.add_subplot(111, projection='3d')

# Plot LHS surface
ax.plot_surface(X, Y, Z_lhs, cmap='viridis', edgecolor='k', alpha=0.7)

# Plot RHS surface
ax.plot_surface(X, Y, Z_rhs, cmap='plasma', edgecolor='k', alpha=0.7)

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Function Values')
ax.set_title(r'$ \sin(x) \cos(y) = \tan(x/y) $ (3D Surface Plot)')

plt.show()
