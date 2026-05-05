

table(umap_df$mclust_cluster, umap_df$robot_protective_stop)
table(umap_df$mclust_cluster, umap_df$grip_lost)

prop.table(
  table(umap_df$mclust_cluster, umap_df$robot_protective_stop),
  margin = 1
)

prop.table(
  table(umap_df$mclust_cluster, umap_df$grip_lost),
  margin = 1
)


protective_summary <- umap_df |>
  group_by(mclust_cluster) |>
  summarise(
    n = n(),
    protective_stops = sum(robot_protective_stop == TRUE),
    protective_stop_rate = mean(robot_protective_stop == TRUE)
  ) |>
  arrange(desc(protective_stop_rate))



write_csv(
  protective_summary,
  file.path(output_dir, "protective_summary.csv")
)

grip_loss_summary <- umap_df |>
  group_by(mclust_cluster) |>
  summarise(
    n = n(),
    grip_losses = sum(grip_lost == TRUE),
    grip_loss_rate = mean(grip_lost == TRUE)
  ) |>
  arrange(desc(grip_loss_rate))


write_csv(
  grip_loss_summary,
  file.path(output_dir, "grip_loss_summary.csv")
)

overall_protective_rate <- mean(umap_df$robot_protective_stop == TRUE)

protective_summary2 <- protective_summary |>
  mutate(
    relative_to_overall = protective_stop_rate / overall_protective_rate
  )


write_csv(
  protective_summary2,
  file.path(output_dir, "protective_summary2.csv")
)


