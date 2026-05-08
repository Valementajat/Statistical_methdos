# Master script for supervised

# Clear environment
rm(list = ls())

# Set seed for reproducibility
set.seed(42)

# Check working directory
getwd()


required_packages <- c(
  "tidyverse",
  "janitor",
  "skimr",
  "broom",
  "caret",
  "rpart",
  "rpart.plot",
  "dplyr"
 
 
)

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

dir.create("output", showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)



supervised_scripts <- c(
  "scripts/supervised/1_load_data.R",
  "scripts/supervised/2_exploratory_analysis.R",
  "scripts/supervised/3_correlation_screening.R",
  "scripts/supervised/4_split_data.R",
  "scripts/supervised/5.1_logistic_regression.R",
  "scripts/supervised/5.2_decision_tree.R",
  "scripts/supervised/5.3_model_comparison.R"
)

# output directories
model_dir <- "figures/supervised/models"
output_dir <- "output/supervised"
exploratory_dir <- "figures/supervised/exploratory"

if (!dir.exists(model_dir)) {
  dir.create(model_dir, recursive = TRUE)
}

if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}
if (!dir.exists(exploratory_dir)) {
  dir.create(exploratory_dir, recursive = TRUE)
}



run_scripts <- function(script_paths) {
  for (script in script_paths) {
    cat("\nRunning:", script, "\n")
    source(script)
  }
}

cat("\n========== SUPERVISED ANALYSIS ==========\n")
run_scripts(supervised_scripts)

cat("\n========== PROJECT COMPLETED ==========\n")