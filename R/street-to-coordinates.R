#' @title Converts a street address into useful geographic information.
#' 
#' @description 
#' This function returns a host of geographic information related to a 
#'   given street address.
#'   
#' @param address A text/string address
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return A data.frame containing:
#'  \item{full.address}{The complete address that was analyzed.}
#'  \item{country_name}{The country of the address.}
#'  \item{longitude}{The longitude associate with the address.}
#'  \item{fips_county}{The fips county of the address. WTF?}
#'  \item{region}{The region of the address (state in US).}
#'  \item{locality}{The locality (city in US) of the address.}
#'  \item{confidence}{The degree of confidence associated with retrieving the address' information.  Presumable near one is good.}
#'  \item{street_address}{Exactly as it sounds.}
#'  \item{country_code}{Country code of the address.}
#'  \item{street number}{The street number of the address.}
#'  \item{country_code3}{For those times when 2 just ain't enough!}
#'  \item{country_code}{Country code of the address.}
#'  \item{latitude}{The latitude of the address.}
#'  \item{street_name}{Why are you still reading this?  It's a street name!}
#'
#' @seealso \code{\link{getURL}}, \code{\link{getCurlHandle}}
#' 
#' @references 
#'   http://www.datasciencetoolkit.org/developerdocs#street2coordinates
#'  
#' @examples
#' \dontrun{
#' street2coordinates("2543 Graystone Place, Simi Valley, CA 93065")
#' }
#' 
#' @export
street2coordinates <- function(address, session=getCurlHandle(), ...) {
  api <- paste(getOption("RDSTK_api_base"), "/street2coordinates/", sep="")
  get.addy <- getURL(paste(api, URLencode(address, reserved = TRUE), sep=""), curl=session, ...)
  clean.addy <- lapply(fromJSON(get.addy), 
                       lapply, 
                       function(x) ifelse(is.null(x), NA, x))
  result <- ldply(clean.addy, data.frame)
  names(result)[1] <- "full.address"
  return(result)
}
