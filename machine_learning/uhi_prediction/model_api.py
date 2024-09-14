from flask import Flask, request, jsonify
import joblib
import numpy as np
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

model = joblib.load(r"./random_forest_uhi_model.joblib")

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        features = [
            data['t1_urban'],
            data['t1_rural'],
            data['humidity'],
            data['co2'],
            data['co'],
            data['nh3'],
            data['sulfur_dioxide']
        ]
        features = np.array(features).reshape(1, -1)
        prediction = model.predict(features)[0]
        return jsonify({'uhi_index': prediction})
    except KeyError as e:
        return jsonify({'error': f'Missing feature: {str(e)}'}), 400
    except Exception as e:
        return jsonify({'error': f'An error occurred: {str(e)}'}), 500

if __name__ == '__main__':
    app.run(debug=True)
