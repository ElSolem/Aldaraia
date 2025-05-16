import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Define the function for evaluation
def equation_lhs(x, y):
    return np.sin(np.cos(x * y))

def equation_rhs(x, y):
    return np.cos(np.sin(x / (y + 1e-6)))  # Avoid division by zero

# Generate a grid
x = np.linspace(-5, 5, 200)
y = np.linspace(-5, 5, 200)
X, Y = np.meshgrid(x, y)

# Compute values
Z_lhs = equation_lhs(X, Y)
Z_rhs = equation_rhs(X, Y)

# Plot 2D contour
plt.figure(figsize=(8, 6))
plt.contourf(X, Y, np.abs(Z_lhs - Z_rhs), levels=50, cmap='plasma')
plt.colorbar(label="Difference (LHS - RHS)")
plt.xlabel("X")
plt.ylabel("Y")
plt.title("2D Contour Plot of sin(cos(XY)) = cos(sin(X/Y))")
plt.show()

# Plot 3D surface
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(X, Y, Z_lhs, cmap='viridis', alpha=0.7, edgecolor='k')
ax.plot_surface(X, Y, Z_rhs, cmap='plasma', alpha=0.7, edgecolor='k')
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("Z")
ax.set_title("3D Plot of sin(cos(XY)) and cos(sin(X/Y))")
plt.show()
