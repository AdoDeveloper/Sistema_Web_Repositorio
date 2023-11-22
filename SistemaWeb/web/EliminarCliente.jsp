<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Cliente</title>
</head>
<body>
    <h1>Eliminar cliente</h1>

    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=EliminarCliente">
        <div>
            <label>ID Cliente: ${param.ID_Cliente}</label><br>
            <label>Nombres: ${param.nombresCliente}</label><br>
            <label>Apellidos: ${param.apellidosCliente}</label><br>
            <label>DUI: ${param.DUI_Cliente}</label><br>
            <label>Fecha de nacimiento: ${param.fechaNacCliente}</label><br>
            <label>Email: ${param.correo}</label><br>
            <!-- Se ha eliminado la línea para mostrar ID_Direccion -->
            <input type="hidden" name="ID_Cliente" id="ID_Cliente" value="${param.ID_Cliente}" /><br><br>
            <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cliente?')" /><br><br>
        </div>
        <div>
            <a href="/SistemaWeb/?accion=GestionClientes">Regresar</a><br><br>
        </div>             
    </form>
</body>
</html>

