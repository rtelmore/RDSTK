#' @title RDSTK: R Interface for the Data Science Toolkit
#' 
#' @description 
#' This package contains several functions that provide direct access to the 
#' Data Science Toolkit API.  See www.datasciencetoolkit.org for an overview 
#' of the API.  The package is an attempt to R-ify calls to this API.
#' 
#' By default the packages accesses the API at www.datasciencetoolkit.org. 
#' Alternatively, because it is possible to clone the DSTK service on a local 
#' machine, you can point the package to an alternate API using 
#' \code{options("RDSTK_api_base"="http://localhost:8080")}.
#' 
#' @section RDSTK Functions:
#'   \code{\link{coordinates2politics}}\cr
#'   \code{\link{coordinates2statistics}}\cr
#'   \code{\link{html2text}}\cr
#'   \code{\link{ip2coordinates}}\cr
#'   \code{\link{street2coordinates}}\cr
#'   \code{\link{text2people}}\cr
#'   \code{\link{text2sentences}}\cr
#'   \code{\link{text2sentiment}}\cr
#'   \code{\link{text2times}}
#' 
#' @docType package
#' @name RDSTK
NULL

# Define globalVariables so R CMD check doesn't freak out
utils::globalVariables(".")

