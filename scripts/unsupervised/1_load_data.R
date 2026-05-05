

cobot_data <- read_xlsx("data/dataset_02052023.xlsx")

# At least for testing purposes we only take rows with complete data 
# cobot_data <- subset(cobot_data, complete.cases(cobot_data))

# Clean column names
cobot_data <- cobot_data |>
  clean_names()



# Check cleaned data
glimpse(cobot_data)
skim(cobot_data)

colSums(is.na(cobot_data))
