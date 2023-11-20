import pandas as pd
from sklearn.linear_model import LinearRegression
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_csv('weight-height.csv')
print(df)
print(type(df))
print(df.Gender.value_counts())

df.Height *= 2.54
df.Weight /= 2.2
print('Units changed')
print(df)
sns.histplot(data=df, x='Weight', hue='Gender')
plt.show()

df = pd.get_dummies(df)
print(df)
del (df["Gender_Male"])
df.rename(columns={'Gender_Female': 'Gender'}, inplace=True)
print(df)