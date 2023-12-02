<%-- 
    Document   : GestionUsuarios
    Created on : 1 dic 2023, 11:38:14
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Usuarios</title>
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
    </head>
    <body>
        <h1>Gestión de Usuarios</h1>
        <h2>Listado de Usuarios</h2>
        <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->

        <table border="1">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>ID Empleado</th>
                    <th>ID Rol</th>
                    <th>Usuario</th>
                    <th>Clave</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaUsuarios}" var="usuario">
                    <tr>
                        <!-- Mostrar -->
                        <td><c:out value="${usuario.ID_Usuario}" /></td>
                        <td><c:out value="${usuario.ID_Empleado}" /></td>
                        <td><c:out value="${usuario.ID_Rol}" /></td>
                        <td><c:out value="${usuario.Usuario}" /></td>
                        <td><c:out value="${usuario.Clave}" /></td>
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesUsuario(
                                                '${usuario.ID_Usuario}',
                                                '${usuario.ID_Empleado}',
                                                '${usuario.ID_Rol}',
                                                '${usuario.Usuario}',
                                                '${usuario.Clave}'
                                                )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Usuario: <span id="ID_Usuario"></span></label><br>
                                <label>ID Empleado: <span id="ID_Empleado"></span></label><br>
                                <label>ID Rol: <span id="ID_Rol"></span></label><br>
                                <label>Usuario: <span id="Usuario"></span></label><br>
                                <label>Clave: <span id="Clave"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar Usuario -->
                            <form method="POST" action="/SistemaWeb/ModificarUsuario.jsp">
                                <input type="hidden" name="ID_Usuario" value="${usuario.ID_Usuario}" />
                                <input type="hidden" name="ID_Empleado" value="${usuario.ID_Empleado}" />
                                <input type="hidden" name="ID_Rol" value="${usuario.ID_Rol}" />
                                <input type="hidden" name="Usuario" value="${usuario.Usuario}" />
                                <input type="hidden" name="Clave" value="${usuario.Clave}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar Usuario -->
                            <form method="POST" action="/SistemaWeb/EliminarUsuario.jsp">
                                <input type="hidden" name="ID_Usuario" value="${usuario.ID_Usuario}" />
                                <input type="hidden" name="ID_Empleado" value="${usuario.ID_Empleado}" />
                                <input type="hidden" name="ID_Rol" value="${usuario.ID_Rol}" />
                                <input type="hidden" name="Usuario" value="${usuario.Usuario}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
    <script>
        function abrirPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');

            if (popup.style.display === 'block') {
                popup.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                popup.style.display = 'block';
                overlay.style.display = 'block';
            }
        }

        function mostrarDetallesUsuario(ID_Usuario, ID_Empleado, ID_Rol, Usuario, Clave) {
            document.getElementById('ID_Usuario').textContent = ID_Usuario;
            document.getElementById('ID_Empleado').textContent = ID_Empleado;
            document.getElementById('ID_Rol').textContent = ID_Rol;
            document.getElementById('Usuario').textContent = Usuario;
            document.getElementById('Clave').textContent = Clave;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>

