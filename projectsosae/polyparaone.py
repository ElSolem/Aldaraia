import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

# Define symbolic variables
x, y, z = sp.symbols('x y z')
i = sp.I  # Imaginary unit

# Define your equation
lhs = sp.sin(x * y) * z * i**2
rhs = sp.cos(x / y) / (z * i**2)

# Extract real parts (Pythonista doesn’t handle complex numbers well in `matplotlib`)
lhs_real, rhs_real = sp.re(lhs), sp.re(rhs)

# Convert to numerical functions
lhs_real_func = sp.lambdify((x, y, z), lhs_real, "numpy")
rhs_real_func = sp.lambdify((x, y, z), rhs_real, "numpy")

# Create meshgrid
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)
Z_real_lhs = lhs_real_func(X, Y, 1)  # Fix z = 1 for visualization
Z_real_rhs = rhs_real_func(X, Y, 1)

# Check if 3D plotting works
try:
    from mpl_toolkits.mplot3d import Axes3D
    fig = plt.figure(figsize=(12, 6))
    ax = fig.add_subplot(111, projection='3d')

    # LHS plot
    ax.plot_surface(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7, edgecolor='k')

    # RHS plot
    ax.plot_surface(X, Y, Z_real_rhs, cmap='plasma', alpha=0.7, edgecolor='k')

    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z (Real Part)')
    ax.set_title('3D Plot of sin(XY)zi2 = cos(X/Y)/(zi2)')
    
except ImportError:
    # Fallback: 2D contour plot if 3D doesn't work
    plt.contourf(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7)
    plt.colorbar()
    plt.title('2D Contour of sin(XY)zi2 (Real Part)')
    plt.xlabel('X')
    plt.ylabel('Y')

plt.show()
