source("preprocess.R")
library(mlbench)
library(mlr3)

# Modeling And Processing
set.seed(1234)
ind <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
train <- data[ind == 1,]
test <- data[ind == 2,]

tree.control <- rpart.control(minsplit = 100,cp=0.002)
tree <- rpart(hospital_death ~ . , data = train,control = tree.control)

# rplot.jpg
jpeg("rplot.jpg", width = 600, height = 600)
rpart.plot(tree)
dev.off()

# predict
hasil_predict <- predict(tree,test,type="class")
confusionMatrix(hasil_predict ,test$hospital_death)

#tree$control
