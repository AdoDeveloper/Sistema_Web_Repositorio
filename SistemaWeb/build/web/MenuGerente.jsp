<%-- 
    Document   : MenuGerente
    Created on : 13 oct 2023, 22:14:11
    Author     : Kevin Aparicio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu Gerente</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
              integrity="sha384-7O3s6ZZlS9l+o9NUkyyz/B3zqvP/kC3TRamL1fjLVSARbIqW/Jfc4m/tz16F9KuD" crossorigin="anonymous">
        <style>
            .menu_principal {
                background-color: #333;
                padding: 20px;
                text-align: center;
            }

            .menu_principal ul {
                list-style: none;
                padding: 0;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .menu_principal li {
                margin: 5px;
                text-align: center;
            }

            .menu_principal a {
                display: flex;
                flex-direction: column;
                align-items: center;
                color: #fff;
                text-decoration: none;
                padding: 30px 20px; /* Aumenta el espacio vertical y mantiene el espacio horizontal */
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s;
                width: 200px;
            }

            .menu_principal a:hover {
                background-color: #45a049;
            }

            .menu_principal .btn-green {
                background-color: #4CAF50;
            }

            .menu_principal .btn-blue {
                background-color: #3498DB;
            }

            .menu_principal .btn-orange {
                background-color: #FF5733;
            }

            .menu_principal .btn-purple {
                background-color: #8E44AD;
            }

            .menu_principal .btn-red {
                background-color: #E74C3C;
            }

            .menu_principal .btn-gray {
                background-color: #95A5A6;
            }

            .menu_principal .btn-yellow {
                background-color: #F1C40F;
            }

            .menu_principal .btn-text {
                font-size: 16px;
                margin-top: 10px;
            }

            .menu_principal i {
                font-size: 24px;
            }
        </style>

    </head>
    <body>
        <div class="menu_principal">
            <ul>
                <li>
                    <a class="btn-green" href="/SistemaWeb">
                        <i class="fas fa-home"></i>
                        <span class="btn-text">Inicio</span>
                    </a>
                </li>
                <li>
                    <a class="btn-blue" href="/SistemaWeb?accion=Login">
                        <i class="fas fa-sign-in-alt"></i>
                        <span class="btn-text">Cerrar Sesion</span>
                    </a>
                </li>
                <li>
                    <a class="btn-purple" href="/SistemaWeb?accion=GestionEmpleados">
                        <i class="fas fa-user-tie"></i>
                        <span class="btn-text">Gestión Empleados</span>
                    </a>
                </li>
                <li>
                    <a class="btn-red" href="/SistemaWeb?accion=GestionProductos">
                        <i class="fas fa-cogs"></i>
                        <span class="btn-text">Gestión Productos</span>
                    </a>
                </li>
                <li>
                    <a class="btn-gray" href="/SistemaWeb?accion=Ventas">
                        <i class="fas fa-dollar-sign"></i>
                        <span class="btn-text">Ventas</span>
                    </a>
                </li>
            </ul>
        </div>
        <script src="https://kit.fontawesome.com/d172c4fb2e.js" crossorigin="anonymous"></script>
    </body>
</html>