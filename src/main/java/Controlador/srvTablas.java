package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import DAO.UsuarioDAO;
import Modelo.Usuario;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fabrizzio
 */
@WebServlet(name = "srvTablas", urlPatterns = {"/srvTablas"})
public class srvTablas extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el parámetro de opción
        String opcion = request.getParameter("opcion");

        // Inicializar el contenido de respuesta
        String contenido = "";

        // Generar contenido HTML según la opción
        if (opcion != null) {
            switch (opcion) {
                case "Usuarios":
                    contenido = generarTablaUsuarios();
                    break;
                // Agregar más casos para otras opciones
                // case "OtraOpcion":
                //     contenido = generarTablaOtraOpcion();
                //     break;
                default:
                    contenido = "Opción no válida.";
                    break;
            }
        } else {
            contenido = "No se ha seleccionado ninguna opción.";
        }

        // Establecer el tipo de contenido y devolver la respuesta
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print(contenido);
    }

    // Método para generar la tabla de usuarios (Ejemplo)
    private String generarTablaUsuarios() {
        System.out.println("Generando Tabla...");
        UsuarioDAO dao = new UsuarioDAO();
        List lista = dao.obtenerUsuarios();
        // Crear contenido HTML de ejemplo
        StringBuilder sb = new StringBuilder();
        //sb.append("<table id='tbl-usuarios' border='1'>");
        sb.append("<thead><tr><th>ID</th><th>Nombre</th><th>Email</th></tr></thead><tbody>");
        // Agregar filas de ejemplo
        System.out.println(lista.size());
        for (int i = 0; i < lista.size(); i++) {
            Usuario usuario = (Usuario) lista.get(i);
             System.out.println("Correo de usuario: " + usuario.getCorreo()); // Impresión de depuración
            // El resto de tu código para agregar el usuario a la tabla HTML
            String nombres_completos = usuario.getAppat() + " " + usuario.getApmat() + ", " + usuario.getNombre();
            
            System.out.println(usuario.getId());
            sb.append("<tr><td>").append(usuario.getId()).append("</td><td>")
                    .append(nombres_completos).append("</td><td>")
                    .append(usuario.getCorreo()).append("</td></tr>");
        }
        sb.append("</tbody>");
        
        // Puedes agregar más filas desde una base de datos o una lista
        //sb.append("</table>");
        System.out.println(sb.toString());
        return sb.toString();
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
        processRequest(request, response);
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

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
