# This script will generate a ternary plot for the marine bed analysis

# Packages
pacman::p_load(
    "ggplot2",
    "ggtern")

# Read data
df <- read.csv("./raw/sample_data.csv")

# Create visualization
ternplot <- ggtern(
    data = df,
    mapping = aes(
        x = sands,
        y = clays,
        z = silts)) +
    labs(
        x = "Sand",
        y = "Clay",
        z = "Silt") +
    geom_point(
        mapping = aes(shape = locations, color = reps),
        size = 6) +
    guides(
        color = guide_legend(title = "Station"),
        shape = guide_legend(title = "Locations")) +
    scale_color_viridis_c(option = 'inferno') +
    theme_classic(base_size = 24)

# Display visualization
ternplot

# Save visualization
ggtern::ggsave(
  "ternary_plot.jpeg",
  device = "jpeg",
  path = "./plots",
  dpi = 1200)