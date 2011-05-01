## Ryan Elmore
## Date: 24 April 2011
## Include project-specific functions in this file

street2coordinates <- function(address) {
  api <- "http://www.datasciencetoolkit.org/street2coordinates/"
  get.addy <- getURL(paste(api, URLencode(address), sep=""))
  result <- ldply(fromJSON(get.addy), data.frame)
  names(result)[1] <- "full.address"
  return(result)
}

ip2coordinates <- function(ip) {
  api <- "http://www.datasciencetoolkit.org/ip2coordinates/"
  get.ips <- getURL(paste(api, URLencode(ip), sep="")) 
  result <- ldply(fromJSON(get.ips), data.frame)
  names(result)[1] <- "ip.address"
  return(result)
}

coordinates2politics <- function(latitude, longitude) {
  api <- "http://www.datasciencetoolkit.org/coordinates2politics/"
  result <- getURL(paste(api, latitude, "%2c", longitude, sep=""))
  return(result)
}

text2sentences <- function(text) {
  api <- "http://www.datasciencetoolkit.org/text2sentences"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update)
  result <- fromJSON(r$value())
  return(result)
}

text2people <- function(text) {
  api <- "http://www.datasciencetoolkit.org/text2people"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update)
  result <- ldply(fromJSON(r$value()), data.frame)
  return(result)
}

html2text <- function(html) {
  api <- "http://www.datasciencetoolkit.org/html2text"
  r = dynCurlReader()
  curlPerform(postfields=html, url=api, post=1L, writefunction=r$update)
  result <- fromJSON(r$value())
  return(result)
}

text2times <- function(text) {
  api <- "http://www.datasciencetoolkit.org/text2times"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update)
  result <- ldply(fromJSON(r$value()), data.frame)
  return(result)
}
