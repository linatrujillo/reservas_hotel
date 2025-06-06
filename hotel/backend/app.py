from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Permite llamadas desde el frontend

@app.route("/reservar", methods=["POST"])
def reservar():
    datos = request.get_json()
    nombre = datos.get("nombre")
    email = datos.get("email")
    checkin = datos.get("checkin")
    checkout = datos.get("checkout")

    # Aquí podrías guardar en una base de datos
    print(f"Reserva recibida: {nombre}, {email}, {checkin} a {checkout}")

    return jsonify({"message": "Reserva realizada con éxito."})

if __name__ == "__main__":
    app.run(debug=True)