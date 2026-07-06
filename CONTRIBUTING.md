# How we work in this repo

This applies to every analysis repo in the lab, not just this template.

## Branching

The `main` branch should always hold a version of the analysis that runs top to bottom without errors. Day to day work happens on branches.

1. Pull the latest `main` before starting anything new.
2. Create a branch named after what you are doing, for example `add-sensitivity-analysis` or `fix-table1-labels`.
3. Commit as you go. Small commits with clear messages beat one giant commit at the end.
4. When the work is ready, open a pull request and ask another lab member to look it over.

## Commit messages

Write a short line that says what the commit does and why, in plain language.

Good: `Exclude patients with under 24h ICU stay per analysis plan`

Not helpful: `updates`, `fixed stuff`, `final version 3 REAL final`

## Pull requests

- Keep them focused. One analysis change per PR is easier to review than five.
- In the description, say what changed and whether any results moved because of it.
- Before you open the PR, restart R or python or any language and run the scripts in order to make sure everything still works from a clean session.
- At least one other person should look at code that feeds a manuscript. For exploratory side work, use your judgment.

## Code review is not a judgment of you

We review each other's code because a second pair of eyes catches mistakes before reviewers or, worse, readers do. Everyone's code gets reviewed, including the PI's. Ask questions freely and point out anything that looks off, no matter who wrote it.

## Code style

- Simple comments that say why, not what. `# lag the exposure by 30 days to avoid immortal time bias` is useful. `# create variable` is not.
- Descriptive names: `icu_admits` beats `df2`.
- Follow the [tidyverse style guide](https://style.tidyverse.org/) for R. Do not stress about it, just be consistent.
- For Python, follow [PEP 8](https://peps.python.org/pep-0008/) where practical. Use clear function names, lowercase variable names with underscores, and readable spacing.
- For SQL, use consistent formatting: uppercase SQL keywords, one major clause per line, and descriptive table aliases. For example, `patient_admissions AS admissions` is better than `patient_admissions AS a`.
- If you copy a chunk of code a third time, turn it into a reusable function, query, or helper script.
- Put reusable R code in `R/functions.R`.
- Put reusable Python code in a `python/` or `src/` folder.
- Put reusable SQL queries in a `sql/` folder.

## The one absolute rule

No data on GitHub. Ever. If you accidentally commit a data file, do not just delete it in the next commit, because it stays in the git history. Tell the lab data scientist or the PI immediately so we can scrub the history properly. Nobody will be upset about the mistake. Staying quiet about it is the only wrong move.
