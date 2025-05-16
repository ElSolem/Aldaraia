import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y, z, i = sp.symbols('x y z i')

# Define equation with i and z
lhs = sp.sin(x * y) * z * i**2
rhs = sp.cos(x / y) / (z * i**2)

# Convert to numerical functions
lhs_func = sp.lambdify((x, y, z, i), lhs, "numpy")
rhs_func = sp.lambdify((x, y, z, i), rhs, "numpy")

# Create meshgrid
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
Z = np.linspace(0.1, 5, 5)  # Avoid zero for division by zero
I = np.array([1j])  # Imaginary unit

X, Y = np.meshgrid(X, Y)

# Loop for each z and i combination
fig = plt.figure(figsize=(12, 6))

# 3D Plot
ax = fig.add_subplot(121, projection='3d')
for z_val in Z:
    for i_val in I:
        Z_lhs = lhs_func(X, Y, z_val, i_val)
        Z_rhs = rhs_func(X, Y, z_val, i_val)
        ax.plot_surface(X, Y, Z_lhs.real, cmap='viridis', alpha=0.7, edgecolor='k')
        ax.plot_surface(X, Y, Z_rhs.real, cmap='plasma', alpha=0.7, edgecolor='k')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('3D Plot of sin(XY)z i2 = cos(X/Y)/(z i2)')

# 2D Contour Plot
ax2 = fig.add_subplot(122)
contour = ax2.contourf(X, Y, Z_lhs.real - Z_rhs.real, cmap='coolwarm', levels=50)
fig.colorbar(contour, ax=ax2)
ax2.set_title('2D Contour of Difference')
ax2.set_xlabel('X')
ax2.set_ylabel('Y')

plt.show()
