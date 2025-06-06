<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_user = $_POST['id_user'];
    $id_habitacion = $_POST['id_habitacion'];
    $fecha_inicio = $_POST['fecha_inicio'];
    $fecha_fin = $_POST['fecha_fin'];
    $metodo_pago = $_POST['metodo_pago'];

    $stmt = $conexion->prepare("INSERT INTO reservas (id_user, id_habitacion, fecha_inicio, fecha_fin, metodo_pago) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iisss", $id_user, $id_habitacion, $fecha_inicio, $fecha_fin, $metodo_pago);

    if ($stmt->execute()) {
        echo "✅ Reserva guardada con éxito.";
    } else {
        echo "❌ Error: " . $stmt->error;
    }

    $stmt->close();
    $conexion->close();
} else {
    http_response_code(405);
    echo "Método no permitido.";
}
?>