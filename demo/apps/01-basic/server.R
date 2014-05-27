library(shiny)
library(shinyMCE)

function(input, output, session) { 
  output$editor1_content <- renderPrint({input$editor1})
}