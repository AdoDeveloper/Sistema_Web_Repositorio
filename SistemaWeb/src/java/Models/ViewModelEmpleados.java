/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author ernes
 */
public class ViewModelEmpleados {
     
    //Atributos
    private int ID_Empleado;
    private String DUI_Empleado;
    private int ISSS_Empleado;
    private String nombresEmpleado;
    private String apellidosEmpleado;
    private Date fechaNacEmpleado;
    private String telefono;
    private String correo;
    private int ID_Cargo;
    private String cargo;
    private int ID_Direccion;
    private String direccionCompleta;
    
    /**
     * @return the ID_Empleado
     */
    public int getID_Empleado() {
        return this.ID_Empleado;
    }

    /**
     * @param ID_Empleado the ID_Empleado to set
     */
    public void setID_Empleado(int ID_Empleado) {
        this.ID_Empleado = ID_Empleado;
    }

    /**
     * @return the DUI_Empleado
     */
    public String getDUI_Empleado() {
        return this.DUI_Empleado;
    }

    /**
     * @param DUI_Empleado the DUI_Empleado to set
     */
    public void setDUI_Empleado(String DUI_Empleado) {
        this.DUI_Empleado = DUI_Empleado;
    }

    /**
     * @return the ISSS_Empleado
     */
    public int getISSS_Empleado() {
        return this.ISSS_Empleado;
    }

    /**
     * @param ISSS_Empleado the ISSS_Empleado to set
     */
    public void setISSS_Empleado(int ISSS_Empleado) {
        this.ISSS_Empleado = ISSS_Empleado;
    }

    /**
     * @return the nombresEmpleado
     */
    public String getNombresEmpleado() {
        return this.nombresEmpleado;
    }

    /**
     * @param nombresEmpleado the nombresEmpleado to set
     */
    public void setNombresEmpleado(String nombresEmpleado) {
        this.nombresEmpleado = nombresEmpleado;
    }

    /**
     * @return the apellidosEmpleados
     */
    public String getApellidosEmpleado() {
        return this.apellidosEmpleado;
    }

    /**
     * @param apellidosEmpleados the apellidosEmpleados to set
     */
    public void setApellidosEmpleado(String apellidosEmpleado) {
        this.apellidosEmpleado = apellidosEmpleado;
    }

    /**
     * @return the fechaNacEmpleado
     */
    public Date getFechaNacEmpleado() {
        return this.fechaNacEmpleado;
    }

    /**
     * @param fechaNacEmpleado the fechaNacEmpleado to set
     */
    public void setFechaNacEmpleado(Date fechaNacEmpleado) {
        this.fechaNacEmpleado = fechaNacEmpleado;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return this.telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return this.correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the ID_Cargo
     */
    public int getID_Cargo() {
        return this.ID_Cargo;
    }

    /**
     * @param ID_Cargo the ID_Cargo to set
     */
    public void setID_Cargo(int ID_Cargo) {
        this.ID_Cargo = ID_Cargo;
    }

    /**
     * @return the ID_Direccion
     */
    public int getID_Direccion() {
        return this.ID_Direccion;
    }

    /**
     * @param ID_Direccion the ID_Direccion to set
     */
    public void setID_Direccion(int ID_Direccion) {
        this.ID_Direccion = ID_Direccion;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getDireccionCompleta() {
        return direccionCompleta;
    }

    public void setDireccionCompleta(String direccionCompleta) {
        this.direccionCompleta = direccionCompleta;
    }

}