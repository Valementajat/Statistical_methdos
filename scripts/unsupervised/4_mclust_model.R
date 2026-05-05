mc_fit <- Mclust(umap_df[, c("Dim1", "Dim2")], G = 1:10)

summary(mc_fit)


umap_df$mclust_cluster <- as.factor(mc_fit$classification)

mclust_plot <- ggplot(
  umap_df,
  aes(x = Dim1, y = Dim2,
      color = mclust_cluster)
) +
  geom_point(size = 2, alpha = 0.7) +
  theme_minimal() +
  ggtitle("UMAP Projection Colored by Mclust Cluster")

ggsave(
  filename = file.path(exploratory_dir, "umap_mclust_clusters.png"),
  plot = mclust_plot,
  width = 6,
  height = 4,
  dpi = 300
)


