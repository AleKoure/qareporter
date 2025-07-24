
# 🤖 AI Review Prompt for R Packages

This markdown file defines a structured prompt for AI-based code review of R packages, incorporating best practices from:

- Mozilla Science Lab’s [Code Review Guide](https://mozillascience.github.io/codeReview/review.html)
- rOpenSci [Packaging Guide](https://ropensci.github.io/dev_guide/building.html)
- Tidyverse Style Guide
- r-pkgs book by Hadley Wickham

---

## 🌐 1. Mozilla Code Review Principles

> “A code review is a chance for people to look at code and offer improvement—not just on style or correctness, but on design, purpose, usability, and documentation.”

### Key Mozilla Guidelines:
- **Design**: Code should be purposeful, not over-engineered. Keep it as simple as possible.
- **Correctness**: Check for bugs or incorrect assumptions.
- **Usability**: APIs should be easy to use and not surprise users.
- **Documentation**: Good comments, documentation, and examples are critical.
- **Tests**: Code should be accompanied by automated tests.
- **Modularity**: Break code into small, reusable parts.

---

## 📦 2. rOpenSci Packaging Guide

From [https://ropensci.github.io/dev_guide/building.html](https://ropensci.github.io/dev_guide/building.html):

### Required Structure:
- `DESCRIPTION`: includes valid `Title`, `Description`, `URL`, `BugReports`, and `License`.
- `README.md` generated from `README.Rmd`.
- Vignettes stored in `vignettes/`, at least one HTML-rendered.
- Functions documented with `roxygen2`, includes `@examples`, `@export`, etc.
- Data objects documented with `@format`.
- Tests written with `testthat`.

### Other Key Points:
- Avoid using `install_github()`; prefer CRAN, r-universe, or local install.
- Pre-knit vignettes to avoid runtime dependencies.
- Ensure `?pkg` and `?pkg-package` documentation exists.
- Provide meaningful user-facing error messages.

---

## 🤖 AI Prompt Template

Use the following structured prompt to guide an LLM to review an R package:

> You are reviewing an R package submitted for scientific use. Evaluate it using the following dimensions, referencing the Mozilla Code Review Principles and rOpenSci Packaging Guidelines:
>
> ### ✅ Structure & Documentation
> - Does the package include all required files (DESCRIPTION, NAMESPACE, README, LICENSE)?
> - Is there at least one well-written HTML vignette?
> - Are installation instructions and usage examples clear?
>
> ### 🧠 Design & Clarity
> - Are functions concise, modular, and well-named?
> - Is the API intuitive and consistent?
> - Are code comments meaningful and up-to-date?
>
> ### 🧪 Tests & Reliability
> - Are there adequate unit tests using `testthat`?
> - Are tests isolated and cover edge cases?
> - Are CI checks included and passing?
>
> ### 💡 Code Style
> - Does the code follow tidyverse styling? (indentation, object names, spacing)
> - Are there magic numbers, deep nesting, or code duplication?
>
> ### 🚀 Performance & Usability
> - Are vectorized operations used when possible?
> - Are user-facing errors and messages helpful?
> - Does the UI/API make it easy to use the package correctly?
>
> ### 📈 Maintainability
> - Is the package scalable and well-documented?
> - Is there technical debt or code smell?
> - Are helper functions reused appropriately?
> 
> ## Technical details 
> 
> ### Session Info
> - R Version
> - Environment
> - Installed packages
> 
> ### Lints
> - Lint summary
> - Call to action
> 
> ### RCMD check
> - Summary of devtools::check()
> 
> ### Code Coverage
> - Code coverage results and suggestions
---

## 🔁 Output Format

Ask the AI to return:

- ✅ **Strengths**
- ⚠️ **Improvements**
- 🔧 **Refactor Suggestions**
- 🚫 **Red Flags or Blockers**
- **Technical Details** - Careful formatting of lists
Example:

```markdown
# Audit report - {{package name}}

## ✅ Strengths
1. Clear and consistent API
2. Excellent vignette and README

## ⚠️ Improvements
1. DESCRIPTION missing `BugReports` URL
2. Some duplicated logic in `R/utils.R`

## 🔧 Suggestions
1. Factor out repetitive code into `parse_input()` helper

## 🚫 Red Flags
1. No unit tests found

## Technical Details
1. add all summary of coveracge checks etc here.. and high level Summary of lints 
```

---

## 🧩 Optional Automation

- You can integrate this prompt in a GitLab Merge Request template.
- Linting: Use `lintr::lint_package()`.
- Testing: Run `devtools::test()` in CI.
- Docs: Render with `pkgdown::build_site()`.

