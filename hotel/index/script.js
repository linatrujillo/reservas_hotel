

// Lista de botones con sus enlaces
const botones = [
  { nombre: "Registrar Usurario", url: "http://localhost:8080/hotel/registro_usuarios.html" },
  { nombre: "registrar habitacion", url: "http://localhost:8080/hotel/registro_habitacion.html" },
  { nombre: "Selecionar Habitacion", url: "http://localhost:8080/hotel/seleccionar_habitacion.php" },
  { nombre: "Crear Reserva", url: "http://localhost:8080/hotel/index.html" },
  { nombre: "confirmacion de Reserva por correo", url: "http://localhost:8080/hotel/reserva_prueba.html" }
];

// Obtener el contenedor del menú
const menu = document.getElementById("menu");

// Crear los botones y enlazarlos
botones.forEach(item => {
  const boton = document.createElement("button");
  boton.textContent = item.nombre;
  boton.onclick = () => {
    window.location.href = item.url; // Redirige a otra página
  };
  menu.appendChild(boton);
});