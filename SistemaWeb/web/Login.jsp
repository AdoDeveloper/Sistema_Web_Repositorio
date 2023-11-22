<%-- 
    Document   : Login
    Created on : 7 oct 2023, 09:43:01
    Author     : ernes
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <form method="post" action="/SistemaWeb/ServletPrincipal?accion=Login" id="formulario">
        <div id="resultadologin"></div>
        <div><h1>Bienvenido al Supermercado</h1><div>
        <%--Comentario Java--%>
        <%--Forma antigua e ilegible--%>
        <%-- <div><label>
                Fecha actual: <strong> <%= new java.util.Date().toString()%>    
        </label></div>
        <%--Forma legible--%>
        <%-- Crear objeto de la clase Date y formatear la fecha --%>
        <c:set var="fechaActual" value="<%= new java.util.Date() %>" />
        <c:set var="formatoFecha" value="dd/MM/YYYY" />  
        <%-- Imprimir fecha --%>            
        <div><label><strong>
            <c:out value="Fecha actual: "/>
            <fmt:formatDate value='${fechaActual}' pattern='${formatoFecha}' />
        </strong></label></div><br>
        <div><label>Usuario: </label></div>
        <div><input type="text" name="tfUsuario" id="usuario"></div>
        <div><label>Contrasena:</label></div>
        <div><input type="password" name="tfContrasenia" id="contrasenia"></div><br>
        <div><input type="submit" value="Iniciar Sesión"></div>
    </form>
    </body>
</html>
