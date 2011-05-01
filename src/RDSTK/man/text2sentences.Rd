\name{text2sentences}
\alias{text2sentences}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Identifies sentences in a text string.
}
\description{
This function returns the legitimate sentences (if they exist) from a text string.
}
\usage{
text2sentences(text)
}

\arguments{
  \item{text}{A string (hopefully) containing sentences. }
}

\value{
A list containing
 \item{sentences}{A string identifying the sentences in the text.}
}

\references{
http://www.datasciencetoolkit.org/developerdocs#text2sentences
}

\author{
Ryan Elmore
}

\examples{
sentences <- "But this does, it contains enough words. So does this one, it appears correct. This is long and complete enough too."
text2sentences(sentences)
}
