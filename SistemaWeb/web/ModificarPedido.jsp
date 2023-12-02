<%-- 
    Document   : ModificarPedido
    Created on : 1 dic 2023, 10:32:06
    Author     : gabri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Pedido</title>
    </head>
    <body>   
        <h1>Modificar Pedido</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=modificarPedido">
            <form>
                <div>
                    <label>ID Pedido:</label>
                    <input type="text" name="ID_Pedido" id="ID_Pedido" value="${param.ID_Pedido}" readonly /><br>

                    <label>Fecha Pedido:</label>
                    <input type="text" name="fechaPedido" id="fechaPedido" value="${param.fechaPedido}" required /><br>

                    <label>Monto:</label>
                    <input type="text" name="monto" id="monto" value="${param.monto}" required /><br>

                    <label>ID Proveedor:</label>
                    <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" required /><br>

                    <label>Nombre del Proveedor:</label>
                    <input type="text" name="nombreProveedor" id="nombreProveedor" value="${param.nombreProveedor}" required /><br>

                    <label>Teléfono del Proveedor:</label>
                    <input type="text" name="telefonoProveedor" id="telefonoProveedor" value="${param.telefonoProveedor}" required /><br><br>

                    <label>ID Direccion:</label>
                    <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br>

                    <label>Direccion Completa:</label>
                    <input type="text" name="direccionCompleta" id="direccionCompleta" value="${param.direccionCompleta}" required /><br>

                    <label>ID Detalle Pedido:</label>
                    <input type="text" name="ID_DetallePedido" id="ID_DetallePedido" value="${param.ID_DetallePedido}" required /><br>

                    <label>Cantidad:</label>
                    <input type="text" name="cantidad" id="cantidad" value="${param.cantidad}" required /><br><br>

                    <label>ID Producto:</label>
                    <input type="text" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" readonly /><br>

                    <label>Nombre del Producto:</label>
                    <input type="text" name="Nombre_Producto" id="Nombre_Producto" value="${param.nombreProducto}" required /><br>

                    <label>Descripción:</label>
                    <textarea name="Descripcion" id="Descripcion" required>${param.descripcion}</textarea><br>

                    <label>Precio Unitario:</label>
                    <input type="text" name="Precio_Unitario" id="Precio_Unitario" value="${param.precioUnitario}" required /><br>

                    <label>Existencia:</label>
                    <input type="text" name="Existencia" id="Existencia" value="${param.existencia}" required /><br><br>

                    <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el pedido?')" /><br><br>
                </div>

                <div>
                    <a href="/SistemaWeb/?accion=GestionPedidos">Regresar</a><br><br>
                </div>


            </form>
    </body>
</html>
