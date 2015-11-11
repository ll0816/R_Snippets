# Loop through variables
df1 <- data.frame(x=1,y=2)
df2 <- data.frame(x=3,y=4)
df3 <- data.frame(x=5,y=6)

newnames <- c('a','b')

# using get+assign
for(x in c('df1','df2','df3')){
    # get the object corresponding to name contained in x
    # N.B. tmp is a copy of the original object, not a reference to it
    tmp <- get(x)        
    # replace the col names of tmp
    names(tmp) <- newnames 
    # assign tmp to the variable corresponding to the name contained in x
    assign(x,tmp)      
}

# using eval+parse
for(x in c('df1','df2','df3')){
    # evaluate the expression: names(<text contained in x>) <- name
    eval(parse(text=paste0('names(',x,') <-','newnames')))
}

dataframes <- list()
dataframes$df1 <- data.frame(x=1,y=2)
dataframes$df2 <- data.frame(x=3,y=4)
dataframes$df3 <- data.frame(x=5,y=6)

# or if you prefer
dataframes <- list(df1=data.frame(x=1,y=2), 
                   df2=data.frame(x=3,y=4), 
                   df3=data.frame(x=5,y=6))
newnames <- c('a','b')

# using for loop
for(x in names(dataframes)){
    names(dataframes[[x]]) <- newnames 
}

# using lapply
dataframes <- lapply(dataframes,FUN=function(x) { 
    names(x) <- newnames
    return(x)
})
