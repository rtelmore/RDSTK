.onLoad <- function(libname, pkgname){
  if (is.null(getOption("RDSTK_api_base"))) {
    default_base <- "http://www.datasciencetoolkit.org"
    options("RDSTK_api_base"=default_base)
  }
}
