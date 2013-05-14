\name{coordinates2statistics}
\alias{coordinates2statistics}

\title{
Coverts latitude and longitude coordinates to statistical measures about that location.
}

\description{
A function to return characteristics like population density, elevation, climate, ethnic makeup, and other statistics for points all around the world at a 1km-squared or finer resolution.
}

\usage{
coordinates2statistics(latitude, longitude, statistic, session=getCurlHandle())
}

\arguments{
  \item{latitude}{The latitude (numeric) of the point you wish to reference.}
  \item{longitude}{The longitude (numeric) of the point you wish to reference.}
  \item{statistic}{The name of the statistic you want, eg "population_density" - see the DSTK docs for a full list.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
Returns a data.frame containing
 \item{value}{A number or array of numbers representing the value at this point.}
 \item{description}{A human-readable description of what the value means.}
 \item{source}{Where the data originally came from.}
 \item{units}{Optional - what units the value is measured in.}
 \item{index}{Optional - if the value is actually an enumerated string (ie for the land cover type) this is the numerical index.}
 \item{proportion_of}{If the value is proportional (eg the percentage of residents who are below the poverty level) this gives the name of the statistic that it's a proportion of.}
}

\references{
http://www.datasciencetoolkit.org/developerdocs#coordinates2statistics
}

\author{
Ryan Elmore
}

\seealso{ \code{\link{getURL}}, \code{\link{getCurlHandle}}}

\examples{
	\dontrun{
		coordinates2statistics(37.769456, -122.429128, 'population_density')
	}
}
