import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error, r2_score
import joblib

data = pd.read_csv(r"uhi_prediction\uhi_dataset.csv")

X = data[['t1_urban', 't1_rural', 'humidity', 'co2', 'co', 'nh3', 'sulfur_dioxide']]
y = data['uhi']

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

model = RandomForestRegressor(n_estimators=100, random_state=42)

model.fit(X_train, y_train)

joblib.dump(model, 'random_forest_uhi_model.joblib')

loaded_model = joblib.load('random_forest_uhi_model.joblib')

y_pred = loaded_model.predict(X_test)

mse = mean_squared_error(y_test, y_pred)
rmse = np.sqrt(mse)
r2 = r2_score(y_test, y_pred)

print(f"Root Mean Squared Error: {rmse}")
print(f"R-squared: {r2}")
