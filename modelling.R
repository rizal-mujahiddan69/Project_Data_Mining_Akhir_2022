source("preprocess.R")

set.seed(1234)
ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
train <- data[ind == 1,]
test <- data[ind == 2,]
tree <- rpart(hospital_death ~ . , data = train)

hasil_predict <- predict(tree,test,type="class")
confusionMatrix(hasil_predict ,test$hospital_death)