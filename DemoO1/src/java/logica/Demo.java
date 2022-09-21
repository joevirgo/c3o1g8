/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.List;

/**
 *
 * @author JORGE EDUARDO
 */
public class Demo {
    public static void main(String[] args) {

        Cliente a = new Cliente();
        a.setNombre("Bart Simpson");
        a.setEmail("EEUU");
        a.setTelefono("347332");
        a.setCiudad("cali");
        a.setDepartamento("valle del cauca");
        a.setDireccion("cr30#45-67");
        a.setBarrio("Diamante");
        a.setIndicacionAdicional("none");
        System.out.println(a.guardarCliente());
//        System.out.println(a.actualizarAutor());
        //System.out.println(a.eliminarAutor());
        List<Cliente> autores = a.consultarCliente();
        for (Cliente ax : autores) {
            System.out.println(ax.toString());
        }
    }
}
