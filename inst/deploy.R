#!/usr/bin/env Rscript

if (FALSE) {
  devtools::install_github('rstudio/shiny')
  devtools::install_github('rstudio/shinyapps')
}

# # first, sync shiny examples
# if (file_test('-d', '../shiny/inst/examples')) {
#   for (app in list.dirs('../shiny/inst/examples', recursive = FALSE)) {
#     dir.create(app1 <- sub('^(\\d\\d)_', '0\\1-', basename(app)), showWarnings = FALSE)
#     file.copy(list.files(app, full.names = TRUE), app1, recursive = TRUE)
#   }
# }

# then deploy all apps
library(methods)
library(shinyapps)
# ./deploy 001-hello 002-text ...
apps = commandArgs(TRUE)
# if not specified, use all the directories here
if (length(apps) == 0) {
  apps = list.dirs(path = './inst/demo/apps', full.names = FALSE, recursive = FALSE)
}
# # print the apps that were not successfully deployed
# print(apps[unlist(lapply(apps, function(app) {
#   if (inherits(try(appDir = deployApp(appDir = paste0('./demo/apps/', app), appName = paste0('shinyMCE-', app), account = 'iheart')), 'try-error')) return(1)
# })) != 0])

# print the apps that were not successfully deployed
lapply(apps, function(app) deployApp(appDir = paste0('./inst/demo/apps/', app), appName = paste0('shinyMCE-', app), account = 'iheart'))
