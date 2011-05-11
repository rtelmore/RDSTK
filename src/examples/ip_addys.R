## Ryan Elmore
## Date: 10 May 2011
## Description: Contrived example for the RDSTK

setwd(paste("~/Side_Projects/RDSTK/src/examples/", sep = ""))

library(RDSTK)
library(XML)

## Get some random IP addresses
url <- 
  "http://sqa.fyicenter.com/Online_Test_Tools/Test_IP_Address_Generator.php"

html <- postForm(url, Count='30', Submit="Start")
doc <- htmlTreeParse(html, useInternalNodes=T)
nset.stats <- getNodeSet(doc, "//textarea[@name='Subject']")
string <- toString.XMLNode(nset.stats[[1]])
ips <- gsub("\n", ",", strsplit(string, "[><]")[[1]][3])
ip2coordinates(ips)


