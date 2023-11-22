<%-- 
    Document   : Ventas
    Created on : 13 oct 2023, 20:55:52
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Ventas</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Registro de Ventas</h1>
        <form method="post" action="/SistemaWeb/ServletPrincipal?accion=GuardarVenta" id="formulario">
            <!-- Campos para la tabla Ventas -->
            <div class="form-group">
                <label for="fechaVenta">Fecha de Venta:</label>
                <input type="date" id="fechaVenta" name="tfFechaVenta" required>
            </div>
            <div class="form-group">
                <label for="montoVenta">Monto de Venta:</label>
                <input type="number" step="0.01" id="montoVenta" name="tfMontoVenta" required>
            </div>

            <!-- Campos para la tabla Detalle_Ventas -->
            <div class="form-group">
                <label for="cantidadProducto">Cantidad de Producto:</label>
                <input type="number" id="cantidadProducto" name="tfCantidadProducto" required>
            </div>
<!--            <div class="form-group">
                <label for="idProducto">ID de Producto:</label>
                <input type="number" id="idProducto" name="tfIDProducto" required>
            </div>-->

            <!-- Botones de acción -->
            <div class="form-group">
                <input type="submit" name="btGuardarVenta" value="GUARDAR VENTA">
                <input type="reset" name="btLimpiar" value="LIMPIAR">
            </div>
        </form>
        <button onclick="regresar()">Regresar</button>
        <script>  
        function regresar(){
            window.history.back();
        }
        </script>
    </body>
</html>
