<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* Estilo para el contenedor del pop-up */
            .popup-container {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                z-index: 1;
            }

            /* Estilo para el fondo oscuro */
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
        </style>
  
    </head>
    <body>
        <h1>Gestión de Productos</h1>
        <h2>Listado de Productos</h2>
        <h3>Conexion: ${mensaje_conexion}</h3><br>

        <table border="1">
            <thead>
                <tr>
                    <th>ID_Producto</th>
                    <th>Nombre_Producto</th>
                    <th>Descripcion</th>
                    <th>Precio_Unitario</th>
                    <th>Existencia</th>
                    <th>ID Proveedor</th>
                    <th>Nombre Proveedor</th>
                    <th>Telefono Proveedor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProductos}" var="item">
                    <tr>    
                        <!-- Mostrar -->
                        <td><c:out value="${item.ID_Producto}" /></td>
                        <td><c:out value="${item.nombreProducto}" /></td>
                        <td><c:out value="${item.descripcion}" /></td>
                        <td><c:out value="${item.precioUnitario}" /></td>
                        <td><c:out value="${item.existencia}" /></td>
                        <td><c:out value="${item.ID_Proveedor}" /></td>
                        <td><c:out value="${item.nombreProveedor}" /></td>
                        <td><c:out value="${item.telefonoProveedor}" /></td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
          <script>
    function abrirPopup() {
        var popup = document.getElementById('popup');
        var overlay = document.getElementById('overlay');

        if (popup.style.display === 'block') {
            popup.style.display = 'none';
            overlay.style.display = 'none';
        } else {
            popup.style.display = 'block';
            overlay.style.display = 'block';
        }
    }

    function mostrarDetallesProductos(ID_Producto, Nombre_Producto, Descripcion, Precio_Unitario, Existencia, ID_Proveedor, Nombre_Proveedor, Telefono_Proveedor) {
        document.getElementById('ID_Producto').textContent = ID_Producto;
        document.getElementById('Nombre_Producto').textContent = Nombre_Producto;
        document.getElementById('Descripcion').textContent = Descripcion;
        document.getElementById('Precio_Unitario').textContent = Precio_Unitario;
        document.getElementById('Existencia').textContent = Existencia;
        document.getElementById('ID_Proveedor').textContent = ID_Proveedor;
        document.getElementById('Nombre_Proveedor').textContent = Nombre_Proveedor;
        document.getElementById('Telefono_Proveedor').textContent = Telefono_Proveedor;

        // Muestra el pop-up
        abrirPopup();
    }
</script>
</html>
