# --- 1. Install and Load Necessary Packages ---

# Uncomment and run the following lines if you don't have the packages installed:
# install.packages("readr")
install.packages("plotly") 
install.packages("readr")

library(readr)
library(plotly) # Load the package for interactive graphs

# --- 2. Read the Data ---

# !!! IMPORTANT: Ensure the file path is correct and accessible in your R environment !!!
# (Keep your file path here)
# --- 2. Read the Data ---

file_path <- "C:/Users/Cyntexia/Documents/Dummy.csv" # Ensure this path is correct!
my_data <- read_csv(file_path) # <--- Variable name changed to my_data

# --- 3. Data Preparation for Grouping (Simplified for Plotly) ---

# Create a unique grouping column by combining 'Artefact' and 'Materials'
# Plotly can use this factor column directly for coloring.
# --- 3. Data Preparation for Grouping (Simplified for Plotly) ---

# Create a unique grouping column by combining 'Artefact' and 'Materials'
my_data$Group <- interaction(my_data$Artefact, my_data$Materials) # Changed 'data' to 'my_data'


# --- 4. Interactive 3D Scatter Plot Generation using Plotly ---

# Use plot_ly to create the 3D scatter plot.
# Plotly automatically handles grouping and coloring based on the 'color' argument,
# and generates an interactive legend and hover text.

# --- 4. Interactive 3D Scatter Plot Generation using Plotly ---

plot_ly(
  my_data, 
  x = ~x, 
  y = ~y, 
  z = ~z, 
  color = ~Group,    # Plotly automatically assigns colors based on the 'Group' factor
  type = "scatter3d",# Specify the 3D scatter plot type
  mode = "markers",  # Plot points as markers
  marker = list(size = 5) # Adjust point size for better visibility
) %>%
  
  layout(
    title = "Interactive 3D Scatter Plot Grouped by Artefact and Materials",
    scene = list(
      xaxis = list(title = "X"),
      yaxis = list(title = "Y"),
      zaxis = list(title = "Z")
    )
  )

# ... (rest of the layout)

# The resulting graph is interactive!
# * Rotate: Click and drag the plot.
# * Zoom: Scroll your mouse wheel.
# * Data: Hover over any point to see its coordinates and its 'Group'.
