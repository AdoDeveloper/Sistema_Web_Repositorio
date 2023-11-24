<%-- 
    Document   : ModificarProducto
    Created on : 19 nov 2023, 08:25:01
    Author     : Kevin Aparicio
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Producto</title>
    </head>
    <body>   
        <h1>Modificar Producto</h1>
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=modificarProducto">
            <div>
                <label>ID Producto:</label>
                <input type="text" name="ID_Producto" id="ID_Producto" value="${param.ID_Producto}" readonly /><br>
                <label>Nombre del Producto:</label>
                <input type="text" name="Nombre_Producto" id="Nombre_Producto" value="${param.nombreProducto}" required /><br>
                <label>Descripción:</label>
                <textarea name="Descripcion" id="Descripcion" required>${param.descripcion}</textarea><br>
                <label>Precio Unitario:</label>
                <input type="text" name="Precio_Unitario" id="Precio_Unitario" value="${param.precioUnitario}" required /><br>
                <label>Existencia:</label>
                <input type="text" name="Existencia" id="Existencia" value="${param.existencia}" required /><br>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" required /><br>
                <label>Nombre del Proveedor:</label>
                <input type="text" name="Nombre_Proveedor" id="Nombre_Proveedor" value="${param.nombreProveedor}" required /><br>
                <label>Teléfono del Proveedor:</label>
                <input type="text" name="Telefono_Proveedor" id="Telefono_Proveedor" value="${param.telefonoProveedor}" required /><br><br>           
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el producto?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWeb/?accion=GestionProductos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>

