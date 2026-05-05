

train_index <- createDataPartition(
  thyroid$recurred,
  p = 0.8,
  list = FALSE
)

train_data <- thyroid[train_index, ]
test_data <- thyroid[-train_index, ]

# Check class balance
prop.table(table(train_data$recurred))
prop.table(table(test_data$recurred))