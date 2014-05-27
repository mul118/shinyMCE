library(shiny)
library(shinyMCE)

function(input, output, session) { 
  
  observe({
    updateTinyMCE(session, 'editor1', paste0('Update button has been pressed ', input$update_editor1,' times'))
  })
  
  output$editor1_content <- renderPrint({input$editor1})
}