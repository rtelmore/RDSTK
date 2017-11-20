#' @title Coverts latitude and longitude coordinates to statistical measures 
#'   about that location.
#' 
#' @description 
#' A function to return characteristics like population density, elevation, 
#'   climate, ethnic makeup, and other statistics for points all around the 
#'   world at a 1km-squared or finer resolution.
#'
#' @param latitude The latitude (numeric) of the point you wish to reference.
#' @param longitude The longitude (numeric) of the point you wish to reference.
#' @param statistic The name of the statistic you want, eg "population_density" 
#'   - see the DSTK docs for a full list.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#' A data.frame containing
#'   \item{value}{A number or array of numbers representing the value at this point.}
#'   \item{description}{A human-readable description of what the value means.}
#'   \item{source}{Where the data originally came from.}
#'   \item{units}{Optional - what units the value is measured in.}
#'   \item{index}{Optional - if the value is actually an enumerated string (ie for the land cover type) this is the numerical index.}
#'   \item{proportion_of}{If the value is proportional (eg the percentage of residents who are below the poverty level) this gives the name of the statistic that it's a proportion of.}
#'      
#' @seealso 
#'   \code{\link{getURL}},
#'   \code{\link{getCurlHandle}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#coordinates2statistics
#'
#' @examples
#' \dontrun{
#' 		coordinates2statistics(37.769456, -122.429128, 'population_density')
#' }
#' 
#' @export

coordinates2statistics <- function(latitude, 
                                   longitude, 
                                   statistic = "population_density", 
                                   session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/coordinates2statistics/", sep="")
  print(paste(api, latitude, "%2c", longitude, "?statistics=", statistic, sep=""))
  r <- RCurl::getURL(paste(api, latitude, "%2c", longitude, "?statistics=", statistic, sep=""), curl=session)
  result <- plyr::ldply(fromJSON(r$value()), data.frame)
  return(result)
}
