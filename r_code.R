#System Time in char
as.character(Sys.time())

#R basic info
R.version$version.string

#set working dir
getwd()
setwd()

#whether file / dir exist
path <- getwd()
file.exists(path)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip" #set prefered filename
download.file(url, file.path(path, f))

#check whether dir exsit, create if not.
if (!file.exists(path)) dir.create(path)

#interact with cmd-line
cmd <- paste("unzip", file.path(path, f)) # if need, use paste0()
system(cmd)

#show all files & dir names in current wd
list.files(path)
list.files(path, recursive=TRUE) #including files in child file

#create dir if not exist
if(!file.exists("dir name")) {
    dir.create("dir name")
}

#read xlsx parameter colIndex & rowIndex which celler u wanna pick
library(xlsx)
read.xlsx("filepath", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex)

#read XML
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
data <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(data)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[3]]
xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode, "//name", xmlValue)

# read json
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login
jdata <- toJSON(iris, pretty=TRUE)
iris2 <- fromJSON(jdata)

# use keys to do joins
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a', 'b', 'dt2'), z=5:7)
setkey(DT1, x) 
setkey(DT2, x)
merge(DT1, DT2)

# use keys to fast reading
big_df <- data.frame(x=rnorm(1E6), y=rnorm(1E6))
file <- tempfile()  #create a name for temp file
write.table(big_df, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))   #system.time measure code execute time
system.time(read.table(file, header=TRUE, sep="\t")) # so slow

# file info
file.info("getdata-data-EDSTATS_Country.csv")

#processing time of R
st <- proc.time()
print (proc.time() - st)

#file2Data.table
fileToDataTable <- function (f) {
    df <- read.table(f)
    dt <- data.table(df)
}

# set names for data.table
require(data.table)
setnames(data_table, "name", "name")

#write dataset in txt file
write.table(Dataset, "filename.txt")
