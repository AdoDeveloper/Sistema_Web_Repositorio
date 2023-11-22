<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestión de Clientes</title>
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
    <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->
    <h1>Gestión de Clientes</h1>
    <h2>Listado de Clientes</h2>
    <!-- Agrega el código para mostrar la lista de clientes -->
    <%-- Agrega esta línea para imprimir el tamaño de la listaClientes --%>
    <!--<p>Tamaño de la listaClientes: ${fn:length(listaClientes)}</p>-->
    <a href="/SistemaWeb?accion=RegistroClientes">Agregar cliente</a><br><br>

    <table border="1">
        <thead>
            <tr>
                <th>ID Cliente</th>
                <th>DUI</th>
                <th>Nombres</th>
                <th>Apellidos</th>             
                <th>Fecha Nacimiento</th>
                <!--<th>Email</th>-->
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaClientes}" var="item">
                <tr>
                    <td><c:out value="${item.ID_Cliente}" /></td>
                    <td><c:out value="${item.DUI_Cliente}" /></td>
                    <td><c:out value="${item.nombresCliente}" /></td>
                    <td><c:out value="${item.apellidosCliente}" /></td>
                    <!--<td><c:out value="${item.telefono}" /></td>-->
                    <td><c:out value="${item.fechaNacCliente}" /></td>
                    <!--<td><c:out value="${item.correo}" /></td>-->
                    <td>
                        <!-- Ver detalles -->
                        <button class="open-popup-btn" 
                                onclick="mostrarDetallesCliente(
                                                '${item.ID_Cliente}',
                                                '${item.nombresCliente}',
                                                '${item.apellidosCliente}',
                                                '${item.DUI_Cliente}',
                                                '${item.fechaNacCliente}',
                                                '${item.telefono}',
                                                '${item.correo}',
                                                '${item.ID_Direccion}',
                                                '${item.direccionCompleta}'
                                                )">Ver detalles
                        </button>

                        <!-- Modificar -->
                        <form method="POST" action="/SistemaWeb/ModificarCliente.jsp">
                            <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                            <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                            <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                            <input type="hidden" name="DUI_Cliente" value="${item.DUI_Cliente}" />
                            <input type="hidden" name="fechaNacCliente" value="${item.fechaNacCliente}" />
                            <input type="hidden" name="telefono" value="${item.telefono}"/>
                            <input type="hidden" name="correo" value="${item.correo}" />
                            <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                            <input type="submit" value="Modificar" />
                        </form>

                        <!-- Eliminar -->   
                        <form method="POST" action="/SistemaWeb/EliminarCliente.jsp">
                            <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                            <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                            <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                            <input type="hidden" name="DUI_Cliente" value="${item.DUI_Cliente}" />
                            <input type="hidden" name="fechaNacCliente" value="${item.fechaNacCliente}" />
                            <input type="hidden" name="telefono" value="${item.telefono}"/>
                            <input type="hidden" name="correo" value="${item.correo}" />
                            <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                            <input type="submit" value="Eliminar" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Detalles del Cliente -->
    <div class="overlay" id="overlay"></div>
    <div class="popup-container" id="popup">
        <label>ID Cliente: <span id="ID_Cliente"></span></label><br>
        <label>Nombres: <span id="nombresCliente"></span></label><br>
        <label>Apellidos: <span id="apellidosCliente"></span></label><br>
        <label>DUI: <span id="DUI_Cliente"></span></label><br>
        <label>Fecha de Nacimiento: <span id="fechaNacCliente"></span></label><br>
        <label>Telefono: <span id="telefono"></span></label><br>
        <label>Email: <span id="correo"></span></label><br>
        <!-- Se ha eliminado la línea para mostrar ID_Direccion en el pop-up -->
        <label>Dirección Completa: <span id="direccionCompleta"></span></label><br><br>
        <button onclick="abrirPopup()">Cerrar</button>
    </div>

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

        function mostrarDetallesCliente(ID_Cliente, nombresCliente, apellidosCliente, DUI_Cliente, fechaNacCliente,telefono, correo, ID_Direccion, direccionCompleta) {
            document.getElementById('ID_Cliente').textContent = ID_Cliente;
            document.getElementById('nombresCliente').textContent = nombresCliente;
            document.getElementById('apellidosCliente').textContent = apellidosCliente;
            document.getElementById('DUI_Cliente').textContent = DUI_Cliente;
            document.getElementById('fechaNacCliente').textContent = fechaNacCliente;
            document.getElementById('telefono').textContent = telefono;
            document.getElementById('correo').textContent = correo;
            // Se ha eliminado la línea para mostrar ID_Direccion en el pop-up
            document.getElementById('direccionCompleta').textContent = direccionCompleta;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</body>
</html>