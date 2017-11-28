# \rf - start r session
# \l  — send current line
# \fd — send function on current line (and body below) to R
# \se — send current selection (and echo)
# \pe — send current paragraph (and echo)
# \rq - close r session

# :help Nvim-R

dataset = read.csv("../Data_Preprocessing/Data.csv")

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)
