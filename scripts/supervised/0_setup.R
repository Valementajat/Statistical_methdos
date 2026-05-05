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
library(GGally)      # pair plots
library(corrplot)    # correlation plots
library(caret)       # train/test split and model evaluation
library(broom)       # clean model outputs
library(rpart)       # decision tree
library(rpart.plot)  # decision tree plots


# output directories
model_dir <- "figures/supervised/models"
output_dir <- "output/supervised"

if (!dir.exists(model_dir)) {
  dir.create(model_dir, recursive = TRUE)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}