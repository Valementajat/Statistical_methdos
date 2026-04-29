

thyroid <- read_csv("data/Thyroid_Diff.csv", show_col_types = FALSE)

# At least for testing purposes we only take rows with complete data 
thyroid <- subset(thyroid, complete.cases(thyroid))

# Clean column names 
thyroid <- thyroid %>%
  clean_names() %>%
  mutate(
    recurred = factor(recurred, levels = c("No", "Yes"))
  )

glimpse(thyroid)




# Split into training and testing sets
# Seed already set in setup.R
train_index <- createDataPartition(
  thyroid$recurred,
  p = 0.8,
  list = FALSE
)

train_data <- thyroid[train_index, ]
test_data <- thyroid[-train_index, ]

# See distribution what we're predicting
# in training and testing sets
# table(train_data$recurred) # nolint
# table(test_data$recurred) # nolint

# Train model on hte training data
mod_train <- glm(
  recurred ~ .,
  data = train_data,
  family = binomial
)

summary(mod_train)