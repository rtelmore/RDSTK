\name{text2times}
\alias{text2times}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Parses a text string for time information.}
\description{
This function take a text string and returns any time-specific information that it finds.  
}
\usage{
text2times(text, session=getCurlHandle())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{text}{A text string containing possible time information.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
A data.frame containing
 \item{duration}{Length of time in seconds of the recognized event.}
 \item{start_index}{The beginning of the matched string in the original string.}
 \item{is_relative}{Logical value for matched string.}
 \item{end_index}{The end of the matched string in the original string.}
 \item{time_seconds}{The unix timestamp of the event (time since epoch).}
 \item{matched_string}{The string that was used in the processing of the request.}
 \item{time_string}{The time string of the recognized time event.}
}
\references{text2times}

\author{
Ryan Elmore
}

\seealso{ \code{\link{curlPerform}}, 
		  \code{\link{getCurlHandle}},
		  \code{\link{dynCurlReader}}}

\examples{
	\dontrun{
		text <- "02/01/2010, Meeting this Wednesday"
		text2times(text)
	}
}
