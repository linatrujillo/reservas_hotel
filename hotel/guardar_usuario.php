<?php
include 'db.php';  // conexión a la base de datos

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $cedula = $_POST['cedula'];
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $email = $_POST['email'];
    $celular = $_POST['celular'];
    $ciudad_origen = $_POST['ciudad_origen'];
    $fecha_nacimiento = $_POST['fecha_nacimiento'];

    // Evitar inyección SQL (mejor con prepared statements, pero así es básico)
    $cedula = $conexion->real_escape_string($cedula);
    $nombre = $conexion->real_escape_string($nombre);
    $apellido = $conexion->real_escape_string($apellido);
    $email = $conexion->real_escape_string($email);
    $celular = $conexion->real_escape_string($celular);
    $ciudad_origen = $conexion->real_escape_string($ciudad_origen);
    $fecha_nacimiento = $conexion->real_escape_string($fecha_nacimiento);

    $sql = "INSERT INTO usuarios (cedula, nombre, apellido, email, celular, ciudad_origen, fecha_nacimiento)
            VALUES ('$cedula', '$nombre', '$apellido', '$email', '$celular', '$ciudad_origen', '$fecha_nacimiento')";

    if ($conexion->query($sql) === TRUE) {
        echo "✅ Usuario registrado con éxito.";
    } else {
        echo "❌ Error: " . $conexion->error;
    }

    $conexion->close();
} else {
    http_response_code(405);
    echo "Método no permitido";
}
?>