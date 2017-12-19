# Data Preprocessing

# Importing the libraries
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.cross_validation import train_test_split
from sklearn.linear_model import LinearRegression

# Importing the dataset
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=1/3, random_state=0)

# Linear Regression
# __init__(fit_intercept=True, normalize=False, copy_X=True, n_jobs=1)
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predictions
y_pred = regressor.predict(X_test)

print("y_test")
print(y_test)
print("y_pred")
print(y_pred)

plt.scatter(X_train, y_train, color="red")
plt.plot(X_train, regressor.predict(X_train), color="yellow")
plt.title('Salary vs Experience (Training Set)')
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
# plt.show()

plt.scatter(X_test, y_test, color="blue")
plt.plot(X_train, regressor.predict(X_train), color="yellow")
plt.title('Salary vs Experience (Training Set)')
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.show()
