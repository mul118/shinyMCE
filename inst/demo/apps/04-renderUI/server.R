library(shiny)
library(shinyMCE)

function(input, output, session) { 
  output$editor1_ui       <- renderUI({tinyMCE('editor1', 'Editor 1')})
  output$editor1_content  <- renderPrint({input$editor1})
}