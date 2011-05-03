## Ryan Elmore
## Date: 24 April 2011
## Include project-specific functions in this file

street2coordinates <- function(address, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/street2coordinates/"
  get.addy <- getURL(paste(api, URLencode(address), sep=""), curl=session)
  result <- ldply(fromJSON(get.addy), data.frame)
  names(result)[1] <- "full.address"
  return(result)
}

ip2coordinates <- function(ip, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/ip2coordinates/"
  get.ips <- getURL(paste(api, URLencode(ip), sep=""), curl=session) 
  result <- ldply(fromJSON(get.ips), data.frame)
  names(result)[1] <- "ip.address"
  return(result)
}

coordinates2politics <- function(latitude, longitude, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/coordinates2politics/"
  result <- getURL(paste(api, latitude, "%2c", longitude, sep=""), curl=session)
  return(result)
}

text2sentences <- function(text, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/text2sentences"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  result <- fromJSON(r$value())
  return(result)
}

text2people <- function(text, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/text2people"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  result <- ldply(fromJSON(r$value()), data.frame)
  return(result)
}

html2text <- function(html, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/html2text"
  r = dynCurlReader()
  curlPerform(postfields=html, url=api, post=1L, writefunction=r$update, 
              curl=session)
  result <- fromJSON(r$value())
  return(result)
}

text2times <- function(text, session=getCurlHandle()) {
  api <- "http://www.datasciencetoolkit.org/text2times"
  r = dynCurlReader()
  curlPerform(postfields=text, url=api, post=1L, writefunction=r$update,
              curl=session)
  result <- ldply(fromJSON(r$value()), data.frame)
  return(result)
}
