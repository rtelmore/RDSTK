## Ryan Elmore
## Date: 16 May 2011
## Description: Examples from DSTK using the RDSTK

setwd(paste("~/Side_Projects/RDSTK/src/examples/", sep = ""))

library(RDSTK)

address <- "2543 Graystone Place, Simi Valley, CA 93065"
s2c <- street2coordinates(address)

ip.string <- "134.184.34.17, 48.82.68.161"
i2c <- ip2coordinates(ip.string)

cords <- coordinates2politics(37.769456, -122.429128)

sentences <- "But this does, it contains enough words. So does this one, it appears correct. This is long and complete enough too."
t2s <- text2sentences(sentences)

t2p <- text2people("Tim O'Reilly, Archbishop Huxley")

html <- '<html><head><title>MyTitle</title></head><body><script type="text/javascript">something();</script><div>Some actual text</div></body></html>'
h2t <- html2text(html)

text <- "02/01/2010, Meeting this Wednesday"
t2t <- text2times(text)

## End Demo