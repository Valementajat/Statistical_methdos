mod_logistic <- glm(
  recurred ~ age + gender + risk + stage + response + adenopathy,
  data = train_data,
  family = binomial
)

summary(mod_logistic)


# Predict recurrence probability on test set
prob_logistic <- predict(
  mod_logistic,
  newdata = test_data,
  type = "response"
)

# Convert probabilities to classes
pred_logistic <- ifelse(prob_logistic > 0.5, "Yes", "No")
pred_logistic <- factor(pred_logistic, levels = c("No", "Yes"))

# Confusion matrix
cm_logistic <- confusionMatrix(
  pred_logistic,
  test_data$recurred,
  positive = "Yes"
)

cm_logistic



# Save coefficient table
logistic_coefficients <- tidy(
  mod_logistic,
  exponentiate = TRUE,
  conf.int = TRUE
)

write_csv(
  logistic_coefficients,
  file.path(output_dir, "logistic_regression_coefficients.csv")
)