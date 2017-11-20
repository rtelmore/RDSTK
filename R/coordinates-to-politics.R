#' @title Coverts latitude and longitude coordinates to politics expressions.
#' 
#' @description 
#' A function to return the countries, states, provinces, cities, 
#'   constituencies and neighborhoods that the latitude and longitude 
#'   point lies within 
#'
#' @param latitude The latitude (numeric) of the point you wish to reference.
#' @param longitude The longitude (numeric) of the point you wish to reference.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#'   Returns a JSON string.  
#'   
#' @seealso \code{\link{getURL}}, \code{\link{getCurlHandle}}
#' 
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#coordinates2politics
#'
#' @examples
#' \dontrun{
#' 	coordinates2politics(37.769456, -122.429128)
#' }
#' 
#' @export

coordinates2politics <- function(latitude, longitude, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/coordinates2politics/", sep="")
  result <- RCurl::getURL(paste(api, latitude, "%2c", longitude, sep=""), curl=session)
  return(result)
}
