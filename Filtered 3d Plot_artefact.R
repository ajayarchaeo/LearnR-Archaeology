# --- 1. Install and Load Necessary Packages ---

# ... (packages code remains the same) ...
library(readr)
library(plotly) 

# --- 2. Read the Data ---

file_path <- "C:/Users/Cyntexia/Documents/Dummy.csv" 
my_data <- read_csv(file_path) 

# --- 2.5 Data Filtering (NEW STEP) ---

# Filter the data to include ONLY the Artefact "Pottery Shard"
# We create a new data frame called 'filtered_data'

filtered_data <- subset(my_data, Artefact == "Pottery Shard")

# OPTIONAL: You can also use base R bracket notation:
# filtered_data <- my_data[my_data$Artefact == "Pottery Shard", ]


# --- 3. Data Preparation for Grouping (UPDATED VARIABLE) ---

# Now use the filtered data for grouping
# Note: You should check if 'Materials' still varies for 'Pottery Shard'.
filtered_data$Group <- interaction(filtered_data$Artefact, filtered_data$Materials)


# --- 4. Interactive 3D Scatter Plot Generation using Plotly (UPDATED VARIABLE) ---

plot_ly(
  filtered_data, # Use the new, filtered data frame
  x = ~x, 
  y = ~y, 
  z = ~z, 
  color = ~Group,    
  type = "scatter3d",
  mode = "markers",  
  marker = list(size = 5) 
) %>%
  # Add layout details (title and axis labels)
  layout(
    title = "Interactive 3D Scatter Plot: ONLY Pottery Shards", # Updated title for clarity
    scene = list(
      xaxis = list(title = "X"),
      yaxis = list(title = "Y"),
      zaxis = list(title = "Z")
    )
  )
