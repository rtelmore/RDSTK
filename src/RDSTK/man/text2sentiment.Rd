\name{text2sentiment}
\alias{text2sentiment}

\title{Estimates the sentiment of some text}

\description{
This function analyzes the text for words that correlate with complimentary or derogatory reviews and comments, to give an overall score for how positive or negative the text is about its subject.
}

\usage{
text2sentiment(text, session=getCurlHandle())
}

\arguments{
  \item{text}{A short piece of writing, from a sentence to a paragraph in length for best results.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
 \item{score}{A number representing the estimated sentiment, from -5 (very negative) to +5 (very positive).}
}

\references{
http://www.datasciencetoolkit.org/developerdocs#text2sentiment
}

\author{
Ryan Elmore
}

\seealso{ \code{\link{curlPerform}}, 
		  \code{\link{getCurlHandle}},
		  \code{\link{dynCurlReader}}}

\examples{
	\dontrun{
		text2sentiment("I love this hotel!")
	}
}
