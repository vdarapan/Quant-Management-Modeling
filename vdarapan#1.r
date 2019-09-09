titanic <- read.csv("titanic_dataset.csv")
head(titanic)
mean(titanic$Fare)
mode(titanic$Age)
only_age <- table(titanic$Age)
head(only_age)
View(only_age)
only_age
names(only_age)[only_age == max(only_age)]
median(titanic$Fare)
range(titanic$Fare)
boxplot(titanic$Age ~ titanic$Pclass, xlab = "Class", ylab = "Age", col = c("blue"))
titanic
var(titanic$Fare)
sqrt(var(titanic$Fare))
hist(titanic$Fare, main = "Fare per Person", xlab = "Fare", col = "black", breaks = 40, xlim = c(0,30))
summary(titanic$Fare)
