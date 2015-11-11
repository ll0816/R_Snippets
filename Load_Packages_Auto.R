packagelist <- c("httr","sqldf","XML","data.table")
newpackage <- packagelist[!(packagelist %in% installed.packages()[,"Package"])]
if(length(newpackage)>0) install.packages(newpackage)
sapply(packagelist, require, character.only=TRUE, quietly=TRUE)
