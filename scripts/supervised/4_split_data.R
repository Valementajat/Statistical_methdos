


# drop the column as the prior test dont have it associated with the target
thyroid_model <- thyroid |>
  select(-thyroid_function)

# Add permuntation to ensure randomness in train/test split
permutation <- sample(nrow(thyroid_model))
thyroid_model <- thyroid_model[permutation, ]

train_index <- createDataPartition(
  thyroid_model$recurred,
  p = 0.8,
  list = FALSE
)

train_data <- thyroid_model[train_index, ]
test_data <- thyroid_model[-train_index, ]

# Check class balance
prop.table(table(train_data$recurred))
prop.table(table(test_data$recurred))