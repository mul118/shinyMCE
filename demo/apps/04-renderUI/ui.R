library(shiny)
library(shinyMCE)

shinyUI(fluidPage(
  #In dynamic environment, necessary to load the resource first
  singleton(tags$head(tags$script(src ="//tinymce.cachefly.net/4.0/tinymce.min.js"))),
  fluidRow(
    column(6, offset = 3,
           h2('tinyMCE Editor:'),
           uiOutput('editor1_ui'),
           hr(),
           h2('Editor Content'),
           verbatimTextOutput('editor1_content')
    )
  )
))