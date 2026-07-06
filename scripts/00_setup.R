# Shared setup for the whole project.
# Every other script starts by sourcing this file, so packages,
# paths, and options only need to be defined once.

library(tidyverse)
library(here)
library(gtsummary)
library(broom)

# here() anchors paths to the repo root so the scripts work
# on anyone's machine regardless of working directory
path_raw <- here("data", "raw")
path_processed <- here("data", "processed")
path_figures <- here("output", "figures")
path_tables <- here("output", "tables")

# project-wide functions
source(here("R", "functions.R"))

# fix the seed once so any resampling or imputation is reproducible
set.seed(20260706)

# I prefer to see the full numbers rather than scientific notation
options(scipen = 999)
