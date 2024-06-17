package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BoletaSuscripcionDAO;
import DAO.UsuarioDAO;
import Modelo.BoletaSuscripcion;
import Modelo.Usuario;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
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
        
        //Obtiene el ID del usuario que realizo el pago
        int id = Integer.parseInt(request.getParameter("id"));
        
        UsuarioDAO usu = new UsuarioDAO();
        BoletaSuscripcionDAO dao = new BoletaSuscripcionDAO();
        
        //Actualiza la membresia que posee el cliente
        usu.adquirirMembresia(id);
        //Registra los datos de la boleta en la BD
        dao.registrarPagoMembresia(id);
        //Obtiene los datos
        BoletaSuscripcion datosBoleta = dao.obtenerDetallesPagoMembresia(id);
        System.out.println(datosBoleta);
        
        //Genera la boleta
        try {
            //Recupera los datos del usuario actual
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("user");
            String nombreCompleto = usuario.getNombre() + " " + usuario.getAppat() + " " + usuario.getApmat();
            
            //Se crea una lista de mapas para llenar los datos de la tabla, cada Map dentro de List equivale a una fila
            List<Map<String, Object>> listaFields = new ArrayList<>();
            Map<String, Object> fields = new HashMap<String, Object>();
            fields.put("descripcion", "Membresia BabyGold");
            fields.put("precio", 9.99);
            listaFields.add(fields);
            
            JRDataSource dataSource = new JRBeanCollectionDataSource(listaFields);
            JasperReport jasperReport = JasperCompileManager.compileReport(getServletContext().getRealPath("\\JasperReports\\ComprobantePagoMembresia.jrxml"));

            //Se obtiene la fecha actual
            DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("ddMMyyyyHHmm");
            String fechaActual = LocalDateTime.now().format(formatoFecha);
            
            //Se obtiene la direccion del logo
            String imagePath = getServletContext().getRealPath("/") + "babybliss_logo.png";
            
            //Se insertan los parametros que posee el jrxml
            Map<String, Object> parameters = new HashMap<String, Object>();
            parameters.put("LogoBabyBliss", imagePath);
            parameters.put("NombreCompleto", nombreCompleto);
            parameters.put("ds", dataSource);
            parameters.put("Total", 9.99);

            //Completa la plantilla jrxml con los datos 
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());

            //Se le da un nombre al pdf
            String nombreBoleta = "Boleta_Membresia_" + usuario.getAppat() + usuario.getApmat() + usuario.getNombre() + "_" + fechaActual + ".pdf";
            System.out.println(nombreBoleta);

            //Se obtiene la ruta absoluta del directorio raíz de la aplicación
            String rootPath = getServletContext().getRealPath("/");
            //Se construye la ruta a la carpeta export
            String reportsDirPath = rootPath + "export";
            
            //Se exporta el pdf en el servidor
            JasperExportManager.exportReportToPdfFile(jasperPrint, rootPath + "\\" + nombreBoleta);
            
            try {
                emailSender enviarCorreo = new emailSender();
                enviarCorreo.enviarCorreo("Prueba", "fabianordinola25@gmail.com");
                System.out.println("Correo enviado correctamente");
            } catch (MessagingException e) {
                e.printStackTrace();
                System.out.println("Error al enviar el correo");
            }
            
            response.reset();
            
            //Se configura la respuesta para la descarga del archivo
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreBoleta + "\"");

            //Se escribe el PDF directamente en el flujo de salida de la respuesta
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
            System.out.println("Descarga exitosa");
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
