\name{RDSTK-package}
\alias{RDSTK-package}
\alias{RDSTK}
\docType{package}
\title{RDSTK: A R wrapper for the Data Science Toolkit API}
\description{
This package contains several functions that provide direct access to the Data Science Toolkit API.  See www.datasciencetoolkit.org for an overview of the API.  The package is an attempt to R-ify calls to this API.

By default the packages accesses the API at www.datasciencetoolkit.org. Alternatively, because it is possible to clone the DSTK service on a local machine, you can point the package to an alternate API using \code{options("RDSTK_api_base"="http://localhost:8080")}. 

\bold{Important:} Ensure that the alternate API does \emph{not} have a trailing slash.
}

\details{
\tabular{ll}{
Package: \tab RDSTK\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2013-05-13\cr
License: \tab BSD\cr
LazyLoad: \tab yes\cr
}
}

\author{
Ryan Elmore and Andrew Heiss \cr
Maintainer: Ryan Elmore <rtelmore@gmail.com>
}

\references{
http://www.datasciencetoolkit.org
}

\examples{
\dontrun{
ip2coordinates("134.184.34.17, 48.82.68.161")

# Use local instance of DSTK
options("RDSTK_api_base"="http://localhost:8080")

# Revert to original DSTK API
options("RDSTK_api_base"="http://www.datasciencetoolkit.org")
}
}