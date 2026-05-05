mod_tree <- rpart(
  recurred ~ age + gender + risk + stage + response + adenopathy,
  data = train_data,
  method = "class"
)

rpart.plot(mod_tree)

png(
  filename = file.path(model_dir, "decision_tree.png"),
  width = 1000,
  height = 700
)

rpart.plot(mod_tree)

dev.off()

pred_tree <- predict(
  mod_tree,
  newdata = test_data,
  type = "class"
)

cm_tree <- confusionMatrix(
  pred_tree,
  test_data$recurred,
  positive = "Yes"
)

cm_tree