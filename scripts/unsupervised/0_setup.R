# Setup file
# Should work with R studio projects, but was made
# with vsCode environment

# Clear environment
rm(list = ls())

# Set seed for reproducibility
set.seed(42)

# Check working directory
getwd()

# Load necessary libraries
# Had to add comments to remember what is what
library(tidyverse)   # data handling and ggplot
library(janitor)     # clean column names
library(skimr)       # data summaries

# For unsupervised learning
library(uwot)
library(ggplot2)
library(readxl)
library(mclust)

# output directories
model_dir <- "figures/unsupervised/models"
output_dir <- "output/unsupervised"
exploratory_dir <- "figures/unsupervised/exploratory"

if (!dir.exists(model_dir)) {
  dir.create(model_dir, recursive = TRUE)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}
if (!dir.exists(exploratory_dir)) {
  dir.create(exploratory_dir, recursive = TRUE)
}

