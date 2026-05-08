mod_logistic <- glm(
  recurred ~
    age +
      gender +
      risk +
      stage +
      response +
      adenopathy +
      physical_examination +
      smoking +
      hx_smoking +
      hx_radiothreapy +
      pathology +
      focality +
      t +
      n +
      m,
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




# Save coefficient table
logistic_coefficients <- broom::tidy(
  mod_logistic,
  conf.int = TRUE
)

write_csv(
  logistic_coefficients,
  file.path(output_dir, "logistic_regression_coefficients_all_variables.csv")
)




# Culled predictors model
mod_logistic_culled <- glm(
  recurred ~
    age +
      gender +
      risk +
      response +
      adenopathy,
  data = train_data,
  family = binomial
)



# Predict recurrence probability on test set
prob_logistic_culled <- predict(
  mod_logistic_culled,
  newdata = test_data,
  type = "response"
)

# Convert probabilities to classes
pred_logistic_culled <- ifelse(prob_logistic_culled > 0.5, "Yes", "No")
pred_logistic_culled <- factor(pred_logistic_culled, levels = c("No", "Yes"))

# Confusion matrix
cm_logistic_culled <- confusionMatrix(
  pred_logistic_culled,
  test_data$recurred,
  positive = "Yes"
)




# Save coefficient table
logistic_coefficients <- broom::tidy(
  mod_logistic_culled,
  conf.int = TRUE
)

write_csv(
  logistic_coefficients,
  file.path(output_dir, "logistic_regression_coefficients_culled.csv")
)




# Final reduced model


# Culled predictors model
mod_logistic_culled_final <- glm(
  recurred ~
    age +
      gender +
      
      response +
      adenopathy,
  data = train_data,
  family = binomial
)



# Predict recurrence probability on test set
prob_logistic_culled_final <- predict(
  mod_logistic_culled_final,
  newdata = test_data,
  type = "response"
)

# Convert probabilities to classes
pred_logistic_culled_final <- ifelse(prob_logistic_culled_final > 0.5, "Yes", "No")
pred_logistic_culled_final <- factor(pred_logistic_culled_final, levels = c("No", "Yes"))

# Confusion matrix
cm_logistic_culled_final <- confusionMatrix(
  pred_logistic_culled_final,
  test_data$recurred,
  positive = "Yes"
)




# Save coefficient table
logistic_coefficients <- broom::tidy(
  mod_logistic_culled_final,
  conf.int = TRUE
)

write_csv(
  logistic_coefficients,
  file.path(output_dir, "logistic_regression_coefficients_culled_final.csv")
)




