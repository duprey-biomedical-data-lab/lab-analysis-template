# Data folder

This folder exists on your local machine only. Nothing in it gets pushed to GitHub. The `.gitignore` at the repo root blocks the contents, and the lab policy blocks it twice.

## How to use it

- `raw/` holds the data exactly as you received it. Never edit these files. If the source sends a corrected file, keep both and note the change in your analysis plan.
- `processed/` holds analysis-ready datasets that the scripts create. Anything in here should be rebuildable by rerunning the scripts, so treat it as disposable.

## Where the real data lives

The canonical copy of every dataset stays on the lab's approved secure storage (ask the PI or the lab data scientist for access). When you clone a project repo, copy the raw data from there into `data/raw/` locally, then run the scripts.

## Documenting the data

Every project needs a filled-in data dictionary in `docs/data_dictionary.md`. The template for it is in `docs/data_dictionary_template.md`. The dictionary contains variable names and descriptions, never actual values, so it is safe to commit and it is often the single most useful file for a reviewer.
