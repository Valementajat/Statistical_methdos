

projection_plot <- ggplot(
  umap_df,
  aes(x = Dim1, y = Dim2,
      color = robot_protective_stop)
) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  ggtitle("UMAP Projection of Sensor Data") 

ggsave(
  filename = file.path(exploratory_dir, "projection_plot.png"),
  plot = projection_plot,
  width = 6,
  height = 4,
  dpi = 300
)

grip_loss_plot <- ggplot(umap_df, aes(x = Dim1, y = Dim2, color = grip_lost)) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  ggtitle("UMAP Projection Colored by Grip Loss")

ggsave(
  filename = file.path(exploratory_dir, "grip_loss_plot.png"),
  plot = grip_loss_plot,
  width = 6,
  height = 4,
  dpi = 300
)