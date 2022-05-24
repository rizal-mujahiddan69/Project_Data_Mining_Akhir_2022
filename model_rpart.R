source("preprocess.R")
source("plotting_tree.R")
library(randomForest)

trainData_x <- trainData %>% select(-c(hospital_death))
trainData_y <- trainData$hospital_death

classifier_RF = train(x = trainData_x,y = trainData_y)

plot(classifier_RF)
varImpPlot(classifier_RF)

# predict
testData_x <- testData %>% select(-c(hospital_death))
testData_y <- testData %>% select(c(hospital_death))
testData_y <- testData_y$hospital_death

predict_y <- predict(classifier_RF,testData_x)
predict_y <- as.vector(predict_y)
predict_y <- factor(predict_y,levels = c("Survived","Death"))
predict_y

confusionMatrix(predict_y,testData_y)


# tree$control
current_2 <- Sys.time()
deltatime_rpart <- current_2 - current_0
print("Time Modelling :")
print(deltatime_rpart)