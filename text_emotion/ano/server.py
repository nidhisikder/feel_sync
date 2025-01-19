from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib  # or any library to load your ML model

app = Flask(__name__)
CORS(app)  # To allow cross-origin requests from Flutter

# Load your trained ML model
model = joblib.load('textemotion.pkl')  # Replace with your model file

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json  # Get JSON data from the request
    user_input = data.get('input')  # Extract the input from JSON
    
    # Process the input and make a prediction
    prediction = model.predict([user_input])  # Adapt as per your model's input structure
    

    return jsonify({'prediction': prediction[0]})  # Send back the prediction

if __name__ == '__main__':
    app.run(debug=True)
