#' @title Parses a text string for time information.
#' 
#' @description 
#' This function take a text string and returns any time-specific information 
#'   that it finds.
#'
#' @param text A text string containing possible time information.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#' A data.frame containing
#'   \item{duration}{Length of time in seconds of the recognized event.}
#'   \item{start_index}{The beginning of the matched string in the original string.}
#'   \item{is_relative}{Logical value for matched string.}
#'   \item{end_index}{The end of the matched string in the original string.}
#'   \item{time_seconds}{The unix timestamp of the event (time since epoch).}
#'   \item{matched_string}{The string that was used in the processing of the request.}
#'   \item{time_string}{The time string of the recognized time event.}
#'   
#' @seealso 
#'   \code{\link{curlPerform}},
#'   \code{\link{getCurlHandle}},
#'   \code{\link{dynCurlReader}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#text2times
#'
#' @examples
#' \dontrun{
#' text <- "02/01/2010, Meeting this Wednesday"
#' text2times(text)
#' }
#' 
#' @export
text2times <- function(text, session = RCurl::getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2times/", sep="")
  r = RCurl::dynCurlReader()
  RCurl::curlPerform(postfields = text, url = api, post = 1L, 
                     writefunction = r$update,
                     curl = session)
  clean.r <- lapply(rjson::fromJSON(r$value()), 
                    lapply, 
                    function(x) ifelse(is.null(x), NA, x))
  result <- plyr::ldply(clean.r, data.frame)
  return(result)
}
