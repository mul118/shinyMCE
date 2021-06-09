#' tinyMCE editor element
#'
#' Display a tinyMCE editor within an application page.
#' @param inputId id associated with the editor
#' @param content editor content. May be a string or HTML embedded in an \code{\link{HTML}} function
#' @param options string containing tinyMCE initialization options. See demos or source code on the tinyMCE website http://www.tinymce.com/tryit/basic.php for more information.
#' @return a tinyMCE editor element that can be included in a panel
#' @examples
#' # Basic editors
#' tinyMCE('editor1', 'Click to edit text')
#' tinyMCE('editor1', HTML('<p><strong>Click</strong> to edit text</p>'))
#' 
#' # With options
#' tinyMCE('editor1', 'This is an inline tinyMCE editor', 'inline: true')
#' @import shiny
#' @export
tinyMCE <- function(inputId, content, options = NULL){
  tagList(
    singleton(tags$head(tags$script(src ="//cloud.tinymce.com/4/tinymce.min.js"))),
    tags$div(id = inputId, class = "shinytinymce", content, style = "resize: none; width: 100%; height: 100%; border-style: none; background: gainsboro;"),
    tags$script(paste0('tinymce.init({selector:".shinytinymce", ', options, '});')),
    singleton(tags$head(tags$script(src = 'shinyMCE/shiny-tinymce-bindings.js')))
  )
}

#' Update tinyMCE editor 
#'
#' Update tinyMCE editor object to display new content.
#' @param session the \code{session} object passed to function given to \code{shinyServer}
#' @param inputId id associated with the tinyMCE editor
#' @param content new content to place withing the editor
#' @import shiny
#' @export
updateTinyMCE <- function(session, inputId, content){
  data_list <- list(id = inputId, content = content)
  session$sendCustomMessage(type = "shinyMCE.update", data_list)
}

