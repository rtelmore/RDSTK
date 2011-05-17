## Ryan Elmore
## Date: 10 May 2011
## Description: Contrived example for the RDSTK

outfile <- "~/Talks/DenverRUG/RDSTK/Examples/data/example.RDdata"

load(outfile)

library(XML)

## Get some random IP addresses
url <- 
  "http://sqa.fyicenter.com/Online_Test_Tools/Test_IP_Address_Generator.php"

html2 <- postForm(url, Count='30', Submit="Start")
doc <- htmlTreeParse(html2, useInternalNodes=T)
nset.stats <- getNodeSet(doc, "//textarea[@name='Subject']")
string <- toString.XMLNode(nset.stats[[1]])
ips <- gsub("\n", ", ", strsplit(string, "[><]")[[1]][3])
ips.str <- "161.104.173.59, 205.25.224.2, 243.2.10.126, 104.249.162.240, 201.213.176.125, 158.79.212.20, 205.62.25.181, 168.54.32.74, 157.204.133.108, 228.102.110.217, 104.120.89.207, 114.250.193.61, 208.114.185.112, 193.143.132.144, 205.156.71.118, 210.102.192.113, 52.70.220.26, 172.75.243.21, 194.78.228.54, 73.166.114.27, 25.45.138.218, 187.16.107.137, 171.177.1.127, 25.192.239.76, 8.204.102.179, 25.90.200.218, 167.173.18.240, 85.131.13.110, 176.151.73.108, 166.179.245.83, "
i2c.new <- ip2coordinates(ips.str)

ip2c.one <- ip2coordinates(strsplit(ips.str, ",")[[1]][1])

save.image(file=outfile)
