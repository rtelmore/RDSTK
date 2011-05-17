\name{ip2coordinates}
\alias{ip2coordinates}

\title{Finds geographic information related to an IP address.}

\description{
This function returns geographic information related to one or possibly more IP addresses.  
}

\usage{
ip2coordinates(ip, session=getCurlHandle())
}

\arguments{
  \item{ip}{A string containing a single IP address or multiple, comma-separated IPs.}
  \item{session}{This is the CURLHandle object giving the structure for the options and that will process the command. For curlMultiPerform, this is an object of class code MultiCURLHandle-class.}
}

\value{
A data.frame containing
	\item{ip.address}{IP address of the request}
	\item{ip.address}{Longitude of the IP address' location}
	\item{country_name}{Country of origin}
	\item{postal_code}{Post code}
	\item{region}{State in the US; not sure elsewhere}
	\item{locality}{City in the US; not sure elsewhere}
	\item{country_code}{Two letter country abbreviation}
	\item{dma_code}{Hell if I know}
	\item{latitude}{Latitude of the IP address' location}
	\item{country_code3}{If two digits aren't enough!}
	\item{area_code}{Area code in the US; not sure elsewhere}
}

\references{
http://www.datasciencetoolkit.org/developerdocs#ip2coordinates
}

\author{
Ryan Elmore
}

\seealso{ \code{\link{getURL}}, \code{\link{getCurlHandle}}}

\examples{
	\dontrun{
		ip2coordinates("134.184.34.17, 48.82.68.161")
	}
}