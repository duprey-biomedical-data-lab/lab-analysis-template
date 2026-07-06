# Reusable functions for this project.
# If you write the same chunk of code three times, it belongs here.

# Format a point estimate with its confidence interval for manuscripts,
# e.g. "1.42 (1.10 to 1.83)"
format_estimate <- function(est, lower, upper, digits = 2) {
  paste0(
    round(est, digits),
    " (", round(lower, digits),
    " to ", round(upper, digits), ")"
  )
}

# Suppress small cells before anything leaves the secure environment.
# Counts below the threshold get replaced with NA so they cannot be
# committed by accident. Default threshold of 11 matches most data use
# agreements, change it if yours says otherwise.
suppress_small_cells <- function(counts, threshold = 11) {
  ifelse(counts < threshold & counts > 0, NA, counts)
}
