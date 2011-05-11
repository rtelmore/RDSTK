## Ryan Elmore
## Date: 10 May 2011
## Description: Contrived example for the RDSTK

setwd(paste("~/Side_Projects/RDSTK/src/examples/", sep = ""))

library(RDSTK)
library(XML)

street2coordinates("2543 Graystone Place, Simi Valley, CA 93065")
ip2coordinates("134.184.34.17, 48.82.68.161")
coordinates2politics(37.769456, -122.429128)
sentences <- "But this does, it contains enough words. So does this one, it appears correct. This is long and complete enough too."
text2sentences(sentences)
text2people("Tim O'Reilly, Archbishop Huxley")
html <- '<html><head><title>MyTitle</title></head><body><script type="text/javascript">something();</script><div>Some actual text</div></body></html>'
html2text(html)
text <- "02/01/2010, Meeting this Wednesday"
text2times(text)

## Get some random IP addresses
url <- 
  "http://sqa.fyicenter.com/Online_Test_Tools/Test_IP_Address_Generator.php"

html <- postForm(url, Count='30', Submit="Start")
doc <- htmlTreeParse(html, useInternalNodes=T)
nset.stats <- getNodeSet(doc, "//textarea[@name='Subject']")
string <- toString.XMLNode(nset.stats[[1]])
ips <- gsub("\n", ",", strsplit(string, "[><]")[[1]][3])
ip2coordinates(ips)


