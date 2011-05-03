\name{coordinates2politics}
\alias{coordinates2politics}

\title{
Coverts latitude and longitude coordinates to politics expressions.
}

\description{
A function to return the countries, states, provinces, cities, constituencies and neighborhoods that the latitude and longitude point lies within (from DSTK website).
}

\usage{
coordinates2politics(latitude, longitude, session=getCurlHandle())
}

\arguments{
  \item{latitude}{The latitude (numeric) of the point you wish to reference.}
  \item{longitude}{The longitude (numeric) of the point you wish to reference.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
Returns a JSON string.  
}

\references{
http://www.datasciencetoolkit.org/developerdocs#coordinates2politics
}

\author{
Ryan Elmore
}

\seealso{ \code{\link{getURL}}, \code{\link{getCurlHandle}}}

\examples{
coordinates2politics(37.769456, -122.429128)
}
