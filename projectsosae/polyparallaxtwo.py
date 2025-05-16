import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Define the equation functions
def equation_lhs(x, y):
    return np.cos((x**2) * (y**-2))

def equation_rhs(x, y):
    return np.sin((x**2) / (y**-2 + 1e-6))  # Avoid division by zero

# Define range and mesh grid
x = np.linspace(-5, 5, 200)
y = np.linspace(-5, 5, 200)
X, Y = np.meshgrid(x, y)

# Compute values
Z_lhs = equation_lhs(X, Y)
Z_rhs = equation_rhs(X, Y)

# 2D Contour Plot
plt.figure(figsize=(8, 6))
plt.contourf(X, Y, np.abs(Z_lhs - Z_rhs), levels=50, cmap='plasma')
plt.colorbar(label="Difference (LHS - RHS)")
plt.xlabel("X")
plt.ylabel("Y")
plt.title("2D Contour Plot of cos((X2)(Y−2)) = sin((X2)/(Y−2))")
plt.show()

# 3D Surface Plot
fig = plt.figure(figsize=(10, 7))
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(X, Y, Z_lhs, cmap='viridis', alpha=0.7, edgecolor='k')
ax.plot_surface(X, Y, Z_rhs, cmap='plasma', alpha=0.7, edgecolor='k')
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("Z")
ax.set_title("3D Plot of cos((X2)(Y−2)) and sin((X2)/(Y−2))")
plt.show()
