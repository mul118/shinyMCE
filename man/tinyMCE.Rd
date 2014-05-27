\name{tinyMCE}
\alias{tinyMCE}
\title{tinyMCE editor element}
\usage{
tinyMCE(inputId, content, options = NULL)
}
\arguments{
  \item{inputId}{id associated with the editor}

  \item{content}{editor content. May be a string or HTML
  embedded in an \code{\link{HTML}} function}

  \item{options}{string containing tinyMCE initialization
  options. See demos or source code on the [tinyMCE
  website](http://www.tinymce.com/tryit/basic.php) for more
  information.}
}
\value{
a tinyMCE editor element that can be included in a panel
}
\description{
Display a tinyMCE editor within an application page.
}
\examples{
# Basic editors
tinyMCE('editor1', 'Click to edit text')
tinyMCE('editor1', HTML('<p><strong>Click</strong> to edit text</p>'))

# With options
tinyMCE('editor1', 'This is an inline tinyMCE editor', 'inline: true')
}

