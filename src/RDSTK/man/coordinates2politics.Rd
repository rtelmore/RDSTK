\name{coordinates2politics}
\alias{coordinates2politics}

\title{
Coverts latitude and longitude coordinates to politics expressions.
}

\description{
A function to return the countries, states, provinces, cities, constituencies and neighborhoods that the latitude and longitude point lies within (from DSTK website).
}

\usage{
coordinates2politics(latitude, longitude)
}

\arguments{
  \item{latitude}{
The latitude (numeric) of the point you wish to reference.
}
  \item{longitude}{
The longitude (numeric) of the point you wish to reference.
}
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

\examples{
coordinates2politics(37.769456, -122.429128)
}
