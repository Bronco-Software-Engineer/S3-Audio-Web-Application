from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allow frontend access (from different origin)

@app.route("/api/hello", methods=["GET"])
def hello():
    return {"message": "Hello World"}

if __name__ == "_main_":
    app.run(debug=True)