/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;

/**
 *
 * @author JORGE EDUARDO
 */
public class Cliente {

    private int idUsuario;
    private String nombre;
    private String email;
    private String telefono;
    private String ciudad;
    private String departamento;
    private String direccion;
    private String barrio;
    private String indicacionAdicional;

    public Cliente() {

    }

    public Cliente(String nombre, String email, String telefono, String ciudad, String departamento, String direccion, String barrio, String indicacionAdicional) {
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.ciudad = ciudad;
        this.departamento = departamento;
        this.direccion = direccion;
        this.barrio = barrio;
        this.indicacionAdicional = indicacionAdicional;
    }

    public Cliente(int idUsuario, String nombre, String email, String telefono, String ciudad, String departamento, String direccion, String barrio, String indicacionAdicional) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.email = email;
        this.telefono = telefono;
        this.ciudad = ciudad;
        this.departamento = departamento;
        this.direccion = direccion;
        this.barrio = barrio;
        this.indicacionAdicional = indicacionAdicional;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public void setIndicacionAdicional(String indicacionAdicional) {
        this.indicacionAdicional = indicacionAdicional;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getEmail() {
        return email;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getCiudad() {
        return ciudad;
    }

    public String getDepartamento() {
        return departamento;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getBarrio() {
        return barrio;
    }

    public String getIndicacionAdicional() {
        return indicacionAdicional;
    }

    @Override
    public String toString() {
        return "Autor{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", email=" + email + ", telefono=" + telefono + ", ciudad=" + ciudad + ", departamento=" + departamento + ", direccion=" + direccion + ", barrio=" + barrio + ", indicacionAdicional=" + indicacionAdicional + '}';
    }

    public List<Cliente> consultarCliente() {
        List<Cliente> clientes = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM clientes;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Cliente a;
            while (rs.next()) {
                a = new Cliente();
                a.setIdUsuario(rs.getInt("idUsuario"));
                a.setNombre(rs.getString("nombre"));
                a.setEmail(rs.getString("email"));
                a.setTelefono(rs.getString("telefono"));
                a.setCiudad(rs.getString("ciudad"));
                a.setDepartamento(rs.getString("departamento"));
                a.setDireccion(rs.getString("direccion"));
                a.setBarrio(rs.getString("barrio"));
                a.setIndicacionAdicional(rs.getString("indicacionAdicional"));

                clientes.add(a);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }

        return clientes;
    }

    public boolean guardarCliente() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO clientes ( nombre, email, telefono, ciudad, departamento, direccion, barrio, indicacionAdicional) VALUES( '" + nombre + "', '" + email + "', '" + telefono + "', '" + ciudad + "', '" + departamento + "', '" + direccion + "', '" + barrio + "', '" + indicacionAdicional + "');";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();

            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        } else {
            conexion.cerrarConexion();
        }
        return exito;
    }

    public boolean actualizarCliente() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE clientes\n"
                + "SET nombre='"+nombre+"', email='"+email+"', telefono='"+telefono
                +"', ciudad='"+ciudad+"', departamento='"+departamento+"', direccion='"+direccion+"', barrio='"+barrio
                +"', indicacionAdicional='"+indicacionAdicional+"'\n"
                + "WHERE idUsuario="+idUsuario+";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        } else {
            conexion.cerrarConexion();
        }
        return exito;
    }

    public boolean eliminarCliente() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM clientes WHERE idUsuario='" + idUsuario + "';";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                exito = true;
                conexion.commitBD();
                conexion.cerrarConexion();
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        } else {
            conexion.cerrarConexion();
        }
        return exito;
    }
}
