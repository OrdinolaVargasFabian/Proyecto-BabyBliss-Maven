/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.RegistrarDAO;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fabrizzio
 */
@WebServlet(name = "svrRegistroUsuario", urlPatterns = {"/svrRegistroUsuario"})
public class svrRegistroUsuario extends HttpServlet {

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
        throws ServletException, IOException, ParseException {
    String nombre = request.getParameter("txtNombre");
    String appat = request.getParameter("txtApellidoPaterno");
    String apmat = request.getParameter("txtApellidoMaterno");
    String dniStr = request.getParameter("txtDNI");
    String fechaNacimientoStr = request.getParameter("txtFechaNacimiento");
    String telefonoStr = request.getParameter("txtTelefono");
    String correo = request.getParameter("txtCorreo");
    String contrasena = request.getParameter("txtClave");

    // Validar y convertir parámetros
    if (nombre == null || appat == null || apmat == null || dniStr == null || dniStr.isEmpty() || fechaNacimientoStr == null || telefonoStr == null || telefonoStr.isEmpty() || correo == null || contrasena == null) {
        // Manejar el error de parámetros faltantes
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios.");
        return;
    }

    int dni;
    int telefono;
    try {
        dni = Integer.parseInt(dniStr);
        telefono = Integer.parseInt(telefonoStr);
    } catch (NumberFormatException e) {
        // Manejar el error de formato
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "DNI y teléfono deben ser números válidos.");
        return;
    }

    // Convertir fecha de nacimiento
    java.util.Date fechaNac;
    try {
        fechaNac = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimientoStr);
    } catch (ParseException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Fecha de nacimiento inválida.");
        return;
    }

    // Crear objeto Usuario y registrar
//    Usuario nuevoUsuario = new Usuario(nombre, appat, apmat, dni, fechaNac, telefono, correo, contrasena);
    Usuario nuevoUsuario = new Usuario();
    RegistrarDAO registrarDAO = new RegistrarDAO();
    
    nuevoUsuario.setNombre(nombre);
    nuevoUsuario.setAppat(appat);
    nuevoUsuario.setApmat(apmat);
    nuevoUsuario.setDni(dni);
    nuevoUsuario.setFechaNac(fechaNac);
    nuevoUsuario.setTelefono(telefono);
    nuevoUsuario.setCorreo(correo);
    nuevoUsuario.setPassword(contrasena);
    
    
    boolean registrado = registrarDAO.registrarUsuario(nuevoUsuario);

    if (registrado) {
        response.getWriter().write("Usuario registrado exitosamente.");
    } else {
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al registrar usuario.");
    }
}



    /**
     * Maneja las solicitudes GET.
     * 
     * @param request El objeto HttpServletRequest que contiene la solicitud del cliente.
     * @param response El objeto HttpServletResponse que contiene la respuesta del servlet.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de E/S.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response); // Llama al método processRequest para manejar la solicitud GET
    } catch (ParseException ex) {
        Logger.getLogger(svrRegistroUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    /**
     * Maneja las solicitudes POST.
     * 
     * @param request El objeto HttpServletRequest que contiene la solicitud del cliente.
     * @param response El objeto HttpServletResponse que contiene la respuesta del servlet.
     * @throws ServletException Si ocurre un error específico del servlet.
     * @throws IOException Si ocurre un error de E/S.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response); // Llama al método processRequest para manejar la solicitud POST
    } catch (ParseException ex) {
        Logger.getLogger(svrRegistroUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
    }


}
