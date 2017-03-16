## Andrew Heiss
## Date: 31 January 2013
## Include project-specific functions in this file

.onLoad <- function(libname, pkgname){
  if (is.null(getOption("RDSTK_api_base"))) {
    default_base <- "http://www.datasciencetoolkit.org"
    options("RDSTK_api_base"=default_base)
  }
}

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

ip2coordinates <- function(ip, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/ip2coordinates/", sep="")
  get.ips <- getURL(paste(api, URLencode(ip), sep=""), curl=session) 
  clean.ips <- lapply(fromJSON(get.ips), 
                      lapply, 
                      function(x) ifelse(is.null(x), NA, x))
  result <- ldply(clean.ips, data.frame)
  names(result)[1] <- "ip.address"
  return(result)
}

coordinates2politics <- function(latitude, longitude, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/coordinates2politics/", sep="")
  result <- getURL(paste(api, latitude, "%2c", longitude, sep=""), curl=session)
  return(result)
}

text2sentences <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2sentences/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  result <- fromJSON(r$value())
  return(result)
}

text2people <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2people/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  clean.r <- lapply(fromJSON(r$value()), 
                      lapply, 
                      function(x) ifelse(is.null(x), NA, x))
  result <- ldply(clean.r, data.frame)
  return(result)
}

html2text <- function(html, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/html2text/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=html, url=api, post=1L, writefunction=r$update, 
              curl=session)
  return(fromJSON(r$value()))
}

text2times <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2times/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  clean.r <- lapply(fromJSON(r$value()), 
                      lapply, 
                      function(x) ifelse(is.null(x), NA, x))
  result <- ldply(clean.r, data.frame)
  return(result)
}

text2sentiment <- function(text, session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/text2sentiment/", sep="")
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  return(fromJSON(r$value()))
}

coordinates2statistics <- function(latitude, 
                                   longitude, 
                                   statistic = "population_density", 
                                   session=getCurlHandle()) {
  api <- paste(getOption("RDSTK_api_base"), "/coordinates2statistics/", sep="")
  print(paste(api, latitude, "%2c", longitude, "?statistics=", statistic, sep=""))
  r <- getURL(paste(api, latitude, "%2c", longitude, "?statistics=", statistic, sep=""), curl=session)
  result <- ldply(fromJSON(r$value()), data.frame)
  return(result)
}

