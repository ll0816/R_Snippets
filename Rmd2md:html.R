require(knitr)
require(markdown)
# setwd()
#extract R code from Rmd file output a md file
knit("filename.Rmd", encoding=getOption("encoding"), quiet = T)
#md to html
markdownToHTML("filename.md", "filename.html")
