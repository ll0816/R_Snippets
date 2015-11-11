library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github","8782feace80589ff83be", "5cc6d32bd471184bea28d0ad668a569edf54abd1")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
content(req)
jsonData=content(req)
jsonData<-fromJSON(toJSON(data))


################################################
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
