library(tidyverse)
library(janitor)

thyroid <- read_csv("data/Thyroid_Diff.csv", show_col_types = FALSE)

# At least for testing purposes we only take rows with complete data 
thyroid <- subset(thyroid, complete.cases(thyroid))

# Clean column names 
thyroid <- thyroid %>%
  clean_names() %>%
  mutate(
    recurred = factor(recurred, levels = c("No", "Yes"))
  )
