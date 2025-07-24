
# qareporter

The goal of qareporter is to generate QA report using LLMs...

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

- [Example generated report](./test_review.md)
- [Prompt used](./inst/package_review_prompt.md)
