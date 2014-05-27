library(shiny)
library(shinyMCE)

shinyUI(fluidPage(
  fluidRow(
    column(6, offset = 3,
           hr(),
           h2('tinyMCE Editor:'),
           tinyMCE('editor1', 'Update button has been pressed 0 times'),
           br(),
           actionButton('update_editor1', 'Update Editor'),
           hr(),
           h2('Editor Content:'),
           verbatimTextOutput('editor1_content')
    )
  )
))