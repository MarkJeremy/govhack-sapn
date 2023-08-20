#generate yearly data for 
# load library
library(tidyverse)

getwd()
setwd("/Users/cc/Desktop/govhack data /GovHack-2023/")

library(readxl)
dataSA <- read_excel("Combines_Features_SA.xlsx")

# Load required libraries
library(ggplot2)
library(reshape2)  # For data manipulation

# Example data
data <- dataSA %>% filter(Year <= 2021)

sum(is.na(data))

# Calculate correlation matrix
cor_matrix <- cor(data)

# Melt the correlation matrix into long format for ggplot
cor_melted <- melt(cor_matrix)

# Create a heatmap using ggplot2
ggplot(cor_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +  # Color scale
  labs(title = "Correlation Heatmap") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability
