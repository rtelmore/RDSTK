#' @title Identifies sentences in a text string.
#' 
#' @description 
#' This function returns the legitimate sentences (if they exist) from a text
#'  string. 
#'
#' @param text A string (hopefully) containing sentences.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#'   A list containing
#'     \item{sentences}{A string identifying the sentences in the text.}
#'   
#' @seealso 
#'   \code{\link{curlPerform}},
#'   \code{\link{getCurlHandle}},
#'   \code{\link{dynCurlReader}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#text2sentences
#'
#' @examples
#' \dontrun{
#' 			sentences <- "But this does, it contains enough words. So does this 
#' 			one, it appears correct. This is long and complete enough too."
#' 			text2sentences(sentences)
#' }
#' 
#' @export

text2sentences <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2sentences/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  result <- fromJSON(r$value())
  return(result)
}
