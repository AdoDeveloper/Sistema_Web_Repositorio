<%-- 
    Document   : PedidosProductos
    Created on : 13 oct 2023, 17:32:42
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Pedidos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Registro de Pedidos</h1>
        <form method="post" action="/SistemaWeb/ServletPrincipal?accion=GuardarPedido" id="formulario">
            <div class="form-group">
                <label for="fechaPedido">Fecha de Pedido:</label>
                <input type="date" id="fechaPedido" name="tfFechaPedido" required>
            </div>
            <div class="form-group">
                <label for="monto">Monto:</label>
                <input type="number" step="0.01" id="monto" name="tfMonto" required>
            </div>
            <!--        <div class="form-group">
                        <label for="proveedor">ID del Proveedor:</label>
                        <input type="number" id="proveedor" name="tfIDProveedor" required>
                    </div>-->
            <div class="form-group">
                <input type="submit" name="btGuardar" value="GUARDAR">
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

