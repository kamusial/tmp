import pandas as pd
from sklearn.linear_model import LinearRegression

df = pd.read_csv('weight-height.csv')
print(df)
print(type(df))
print(df.Gender.value_counts())

