<%-- 
    Document   : Clientes
    Created on : 13 oct 2023, 21:22:39
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Clientes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Registro de Clientes</h1>
    <form method="post" action="/SistemaWeb/ServletPrincipal?accion=GuardarCliente" id="formulario">
        <div class="form-group">
            <label for="nombres">Nombres:</label>
            <input type="text" id="nombres" name="tfNombres" required>
        </div>
        <div class="form-group">
            <label for="apellidos">Apellidos:</label>
            <input type="text" id="apellidos" name="tfApellidos" required>
        </div>
        <div class="form-group">
            <label for="dui">DUI:</label>
            <input type="text" id="dui" name="tfDUI" required>
        </div>
        <div class="form-group">
            <label for="fechaNac">Fecha de Nacimiento:</label>
            <input type="date" id="fechaNac" name="tfFechaNac" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="tfTelefono" required>
        </div>
        <div class="form-group">
            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="tfEmail" required>
        </div>
<!--        <div class="form-group">
            <label for="idDireccion">ID de Dirección:</label>
            <input type="number" id="idDireccion" name="tfIDDireccion" required>
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
