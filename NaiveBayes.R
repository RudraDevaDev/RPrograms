library(dplyr)
library(caret)
library(e1071)
library(ggplot2)

titanic<-read.csv("C:/Users/RudraDevan G/Downloads/titanic.csv")
head(titanic)
tail(titanic)

titanic=select(titanic,Survived,Pclass,Sex,SibSp,Parch)
titanic=na.omit(titanic)
str(titanic)

titanic$Survived = factor(titanic$Survived)
titanic$Pclass = factor(titanic$Pclass, order=TRUE,levels = c(3, 2, 1))

print(
ggplot(titanic,aes(x = Survived)) + geom_bar(width=0.5, fill = "coral") +
  geom_text(stat='count', aes(label=stat(count)), vjust=-0.5) + theme_classic()
)

train_test_split = function(data, fraction = 0.8, train = TRUE) {
   total_rows = nrow(data)
   train_rows = fraction * total_rows
   sample = 1:train_rows
   if (train == TRUE) {
     return (data[sample, ])
     } else {
       return (data[-sample, ])
       }
   }

train <- train_test_split(titanic, 0.8, train = TRUE)
test <- train_test_split(titanic, 0.8, train = FALSE)
nb_model = naiveBayes(Survived ~., data=train)
nb_predict = predict(nb_model,test)

table_mat <- table(nb_predict, test$Survived)
print(table_mat)
nb_accuracy = sum(diag(table_mat)) / sum(table_mat)
print(paste("The accuracy is : ", nb_accuracy))