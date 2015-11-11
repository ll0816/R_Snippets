pitch <- c(233,204,242,130, 112, 142)
sex <- c(rep("femail",3), rep("male", 3))
my.df <- data.frame(sex, pitch)
my.df
xmdl <- lm(pitch ~ age, my.df)
summary(xmdl)
plot(fitted(xmdl), residuals(xmdl))
#Test Normality of residuals
hist(residuals(xmdl))
qqnorm(residuals(xmdl)))
# check influential data points
dfbeta(xmdl)
