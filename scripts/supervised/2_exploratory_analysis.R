# 02_exploratory_analysis.R

# Create output directory for exploratory figures
exploratory_dir <- "figures/supervised/exploratory"

if (!dir.exists(exploratory_dir)) {
  dir.create(exploratory_dir, recursive = TRUE)
}


# Distribution of recurrence
p_recurred <- ggplot(thyroid, aes(x = recurred)) +
  geom_bar() +
  labs(
    title = "Distribution of Cancer Recurrence",
    x = "Recurrence",
    y = "Number of Patients"
  )

p_recurred

ggsave(
  filename = file.path(exploratory_dir, "recurrence_distribution.png"),
  plot = p_recurred,
  width = 6,
  height = 4,
  dpi = 300
)

# Age distribution by recurrence
p_age_recurred <- ggplot(thyroid, aes(x = recurred, y = age)) +
  geom_boxplot() +
  labs(
    title = "Age Distribution by Recurrence Status",
    x = "Recurrence",
    y = "Age"
  )

p_age_recurred

ggsave(
  filename = file.path(exploratory_dir, "age_by_recurrence.png"),
  plot = p_age_recurred,
  width = 6,
  height = 4,
  dpi = 300
)

# Response by recurrence
p_response <- ggplot(thyroid, aes(x = response, fill = recurred)) +
  geom_bar(position = "fill") +
  labs(
    title = "Recurrence Proportion by Treatment Response",
    x = "Response",
    y = "Proportion",
    fill = "Recurred"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

p_response

ggsave(
  filename = file.path(exploratory_dir, "response_by_recurrence.png"),
  plot = p_response,
  width = 8,
  height = 4,
  dpi = 300
)

# Risk by recurrence
p_risk <- ggplot(thyroid, aes(x = risk, fill = recurred)) +
  geom_bar(position = "fill") +
  labs(
    title = "Recurrence Proportion by Risk Category",
    x = "Risk",
    y = "Proportion",
    fill = "Recurred"
  )

p_risk

ggsave(
  filename = file.path(exploratory_dir, "risk_by_recurrence.png"),
  plot = p_risk,
  width = 6,
  height = 4,
  dpi = 300
)

# Stage by recurrence
p_stage <- ggplot(thyroid, aes(x = stage, fill = recurred)) +
  geom_bar(position = "fill") +
  labs(
    title = "Recurrence Proportion by Cancer Stage",
    x = "Stage",
    y = "Proportion",
    fill = "Recurred"
  )

p_stage

ggsave(
  filename = file.path(exploratory_dir, "stage_by_recurrence.png"),
  plot = p_stage,
  width = 6,
  height = 4,
  dpi = 300
)
