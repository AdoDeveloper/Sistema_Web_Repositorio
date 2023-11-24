<%-- 
    Document   : EliminarProducto
    Created on : 19 nov 2023, 08:24:39
    Author     : Kevin Aparicio
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Producto</title>
    </head>
    <body>
        <h1>Eliminar Producto</h1>

        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=eliminarProducto">
            <div>
                <label>ID Producto: ${param.ID_Producto}</label><br>
                <label>Nombre Producto: ${param.nombreProducto}</label><br>
                <label>Descripcion: ${param.descripcion}</label><br>
                <label>Precio Unitario: ${param.precioUnitario}</label><br>
                <label>Existencia: ${param.existencia}</label><br>
                <label>Id Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombre Proveedor: ${param.nombreProveedor}</label><br>
                <label>Telefono Proveedor: ${param.telefonoProveedor}</label><br>  
                <input type="hidden" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar este Producto?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWeb/?accion=GestionProductos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
