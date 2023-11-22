<%-- 
    Document   : RegistroEmpleados
    Created on : 12 oct 2023, 16:45:13
    Author     : ernes
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Empleado</title>
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
        <h1>Agregar nuevo empleado</h1>
            
        <form method="POST" action="/SistemaWeb/ServletPrincipal?accion=RegistroEmpleado">


                <!-- El ID de los empleados es autoincrementable -->
                <label>DUI:</label>
                <input type="text" name="DUI_Empleado" id="DUI_Empleado" required /><br>
                <label>Número de afiliado ISSS:</label>
                <input type="text" name="ISSS_Empleado" id="ISSS_Empleado" required /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresEmpleado" id="nombresEmpleado" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEmpleado" id="apellidosEmpleado" required /><br>
                <label>Fecha de nacimiento:</label>
                <input type="date" name="fechaNacEmpleado" id="fechaNacEmpleado" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefono" id="telefono" required /><br>
                <label>Correo:</label>
                <input type="email" name="correo" id="correo" required /><br>
                
                <label>Cargo:</label>
                <select name="ID_Cargo" id="ID_Cargo" required>
                    <option value="-1" selected>Seleccione una opción</option>
                    <c:forEach var="item" items="${listaCargos}">
                        <option value="${item.ID_Cargo}">
                            ${item.cargo}
                        </option>
                    </c:forEach>
                </select>          
                <button type="button" onclick="agregarCargo()">Nuevo cargo</button><br>   
                
                <label>Dirección:</label>
                <select name="ID_Direccion" id="ID_Direccion" required>
                    <option value="-1" selected>Seleccione una opción</option>
                    <c:forEach var="item" items="${listaDirecciones}">
                        <option value="${item.ID_Direccion}">
                            ${item.linea1}, ${item.linea2}, ${item.ID_Distrito}, ${item.codigoPostal}
                        </option>
                    </c:forEach>
                </select>                              
                <button type="button" onclick="agregarDireccion()">Pre-registrar dirección</button>
                
                
                
                <br>
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el empleado?')" />
                <input type="button" value="Limpiar" onclick="limpiarFormulario()" />
                <button type="button" onclick="location.href = '/SistemaWeb/?accion=GestionEmpleados'">Gestionar empleados</button> 
        </form>
    </body>
</html>
<script>
    function agregarCargo() {
        window.open('/SistemaWeb/?accion=AgregarCargo', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }

    function agregarDireccion() {
        window.open('/SistemaWeb/?accion=AgregarDireccion', '_blank', 'width=600, height=600, top=100, left=100, resizable=yes, scrollbars=yes');
    }

    function limpiarFormulario() {
        document.getElementById("DUI_Empleado").value = "";
        document.getElementById("ISSS_Empleado").value = "";
        document.getElementById("nombresEmpleado").value = "";
        document.getElementById("apellidosEmpleado").value = "";
        document.getElementById("fechaNacEmpleado").value = "";
        document.getElementById("telefono").value = "";
        document.getElementById("correo").value = "";
        document.getElementById("ID_Cargo").value = "-1";
        document.getElementById("ID_Direccion").value = "-1";
    }
</script>
