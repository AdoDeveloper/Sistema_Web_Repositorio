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

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
    public void  modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
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
                 + "DUI_Empleado='"+DUI_Empleado+"', "
                 + "ISSS_Empleado='"+ISSS_Empleado+"', "
                 + "NombresEmpleado='"+nombresEmpleado+"', "
                 + "ApellidosEmpleado='"+apellidosEmpleado+"', "
                 + "FechaNacEmpleado='"+fechaNacEmpleado+"', "
                 + "Telefono='"+telefonoEmpleado+"', "
                 + "Correo='"+correo+"', " 
                 + "ID_Cargo='"+ID_Cargo+"', "
                 + "ID_Direccion='"+ID_Direccion+"' " 
                 + "where ID_Empleado='"+ID_Empleado+"'";
                
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
        }else if (accion.equals("GestionEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("GestionEmpleados.jsp").forward(request, response);
        } else if (accion.equals("RegistroProductos")) {
            request.getRequestDispatcher("RegistroProductos.jsp").forward(request, response);
        } else if (accion.equals("Ventas")) {
            request.getRequestDispatcher("Ventas.jsp").forward(request, response);
        } else if (accion.equals("Clientes")) {
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        } else if (accion.equals("GestionClientes")) {
            mostrarClientes(request, response);
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
        } else if (accion.equals("GestionProductos")){
            mostrarProductos(request, response);
            if (request.getSession().getAttribute("exito") != null) {
                request.setAttribute("exito", request.getSession().getAttribute("exito"));
                request.getSession().removeAttribute("exito");
            }
            request.getRequestDispatcher("GestionProductos.jsp").forward(request, response);
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
