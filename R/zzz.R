.onLoad <- function(libname, pkgname) {
  require(shiny)
  require(RJSONIO)
  addResourcePath("shinyMCE", system.file("www", package = "shinyMCE"))
}

.onAttach <- function(libname, pkgname) {
  require(shiny)    
} 