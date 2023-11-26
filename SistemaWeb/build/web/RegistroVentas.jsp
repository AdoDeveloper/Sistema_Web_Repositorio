<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Tus imports, estilos y otros elementos del encabezado -->

<script>
    function calcularTotal() {
        // Obtener los valores seleccionados por el usuario
        var seleccionProducto = document.getElementById("idProducto");
        var precioUnitario = parseFloat(seleccionProducto.options[seleccionProducto.selectedIndex].getAttribute("data-precio"));
        var cantidadProducto = parseInt(document.getElementById("cantidadProducto").value);
        var iva = parseFloat(document.getElementById("iva").value);
        var descuento = parseFloat(document.getElementById("descuento").value);

        // Calcular los campos restantes
        var subtotal = precioUnitario * cantidadProducto;
        var total = (subtotal + (subtotal * (iva / 100))) - descuento;

        // Mostrar los resultados en los campos correspondientes
        document.getElementById("subtotal").value = subtotal.toFixed(2);
        document.getElementById("total").value = total.toFixed(2);
    }
</script>

</head>

<body>
    <div class="container">
        <h2>Registro de Ventas</h2>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nueva venta</h1>
            
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroVenta" oninput="calcularTotal()">
            <!-- Campo oculto para la fecha de venta -->
            <input type="hidden" id="fechaVenta" name="fechaVenta" value="<%= new java.sql.Date(System.currentTimeMillis()) %>" required>

            <!-- Campos del formulario para registrar la venta -->
            <label for="idProducto">Seleccione un Producto:</label>
            <select id="idProducto" name="idProducto" required>
                <c:forEach var="producto" items="${listaProductos}">
                    <option value="${producto.ID_Producto}" data-precio="${producto.precioUnitario}">${producto.nombreProducto} - Precio: ${producto.precioUnitario}</option>
                </c:forEach>
            </select><br>

            <label for="cantidadProducto">Cantidad de Producto:</label>
            <input type="number" id="cantidadProducto" name="cantidadProducto" required><br>

            <!-- Campos adicionales para Facturas -->
            <label for="iva">IVA:</label>
            <input type="number" id="iva" name="iva" step="0.01" required><br>

            <label for="descuento">Descuento:</label>
            <input type="number" id="descuento" name="descuento" step="0.01" required><br>

            <!-- Campos calculados automáticamente -->
            <label for="subtotal">Subtotal:</label>
            <input type="text" id="subtotal" name="subtotal" readonly><br>

            <label for="total">Total:</label>
            <input type="text" id="total" name="total" readonly><br>

            <label for="nit">NIT:</label>
            <input type="text" id="nit" name="nit" required><br>

            <!-- Campo para seleccionar el cliente -->
            <label for="idCliente">Seleccione un Cliente:</label>
            <select id="idCliente" name="idCliente" required>
                <c:forEach var="cliente" items="${listaClientes}">
                    <option value="${cliente.ID_Cliente}">${cliente.nombresCliente} ${cliente.apellidosCliente}</option>
                </c:forEach>
            </select><br>

            <button type="submit">Registrar Venta</button>
        </form>
    </div>
            
            <a href="/SistemaWeb/ServletPrincipal?accion=GestionVentas">Regresar a Gestion Ventas</a>
</body>

</html>
