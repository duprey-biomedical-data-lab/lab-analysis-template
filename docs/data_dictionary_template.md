# Data dictionary

Copy this file to `data_dictionary.md` and fill it in for your project. One row per variable in the analysis dataset. This file describes the data without containing any of it, so it is safe to commit and extremely useful for reviewers.

## Source data

- **Dataset name:**
- **Provider or source:**
- **Extract date:**
- **Rows and columns in raw extract:**

## Variables

| Variable | Type | Description | Values or units | Source | Notes |
|---|---|---|---|---|---|
| patient_id | character | Deidentified patient identifier | | raw extract | unique per patient |
| age | numeric | Age at index date | years | raw extract | |
| age_group | factor | Age category | 18-44, 45-64, 65+ | derived in 02_clean_data.R | |
| exposure_group | factor | Exposure status at index | exposed, unexposed | derived in 02_clean_data.R | see analysis plan for definition |
| outcome | binary | Primary outcome | 0, 1 | derived in 02_clean_data.R | see analysis plan for definition |

Add every variable used in the analysis, including derived ones. For derived variables, name the script that creates them.
