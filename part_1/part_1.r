# START AND STOP
# \rf - start r session
# \rq - close r session

# \l  — send current line
# \ae - Send file
# \fd — send function on current line (and body below) to R
# \se — send current selection (and echo)
# \pe — send current paragraph (and echo)

# :help Nvim-R
# install.packages("caTools")
library("caTools")

dataset = read.csv("Data.csv")

# TAKE CARE OF MISSING DATA
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# ENCODING CATEGORICAL DATA
# factors in R is not numeric
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1,2,3))

dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0,1))

# SPLIT TRAIN SETS AND TEST SETS
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
trainingSet = subset(dataset, split == TRUE)
testSet = subset(dataset, split == FALSE)

# FEATURE SCALING
# factors in R is not numeric so we get 'x' must be numeric
trainingSet[,2:3] = scale(trainingSet[,2:3])
testSet[,2:3] = scale(testSet[,2:3])
