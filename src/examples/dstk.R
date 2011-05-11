## Ryan Elmore
## Date: 10 May 2011
## Description: Examples from DSTK using the RDSTK

setwd(paste("~/Side_Projects/RDSTK/src/examples/", sep = ""))

library(RDSTK)

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
