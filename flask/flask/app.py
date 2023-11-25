from flask import request, jsonify, Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/api/data', methods=['GET', 'POST'])
def api_data():
    if request.method == 'GET':
        # Process and fetch data
        data = {"key": "value"}
        return jsonify(data)
    elif request.method == 'POST':
        # Process posted data
        posted_data = request.get_json()
        # Process and return a response
        response = {"message": "Data received successfully"}
        return jsonify(response)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
