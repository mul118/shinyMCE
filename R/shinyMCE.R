#' tinyMCE editor element
#'
#' Display a tinyMCE editor within an application page.
#' @param inputId inputId associated with the editor
#' @param content editor content. May be a string or HTML embedded in an \code{\link{HTML}} function
#' @param options a string containing tinyMCE initialization options. See demos or source code on the tinyMCE examples website \code{\link{http://www.tinymce.com/tryit/basic.php}} for more information.
#' @return a tinyMCE editor element that can be included in a panel
#' @export
tinyMCE <- function(inputId, content = 'Click to edit text.', options = NULL){
  tagList(
    singleton(HTML('<script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>')),
    singleton(tags$script(src = 'shinyMCE/shiny-tinymce-bindings.js')),
    tags$div(id = inputId, class = "shinytinymce", content, style = "resize: none; width: 100%; height: 100%; border-style: none; background: gainsboro;"),
    tags$script(paste0('tinymce.init({selector:".shinytinymce", ', options, '});'))
  )
}

#' Update tinyMCE editor 
#'
#' Update tinyMCE editor object to display new content.
#' @param session the \code{session} object passed to function given to \code{shinyServer}
#' @param inputId id associated with the tinyMCE editor
#' @param content new content to place withing the editor
#' @export
updateTinyMCE <- function(session, inputId, content){
  data_list <- list(id = inputId, content = content)
  session$sendCustomMessage(type = "shinyMCE.update", data_list)
}

