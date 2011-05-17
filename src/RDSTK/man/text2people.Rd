\name{text2people}
\alias{text2people}

\title{Finds some good info related to people}

\description{
This function will return information such as first and last name, title, etc. for a given person or persons.
}

\usage{
text2people(text, session=getCurlHandle())
}

\arguments{
  \item{text}{A text string containing a person's name or a comma-separated list of names.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
A data.frame containing
 \item{gender}{Gender of the person.}
 \item{first_name}{The person's first name}
 \item{title}{A title associated with this person.}
 \item{surnames}{The person's last name}
 \item{start_index}{The beginning of the matched string in the original string.}
 \item{end_index}{The end of the matched string in the original string.}
 \item{matched_string}{The matched string used to look up this information.}
}

\references{
http://www.datasciencetoolkit.org/developerdocs#text2people
}

\author{
Ryan Elmore
}

\seealso{ \code{\link{curlPerform}}, 
		  \code{\link{getCurlHandle}},
		  \code{\link{dynCurlReader}}}

\examples{
	\dontrun{
		text2people("Tim O'Reilly, Archbishop Huxley")
	}
}
