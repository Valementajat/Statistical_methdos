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

library(tidyverse)
library(MASS)
library(janitor)
library(skimr)
library(GGally)
library(corrplot)
library(caret)
library(broom)
library(rpart)
library(rpart.plot)



