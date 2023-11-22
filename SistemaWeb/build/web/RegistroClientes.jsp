<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Cliente</title>
</head>
<body>
    <c:if test="${exito!=null}">
        <c:if test="${exito}">
            <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
        </c:if>
        <c:if test="${!exito}">
            <p><strong style="color: red;">No se guardó la información</strong></p>
        </c:if>
    </c:if>   
    <h1>Agregar nuevo cliente</h1>
        
    <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroCliente">
        <!-- Agregar los campos correspondientes a los clientes -->
        <label>Nombres:</label>
        <input type="text" name="nombresCliente" id="nombresCliente" required /><br>
        <label>Apellidos:</label>
        <input type="text" name="apellidosCliente" id="apellidosCliente" required /><br>
        <label>DUI:</label>
        <input type="text" name="DUI_Cliente" id="DUI_Cliente" required /><br>
        <label>Fecha de Nacimiento:</label>
        <input type="date" name="fechaNacCliente" id="fechaNacCliente" required /><br>
        <label>Correo:</label>
        <input type="email" name="correo" id="correo" required /><br>
        <label>ID Dirección:</label>
        <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>

        <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el cliente?')" />
        <input type="button" value="Limpiar" onclick="limpiarFormulario()" />
        <button type="button" onclick="location.href = '/SistemaWeb/?accion=GestionClientes'">Gestionar clientes</button> 
    </form>

    <!-- Agregar el script necesario para las funciones adicionales -->
    <script>
        function limpiarFormulario() {
            document.getElementById("nombresCliente").value = "";
            document.getElementById("apellidosCliente").value = "";
            document.getElementById("DUI_Cliente").value = "";
            document.getElementById("fechaNacCliente").value = "";
            document.getElementById("correo").value = "";
            document.getElementById("ID_Direccion").value = "";
        }
    </script>
</body>
</html>

