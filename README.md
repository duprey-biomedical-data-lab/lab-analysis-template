# Lab Analysis Template

This is the starting point for every analysis project in the Duprey Lab. When you begin a new project or paper, create a new repository from this template (click "Use this template" at the top of this page) instead of starting from an empty repo. That way every project in the lab has the same layout, and anyone can open any repo and know where things are.

## Project information

Fill this section in after you create your repo from the template.

- **Project title:**
- **Lead analyst:**
- **Principal investigator:**
- **IRB protocol number:**
- **Status:** planning / active / under review / published
- **Manuscript or citation:** add the DOI once published

## Folder structure

```
.
├── data/          Data lives here LOCALLY ONLY (in VM) and is never pushed. See data/README.md
│   ├── raw/       Original data as received, never edited by hand
│   └── processed/ Cleaned analysis-ready datasets created by scripts
├── scripts/       Numbered analysis scripts, run in order
├── R/ or python/             Reusable functions sourced by the scripts
├── output/
│   ├── figures/   Generated plots
│   └── tables/    Generated tables
└── docs/          Analysis plan, data dictionary, and other documentation
```

## How the scripts work

Scripts are numbered and meant to be run in order. Each one reads what the previous one produced, so a fresh clone of the repo (plus the data placed in `data/raw/`) can rebuild the entire analysis from top to bottom.

| Script | Purpose |
|---|---|
| `scripts/00_setup.R` | Loads packages and sets shared options and file paths |
| `scripts/01_import_data.R` | Reads raw data and saves an untouched copy in R format |
| `scripts/02_clean_data.R` | Cleaning, recoding, derived variables, exclusions |
| `scripts/03_descriptive_analysis.R` | Table 1, descriptive statistics, exploratory plots |
| `scripts/04_models.R` | Primary and sensitivity analyses |

Add more numbered scripts as your project needs them (05, 06, and so on). Keep one clear purpose per script.

## Rules for every project

1. **Never commit data.** Not raw, not processed, not "just a small deidentified sample". The `.gitignore` in this template blocks common data file types, but the gitignore is a safety net, not the policy. The policy is: data does not go on GitHub. Data stays on the lab's approved secure storage.
2. **Never put patient level results in the repo.** Aggregated tables and figures in `output/` are fine as long as they follow small cell suppression rules (nothing based on fewer than 11 patients in claims data, or whatever your data use agreement specifies).
3. **The full analysis must be reproducible from the scripts.** If you did something by hand (edited a value, dropped a row in Excel), it did not happen. Put it in a script.
4. **Write down decisions in `docs/analysis_plan.md`.** Six months from now, at revision time, you will thank yourself.
5. **Set a seed** before anything random (multiple imputation, bootstrapping, train test splits).

## Getting set up

We use [renv](https://rstudio.github.io/renv/) so everyone runs the same package versions.

```r
# first time in a new project
install.packages("renv")
renv::init()

# after cloning someone else's project
renv::restore()
```

For Python projects, keep the same folder layout and numbering, use a virtual environment, and commit a requirements.txt.

```py
# first time in a new Python project
python -m venv .venv
source .venv/bin/activate  # Mac/Linux
# .venv\Scripts\activate   # Windows

pip install -r requirements.txt
```

For SQL projects, keep SQL scripts in the sql/ folder and use clear numbering so they run in order.

sql/
├── 01_extract_cohort.sql
├── 02_clean_variables.sql
└── 03_create_analysis_table.sql

## Workflow

We do not push straight to `main`. See [CONTRIBUTING.md](CONTRIBUTING.md) for the branch and pull request workflow.

## Questions

Ask in the Teams channel or bring it to lab meeting. If something about this template is confusing or missing, open an issue on this repo so we can fix it for everyone.
