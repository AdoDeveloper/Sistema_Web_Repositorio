<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modificar Cliente</title>
</head>
<body>   
    <h1>Modificar cliente</h1>
    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=ModificarCliente">
        <div>
            <label>ID Cliente:</label>
            <input type="text" name="ID_Cliente" id="ID_Cliente" value="${param.ID_Cliente}" readonly /><br>
            <label>Nombres:</label>
            <input type="text" name="nombresCliente" id="nombresCliente" value="${param.nombresCliente}" required /><br>
            <label>Apellidos:</label>
            <input type="text" name="apellidosCliente" id="apellidosCliente" value="${param.apellidosCliente}" required /><br>
            <label>DUI:</label>
            <input type="text" name="DUI_Cliente" id="DUI_Cliente" value="${param.DUI_Cliente}" required /><br>
            <label>Fecha de nacimiento:</label>
            <input type="date" name="fechaNacCliente" id="fechaNacCliente" value="${param.fechaNacCliente}" required /><br>
            <label>Telefono:</label>
            <input type="text" name="telefono" id="telefono" value="${param.telefono}" required /><br>
            <label>Email:</label>
            <input type="email" name="correo" id="correo" value="${param.correo}" required /><br>
            <!-- Utiliza el combobox para seleccionar la dirección -->
            <label>ID Dirección:</label>
            <input type="number" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br> 
            <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el cliente?')" /><br><br> 
        </div>
        <div>
            <a href="/SistemaWeb/?accion=GestionClientes">Regresar</a><br><br>
        </div>             
    </form>
</body>
</html>
