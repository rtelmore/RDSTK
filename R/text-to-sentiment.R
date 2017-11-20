#' @title Estimates the sentiment of some text.
#' 
#' @description 
#'   This function analyzes the text for words that correlate with 
#'   complimentary or derogatory reviews and comments, to give an overall 
#'   score for how positive or negative the text is about its subject.
#'
#' @param text A short piece of writing, from a sentence to a paragraph in 
#'   length for best results.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#'    \item{score}{A number representing the estimated sentiment, from 
#'    -5 (very negative) to +5 (very positive).}
#'   
#' @seealso 
#'   \code{\link{curlPerform}},
#'   \code{\link{getCurlHandle}},
#'   \code{\link{dynCurlReader}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#text2sentiment
#'
#' @examples
#' \dontrun{
#' 		text2sentiment("I love this hotel!")
#' }
#' 
#' @export

text2sentiment <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2sentiment/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  return(fromJSON(r$value()))
}
