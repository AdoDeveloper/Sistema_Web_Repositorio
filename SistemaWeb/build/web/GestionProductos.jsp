<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <h1>Gestión de Productos</h1>
        <h2>Listado de Productos</h2>
        <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->

        <table border="1">
            <thead>
                <tr>
                    <th>ID_Producto</th>
                    <th>Nombre_Producto</th>
                    <th>Descripcion</th>
                    <th>Precio_Unitario</th>
                    <th>Existencia</th>
                    <th>ID Proveedor</th>
                    <th>Nombre Proveedor</th>
                    <th>Telefono Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProductos}" var="item">
                    <tr>    
                        <!-- Mostrar -->
                        <td><c:out value="${item.ID_Producto}" /></td>
                        <td><c:out value="${item.nombreProducto}" /></td>
                        <td><c:out value="${item.descripcion}" /></td>
                        <td><c:out value="${item.precioUnitario}" /></td>
                        <td><c:out value="${item.existencia}" /></td>
                        <td><c:out value="${item.ID_Proveedor}" /></td>
                        <td><c:out value="${item.nombreProveedor}" /></td>
                        <td><c:out value="${item.telefonoProveedor}" /></td>
                        <td>
                            <!-- Ver detalles -->
                            <button class="open-popup-btn" 
                                    onclick="mostrarDetallesProductos(
                                                '${item.ID_Producto}',
                                                '${item.nombreProducto}',
                                                '${item.descripcion}',
                                                '${item.precioUnitario}',
                                                '${item.existencia}',
                                                '${item.ID_Proveedor}',
                                                '${item.nombreProveedor}',
                                                '${item.telefonoProveedor}'
                                                )">Ver detalles
                            </button>
                            <!-- Contenedor del pop-up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Producto: <span id="ID_Producto"></span></label><br>
                                <label>Nombre Producto: <span id="nombreProducto"></span></label><br>
                                <label>Descripcion: <span id="descripcion"></span></label><br>
                                <label>Precio Unitario: <span id="precioUnitario"></span></label><br>
                                <label>Existencia: <span id="existencia"></span></label><br>
                                <label>ID Proveedor: <span id="ID_Proveedor"></span></label><br>
                                <label>Nombre Proveedor: <span id="nombreProveedor"></span></label><br>
                                <label>Telefono Proveedor: <span id="telefonoProveedor"></span></label><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>

                            <!-- Modificar -->
                            <form method="POST" action="/SistemaWeb/ModificarProducto.jsp">
                                <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                                <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="submit" value="Modificar" />
                            </form>

                            <!-- Eliminar -->
                            <form method="POST" action="/SistemaWeb/EliminarProducto.jsp">
                                <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                                <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                                <input type="hidden" name="descripcion" value="${item.descripcion}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
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

        function mostrarDetallesProductos(ID_Producto, Nombre_Producto, Descripcion, Precio_Unitario, Existencia, ID_Proveedor, Nombre_Proveedor, Telefono_Proveedor) {
            document.getElementById('ID_Producto').textContent = ID_Producto;
            document.getElementById('nombreProducto').textContent = Nombre_Producto;
            document.getElementById('descripcion').textContent = Descripcion;
            document.getElementById('precioUnitario').textContent = Precio_Unitario;
            document.getElementById('existencia').textContent = Existencia;
            document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
            document.getElementById('nombreProveedor').textContent = Nombre_Proveedor;
            document.getElementById('telefonoProveedor').textContent = Telefono_Proveedor;

            // Muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
