import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Define the equation and mask for the circle condition
def equation(X, Y):
    # sin(XY)zi2 = cos(x/y)/(zi2) part of the original equation
    Z = np.sin(X * Y) / (np.cos(X / Y))  # Modify as needed based on original equation
    return Z

# Circle condition: points inside the ellipse defined by ((x^2 / a^2) + (y^2 / b^2)) <= 1
def inside_ellipse(X, Y, a=1, b=1):
    return (X**2 / a**2 + Y**2 / b**2) <= 1

# Generate meshgrid
X = np.linspace(-5, 5, 200)
Y = np.linspace(-5, 5, 200)
X, Y = np.meshgrid(X, Y)

# Mask points that lie outside the circle
mask = inside_ellipse(X, Y)

# Apply the mask to filter out the points outside the circle
Z = equation(X, Y)
Z[~mask] = np.nan  # Set the points outside the circle to NaN (won't be plotted)

# Plotting 3D surface
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

# Plot only the points inside the circle
ax.plot_surface(X, Y, Z, cmap='viridis', alpha=0.7, edgecolor='k')

# Labels and title
ax.set_xlabel('X-axis')
ax.set_ylabel('Y-axis')
ax.set_zlabel('Z-axis')
ax.set_title('Region Inside the Circle')

# Show plot
plt.show()
