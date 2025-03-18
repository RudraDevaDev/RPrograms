iris<-read.csv("C:/Users/RudraDevan G/Downloads/iris.csv")
# Loading data
data(iris)
head(iris)
tail(iris)
# Structure
str(iris)# Installing package
library(caTools)
library(randomForest)
library(caret)
# Splitting data in train and test data
split <- sample.split(iris, SplitRatio = 0.7)
split
train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")
# Fitting Random Forest to the train data set
control <- trainControl(method="repeatedcv", number=10, repeats=3)
seed <- 7
metric <- "Accuracy"
set.seed(seed)
rf <- train(Species~., data=iris, method="rf", metric=metric, tuneLength=15,
            trControl=control)
print(rf)
# Grid Search
tunegrid <- expand.grid(.mtry=c(1:4))
rf_gridsearch <- train(Species~., data=iris, method="rf", metric=metric,
                       tuneGrid=tunegrid, trControl=control)
print(rf_gridsearch)
print(plot(rf_gridsearch))