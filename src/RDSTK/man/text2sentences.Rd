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
text2sentences(text, session=getCurlHandle())
}

\arguments{
  \item{text}{A string (hopefully) containing sentences. }
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
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

\seealso{ \code{\link{curlPerform}}, 
		  \code{\link{getCurlHandle}},
		  \code{\link{dynCurlReader}}}

\examples{
	\dontrun{
		sentences <- "But this does, it contains enough words. So does this one, it appears correct. This is long and complete enough too."
		text2sentences(sentences)
	}
}
