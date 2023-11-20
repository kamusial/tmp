import pandas as pd

df = pd.read_csv('diabetes.csv')
print(df.head().to_string())
print(df.describe().T.to_string())