<%-- 
    Document   : GestionPedidos
    Created on : 30 nov 2023, 23:55:27
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Pedidos</title>
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
        <h1>Gestión de Pedidos</h1>
        <h2>Listado de Pedidos</h2>
        <!--<h3>Conexion: ${mensaje_conexion}</h3><br>-->

        <a href="/SistemaWeb?accion=RegistroPedidos">Agregar Pedidos</a><br><br>
        <table border="1">
            <thead>
                <tr>
                    <th>ID_Pedido</th>
                    <th>Fecha_Pedido</th>
                    <th>Monto</th>
                    <th>Nombre_Proveedor</th>                                  
                    <th>Cantidad</th>
                    <th>Nombre_Producto</th>
                    <th>Precio_Unitario</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaPedidos}" var="item">
                <tr>
                    <!-- Mostrar -->
                    <td><c:out value="${item.ID_Pedido}" /></td>
                    <td><c:out value="${item.fechaPedido}" /></td>
                    <td><c:out value="${item.monto}" /></td>
                    <!-- <td><c:out value="${item.ID_Proveedor}" /></td> -->
                    <td><c:out value="${item.nombreProveedor}" /></td>
                    <!-- <td><c:out value="${item.telefonoProveedor}" /></td> -->
                    <!-- <td><c:out value="${item.ID_Direccion}" /></td> -->
                    <!-- <td><c:out value="${item.direccionCompleta}" /></td> -->                   
                    <!-- <td><c:out value="${item.ID_DetallePedido}" /></td> -->   
                    <td><c:out value="${item.cantidad}" /></td>
                    <!-- <td><c:out value="${item.ID_Producto}" /></td>-->   
                    <td><c:out value="${item.nombreProducto}" /></td>
                    <!-- <td><c:out value="${item.descripcion}" /></td> -->
                    <!-- <td><c:out value="${item.existencia}" /></td> -->
                    <td><c:out value="${item.precioUnitario}" /></td>
                    <td>
                        <!-- Ver detalles -->
                        <button class="open-popup-btn" 
                                onclick="mostrarPedido(
                                                '${item.ID_Pedido}',
                                                '${item.fechaPedido}',
                                                '${item.monto}',
                                                '${item.ID_Proveedor}',
                                                '${item.nombreProveedor}',
                                                '${item.telefonoProveedor}',
                                                '${item.ID_Direccion}',
                                                '${item.direccionCompleta}',
                                                '${item.ID_DetallePedido}',
                                                '${item.cantidad}',
                                                '${item.ID_Producto}',
                                                '${item.nombreProducto}',
                                                '${item.descripcion}',
                                                '${item.existencia}',
                                                '${item.precioUnitario}',
                                                )">Ver detalles
                        </button>
                        <!-- Contenedor del pop-up -->
                        <div class="overlay" id="overlay"></div>
                        <div class="popup-container" id="popup">
                            <label>ID Pedido: <span id="ID_Pedido"></span></label><br>
                            <label>Fecha Pedido: <span id="fechaPedido"></span></label><br>
                            <label>Monto: <span id="monto"></span></label><br>
                            <label>ID_Proveedor: <span id="ID_Proveedor"></span></label><br>
                            <label>Nombre Proveedor: <span id="nombreProveedor"></span></label><br>
                            <label>Telefono: <span id="telefonoProveedor"></span></label><br>
                            <label>ID_Direccion: <span id="ID_Direccion"></span></label><br>
                            <label>Dirección: <span id="direccionCompleta"></span></label><br>
                            <label>ID_DetallePedido: <span id="ID_DetallePedido"></span></label><br>
                            <label>Cantidad: <span id="cantidad"></span></label><br>
                            <label>ID_Producto: <span id="ID_Producto"></span></label><br>
                            <label>Nombre Producto: <span id="nombreProducto"></span></label><br>
                            <label>Descripcion: <span id="descripcion"></span></label><br>
                            <label>Existencia: <span id="existencia"></span></label><br>
                            <label>Precio Unitario: <span id="precioUnitario"></span></label><br><br>
                            <button onclick="abrirPopup()">Cerrar</button>
                        </div>

                        <!-- Modificar -->
                        <form method="POST" action="/SistemaWeb/ModificarPedido.jsp">
                            <input type="hidden" name="ID_Pedido" value="${item.ID_Pedido}" />
                            <input type="hidden" name="fechaPedido" value="${item.fechaPedido}" />
                            <input type="hidden" name="monto" value="${item.monto}" />
                            <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                            <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                            <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                            <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                            <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                            <input type="hidden" name="ID_DetallePedido" value="${item.ID_DetallePedido}" />
                            <input type="hidden" name="cantidad" value="${item.cantidad}" />
                            <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                            <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                            <input type="hidden" name="descripcion" value="${item.descripcion}" />
                            <input type="hidden" name="existencia" value="${item.existencia}" />
                            <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                            <input type="submit" value="Modificar" />
                        </form>

                        <!-- Eliminar -->   
                        <form method="POST" action="/SistemaWeb/EliminarPedido.jsp">
                            <input type="hidden" name="ID_Pedido" value="${item.ID_Pedido}" />
                            <input type="hidden" name="fechaPedido" value="${item.fechaPedido}" />
                            <input type="hidden" name="monto" value="${item.monto}" />
                            <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                            <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                            <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                            <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                            <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                            <input type="hidden" name="ID_DetallePedido" value="${item.ID_DetallePedido}" />
                            <input type="hidden" name="cantidad" value="${item.cantidad}" />
                            <input type="hidden" name="ID_Producto" value="${item.ID_Producto}" />
                            <input type="hidden" name="nombreProducto" value="${item.nombreProducto}" />
                            <input type="hidden" name="descripcion" value="${item.descripcion}" />
                            <input type="hidden" name="existencia" value="${item.existencia}" />
                            <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
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

    function mostrarPedido(ID_Pedido, fechaPedido, monto, ID_Proveedor, nombreProveedor, telefonoProveedor, ID_Direccion, direccionCompleta, ID_DetallePedido, cantidad, ID_Producto, nombreProducto, descripcion, existencia, precioUnitario) {
        document.getElementById('ID_Pedido').textContent = ID_Pedido;
        document.getElementById('fechaPedido').textContent = fechaPedido;
        document.getElementById('monto').textContent = monto;
        document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
        document.getElementById('nombreProveedor').textContent = nombreProveedor;
        document.getElementById('telefonoProveedor').textContent = telefonoProveedor;
        document.getElementById('ID_Direccion').textContent = ID_Direccion;
        document.getElementById('direccionCompleta').textContent = direccionCompleta;
        document.getElementById('ID_DetallePedido').textContent = ID_DetallePedido;
        document.getElementById('cantidad').textContent = cantidad;
        document.getElementById('ID_Producto').textContent = ID_Producto;
        document.getElementById('nombreProducto').textContent = nombreProducto;
        document.getElementById('descripcion').textContent = descripcion;
        document.getElementById('existencia').textContent = existencia;
        document.getElementById('precioUnitario').textContent = precioUnitario;

        // Muestra el pop-up
        abrirPopup();
    }

</script>

</html>

