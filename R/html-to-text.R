#' @title Identifies the text of an html string.
#' 
#' @description 
#' This function is used for processing an html string in order to find the 
#'   main text of this string.  The output is a list that contains the extracted 
#'   text.
#'
#' @param html A string containing valid html code.
#' @param session The CURLHandle object giving the structure for the options 
#'   and that will process the command. For curlMultiPerform, this is an object 
#'   of class code MultiCURLHandle-class.
#' 
#' @return 
#'   A list with the main text in the html.
#'   
#' @seealso 
#'   \code{\link{curlPerform}},
#'   \code{\link{getCurlHandle}},
#'   \code{\link{dynCurlReader}}
#'
#' @references 
#'  http://www.datasciencetoolkit.org/developerdocs#html2text
#'
#' @examples
#' \dontrun{
#' 		html <- '<html><head><title>MyTitle</title></head><body><script 
#' 		         type="text/javascript">something();</script><div>Some actual 
#' 		         text</div></body></html>'
#' 	  html2text(html)
#' }
#' 
#' @export
html2text <- function(html, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/html2text/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=html, url=api, post=1L, writefunction=r$update, 
              curl=session)
  return(fromJSON(r$value()))
}
