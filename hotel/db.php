<?php
$host = "localhost";          // Servidor
$usuario = "root";            // Usuario MySQL
$contrasena = "";             // Contraseña (vacía si es local sin contraseña)
$bd = "hotel";                // Nombre de la base de datos
$puerto = 3308;               // Puerto MySQL (3306 es por defecto; tú usas 3308)

$conexion = new mysqli($host, $usuario, $contrasena, $bd, $puerto);

if ($conexion->connect_error) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}

// Opcional: para confirmar éxito al incluir el archivo
// echo "✅ Conexión exitosa a la base de datos.";
?>






