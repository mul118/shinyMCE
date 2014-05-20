# Demo file

# 
###############################################################################

library(shinyMCE)

#1: Basic example
runApp(list(
  ui = fluidPage(
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
  ),
  
  server = function(input, output, session) { 
    output$editor1_content <- renderPrint({input$editor1})
  }
))


#2: Editor with options
editor_opts <- 
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
                     editor_opts),
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


#3: Update editor from server
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


#4: Multiple Editors via renderUI
runApp(list(
  ui = fluidPage(
    #In dynamic environment, necessary to load the resource first
    singleton(tags$head(tags$script(src ="//tinymce.cachefly.net/4.0/tinymce.min.js"))),
    fluidRow(
      column(6, offset = 3,
             h2('tinyMCE Editors:'),
             uiOutput('editor1'),
             hr(),
             uiOutput('editor2')
      )
    )
  ),
  
  server = function(input, output, session) { 
    output$editor1 <- renderUI({tinyMCE('editor1', 'Editor 1')})
    output$editor2 <- renderUI({tinyMCE('editor2', 'Editor 2')})
  }
))
