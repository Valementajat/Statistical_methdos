# Master script for unsupervised

# Clear environment
rm(list = ls())

# Set seed for reproducibility
set.seed(42)

# Check working directory
getwd()


required_packages <- c(
  "tidyverse",
  "skimr",
 
  "janitor",
  "mclust",
  "uwot",
  "ggplot2",
  "readxl"
)

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

dir.create("output", showWarnings = FALSE)
dir.create("figures", showWarnings = FALSE)



unsupervised_scripts <- c(
  "scripts/unsupervised/1_load_data.R",
  "scripts/unsupervised/2_data_processing.R",
  "scripts/unsupervised/3_exploratory_analysis.R",
  "scripts/unsupervised/4_mclust_model.R",
  "scripts/unsupervised/5_model_savings.R"
)

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



run_scripts <- function(script_paths) {
  for (script in script_paths) {
    cat("\nRunning:", script, "\n")
    source(script)
  }
}

cat("\n========== UNSUPERVISED ANALYSIS ==========\n")
run_scripts(unsupervised_scripts)

cat("\n========== PROJECT COMPLETED ==========\n")