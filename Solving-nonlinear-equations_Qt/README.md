# Solving Nonlinear Equations (Qt/C++)

This project is a graphical application for numerical solving of nonlinear equations with visualization of results. It is implemented using Qt 5.15 and C++17, with the `QCustomPlot` library for plotting graphs.

<img width="823" alt="Example interface" src="https://github.com/user-attachments/assets/ea0bc044-9f0b-4b18-b03d-fd50c9b0691a" />

## Features
- Solving equations using methods:
  - Newton's method(3 variations)
  - Simple iteration method(3 vatiations)
- Visualization of the function on a graph
- Configurable precision settings
- Adaptive interface with support for dark/light themes

## Requirements
- **OS**: macOS 13.6.3+ or compatible Unix systems
- **Qt**: Version 5.15.0
- **Compiler**: C++17 support
- **Libraries**:
  - Qt Core, GUI, Widgets
  - QCustomPlot (included in the project)

## Building and Running
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Solving-nonlinear-equations_Qt.git
   ```
## Project Structure
.
├── function.h        # My mathematical function
├── mainwindow.h/cpp  # Interface logic
├── qcustomplot.h/cpp # Plotting library
├── mainwindow.ui     # Interface XML description
└── Solving-nonlinear-equations_Qt.pro # Build configuration        
