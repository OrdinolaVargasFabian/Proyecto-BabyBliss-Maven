
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Persistencia.Conexion;
import java.sql.PreparedStatement;

/**
 *
 * @author Fabrizzio
 */
@WebServlet(name = "srvTablas", urlPatterns = {"/srvTablas"})
public class srvTablas extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // Suponiendo que tienes un método para obtener la conexión a la base de datos
//            Connection con = Conexion.getConnection();
//            String consulta = "SELECT * FROM usuario";
//            PreparedStatement ps = con.prepareStatement(consulta);
//            ResultSet rs = ps.executeQuery();
            
            out.println("<table border='1'>");
            out.println("<tr><th>ID</th><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>DNI</th><th>Fecha Nacimiento</th><th>Correo</th><th>Teléfono</th><th>Membresía</th></tr>");
            
//            while (rs.next()) {
//                out.println("<tr>");
//                out.println("<td>" + rs.getInt("id") + "</td>");
//                out.println("<td>" + rs.getString("nombre") + "</td>");
//                out.println("<td>" + rs.getString("appat") + "</td>");
//                out.println("<td>" + rs.getString("apmat") + "</td>");
//                out.println("<td>" + rs.getInt("dni") + "</td>");
//                out.println("<td>" + rs.getDate("fechaNac") + "</td>");
//                out.println("<td>" + rs.getString("correo") + "</td>");
//                out.println("<td>" + rs.getInt("telefono") + "</td>");
//                out.println("<td>" + rs.getInt("membresia") + "</td>");
//                out.println("</tr>");
//            }
//            
//            out.println("</table>");
//            
//            con.close();
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        } finally {
            out.close();
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
