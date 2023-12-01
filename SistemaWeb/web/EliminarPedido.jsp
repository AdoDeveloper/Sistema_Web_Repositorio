<%-- 
    Document   : EliminarPedido
    Created on : 1 dic 2023, 10:46:00
    Author     : gabri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Pedido</title>
    </head>
    <body>
        <h1>Eliminar pedido</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=EliminarEmpleado">
            <div>
                <label>ID Pedido: ${param.ID_Pedido}</label><br>
                <label>Fecha Pedido: ${param.fechaPedido}</label><br>
                <label>Monto: ${param.monto}</label><br>
                <label>ID Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombre del Proveedor: ${param.nombreProveedor}</label><br>
                <label>Teléfono del Proveedor: ${param.telefonoProveedor}</label><br><br>

                <label>ID Direccion: ${param.ID_Direccion}</label><br>
                <label>Direccion Completa: ${param.direccionCompleta}</label><br>
                <label>ID Detalle Pedido: ${param.ID_DetallePedido}</label><br>
                <label>Cantidad: ${param.cantidad}</label><br><br>

                <label>ID Producto: ${param.ID_Producto}</label><br>
                <label>Nombre del Producto: ${param.nombreProducto}</label><br>
                <label>Descripción: ${param.descripcion}</label><br>
                <label>Existencia: ${param.existencia}</label><br>
                <label>Precio Unitario: ${param.precioUnitario}</label><br><br>

                <input type="hidden" name="ID_Pedido" id="ID_Pedido" value="${param.ID_Pedido}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el pedido?')" /><br><br>
            </div>

            <div>
                <a href="/SistemaWeb/?accion=GestionPedidos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
