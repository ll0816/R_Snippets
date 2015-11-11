# Get Twitter @username and #hashtag with Regex

##################################################
#install.packages("stringr")
require(stringr, quietly = T)

tweets <- read.csv(url("http://nikbearbrown.com/YouTube/MachineLearning/M08/M08_tweets_small.csv"))
tweets <- as.character(tweets[,1])
string <- unlist(strsplit(tweets, " "))
regex1 <- "(^|[^@\\w])@(\\w{1,15})\\b" # get strings with @
regex2 <- "[^[:alnum:]@_]"             # remove all punctuation except _ and @

username <- gsub(regex2, "", string[grep(regex1, string, perl = T)])
username

regex1 <- "(^|[^#\\w])#(\\w{1,15})\\b" # get strings with #
regex2 <- "[^[:alnum:]#_]"    
hashtag <- gsub(regex2, "", string[grep(regex1, string, perl = T)])
hashtag
