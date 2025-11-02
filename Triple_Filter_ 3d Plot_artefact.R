# --- 1. Install and Load Necessary Packages ---

# ... (packages code remains the same) ...
library(readr)
library(plotly) 

# --- 2. Read the Data ---

file_path <- "C:/Users/Cyntexia/Documents/Dummy.csv" 
my_data <- read_csv(file_path) 

# --- 2.5 Data Filtering (UPDATED STEP: Artefact AND Materials) ---

# Filter the data to include rows where:
# 1. Artefact is EXACTLY "Pottery Shard"
# AND
# 2. Materials is EXACTLY "Ceramic"

filtered_data <- subset(
  my_data, 
  Artefact == "Pottery Shard" & Materials == "Ceramic" & Shape == "Round"
)

# Note: The logical AND operator '&' requires both conditions to be TRUE for a row to be kept.


# --- 3. Data Preparation for Grouping ---

# Since both 'Artefact' and 'Materials' are now fixed, 
# 'Group' might not be necessary, but we'll keep it for structure.
filtered_data$Group <- interaction(filtered_data$Artefact, filtered_data$Materials)


# --- 4. Interactive 3D Scatter Plot Generation using Plotly ---

plot_ly(
  filtered_data, 
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
    title = "Interactive 3D Scatter Plot: Pottery Shard (Ceramic)", # Updated title
    scene = list(
      xaxis = list(title = "X"),
      yaxis = list(title = "Y"),
      zaxis = list(title = "Z")
    )
  )
