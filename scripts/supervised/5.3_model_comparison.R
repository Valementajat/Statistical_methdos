model_comparison <- tibble(
  model = c("Logistic Regression", "Decision Tree"),
  accuracy = c(
    cm_logistic_culled_final$overall["Accuracy"],
    cm_tree$overall["Accuracy"]
  ),
  sensitivity = c(
    cm_logistic_culled_final$byClass["Sensitivity"],
    cm_tree$byClass["Sensitivity"]
  ),
  specificity = c(
    cm_logistic_culled_final$byClass["Specificity"],
    cm_tree$byClass["Specificity"]
  ),
  balanced_accuracy = c(
    cm_logistic_culled_final$byClass["Balanced Accuracy"],
    cm_tree$byClass["Balanced Accuracy"]
  )
)

model_comparison

write_csv(
  model_comparison,
  file.path(output_dir, "model_comparison.csv")
)