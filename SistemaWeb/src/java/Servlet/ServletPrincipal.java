/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Models.ViewModelCargos;
import Models.ViewModelClientes;
import Models.ViewModelDirecciones;
import Models.ViewModelProductos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Models.ViewModelEmpleados;
import Models.ViewModelFacturas;
import Models.ViewModelUsuarios;
import Models.ViewModelVentas;
import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServletPrincipal extends HttpServlet {

    private final String usuario = "sa";
    private final String contrasenia = "root";
    private final String servidor = "localhost:1433";
    private final String bd = "Supermercado";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName=" + bd
            + ";user=" + usuario
            + ";password=" + contrasenia
            + ";encrypt=false;trustServerCertificate=false;";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaEmpleados";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    ViewModelEmpleados empleado = new ViewModelEmpleados();
                    empleado.setID_Empleado(rs.getInt("ID_Empleado"));
                    empleado.setDUI_Empleado(rs.getString("DUI_Empleado"));
                    empleado.setISSS_Empleado(rs.getInt("ISSS_Empleado"));
                    empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                    empleado.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                    empleado.setFechaNacEmpleado(rs.getDate("fechaNacEmpleado"));
                    empleado.setTelefono(rs.getString("telefono"));
                    empleado.setCorreo(rs.getString("correo"));
                    empleado.setID_Cargo(rs.getInt("ID_Cargo"));
                    empleado.setCargo(rs.getString("cargo"));
                    empleado.setID_Direccion(rs.getInt("ID_Direccion"));
                    empleado.setDireccionCompleta(rs.getString("direccionCompleta"));
                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    //Funciones de escritura en tablas (INSERT)
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, DUI_Empleado);
                pstmt.setString(2, ISSS_Empleado);
                pstmt.setString(3, nombresEmpleado);
                pstmt.setString(4, apellidosEmpleado);
                pstmt.setString(5, fechaNacEmpleado);
                pstmt.setString(6, telefonoEmpleado);
                pstmt.setString(7, correo);
                pstmt.setString(8, ID_Cargo);
                pstmt.setString(9, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void agregarProducto(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los productos es autoincrementable
        String Nombre_Producto = request.getParameter("Nombre_Producto");
        String Descripcion = request.getParameter("Descripcion");
        String Precio_Unitario = request.getParameter("Precio_Unitario");
        String Existencia = request.getParameter("Existencia");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Productos values (?, ?, ?, ?,)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Nombre_Producto);
                pstmt.setString(2, Descripcion);
                pstmt.setString(3, Precio_Unitario);
                pstmt.setString(4, Existencia);
                pstmt.setString(5, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void mostrarProductos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaDetalleProductos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelProductos> listaProductos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelProductos producto = new ViewModelProductos();
                    producto.setID_Producto(rs.getInt("ID_Producto"));
                    producto.setNombreProducto(rs.getString("Nombre_Producto"));
                    producto.setDescripcion(rs.getString("Descripcion"));
                    producto.setPrecioUnitario(rs.getFloat("Precio_Unitario"));
                    producto.setExistencia(rs.getInt("Existencia"));
                    producto.setID_Proveedor(rs.getInt("ID_Proveedor"));
                    producto.setNombreProveedor(rs.getString("Nombre_Proveedor"));
                    producto.setTelefonoProveedor(rs.getString("Telefono_Proveedor"));
                    listaProductos.add(producto);
                }
                request.setAttribute("listaProductos", listaProductos);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    //Funciones de actualizacion de registros (UPDATE)
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Empleado = request.getParameter("ID_Empleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String fechaNacEmpleado = request.getParameter("fechaNacEmpleado");
        String telefonoEmpleado = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Empleados set "
                        + "DUI_Empleado='" + DUI_Empleado + "', "
                        + "ISSS_Empleado='" + ISSS_Empleado + "', "
                        + "NombresEmpleado='" + nombresEmpleado + "', "
                        + "ApellidosEmpleado='" + apellidosEmpleado + "', "
                        + "FechaNacEmpleado='" + fechaNacEmpleado + "', "
                        + "Telefono='" + telefonoEmpleado + "', "
                        + "Correo='" + correo + "', "
                        + "ID_Cargo='" + ID_Cargo + "', "
                        + "ID_Direccion='" + ID_Direccion + "' "
                        + "where ID_Empleado='" + ID_Empleado + "'";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void modificarProducto(HttpServletRequest request, HttpServletResponse response) {
        String ID_Producto = request.getParameter("ID_Producto");
        String Nombre_Producto = request.getParameter("Nombre_Producto");
        String descripcion = request.getParameter("Descripcion");
        String Precio_Unitario = request.getParameter("Precio_Unitario");
        String Existencia = request.getParameter("Existencia");
        String ID_Proveedor = request.getParameter("ID_Proveedor");
        String Nombre_Proveedor = request.getParameter("Nombre_Proveedor");
        String Telefono_Proveedor = request.getParameter("Telefono_Proveedor");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                String sql = "update VistaDetalleProductos set "
                        + "Nombre_Producto=?, "
                        + "Descripcion=?, "
                        + "Precio_Unitario=?, "
                        + "Existencia=?, "
                        + "ID_Proveedor=?, "
                        + "Nombre_Proveedor=?, "
                        + "Telefono_Proveedor=? "
                        + "where ID_Producto=?";

                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, Nombre_Producto);
                    pstmt.setString(2, descripcion);
                    pstmt.setString(3, Precio_Unitario);
                    pstmt.setString(4, Existencia);
                    pstmt.setString(5, ID_Proveedor);
                    pstmt.setString(6, Nombre_Proveedor);
                    pstmt.setString(7, Telefono_Proveedor);
                    pstmt.setString(8, ID_Producto);

                    int registros = pstmt.executeUpdate();
                    if (registros > 0) {
                        request.getSession().setAttribute("exito", true);
                    } else {
                        request.getSession().setAttribute("exito", false);
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace(); // Podrías manejar la excepción de una manera más amigable.
        }
    }

    public void mostrarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Usuarios";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelUsuarios> listaUsuarios = new ArrayList<>();
                while (rs.next()) {
                    ViewModelUsuarios usuarios = new ViewModelUsuarios();
                    usuarios.setID_Usuario(rs.getInt("ID_Usuario"));
                    usuarios.setID_Empleado(rs.getInt("ID_Empleado"));
                    usuarios.setID_Rol(rs.getInt("ID_Rol"));
                    usuarios.setUsuario(rs.getString("Usuario"));
                    usuarios.setClave(rs.getString("Clave"));
                    listaUsuarios.add(usuarios);
                }
                request.setAttribute("listaUsuarios", listaUsuarios);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    //Funciones de eliminacion de registros (DELETE)
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Empleados where ID_Empleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        String ID_Producto = request.getParameter("ID_Producto");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Productos where ID_Producto='" + ID_Producto + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void mostrarCargos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from Cargos";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelCargos> listaCargos = new ArrayList<>();
                while (rs.next()) {
                    ViewModelCargos cargo = new ViewModelCargos();
                    cargo.setID_Cargo(rs.getInt("ID_Cargo"));
                    cargo.setCargo(rs.getString("cargo"));
                    listaCargos.add(cargo);
                }
                request.setAttribute("listaCargos", listaCargos);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void agregarCargo(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los cargos es autoincrementable
        String cargo = request.getParameter("Cargo");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Cargos values (?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, cargo);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void agregarDireccion(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String linea1 = request.getParameter("linea1");
        String linea2 = request.getParameter("linea2");
        String ID_Distrito = request.getParameter("ID_Distrito");
        String codigoPostal = request.getParameter("codigoPostal");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Direcciones values (?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, linea1);
                pstmt.setString(2, linea2);
                pstmt.setString(3, ID_Distrito);
                pstmt.setString(4, codigoPostal);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void mostrarDirecciones(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                //Lista de Departamentos
                String sqlQueryDepartamentos = "select * from Departamentos";
                PreparedStatement pstmtDep = conn.prepareStatement(sqlQueryDepartamentos);
                ResultSet rsDep = pstmtDep.executeQuery();
                ArrayList<ViewModelDirecciones> listaDepartamentos = new ArrayList<>();
                while (rsDep.next()) {
                    ViewModelDirecciones departamento = new ViewModelDirecciones();
                    departamento.setID_Departamento(rsDep.getString("ID_Departamento"));
                    departamento.setDepartamento(rsDep.getString("Departamento"));
                    departamento.setPais(rsDep.getString("Pais"));
                    listaDepartamentos.add(departamento);
                }
                request.setAttribute("listaDepartamentos", listaDepartamentos);

                //Lista de Municipios
                String sqlQueryMunicipios = "select * from Municipios";
                PreparedStatement pstmtMun = conn.prepareStatement(sqlQueryMunicipios);
                ResultSet rsMun = pstmtMun.executeQuery();
                ArrayList<ViewModelDirecciones> listaMunicipios = new ArrayList<>();
                while (rsMun.next()) {
                    ViewModelDirecciones municipio = new ViewModelDirecciones();
                    municipio.setID_Municipio(rsMun.getString("ID_Municipio"));
                    municipio.setMunicipio(rsMun.getString("Municipio"));
                    municipio.setID_Departamento(rsMun.getString("ID_Departamento"));
                    listaMunicipios.add(municipio);
                }
                request.setAttribute("listaMunicipios", listaMunicipios);

                //Lista de Distritos
                String sqlQueryDistritos = "select * from Distritos";
                PreparedStatement pstmtDis = conn.prepareStatement(sqlQueryDistritos);
                ResultSet rsDis = pstmtDis.executeQuery();
                ArrayList<ViewModelDirecciones> listaDistritos = new ArrayList<>();
                while (rsDis.next()) {
                    ViewModelDirecciones distrito = new ViewModelDirecciones();
                    distrito.setID_Distrito(rsDis.getString("ID_Distrito"));
                    distrito.setDistrito(rsDis.getString("Distrito"));
                    distrito.setID_Municipio(rsDis.getString("ID_Municipio"));
                    listaDistritos.add(distrito);
                }
                request.setAttribute("listaDistritos", listaDistritos);

                //Lista de Direcciones
                String sqlQueryDirecciones = "select * from Direcciones";
                PreparedStatement pstmtDir = conn.prepareStatement(sqlQueryDirecciones);
                ResultSet rsDir = pstmtDir.executeQuery();
                ArrayList<ViewModelDirecciones> listaDirecciones = new ArrayList<>();
                while (rsDir.next()) {
                    ViewModelDirecciones direccion = new ViewModelDirecciones();
                    direccion.setID_Direccion(rsDir.getInt("ID_Direccion"));
                    direccion.setLinea1(rsDir.getString("linea1"));
                    direccion.setLinea2(rsDir.getString("linea2"));
                    direccion.setID_Distrito(rsDir.getString("ID_Distrito"));
                    direccion.setCodigoPostal(rsDir.getString("CodigoPostal"));
                    listaDirecciones.add(direccion);
                }
                request.setAttribute("listaDirecciones", listaDirecciones);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaClientes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setID_Cliente(rs.getInt("ID_Cliente"));
                    cliente.setNombresCliente(rs.getString("Nombres"));
                    cliente.setApellidosCliente(rs.getString("Apellidos"));
                    cliente.setDUI_Cliente(rs.getString("DUI"));
                    cliente.setFechaNacCliente(rs.getDate("FechaNac"));
                    cliente.setCorreo(rs.getString("Email"));
                    cliente.setTelefono(rs.getString("Telefono"));
                    cliente.setID_Direccion(rs.getInt("ID_Direccion"));
                    cliente.setDireccionCompleta(rs.getString("direccionCompleta"));
                    listaClientes.add(cliente);
                }
                request.setAttribute("listaClientes", listaClientes);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {
        // CAPTURA DE VARIABLES
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String DUI_Cliente = request.getParameter("DUI_Cliente");
        String fechaNacCliente = request.getParameter("fechaNacCliente");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono"); // Agregado el campo de teléfono
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                conn.setAutoCommit(false); // Deshabilitar la confirmación automática

                String sql = "INSERT INTO Clientes (Nombres, Apellidos, DUI, FechaNac, Email, Telefono, ID_Direccion) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    // Validar que los datos no estén vacíos o nulos
                    if (nombresCliente != null && apellidosCliente != null && DUI_Cliente != null
                            && fechaNacCliente != null && correo != null && telefono != null && ID_Direccion != null) {
                        pstmt.setString(1, nombresCliente);
                        pstmt.setString(2, apellidosCliente);
                        pstmt.setString(3, DUI_Cliente);
                        pstmt.setString(4, fechaNacCliente);
                        pstmt.setString(5, correo);
                        pstmt.setString(6, telefono);
                        pstmt.setString(7, ID_Direccion);

                        int registros = pstmt.executeUpdate();

                        if (registros > 0) {
                            conn.commit(); // Confirmar la transacción si todo está bien
                            request.getSession().setAttribute("exito", true);
                        } else {
                            request.getSession().setAttribute("exito", false);
                        }
                    } else {
                        request.getSession().setAttribute("exito", false);
                    }
                }
            } catch (SQLException ex) {
                // Manejar las excepciones de manera más específica
                request.getSession().setAttribute("exito", false);
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
        // CAPTURA DE VARIABLES
        String ID_Cliente = request.getParameter("ID_Cliente");
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String DUI_Cliente = request.getParameter("DUI_Cliente");
        String fechaNacCliente = request.getParameter("fechaNacCliente");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono"); // Agregado el campo de teléfono
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sql = "update Clientes set "
                        + "Nombres=?, "
                        + "Apellidos=?, "
                        + "DUI=?, "
                        + "FechaNac=?, "
                        + "Email=?, "
                        + "Telefono=?, " // Agregado el campo de teléfono
                        + "ID_Direccion=? "
                        + "where ID_Cliente=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, DUI_Cliente);
                pstmt.setString(4, fechaNacCliente);
                pstmt.setString(5, correo);
                pstmt.setString(6, telefono);
                pstmt.setString(7, ID_Direccion);
                pstmt.setString(8, ID_Cliente);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("ID_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Clientes where ID_Cliente=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, ID_Cliente);

                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }

    public void mostrarVentas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sqlQuery = "SELECT * FROM VistaDetalleVentas";
                try (PreparedStatement pstmt = conn.prepareStatement(sqlQuery); ResultSet rs = pstmt.executeQuery()) {

                    ArrayList<ViewModelVentas> listaVentas = new ArrayList<>();
                    while (rs.next()) {
                        ViewModelVentas venta = new ViewModelVentas();
                        venta.setID_Venta(rs.getInt("ID_Venta"));
                        venta.setFechaVenta(rs.getString("FechaVenta"));
                        venta.setSubtotal(rs.getDouble("SubTotal"));
                        venta.setTotal(rs.getDouble("Total"));
                        venta.setNombreProducto(rs.getString("Nombre_Producto"));
                        venta.setPrecioUnitario(rs.getDouble("Precio_Unitario"));
                        venta.setCantidadProducto(rs.getInt("Cantidad_Producto"));
                        venta.setNombreCliente(rs.getString("Cliente"));
                        listaVentas.add(venta);
                    }

                    request.setAttribute("listaVentas", listaVentas);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public void mostrarFacturas(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");

                String sqlQuery = "SELECT * FROM VistaDetalleFacturas";
                try (PreparedStatement pstmt = conn.prepareStatement(sqlQuery); ResultSet rs = pstmt.executeQuery()) {

                    ArrayList<ViewModelFacturas> listaFacturas = new ArrayList<>();
                    while (rs.next()) {
                        ViewModelFacturas factura = new ViewModelFacturas();
                        factura.setID_Cliente(rs.getInt("ID_Cliente"));
                        factura.setNombres(rs.getString("Nombres"));
                        factura.setApellidos(rs.getString("Apellidos"));
                        factura.setDui(rs.getString("DUI"));
                        factura.setFechaNac(rs.getDate("FechaNac"));
                        factura.setEmail(rs.getString("Email"));
                        factura.setId_factura(rs.getInt("ID_Factura"));
                        factura.setIva(rs.getDouble("IVA"));
                        factura.setDescuento(rs.getDouble("Descuento"));
                        factura.setSubTotal(rs.getDouble("SubTotal"));
                        factura.setTotal(rs.getDouble("Total"));
                        factura.setNit(rs.getString("NIT"));
                        factura.setId_venta(rs.getInt("ID_Venta"));
                        factura.setMontoVenta(rs.getDouble("MontoVenta"));
                        factura.setFechaVenta(rs.getString("FechaVenta"));
                        factura.setNombreProducto(rs.getString("Nombre_Producto"));
                        factura.setPrecioUnitario(rs.getDouble("Precio_Unitario"));
                        factura.setCantidadProducto(rs.getInt("Cantidad_Producto"));
                        listaFacturas.add(factura);
                    }

                    request.setAttribute("listaFacturas", listaFacturas);

                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
            ex.printStackTrace();
        }
    }

    public ViewModelFacturas obtenerDetallesFacturaPorVenta(int idVenta) {
        ViewModelFacturas detallesFactura = new ViewModelFacturas();

        try (Connection conn = DriverManager.getConnection(url)) {
            String sqlQuery = "SELECT * FROM VistaDetalleFacturas WHERE ID_Venta = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sqlQuery)) {
                pstmt.setInt(1, idVenta);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        detallesFactura.setID_Cliente(rs.getInt("ID_Cliente"));
                        detallesFactura.setNombres(rs.getString("Nombres"));
                        detallesFactura.setApellidos(rs.getString("Apellidos"));
                        detallesFactura.setDui(rs.getString("DUI"));
                        detallesFactura.setFechaNac(rs.getDate("FechaNac"));
                        detallesFactura.setEmail(rs.getString("Email"));
                        detallesFactura.setId_factura(rs.getInt("ID_Factura"));
                        detallesFactura.setIva(rs.getDouble("IVA"));
                        detallesFactura.setDescuento(rs.getDouble("Descuento"));
                        detallesFactura.setSubTotal(rs.getDouble("SubTotal"));
                        detallesFactura.setTotal(rs.getDouble("Total"));
                        detallesFactura.setNit(rs.getString("NIT"));
                        detallesFactura.setId_venta(rs.getInt("ID_Venta"));
                        detallesFactura.setMontoVenta(rs.getDouble("MontoVenta"));
                        detallesFactura.setFechaVenta(rs.getString("FechaVenta"));
                        detallesFactura.setNombreProducto(rs.getString("Nombre_Producto"));
                        detallesFactura.setPrecioUnitario(rs.getDouble("Precio_Unitario"));
                        detallesFactura.setCantidadProducto(rs.getInt("Cantidad_Producto"));
                    }
                }
            }
        } catch (SQLException ex) {
            // Manejo de excepciones
            ex.printStackTrace();
        }

        return detallesFactura;
    }

    public void agregarVenta(HttpServletRequest request, HttpServletResponse response) {
        // Obtener datos del formulario
        String fechaVenta = request.getParameter("fechaVenta");
        String montoVenta = request.getParameter("total");

        int cantidadProducto = Integer.parseInt(request.getParameter("cantidadProducto"));
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));

        Connection conn = null;
        PreparedStatement pstmtVentas = null;
        PreparedStatement pstmtDetalleVentas = null;
        PreparedStatement pstmtFacturas = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            conn = DriverManager.getConnection(url);
            conn.setAutoCommit(false); // Deshabilitar el modo de autocommit

            // Insertar en la tabla Ventas
            String sql = "INSERT INTO Ventas (FechaVenta, MontoVenta) VALUES (?, ?)";
            pstmtVentas = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            pstmtVentas.setString(1, fechaVenta);
            pstmtVentas.setString(2, montoVenta);
            pstmtVentas.executeUpdate();

            System.out.print("se insertó en venta");

            // Obtener el ID_Venta generado
            try (ResultSet generatedKeys = pstmtVentas.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int idVenta = generatedKeys.getInt(1);

                    // Insertar en la tabla Detalle_Ventas
                    String insertDetalleVentas = "INSERT INTO Detalle_Ventas (Cantidad_Producto, ID_Producto, ID_Venta) VALUES (?, ?, ?)";
                    pstmtDetalleVentas = conn.prepareStatement(insertDetalleVentas);
                    pstmtDetalleVentas.setInt(1, cantidadProducto);
                    pstmtDetalleVentas.setInt(2, idProducto);
                    pstmtDetalleVentas.setInt(3, idVenta);
                    pstmtDetalleVentas.executeUpdate();

                    System.out.print("se insertó en detalle venta");

                    // Insertar en la tabla Facturas
                    String insertFacturas = "INSERT INTO Facturas (IVA, Descuento, SubTotal, Total, NIT, ID_Cliente, ID_Venta) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    pstmtFacturas = conn.prepareStatement(insertFacturas);

                    String iva = request.getParameter("iva");
                    String descuento = request.getParameter("descuento");
                    String subTotal = request.getParameter("subtotal");
                    String total = request.getParameter("total");
                    String nit = request.getParameter("nit");

                    pstmtFacturas.setString(1, iva);
                    pstmtFacturas.setString(2, descuento);
                    pstmtFacturas.setString(3, subTotal);
                    pstmtFacturas.setString(4, total);
                    pstmtFacturas.setString(5, nit);
                    pstmtFacturas.setInt(6, idCliente);
                    pstmtFacturas.setInt(7, idVenta);

                    int registros = pstmtFacturas.executeUpdate();

                    if (registros > 0) {
                        conn.commit(); // Confirmar la transacción si todo está bien
                        request.getSession().setAttribute("exito", true);
                    } else {
                        request.getSession().setAttribute("exito", false);
                    }

                    System.out.print("se insertó en factura");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback(); // Hacer rollback en caso de error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            // Manejar errores y redirigir o mostrar mensajes al usuario según sea necesario
        } finally {
            try {
                if (pstmtVentas != null) {
                    pstmtVentas.close();
                }
                if (pstmtDetalleVentas != null) {
                    pstmtDetalleVentas.close();
                }
                if (pstmtFacturas != null) {
                    pstmtFacturas.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String accion = request.getParameter("accion");

        if (accion == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (accion.equals("Login")) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (accion.equals("GestionEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("GestionEmpleados.jsp").forward(request, response);

            //NO OLVIDAR PONER MOSTRAR USUARIOS PARA HACER LA CONEXION CON LA DB
        } else if (accion.equals("GestionUsuarios")) {
            mostrarUsuarios(request, response);
            request.getRequestDispatcher("GestionUsuarios.jsp").forward(request, response);

        } else if (accion.equals("RegistroProductos")) {
            request.getRequestDispatcher("RegistroProductos.jsp").forward(request, response);
        } else if (accion.equals("GestionVentas")) {
            mostrarVentas(request, response);
            mostrarFacturas(request, response);
            request.getRequestDispatcher("GestionVentas.jsp").forward(request, response);
        } else if (accion.equals("Clientes")) {
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        } else if (accion.equals("GestionClientes")) {
            mostrarClientes(request, response);
            mostrarDirecciones(request, response);
            request.getRequestDispatcher("GestionClientes.jsp").forward(request, response);
        } else if (accion.equals("PedidosProductos")) {
            request.getRequestDispatcher("PedidosProductos.jsp").forward(request, response);
            //REDIRECCION PARA JSP DE AGREGAR
        } else if (accion.equals("RegistroEmpleados")) {
            mostrarCargos(request, response);
            mostrarDirecciones(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("RegistroEmpleados.jsp").forward(request, response);
        } else if (accion.equals("AgregarDireccion")) {
            mostrarDirecciones(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("AgregarDireccion.jsp").forward(request, response);
        } else if (accion.equals("GestionProductos")) {
            mostrarProductos(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("GestionProductos.jsp").forward(request, response);
        } else if (accion.equals("RegistroClientes")) {
            mostrarDirecciones(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("RegistroClientes.jsp").forward(request, response);
        } else if (accion.equals("verFactura")) {
            // Obtener el ID_Venta desde los parámetros de la URL
            int idVenta = Integer.parseInt(request.getParameter("ID_Venta"));
            ViewModelFacturas detallesFactura = obtenerDetallesFacturaPorVenta(idVenta);

            // Puedes realizar alguna acción con los detallesFactura
            request.setAttribute("detallesFactura", detallesFactura);

            // Redirigir a la página JSP
            request.getRequestDispatcher("GestionFacturas.jsp").forward(request, response);
            //mostrarEmpleados(request, response);
            //request.getRequestDispatcher("GestionEmpleados.jsp").forward(request, response);
        } else if (accion.equals("RegistroVentas")) {
            mostrarProductos(request, response);
            mostrarClientes(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("RegistroVentas.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //processRequest(request, response);
        String accion = request.getParameter("accion");

        if (accion.equals("Login")) {
            String usuario = request.getParameter("tfUsuario");
            String contrasenia = request.getParameter("tfContrasenia");

            try (PrintWriter print = response.getWriter()) {
                if (usuario.equals("admin") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelAdministrador.jsp").forward(request, response);
                } else if (usuario.equals("gerente") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelGerente.jsp").forward(request, response);
                } else if (usuario.equals("supervisor") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelSupervisor.jsp").forward(request, response);
                } else if (usuario.equals("rrhh") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelRRHH.jsp").forward(request, response);
                } else if (usuario.equals("contador") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelContador.jsp").forward(request, response);
                } else if (usuario.equals("bodeguero") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelBodeguero.jsp").forward(request, response);
                } else if (usuario.equals("cajero") && contrasenia.equals("root")) {
                    request.getRequestDispatcher("PanelCajero.jsp").forward(request, response);
                } else {
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Login Supermercado</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1>ERROR: Usuario o contraseña incorrectos</h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }

        //CAPTURA DE DATOS ENVIADOS POR POST
        if (accion.equals("RegistroEmpleado")) {
            //LOS DATOS SE LE PASAN POR PARAMETRO A LA FUNCION
            agregarEmpleado(request, response);
            //REDIRIGE NUEVAMENTE A LA VISTA DE AGREGAR EMPLEADO
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=RegistroEmpleados");
        } else if (accion.equals("ModificarEmpleado")) {
            modificarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionEmpleados");
        } else if (accion.equals("EliminarEmpleado")) {
            eliminarEmpleado(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionEmpleados");
        } else if (accion.equals("AgregarCargo")) {
            agregarCargo(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarCargo");
        } else if (accion.equals("AgregarDireccion")) {
            agregarDireccion(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=AgregarDireccion");
        } else if (accion.equals("RegistroCliente")) {

            agregarCliente(request, response);

            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=RegistroClientes");
        } else if (accion.equals("ModificarCliente")) {
            modificarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionClientes");
        } else if (accion.equals("EliminarCliente")) {
            eliminarCliente(request, response);
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=GestionClientes");
        } else if (accion.equals("RegistroVenta")) {

            agregarVenta(request, response);
            System.out.print("pasa al llamado");
            response.sendRedirect(request.getContextPath() + "/ServletPrincipal?accion=RegistroVentas");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
