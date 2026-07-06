# Cleaning, recoding, derived variables, and exclusions.
# Every decision that changes the data should live in this script and
# match what the analysis plan in docs/ says.

source(here::here("scripts", "00_setup.R"))

cohort_raw <- readRDS(file.path(path_processed, "01_cohort_raw.rds"))

# keep a running log of exclusions for the CONSORT style flow diagram
n_start <- nrow(cohort_raw)

cohort <- cohort_raw %>%
  # assign proper types now that we can see what the columns hold
  mutate(
    patient_id = as.character(patient_id),
    age = as.numeric(age),
    admit_date = as.Date(admit_date)
  ) %>%
  # example exclusion, replace with the criteria from your analysis plan
  filter(age >= 18)

n_adults <- nrow(cohort)
message("Excluded ", n_start - n_adults, " patients under 18, ", n_adults, " remain")

# example derived variable, delete or replace as needed
cohort <- cohort %>%
  mutate(
    age_group = case_when(
      age < 45 ~ "18-44",
      age < 65 ~ "45-64",
      TRUE ~ "65+"
    )
  )

# check that patient_id is actually unique before we treat it that way
stopifnot(!any(duplicated(cohort$patient_id)))

saveRDS(cohort, file.path(path_processed, "02_cohort_clean.rds"))
