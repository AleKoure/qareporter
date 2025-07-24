
# qareporter

The goal of qareporter is to generate QA report using LLMs.

In the initial draft phase, it gathers data using:

- devtools::check()
- lintr::lint_package()
- covr::package_coverage()
- Dump package to a single file

and performs an API call with `ellmer` and this [prompt](./inst/package_review_prompt.md)

## How to use

Setup Gemini API by adding the environmental variable

```
GEMINI_API_KEY
```

This is a basic example that generate a report for `ini` package

``` r
library(qareporter)
build_report("https://github.com/dvdscripter/ini")
```

- [Example report generated for `ini`](./test_review.md)
