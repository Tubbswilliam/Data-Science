data<- read_excel("C:/Users/User/Downloads/Book1.xlsx")
attach(data)
head(data)
#In order to come up with a linear regression model, 
#I used tch_experience as the independent variable and math as the dependent variable.
lmodel<-lm(Math~tch_experience)

#To obtain the summary of the model
summary(lmodel)

#Adding the regression line
abline(lmodel)

#To fix the error produce we plot a scatter plot then fit the line.

#Plotting the regression model
plot(lmodel)

#Displaying the value of pi
print(pi)

#listing the objects in the current working directory
ls()

#Displaying the object ls
ls

#Creating a copy of an object
data.cp<-data
head(data.cp)

#Listing objects in the current working space
ls()

#Deleting the copy made
rm(data.cp)
head(data.cp)
