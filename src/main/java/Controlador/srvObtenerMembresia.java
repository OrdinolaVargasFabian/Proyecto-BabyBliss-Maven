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
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

@WebServlet(name = "srvObtenerMembresia", urlPatterns = {"/srvObtenerMembresia"})
public class srvObtenerMembresia extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        response.setContentType("image/png");
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
            
            DefaultPieDataset data = new DefaultPieDataset();
            data.setValue("Sin Membresía: "+String.valueOf(noMembresia), noMembresia);
            data.setValue("Con Membresía: "+String.valueOf(Membresia), Membresia);
            
            JFreeChart cha = ChartFactory.createPieChart3D("Cantidad de Membresías", data, true, true, true );
            
            int ancho = 750;
            int alto = 600;
            
            ChartUtilities.writeChartAsPNG(out, cha, ancho, alto);
            
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


