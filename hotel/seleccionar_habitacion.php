<?php
include 'db.php'; // conexión a la BD
?>

<!DOCTYPE html>
<html>
<head>
    <title>Seleccionar Habitación</title>
</head>
<body>
    <h1>Consultar Habitaciones</h1>

    <form action="mostrar_habitacion.php" method="POST">
        <label>Selecciona una habitación:</label>
        <select name="id_habitacion" required>
            <option value="">-- Selecciona --</option>
            <?php
            // Consultar todas las habitaciones
            $sql = "SELECT id_habitacion, numero_habitacion, tipo FROM habitaciones";
            $result = $conexion->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row['id_habitacion'] . "'>ID " . $row['id_habitacion'] . " - Habitación " . $row['numero_habitacion'] . " (" . $row['tipo'] . ")</option>";
                }
            } else {
                echo "<option value=''>No hay habitaciones registradas</option>";
            }

            $conexion->close();
            ?>
        </select><br><br>

        <input type="submit" value="Ver Detalles">
    </form>
</body>
</html>