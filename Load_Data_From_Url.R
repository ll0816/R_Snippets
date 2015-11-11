getwd()
library(RCurl)
data <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",ssl.verifypeer=0L, followlocation=1L)
x <- read.csv(text=data)
################################
writeLines(data,'temp.csv')
d <- read.csv('temp.csv', header = T, stringsAsFactors = F)
head(d )
