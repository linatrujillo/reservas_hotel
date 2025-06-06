<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_habitacion = $_POST['id_habitacion'];

    $sql = "SELECT * FROM habitaciones WHERE id_habitacion = '$id_habitacion'";
    $result = $conexion->query($sql);

    if ($result->num_rows === 1) {
        $habitacion = $result->fetch_assoc();
        echo "<h1>Detalles de la Habitación</h1>";
        echo "ID: " . $habitacion['id_habitacion'] . "<br>";
        echo "Número: " . $habitacion['numero_habitacion'] . "<br>";
        echo "Tipo: " . $habitacion['tipo'] . "<br>";
        echo "Descripción: " . $habitacion['descripcion'] . "<br>";
        echo "Capacidad: " . $habitacion['capacidad'] . "<br>";
        echo "Precio: $" . $habitacion['precio'] . "<br>";
        echo "Disponible: " . ($habitacion['disponible'] ? "Sí" : "No") . "<br>";
    } else {
        echo "❌ Habitación no encontrada.";
    }

    $conexion->close();
} else {
    echo "Método no permitido.";
}
?>