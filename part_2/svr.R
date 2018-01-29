# :help Nvim-R
# \rf - start r session
# \rq - close r session
# \l  — send current line
# \ae - Send file
# \se — send current selection (and echo)

library(caTools)
library(ggplot2)
library(e1071)

dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

# Fitting Polynomial Regression Model to the dataset
# For example:
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')

# PREDICTION
# For example:
yPred1 = predict(regressor, data.frame(Level = 6.5))
# yPred2 = predict(regressor, data.frame(Level = 6.5,
#                                        Level2 = 6.5^2,
#                                        Level3 = 6.5^3,
#                                        Level4 = 6.5^4))

# VISUALIZATION
# Polynomial Regression
# For Example:
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") +
    geom_line(aes(x = dataset$Level, y = predict(regressor, newData = dataset)), colour = "blue") +
    ggtitle("Truth or Bluff (Linear Regression)") +
    xlab("position level") +
    ylab("salary")

# polynomial with higher resolution
xGrid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
    geom_point(aes(x = dataset$Level ,y = dataset$Salary), colour="red") +
    geom_line(aes(x = xGrid, y = predict(regressor,
                                         newdata = data.frame(Level = xGrid,
                                                              Level2 = xGrid^2,
                                                              Level3 = xGrid^3,
                                                              Level4 = xGrid^4))),
              colour="blue") +
    ggtitle("Truth or Bluff (Linear Regression)") +
    xlab("position level") +
    ylab("salary")
