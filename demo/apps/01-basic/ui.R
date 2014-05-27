library(shiny)
library(shinyMCE)

shinyUI(fluidPage(
  fluidRow(
    column(6, offset = 3,
           hr(),
           h2('tinyMCE Editor:'),
           tinyMCE('editor1', 'Click to edit text'),
           hr(),
           h2('Editor Content:'),
           verbatimTextOutput('editor1_content')
    )
  )
))