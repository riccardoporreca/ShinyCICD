account_info <- lapply(
  paste0("SHINYAPPS_", c("ACCOUNT", "TOKEN", "SECRET")),
  Sys.getenv
)
do.call(rsconnect::setAccountInfo, account_info)
rsconnect::deployApp(
  appName = "ShinyCICD",
  # exclude hidden files and renv directory
  appFiles = setdiff(list.files(), "renv")
)
