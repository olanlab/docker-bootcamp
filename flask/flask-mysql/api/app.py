
from typing import List, Dict
from flask import Flask
import mysql.connector
import json

app = Flask(__name__)

def users() -> List[Dict]:
    config = {
        'user': 'root',
        'password': '1111',
        'host': 'mysql',
        'port': '3306',
        'database': 'test_db'
    }
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM USER')

    row_headers=[x[0] for x in cursor.description] #this will extract row headers
    rv = cursor.fetchall()
    json_data=[]
    for result in rv:
        json_data.append(dict(zip(row_headers,result)))
    
    cursor.close()
    connection.close()
    return json_data


@app.route('/', methods=['GET'])
def hello_world() -> str:
    return 'Hello, World! !!!!!!!!!!!!!'

@app.route('/users', methods=['GET'])
def index() -> str:
    return json.dumps(users(),  default=str)

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)