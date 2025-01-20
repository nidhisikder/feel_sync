from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib  # or any library to load your ML model


pipe_lr = joblib.load(open("textemotion.pkl", "rb"))

app = Flask(__name__)
CORS(app)  # To allow cross-origin requests from Flutter


@app.route('/predict', methods=['GET','POST'])
def predict():
    data = request.json  # Get JSON data from the request
    user_input = data.get('input')  # Extract the input from JSON
    
    # Process the input and make a prediction
    results = pipe_lr.predict([user_input])

    return jsonify({'prediction': results[0]})  

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
