# :help Nvim-R
# \rf - start r session
# \rq - close r session
# \l  — send current line
# \ae - Send file
# \se — send current selection (and echo)

# install.packages("caTools")
# install.packages("ggplot2")
library(caTools)
library(ggplot2)

dataset = read.csv("Salary_Data.csv")

# SPLIT TRAIN SETS AND TEST SETS
split       = sample.split(dataset$Salary, SplitRatio = 2/3)
trainingSet = subset(dataset, split == TRUE)
testSet     = subset(dataset, split == FALSE)

# summary(regressor) => shows useful information
regressor = lm(formula = Salary ~ YearsExperience,
               data = trainingSet)

# predictions
yPred = predict(regressor, newdata = testSet)

# plotting the graph with purely trainingSet
ggplot() +
    geom_point(aes(x = trainingSet$YearsExperience, y = trainingSet$Salary),
               colour = "red") +
    geom_line(aes(x = trainingSet$YearsExperience, y = predict(regressor, newdata = trainingSet)),
              colour = "blue") +
    ggtitle("Salary vs Experience (Training set)") +
    xlab("Years of Experience") +
    ylab("Salary")

# plotting the graph with testSet in Red and trainingSet in Green
ggplot() +
    geom_point(aes(x = testSet$YearsExperience, y = testSet$Salary),
               colour = "red") +
    geom_point(aes(x = trainingSet$YearsExperience, y = trainingSet$Salary),
               colour = "green") +
    geom_line(aes(x = trainingSet$YearsExperience, y = predict(regressor, newdata = trainingSet)),
              colour = "blue") +
    ggtitle("Salary vs Experience (Test set)") +
    xlab("Years of Experience") +
    ylab("Salary")
