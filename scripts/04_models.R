# Primary and sensitivity analyses.
# The model specifications here should match the analysis plan in docs/.
# If a reviewer asks for something new, add it here with a comment saying
# it came from revision, so the history of the analysis stays readable.

source(here::here("scripts", "00_setup.R"))

cohort <- readRDS(file.path(path_processed, "02_cohort_clean.rds"))

# primary model, replace outcome and covariates with your own
# covariates below are placeholders from the analysis plan
model_primary <- glm(
  outcome ~ exposure_group + age + sex,
  data = cohort,
  family = binomial()
)

# tidy() with exponentiate gives odds ratios with confidence intervals,
# which is what goes in the manuscript table
results_primary <- broom::tidy(
  model_primary,
  exponentiate = TRUE,
  conf.int = TRUE
)

write_csv(results_primary, file.path(path_tables, "model_primary_results.csv"))

# sensitivity analysis example: restrict to patients 65 and older
model_sens_older <- glm(
  outcome ~ exposure_group + age + sex,
  data = filter(cohort, age >= 65),
  family = binomial()
)

results_sens_older <- broom::tidy(
  model_sens_older,
  exponentiate = TRUE,
  conf.int = TRUE
)

write_csv(results_sens_older, file.path(path_tables, "model_sensitivity_age65.csv"))
