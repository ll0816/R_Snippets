library(lme4) 
politeness = read.csv("~/Documents/R dir/politeness_data.csv")
boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)
head(politeness)
politeness.model = lmer(frequency ~ attitude + (1|subject) + (1|scenario), data=politeness)
summary(politeness.model)
politeness.model = lmer(frequency ~ attitude +gender + (1|subject) +(1|scenario), data=politeness)
summary(politeness.model)
# null model
politeness.null = lmer(frequency ~ gender + (1|subject) + (1|scenario), data=politeness,REML=FALSE)
#full model random intercept model.
politeness.model = lmer(frequency ~ attitude + gender + (1|subject) + (1|scenario), data=politeness, REML=FALSE)
#perform the likelihood ratio test
anova(politeness.null,politeness.model)
#interaction
full model: frequency ~ attitude*gender 
reduced model: frequency ~ attitude + gender
coef(politeness.model)
#random slope model
politeness.model = lmer(frequency ~ attitude +gender + (1+attitude|subject) +(1+attitude|scenario),data=politeness,REML=FALSE)
coef(politeness.model)
politeness.null = lmer(frequency ~ gender + (1+attitude|subject) + (1+attitude|scenario), data=politeness, REML=FALSE)
anova(politeness.null,politeness.model)
citation()
citation("lme4")
