#Step 1
data <- read.csv("seaflow_21min.csv")
str(data)
sum(data$pop=="synecho")
summary(data)

#Step 2
library(caret)
library(ggplot2)
index <- createDataPartition(data$pop, p=.5,list=FALSE,times =1)
train <-data[index,]
test <- data[-index,]
train$pop = as.factor(train$pop)
test$pop = as.factor(test$pop)
str(train)
mean(train$time)

#Step 3
df <-data
ggplot(df, aes(x=pe, y=chl_small,color=pop))+geom_point(size=5) 

#Step 4
library(rpart)
library(rpart.plot)
cartmodel <- rpart(pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small,method="class",data=train)
prp(cartmodel)
print(cartmodel)

#Step 5
pred=predict(cartmodel,newdata=test,type="class")
sum(test$pop==pred)/length(pred)

#Step 6
library(randomForest)
fol <- formula(pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small)
rfmodel <- randomForest(fol, data=train)
pred2 <- predict(rfmodel, newdata=test,type="class")
sum(test$pop == pred2)/length(pred2)
importance(rfmodel)

#Step 7
library(e1071)
svmmodel <- svm(fol,data=train)
pred3 <- predict(svmmodel, newdata=test,type="class")
sum(pred3==test$pop)/length(pred3)

#Step 8
table(true=test$pop, pred=pred)
table(true=test$pop, pred=pred2)
table(true=test$pop, pred=pred3)
722/(722+7+5620)
1361/(1361+379+11+8517)
340/(340+66+10024)

#Step 9
ggplot(df,aes(x=time,y=fsc_small))+ geom_line()
ggplot(df,aes(x=time,y=fsc_perp))+ geom_line()
ggplot(df,aes(x=time,y=fsc_big))+ geom_line()
ggplot(df,aes(x=time,y=pe))+ geom_line()
ggplot(df,aes(x=time,y=chl_small))+ geom_line()
ggplot(df,aes(x=time,y=chl_big))+ geom_line()
str(data)
rm(list=ls())
data <- read.csv("seaflow_21min.csv")
dp <- data [!data$file_id==208,]
#dp <- subset(data,file_id!=208)
208 %in% dp$file_id
index <- createDataPartition(dp$pop, p=.5,list=FALSE,times =1)
train <-dp[index,]
test <- dp[-index,]
train$pop = as.factor(train$pop)
test$pop = as.factor(test$pop)
fol <- formula(pop ~ fsc_small + fsc_perp + fsc_big + pe + chl_big + chl_small)
svmmodel <- svm(fol,data=train)
pred <- predict(svmmodel, newdata=test,type="class")
sum(pred==test$pop)/length(pred)
abs(0.9726908-0.9194106)
