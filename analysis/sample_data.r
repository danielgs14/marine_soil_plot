### Create sample data
# A sample dataframe will ensure privacy is kept for unpublished data.

# Generate sample dataframe
sample_df <- data.frame(
  sands = runif(21, 100000, 999999),
  clays = runif(21, 100000, 999999),
  silts = runif(21, 100000, 999999)
)

# Ensure each row adds up to 100
for (i in 1:nrow(sample_df)) {
  row_sum <- sum(sample_df[i, ])
  sample_df[i, ] <- sample_df[i, ] / row_sum * 100
}

# Adding station columns
# If added before, the function for ensuring sum to 100 failed
stations <- rep(c("a", "b", "c"), each = 7)
stations <- paste0(stations, 1:21)
sample_df$stations <- stations

locations <- rep(c("a", "b", "c"), each = 7)
sample_df$locations <- locations

reps <- rep(1:7, each = 1)
sample_df$reps <- reps

# It is not necessary but I want to reorder the dataframe
sample_df <- data.frame(
    stations = sample_df$stations,
    locations = sample_df$locations,
    reps = sample_df$reps,
    sand = sample_df$sands,
    clay = sample_df$clays,
    silt = sample_df$silts)


# Save data frame as CSV
write.csv(
    sample_df,
    file = "./raw/sample_data.csv",
    row.names = FALSE)