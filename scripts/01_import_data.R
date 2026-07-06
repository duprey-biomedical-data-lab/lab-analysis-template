# Read the raw data and save an untouched copy in R format.
# No cleaning happens here on purpose. This script's only job is to get
# the data into R exactly as we received it, so that every decision we
# make later is visible in 02_clean_data.R.

source(here::here("scripts", "00_setup.R"))

# swap this for however your raw data actually arrives
# (read_csv, haven::read_sas, DBI query, etc.)
cohort_raw <- read_csv(
  file.path(path_raw, "cohort.csv"),
  # read everything as character first so nothing gets silently coerced,
  # types get assigned deliberately in the cleaning script
  col_types = cols(.default = col_character())
)

# quick sanity checks before moving on
# stopifnot fails loudly, which is what we want if the file is wrong
stopifnot(nrow(cohort_raw) > 0)

# note the row count so we can track exclusions later for the flow diagram
message("Rows in raw cohort: ", nrow(cohort_raw))

saveRDS(cohort_raw, file.path(path_processed, "01_cohort_raw.rds"))
