library(mlbench)
library(caret)
#Import Boston data
data("BostonHousing")
head(BostonHousing)
str(BostonHousing)

############################################################
#checking if the dataset contains any na
sum(is.na(BostonHousing))#Contains no NAs

#Setting the random seed number in order to achieve reproducible code
set.seed(100)

#Performing stratified random splits of the dataset
TrainingIndex<-createDataPartition(BostonHousing$medv,p=0.8,list=F)
Trainingset<-BostonHousing[TrainingIndex,]
Testingset<-BostonHousing[-TrainingIndex,]
head(Trainingset)
head(Testingset)
attach(Trainingset)
attach(Testingset)
#Building the training model
LrModel<-train(medv ~ ., data = TrainingSet,
               method = "lm",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none")
)
#Using model for prediction
Model.training<-predict(LrModel,Trainingset)#predictions on trainingset
Model.testing<-predict(LrModel,Testingset)#Prediction on testingset

#Checking the performance of our model
plot(TrainingSet$medv,Model.training, col = "blue" )
plot(TestingSet$medv,Model.testing, col = "green" )

#Checking the correlation
cor(Trainingset$medv,Model.training)
cor(Testingset$medv,Model.testing)

#The model seems to predict better on the unseen data