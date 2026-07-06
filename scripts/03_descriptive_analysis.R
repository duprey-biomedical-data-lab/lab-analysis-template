# Descriptive statistics and Table 1.
# Outputs go to output/tables and output/figures.
# Remember the small cell rule before committing anything from here.

source(here::here("scripts", "00_setup.R"))

cohort <- readRDS(file.path(path_processed, "02_cohort_clean.rds"))

# Table 1, stratified by exposure group
# gtsummary handles the formatting so we are not hand editing tables in Word
table1 <- cohort %>%
  select(age, age_group, sex, exposure_group) %>%
  tbl_summary(
    by = exposure_group,
    statistic = list(
      all_continuous() ~ "{median} ({p25}, {p75})",
      all_categorical() ~ "{n} ({p}%)"
    )
  )

table1 %>%
  as_gt() %>%
  gt::gtsave(file.path(path_tables, "table1.html"))

# distribution of age by group, mostly a sanity check for ourselves
fig_age <- ggplot(cohort, aes(x = age, fill = exposure_group)) +
  geom_histogram(bins = 30, position = "identity", alpha = 0.6) +
  labs(x = "Age at admission", y = "Patients", fill = NULL) +
  theme_minimal()

ggsave(
  file.path(path_figures, "age_distribution.png"),
  fig_age,
  width = 7, height = 5, dpi = 300
)
