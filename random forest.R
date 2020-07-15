rm(list = ls())
library(randomForest)
dat = read.csv('c:/users/du/Desktop/SPRING 2020/Business Intelligence/project1/winequality-red.csv',na.strings="?")

set.seed(1)
train = sample(1 : nrow (dat), nrow(dat)/2)
rf.X = randomForest(as.factor(quality)~., data = dat[train,],  mtry = 3, importance = TRUE)
quality_hat.rf = predict(rf.X, newdata = dat[-train,], type = 'class')
quality.test = dat[-train ,"quality"]
confusion_Matrix = table(quality_hat.rf,quality.test)
importance(rf.X)
varImpPlot(rf.X)


print(confusion_Matrix)
mean(quality_hat.rf == quality.test)