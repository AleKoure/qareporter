remote_package_report <- function(package_url) {
  local_path <- withr::local_tempdir()
  git2r::clone(package_url, local_path = local_path)
  rcmd_check <- get_rcmd_check(local_path)

  report <- list()
  report$package_code <- rdocdump::rdd_extract_code(
    local_path,
    include_roxygen = TRUE,
    include_tests = TRUE,
    force_fetch = FALSE,
    repos = c("CRAN" = "https://cran.r-project.org")
  )

  report$coverage_report <- get_coverage_report(local_path)
  report$lint_report <- get_lint_report(local_path)
  report$rcmd_check_report <- rcmd_check$stdout
  report$session_info <- rcmd_check$session_info |> as.character()

  purrr::imap(report, function(report_content, report_name) {
    glue::glue("
      -------------------------
      -------------------------
      {report_name}
      -------------------------
      -------------------------
      {paste(report_content, collapse = '\n')}
    ")
  }) |>
    paste(collapse = "\n")
}

get_coverage_report <- function(path_to_package) {
  coverage_results <- covr::package_coverage(path = path_to_package, quiet = TRUE)
  covr::coverage_to_list(coverage_results) |> dput()
}

get_lint_report <- function(path_to_package) {
  lints <- lintr::lint_package(path_to_package)
  as.character(lints)
}

get_rcmd_check <- function(path_to_package) {
  result <- devtools::check(pkg = path_to_package)
  result
}
