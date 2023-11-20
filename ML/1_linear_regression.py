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
sns.histplot(df.Weight)
plt.show()


