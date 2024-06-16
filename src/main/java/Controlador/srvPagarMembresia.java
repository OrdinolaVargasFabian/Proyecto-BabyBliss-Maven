package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoletaSuscripcionDAO;
import DAO.UsuarioDAO;
import Modelo.BoletaSuscripcion;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@WebServlet(name = "srvPagarMembresia", urlPatterns = {"/srvPagarMembresia"})
public class srvPagarMembresia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JRException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            //Obtiene el ID del usuario que realizo el pago
            int id = Integer.parseInt(request.getParameter("id"));
            UsuarioDAO usu = new UsuarioDAO();
            BoletaSuscripcionDAO dao = new BoletaSuscripcionDAO();
            //Actualiza la membresia que posee el cliente
            usu.adquirirMembresia(id);
            //Registra la boleta en la BD
            dao.registrarPagoMembresia(id);

            BoletaSuscripcion datosBoleta = dao.obtenerDetallesPagoMembresia(id);
            System.out.println(datosBoleta);
            JRDataSource dataSource = new JRBeanCollectionDataSource(Collections.singletonList(datosBoleta));
            JasperReport jasperReport = JasperCompileManager.compileReport(getServletContext().getRealPath("\\JasperReports\\BoletaMembresia.jrxml"));

            Map<String, Object> parameters = new HashMap<String, Object>();
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, dataSource);

            // Obtiene la ruta absoluta del directorio raíz de la aplicación
            String rootPath = getServletContext().getRealPath("/");
            // Construye la ruta al directorio
            String reportsDirPath = rootPath + "export";
            
            //Se le da un nombre al pdf
            String nombreBoleta = "";
            
            JasperExportManager.exportReportToPdfFile(jasperPrint, reportsDirPath + "\\boleta.pdf");

            response.sendRedirect("Vista/index.jsp");
        } catch (JRException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al generar el reporte de membresía.");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(srvPagarMembresia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(srvPagarMembresia.class.getName()).log(Level.SEVERE, null, ex);
        }
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

}
