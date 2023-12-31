import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
from sklearn.tree import DecisionTreeClassifier
from mlxtend.plotting import plot_decision_regions

df = pd.read_csv('iris.csv')
print(df['class'].value_counts())
print(df)

species = {
    'Iris-setosa': 0, 'Iris-versicolor': 1, 'Iris-virginica':2
}
df['class_values'] = df['class'].map(species)
print(df.to_string())

X = df.iloc[:, :2]
y = df.class_values
model = DecisionTreeClassifier(max_depth=99, min_samples_split=20)
model.fit(X, y)

print(pd.DataFrame(model.feature_importances_, X.columns))
plot_decision_regions(X.values, y.values, model)
plt.show()