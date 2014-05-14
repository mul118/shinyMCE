# Demo file

# 
###############################################################################

library(shinyMCE)

#Basic Example
runApp(list(
  ui = fluidPage(
    fluidRow(
      column(6, offset = 3,
             hr(),
             h2('tinyMCE Editor:'),
             tinyMCE('editor1'),
             hr(),
             h2('Editor Content:'),
             verbatimTextOutput('editor1_content')
      )
    )
  ),
  
  server = function(input, output, session) { 
    output$editor1_content <- renderPrint({input$editor1})
  }
))


#Inline Editor
inline_opts <- 
        'inline: true, 
        plugins: ["advlist autolink lists link image charmap print preview anchor",
                  "searchreplace visualblocks code fullscreen",
                  "insertdatetime media table contextmenu paste"],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"'        


runApp(list(
  ui = fluidPage(
    fluidRow(
      column(6, offset = 3,
             hr(),
             h2('tinyMCE Editor:'),
             tinyMCE('editor1', 
                     HTML('<p>This is an inline <strong>tinyMCE editor</strong> embedded in a text block.  Click to edit.</p>'), 
                     inline_opts),
             hr(),
             h2('Editor Content:'),
             verbatimTextOutput('editor1_content')
      )
    )
  ),
  
  server = function(input, output, session) { 
    output$editor1_content <- renderPrint({input$editor1})
  }
))


#Update Editor
runApp(list(
  ui = fluidPage(
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
  ),
  
  server = function(input, output, session) { 
    observe({
      updateTinyMCE(session, 'editor1', paste0('Update button has been pressed ', input$update_editor1,' times'))
    })
      
    output$editor1_content <- renderPrint({input$editor1})
  }
))
