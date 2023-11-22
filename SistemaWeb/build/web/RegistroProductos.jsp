<%-- 
    Document   : RegistroProductos
    Created on : 12 oct 2023, 16:46:58
    Author     : ernes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 20px;
            }
            
            .form-container {
                max-width: 400px;
                margin: auto;
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            
            .form-group {
                margin-bottom: 10px;
            }
            
            .form-group label {
                display: block;
                font-weight: bold;
            }
            
            .form-group input {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            
            .form-group input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            
            .form-group input[type="submit"]:hover {
                background-color: #45a049;
            }
            
            .contenedor {
              display: flex;
              flex-direction: column; 
              align-items: center; 
              justify-content: center;
              height: 100vh; 
            }
        </style>
    </head>
    <body>
        <div class="contenedor">
            <div class="form-container">
                <h1>Registro de Productos</h1>
                <form method="post" action="/SistemaWeb/ServletPrincipal?accion=Login" id="formulario">
                    <div class="form-group">
                        <label for="nombre">Nombre del Producto:</label>
                        <input type="text" id="nombre" name="tfNombreProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <input type="text" id="descripcion" name="tfDescripcion" required>
                    </div>
                    <div class="form-group">
                        <label for="precio">Precio Unitario:</label>
                        <input type="text" id="precio" name="tfPrecio" required>
                    </div>
                    <div class="form-group">
                        <label for="existencia">Existencia:</label>
                        <input type="number" id="existencia" name="tfExistencia" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="btGuardar" value="GUARDAR">
                        <input type="reset" name="btLimpiar" value="LIMPIAR">
                    </div>
                </form>
                <button onclick="regresar()">Regresar</button>
            </div>
        </div>
        <script>  
        function regresar(){
            window.history.back();
        }
        </script>
    </body>
</html>
