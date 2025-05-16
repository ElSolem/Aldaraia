import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y = sp.symbols('x y')

# Define left-hand side (LHS) and right-hand side (RHS) of the inequality
lhs = sp.cos(x) * sp.sin(y)
rhs = sp.tan(9.9)  # This is a constant

# Convert symbolic expressions to numerical functions
lhs_func = sp.lambdify((x, y), lhs, "numpy")
rhs_value = float(rhs)  # Convert RHS constant to float

# Define the plotting range
X = np.linspace(-5, 5, 400)
Y = np.linspace(-5, 5, 400)
X, Y = np.meshgrid(X, Y)

# Compute function values
Z_lhs = lhs_func(X, Y)

# **2D Contour Plot**
fig, ax = plt.subplots(figsize=(8, 6))
contour = ax.contourf(X, Y, Z_lhs, levels=100, cmap='viridis', alpha=0.7)
plt.colorbar(contour, label=r'LHS: $\cos(x) \sin(y)$')

# Highlight the inequality region (LHS >= RHS)
ax.contour(X, Y, Z_lhs - rhs_value, levels=[0], colors='violet', linewidths=2)

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_title(r'$ \cos(x) \sin(y) \geq \tan(9.9) $ (2D Contour Plot)')

# **3D Surface Plot**
fig = plt.figure(figsize=(10, 6))
ax = fig.add_subplot(111, projection='3d')

# Plot LHS surface
ax.plot_surface(X, Y, Z_lhs, cmap='viridis', edgecolor='k', alpha=0.7)

# Plot RHS plane (constant)
ax.plot_surface(X, Y, np.full_like(X, rhs_value), color='red', alpha=0.5)

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Function Values')
ax.set_title(r'$ \cos(x) \sin(y) \geq \tan(9.9) $ (3D Surface Plot)')

plt.show()
