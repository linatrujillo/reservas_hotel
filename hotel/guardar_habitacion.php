<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $numero_habitacion = $conexion->real_escape_string($_POST['numero_habitacion']);
    $tipo = $conexion->real_escape_string($_POST['tipo']);
    $descripcion = $conexion->real_escape_string($_POST['descripcion']);
    $capacidad = $conexion->real_escape_string($_POST['capacidad']);
    $precio = $conexion->real_escape_string($_POST['precio']);
    $disponible = $conexion->real_escape_string($_POST['disponible']);

    $sql = "INSERT INTO habitaciones (numero_habitacion, tipo, descripcion, capacidad, precio, disponible)
            VALUES ('$numero_habitacion', '$tipo', '$descripcion', '$capacidad', '$precio', '$disponible')";

    if ($conexion->query($sql) === TRUE) {
        echo "✅ Habitación registrada con éxito.";
    } else {
        echo "❌ Error: " . $conexion->error;
    }

    $conexion->close();
} else {
    http_response_code(405);
    echo "Método no permitido";
}
?>