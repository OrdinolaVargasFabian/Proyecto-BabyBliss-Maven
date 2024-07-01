
package Controlador;

import Persistencia.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet(name = "srvObtenerMembresia", urlPatterns = {"/srvObtenerMembresia"})
public class srvObtenerMembresia extends HttpServlet{
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        Conexion conexion = new Conexion();
        Connection con = null;     
        try {
            con = conexion.con;
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT membresia, COUNT(*) as cantidad FROM usuario GROUP BY membresia");
            
            int noMembresia = 0;
            int Membresia = 0;
            
            while (rs.next()) {
                int membresia = rs.getInt("membresia");
                int cantidad = rs.getInt("cantidad");
                
                if (membresia == 2) { // membresía 2 es premium
                    Membresia = cantidad;
                } else {
                    noMembresia += cantidad;
                }
            }
            
            JSONObject json = new JSONObject();
            json.put("noMembresia", noMembresia);
            json.put("Membresia", Membresia);
            
            out.print(json.toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.flush();
            out.close();
        }
    }   
}
