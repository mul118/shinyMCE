library(shiny)
library(shinyMCE)

editor_opts <- 
  'inline: true, 
        plugins: ["advlist autolink lists link image charmap print preview anchor",
                  "searchreplace visualblocks code fullscreen",
                  "insertdatetime media table contextmenu paste"],
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"'        


shinyUI(fluidPage(
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
))