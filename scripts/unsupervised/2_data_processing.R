# 02_data_processing.R

# The original dataset contains timestampep sensor readings
# To make the data more suitable for the required cross-sectional
# unsupervised analysis, we aggregate the data by robot operation cycle.
# Each row in cycle_data represents one robot cycle.

cycle_data <- cobot_data |>
  group_by(cycle) |>
  summarise(
    across(
      c(
        starts_with("current_"),
        starts_with("temperature_"),
        starts_with("speed_"),
        tool_current
      ),
      list(
        mean = ~ mean(.x, na.rm = TRUE),
        sd   = ~ sd(.x, na.rm = TRUE),
        min  = ~ min(.x, na.rm = TRUE),
        max  = ~ max(.x, na.rm = TRUE)
      ),
      .names = "{.col}_{.fn}"
    ),

    # These labels are not used for clustering.
    # They are saved only for post-hoc interpretation.
    robot_protective_stop = any(robot_protective_stop == TRUE, na.rm = TRUE),
    grip_lost = any(grip_lost == TRUE, na.rm = TRUE),

    .groups = "drop"
  )


# Select only aggregated sensor features for unsupervised learning.
# We exclude cycle and event labels from the model input.

sensor_data <- cycle_data |>
  select(
    -cycle,
    -robot_protective_stop,
    -grip_lost
  ) |>
  drop_na()

sensor_data_scaled <- scale(sensor_data)



umap_res <- umap(
  sensor_data_scaled,
  n_neighbors = 15,
  min_dist = 0.1,
  metric = "euclidean"
)


umap_df <- data.frame(
  cycle = cycle_data_clean$cycle,
  Dim1 = umap_res[, 1],
  Dim2 = umap_res[, 2],
  robot_protective_stop = cycle_data_clean$robot_protective_stop,
  grip_lost = cycle_data_clean$grip_lost
)

umap_df