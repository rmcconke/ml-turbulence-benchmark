import numpy as np
import matplotlib.pyplot as plt

# Load the data
data = np.load('ground_truth_eval.npz')

# Get all unique case names
case_names = sorted(set([key.split('/')[0] for key in data.files]))

# Create a figure with subplots
n_cases = len(case_names)
n_cols = 3
n_rows = (n_cases + n_cols - 1) // n_cols

fig, axes = plt.subplots(n_rows, n_cols, figsize=(15, 5*n_rows))
axes = axes.flatten()

for idx, case_name in enumerate(case_names):
    ax = axes[idx]
    
    # Load coordinates and velocity
    coords = data[f'{case_name}/coords']
    U = data[f'{case_name}/U']
    
    # Extract coordinates based on case type
    if case_name.startswith('AR_'):
        # For duct cases, plot y-z plane
        x = coords[:, 1]  # y
        y = coords[:, 2]  # z
        xlabel = 'y [m]'
        ylabel = 'z [m]'
    else:
        # For other cases, plot x-y plane
        x = coords[:, 0]
        y = coords[:, 1]
        xlabel = 'x [m]'
        ylabel = 'y [m]'
    
    # Compute velocity magnitude
    U_mag = np.sqrt(U[:, 0]**2 + U[:, 1]**2 + U[:, 2]**2)
    
    # Scatter plot
    scatter = ax.scatter(x, y, c=U_mag, cmap='viridis', s=10, alpha=0.7)
    plt.colorbar(scatter, ax=ax, label='|U| [m/s]')
    
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_title(f'{case_name}')
    ax.set_aspect('equal', adjustable='box')

# Hide any unused subplots
for idx in range(n_cases, len(axes)):
    axes[idx].axis('off')

plt.tight_layout()
plt.savefig('scripts/plots_data/velocity_fields.png', dpi=150, bbox_inches='tight')
print("Saved visualization to data/test/velocity_fields.png")
plt.show()