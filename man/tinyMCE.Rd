\name{tinyMCE}
\alias{tinyMCE}
\title{tinyMCE editor element}
\usage{
tinyMCE(inputId, content = "Click to edit text.", options = NULL)
}
\arguments{
  \item{inputId}{inputId associated with the editor}

  \item{content}{editor content. May be a string or HTML
  embedded in an \code{\link{HTML}} function}

  \item{options}{a string containing tinyMCE initialization
  options. See demos or source code on the tinyMCE examples
  website
  \code{\link{http://www.tinymce.com/tryit/basic.php}} for
  more information.}
}
\value{
a tinyMCE editor element that can be included in a panel
}
\description{
Display a tinyMCE editor within an application page.
}

