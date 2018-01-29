# :help Nvim-R
# \rf - start r session
# \rq - close r session
# \l  — send current line
# \ae - Send file
# \se — send current selection (and echo)

library(caTools)
library(ggplot2)

dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]

# Fitting Linear Regression to the dataset
linReg = lm(formula = Salary ~ .,
            data = dataset)

# Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
polyReg = lm(formula = Salary ~ .,
             data = dataset)

# VISUALIZATION
# linear regression
# ggplot() +
#     geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") +
#     geom_line(aes(x = dataset$Level, y = predict(linReg, newData = dataset)), colour = "blue") +
#     ggtitle("Truth or Bluff (Linear Regression)") +
#     xlab("position level") +
#     ylab("salary")

# polynomial regression
ggplot() +
    geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = "red") +
    geom_line(aes(x = dataset$Level, y = predict(polyReg, newData = dataset)), colour = "blue") +
    ggtitle("Truth or Bluff (Linear Regression)") +
    xlab("position level") +
    ylab("salary")

# polynomial with higher resolution
xGrid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
    geom_point(aes(x = dataset$Level ,y = dataset$Salary), colour="red") +
    geom_line(aes(x = xGrid, y = predict(polyReg,
                                         newdata = data.frame(Level = xGrid,
                                                              Level2 = xGrid^2,
                                                              Level3 = xGrid^3,
                                                              Level4 = xGrid^4))),
              colour="blue") +
    ggtitle("Truth or Bluff (Linear Regression)") +
    xlab("position level") +
    ylab("salary")

# PREDICTION
# linear regression
yPred = predict(linReg, data.frame(Level = 6.5))

# polynomial regression
yPred2 = predict(polyReg, data.frame(Level = 6.5,
                                     Level2 = 6.5^2,
                                     Level3 = 6.5^3,
                                     Level4 = 6.5^4))
