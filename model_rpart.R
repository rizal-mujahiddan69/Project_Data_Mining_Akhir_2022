source("preprocess.R")

tree.control <- rpart.control(minsplit = 100,cp=0.002)
tree <- rpart(hospital_death ~ . , data = trainData,control = tree.control)

rpart.plot(tree)

# rplot.jpg
jpeg("rplot.jpg", width = 700, height = 700)
rpart.plot(tree)
dev.off()

# predict
hasil_predict <- predict(tree,testData_sel,type="class")
aaa <- confusionMatrix(hasil_predict ,testData$hospital_death)
print(aaa)
##bagan 2

# tree.control <- rpart.control(minsplit = 100,cp=0.002)
# tree <- rpart(hospital_death ~ . , data = trainData_sel,control = tree.control)
# 
# # rplot.jpg
# jpeg("rplot.jpg", width = 600, height = 600)
# rpart.plot(tree)
# dev.off()
# 
# # predict
# hasil_predict <- predict(tree,testData_sel,type="class")
# bbb <- confusionMatrix(hasil_predict ,testData_sel$hospital_death)
# 
# print(aaa)
# print(bbb)


# tree$control
current_2 <- Sys.time()
deltatime_rpart <- current_2 - current_0
print("Time Modelling :")
print(deltatime_rpart)