\name{html2text}
\alias{html2text}

\title{
Identifies the text of an html string
}
\description{
This function is used for processing an html string in order to find the main
text of this string.  The output is a list that contains the extracted text.
}

\usage{
html2text(html)
}

\arguments{
  \item{html}{
A string containing valid html code.
}
}

\value{
A list with the main text in the html.
}

\references{
http://www.datasciencetoolkit.org/developerdocs#html2text
}

\author{
Ryan Elmore
}

\examples{
html <- '<html><head><title>MyTitle</title></head><body><script type="text/javascript">something();</script><div>Some actual text</div></body></html>'
html2text(html)
}