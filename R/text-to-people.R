#' @title Finds some good info related to people.
#' 
#' @description 
#' This function will return information such as first and last name, 
#'   title, etc. for a given person or persons.
#'
#' @param text A text string containing a person's name or a comma-separated 
#'   list of names.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#' A data.frame containing
#'   \item{gender}{Gender of the person.}
#'   \item{first_name}{The person's first name}
#'   \item{title}{A title associated with this person.}
#'   \item{surnames}{The person's last name}
#'   \item{start_index}{The beginning of the matched string in the original string.}
#'   \item{end_index}{The end of the matched string in the original string.}
#'   \item{matched_string}{The matched string used to look up this information.}
#'   
#' @seealso 
#'   \code{\link{curlPerform}},
#'   \code{\link{getCurlHandle}},
#'   \code{\link{dynCurlReader}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#text2people
#'
#' @examples
#' \dontrun{
#' 		text2people("Tim O'Reilly, Archbishop Huxley")
#' }
#' 
#' @export
text2people <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2people/", sep="")
  r = RCurl::dynCurlReader()
  RCurl::curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
                     curl=session)
  clean.r <- lapply(fromJSON(r$value()), 
                    lapply, 
                    function(x) ifelse(is.null(x), NA, x))
  result <- plyr::ldply(clean.r, data.frame)
  return(result)
}
