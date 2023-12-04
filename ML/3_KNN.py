import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix

df = pd.read_csv('iris.csv')
print(df['class'].value_counts())
print(df)

species = {
    'Iris-setosa': 0, 'Iris-versicolor': 1, 'Iris-virginica':2
}
df['class_values'] = df['class'].map(species)
print(df)

sample = np.array([5.6, 3.2, 5.2, 1.45])
# sns.scatterplot(data=df, x='sepallength', y='sepalwidth', hue='class')
# plt.scatter(5.6, 3.2, c='r')
sns.scatterplot(data=df, x='petallength', y='petalwidth', hue='class')
plt.scatter(5.2, 1.45, c='r')
plt.show()