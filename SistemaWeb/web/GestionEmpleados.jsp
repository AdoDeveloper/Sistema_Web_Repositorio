        <%-- 
    Document   : GestionEmpleados
    Created on : 13 oct 2023, 21:36:58
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
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
        <h1>Gestión de Empleados</h1>
        <h2>Listado de Empleados</h2>
        <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->

        <a href="/SistemaWeb?accion=RegistroEmpleados">Agregar empleado</a><br><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID_Empleado</th>
                    <th>DUI</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Cargo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEmpleados}" var="item">
                    <tr>
                        <!-- Mostrar -->
                        <td><c:out value="${item.ID_Empleado}" /></td>
                        <td><c:out value="${item.DUI_Empleado}" /></td>
                        <!-- <td><c:out value="${item.ISSS_Empleado}" /></td> -->
                        <td><c:out value="${item.nombresEmpleado}" /></td>
                        <td><c:out value="${item.apellidosEmpleado}" /></td>
                        <!-- <td><c:out value="${item.fechaNacEmpleado}" /></td> -->
                        <!-- <td><c:out value="${item.telefono}" /></td> -->
                        <!-- <td><c:out value="${item.correo}" /></td> -->
                        <!-- <td><c:out value="${item.ID_Cargo}" /></td> -->                        
                        <td><c:out value="${item.cargo}" /></td>
                        <!-- <td><c:out value="${item.ID_Direccion}" /></td> -->
                        <!-- <td><c:out value="${item.direccionCompleta}" /></td> -->
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesEmpleado(
                                                    '${item.ID_Empleado}',
                                                    '${item.DUI_Empleado}',
                                                    '${item.ISSS_Empleado}',
                                                    '${item.nombresEmpleado}',
                                                    '${item.apellidosEmpleado}',
                                                    '${item.fechaNacEmpleado}',
                                                    '${item.telefono}',
                                                    '${item.correo}',
                                                    '${item.cargo}',
                                                    '${item.direccionCompleta}'
                                                    )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Empleado: <span id="ID_Empleado"></span></label><br>
                                <label>DUI: <span id="DUI_Empleado"></span></label><br>
                                <label>ISSS: <span id="ISSS_Empleado"></span></label><br>
                                <label>Nombres: <span id="nombresEmpleado"></span></label><br>
                                <label>Apellidos: <span id="apellidosEmpleado"></span></label><br>
                                <label>Fecha de nacimiento: <span id="fechaNacEmpleado"></span></label><br>
                                <label>Teléfono: <span id="telefono"></span></label><br>
                                <label>Correo: <span id="correo"></span></label><br>
                                <label>Cargo: <span id="cargo"></span></label><br>
                                <label>Dirección: <span id="direccionCompleta"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWeb/ModificarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefono" value="${item.telefono}" />
                                <input type="hidden" name="correo" value="${item.correo}" />
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->   
                            <form method="POST" action="/SistemaWeb/EliminarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefono" value="${item.telefono}" />
                                <input type="hidden" name="correo" value="${item.correo}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
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

        function mostrarDetallesEmpleado(ID_Empleado, DUI_Empleado, ISSS_Empleado, nombresEmpleado, apellidosEmpleado, fechaNacEmpleado, telefonoEmpleado, correo, cargo, direccionCompleta) {
            document.getElementById('ID_Empleado').textContent = ID_Empleado;
            document.getElementById('DUI_Empleado').textContent = DUI_Empleado;
            document.getElementById('ISSS_Empleado').textContent = ISSS_Empleado;
            document.getElementById('nombresEmpleado').textContent = nombresEmpleado;
            document.getElementById('apellidosEmpleado').textContent = apellidosEmpleado;
            document.getElementById('fechaNacEmpleado').textContent = fechaNacEmpleado;
            document.getElementById('telefono').textContent = telefonoEmpleado;
            document.getElementById('correo').textContent = correo;
            document.getElementById('cargo').textContent = cargo;
            document.getElementById('direccionCompleta').textContent = direccionCompleta;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
