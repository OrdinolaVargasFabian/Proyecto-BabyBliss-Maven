package Controlador;

import Persistencia.Conexion;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "srvObtenerMembresia", urlPatterns = {"/srvObtenerMembresia"})
public class srvObtenerMembresia extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        response.setContentType("application/json"); 
        OutputStream out = response.getOutputStream();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Conexion conexion = new Conexion();
            con = conexion.con;

            int noMembresia = 0;
            int Membresia = 0;

            ps = con.prepareStatement("SELECT membresia FROM usuario WHERE membresia IN (1, 2)");
            rs = ps.executeQuery();

            while (rs.next()) {
                int membresia = rs.getInt("membresia");
                if (membresia == 2) { // Membresía premium
                    Membresia++;
                } else if (membresia == 1) { // No premium
                    noMembresia++;
                }
            }

            // Crear un objeto JSON con los datos necesarios
            String json = "{\"sinMembresia\": " + noMembresia + ", \"conMembresia\": " + Membresia + "}";
            
            // Enviar el objeto JSON como respuesta
            out.write(json.getBytes());

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            out.close();
        }
    }
}

