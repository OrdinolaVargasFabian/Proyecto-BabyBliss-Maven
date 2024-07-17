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

@WebServlet(name = "srvObtenerVentas", urlPatterns = {"/srvObtenerVentas"})
public class srvObtenerVentas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        response.setContentType("application/json"); 
        response.setCharacterEncoding("UTF-8");
        OutputStream out = response.getOutputStream();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Conexion conexion = new Conexion();
            con = conexion.con;

            ps = con.prepareStatement("SELECT idProducto, SUM(cantidad) AS totalCantidad FROM compradetalles GROUP BY idProducto");
            rs = ps.executeQuery();

            StringBuilder json = new StringBuilder();
            json.append("[");

            while (rs.next()) {
                int idProducto = rs.getInt("idProducto");
                int totalCantidad = rs.getInt("totalCantidad");

                String nombreProducto = "";
                switch (idProducto) {
                    case 1:
                        nombreProducto = "Conjunto de niña";
                        break;
                    case 2:
                        nombreProducto = "Shampoo Johnsons";
                        break;
                    case 3:
                        nombreProducto = "Formula BEBA";
                        break;
                    case 4:
                        nombreProducto = "Pañales Babysec";
                        break;
                    case 5:
                        nombreProducto = "Pack 1 para recién nacido";
                        break;
                    case 6:
                        nombreProducto = "Pack de shampoos Johnsons baby";
                        break;
                    case 7:
                        nombreProducto = "Coche babybliss";
                        break;
                }

                json.append("{");
                json.append("\"nombreProducto\": \"").append(nombreProducto).append("\",");
                json.append("\"totalCantidad\": ").append(totalCantidad);
                json.append("},");
            }

            // Eliminar la última coma
            if (json.length() > 1) {
                json.setLength(json.length() - 1);
            }

            json.append("]");
            
            // Enviar el objeto JSON como respuesta
            out.write(json.toString().getBytes());

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

