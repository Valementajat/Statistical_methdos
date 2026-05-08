# Encode recurrence as numeric: No = 0, Yes = 1 for age correlation

association_results <- tibble(
  variable = character(),
  test_used = character(),
  statistic = numeric(),
  p_value = numeric()
)


categorical_test <- function(name, thyroid) {
  table_var <- table(thyroid[[name]], thyroid$recurred)
  test_result <- fisher.test(
    table_var,
    simulate.p.value = TRUE,
    B = 10000
)
  gen_list <-   tibble(
    variable = name,
    test_used = "Fisher's exact test",
    statistic = NA_real_,
    p_value = test_result$p.value
  )
  return(gen_list)
}

variables <- c(
    "age",
    "response",
    "risk",
    "stage",
    "adenopathy",
    "physical_examination",
    "gender",
    "smoking",
    "hx_smoking",
    "hx_radiothreapy",
    "thyroid_function",
    "pathology",
    "focality",
    "t",
    "n",
    "m"
  )

for (var in variables) {

  if (var == "age") {

    thyroid_corr <- thyroid |>
      mutate(
        recurred_num = ifelse(recurred == "Yes", 1, 0)
      )


    test_result <- cor.test(
      thyroid_corr$age,
      thyroid_corr$recurred_num,
      method = "spearman",
      exact = FALSE
    )
    association_results <- bind_rows(
      association_results,
      tibble(
        variable = var,
        test_used = "Spearman correlation",
        statistic = as.numeric(test_result$estimate),
        p_value = test_result$p.value
      )
    )

  } else {

    result <- categorical_test(var, thyroid)

    association_results <- bind_rows(
      association_results,
      result
    )
  }
}

write_csv(
  association_results,
  "output/supervised/manual_association_test_results.csv"
)


