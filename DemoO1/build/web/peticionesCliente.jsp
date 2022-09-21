<%-- 
    Document   : peticionesCliente
    Created on : 19/09/2022, 06:21:14 AM
    Author     : JORGE EDUARDO
--%>


<%@page import="logica.Cliente"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>
<%//Iniciando respuesta JSON.
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar"
    });
    String proceso = "" + request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
// ------------------------------------------------------------------------------------- //
// -----------------------------------INICIO PROCESOS----------------------------------- //
// ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardar")) {
//Solicitud de parámetros enviados desde el frontned
//, uso de request.getParameter("nombre parametro")
// creación de objeto y llamado a método guardar
            
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String ciudad = request.getParameter("ciudad");
            String departamento = request.getParameter("departamento");
            String direccion = request.getParameter("direccion");
            String barrio = request.getParameter("barrio");
            String indicacionAdicional = request.getParameter("indicacionAdicional");
            
           
            Cliente a = new Cliente(nombre, email, telefono, ciudad, departamento, direccion, barrio, indicacionAdicional);
            if (a.guardarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("eliminar")) {
//Solicitud de parámetros enviados desde el frontned
//, uso de request.getParameter("nombre parametro")
//creación de objeto y llamado a método eliminar
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            Cliente a=new Cliente();
            a.setIdUsuario(idUsuario);
            if (a.eliminarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("listar")) {
//Solicitud de parámetros enviados desde el frontned
//, uso de request.getParameter("nombre parametro")
//creación de objeto y llamado al metodo listar
            try {
                Cliente a = new Cliente();
                List<Cliente> lista=a.consultarCliente();
                respuesta += "\"" + proceso + "\": true,\"clientes\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"clientes\":[]";
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizar")) {
//creación de objeto y llamado al metodo actualizar
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String ciudad = request.getParameter("ciudad");
            String departamento = request.getParameter("departamento");
            String direccion = request.getParameter("direccion");
            String barrio = request.getParameter("barrio");
            String indicacionAdicional = request.getParameter("indicacionAdicional");
            
            Cliente a = new Cliente(idUsuario, nombre, email, telefono, ciudad, departamento, direccion, barrio, indicacionAdicional);
            if (a.actualizarCliente()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }
// ------------------------------------------------------------------------------------- //
// -----------------------------------FIN PROCESOS-------------------------------------- //
// ------------------------------------------------------------------------------------- //
// Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + "son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
// Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
