<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gestión de Ventas</title>
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
    <h1>Gestión de Ventas</h1>
    <h2>Listado de Ventas</h2>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID Venta</th>
                <th>Fecha de Venta</th>
                <th>Subtotal</th>
                <th>Total</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listaVentas}" var="venta">
                <tr>
                    <td><c:out value="${venta.ID_Venta}" /></td>
                    <td><c:out value="${venta.fechaVenta}" /></td>
                    <td><c:out value="${venta.subtotal}" /></td>
                    <td><c:out value="${venta.total}" /></td>
                    <td>
                        <!-- Ver detalles -->
                        <button onclick="mostrarDetallesVenta(
                            '${venta.ID_Venta}',
                            '${venta.fechaVenta}',
                            '${venta.subtotal}',
                            '${venta.total}',
                            '${venta.nombreProducto}',
                            '${venta.precioUnitario}',
                            '${venta.cantidadProducto}',
                            '${venta.nombreCliente}'
                        )">Detalles</button>
                        
                        <!-- Modificar -->
                        <form method="POST" action="/SistemaWeb/ModificarVenta.jsp">
                            <input type="hidden" name="ID_Venta" value="${venta.ID_Venta}" />
                            <input type="submit" value="Modificar" />
                        </form>

                        <!-- Eliminar -->   
                        <form method="POST" action="/SistemaWeb/EliminarVenta.jsp">
                            <input type="hidden" name="ID_Venta" value="${venta.ID_Venta}" />
                            <input type="submit" value="Eliminar" />
                        </form>

                        <form method="GET" action="/SistemaWeb?">
                            <input type="hidden" name="accion" value="verFactura" />
                            <input type="hidden" name="ID_Venta" value="${venta.ID_Venta}" />
                            <input type="submit" value="Ver Factura" />
                        </form>




                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

   <!-- Detalles de la Venta -->
    <div class="overlay" id="overlay"></div>
    <div class="popup-container" id="popup">
        <label>ID Venta: <span id="ID_Venta"></span></label><br>
        <label>Fecha de Venta: <span id="fechaVenta"></span></label><br>
        <label>Subtotal: <span id="subtotal"></span></label><br>
        <label>Total: <span id="total"></span></label><br>
        <label>Detalles del Producto:</label><br>
        <span id="detallesProducto"></span><br>
        <span id="precioUnitario"></span><br>
        <span id="cantidadProducto"></span><br>
        <label>Nombre del Cliente: <span id="nombreCliente"></span></label><br>
        <br>
        <button onclick="cerrarPopup()">Cerrar</button>
    </div>

    <!-- JavaScript al final de la página -->
    <script>
        function cerrarPopup() {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');
            popup.style.display = 'none';
            overlay.style.display = 'none';
        }

        function mostrarDetallesVenta( ID_Venta, fechaVenta, subtotal, total, nombreProducto, precioUnitario, cantidadProducto, nombreCliente) {
            document.getElementById('ID_Venta').textContent = ID_Venta;
            document.getElementById('fechaVenta').textContent = fechaVenta;
            document.getElementById('subtotal').textContent = subtotal;
            document.getElementById('total').textContent = total;
            document.getElementById('detallesProducto').textContent = 'Nombre del Producto: ' + nombreProducto;
            document.getElementById('precioUnitario').textContent = 'Precio Unitario: ' + precioUnitario;
            document.getElementById('cantidadProducto').textContent = 'Cantidad: ' + cantidadProducto;
            document.getElementById('nombreCliente').textContent = nombreCliente;

            // Muestra el pop-up
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');
            popup.style.display = 'block';
            overlay.style.display = 'block';
        }
    </script>
</body>
</html>
