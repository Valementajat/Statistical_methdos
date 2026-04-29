

ggplot(thyroid, aes(x = recurred)) +
  geom_bar() +
  labs(
    title = "Distribution of cancer recurrence",
    x = "Recurrence",
    y = "Number of patients"
  )

# Plot relationship between age and recurrence
ggplot(thyroid, aes(x = recurred, y = age)) +
  geom_boxplot() +
  labs(
    title = "Age distribution by recurrence status",
    x = "Recurrence",
    y = "Age"
  )