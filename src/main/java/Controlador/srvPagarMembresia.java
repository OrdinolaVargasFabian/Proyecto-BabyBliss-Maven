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
import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
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

    private static final String EMAIL_FROM = "equiposoportebabybliss@gmail.com";
    private static final String PASSWORD_FROM = "mjdm mbvg hjnl qich";

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

            usuario.setMembresia(2);

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

            //Se obtiene la ruta absoluta del directorio raíz de la aplicación
            String rootPath = getServletContext().getRealPath("/");
            String boletaPath = rootPath + "\\" + nombreBoleta;

            //Se exporta el pdf en el servidor
            JasperExportManager.exportReportToPdfFile(jasperPrint, boletaPath);
            System.out.println("Boleta de Membresia generada en al dirección: " + boletaPath);

            response.reset();

            //Se configura la respuesta para la descarga del archivo
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreBoleta + "\"");

            //Se escribe el PDF directamente en el flujo de salida de la respuesta
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            //Proceso para que la boleta pdf se envie por correo
            String emailTo = usuario.getCorreo(); //Obtiene el correo con el que se registro el cliente
            String subject = "Confirmación de Pago de Membresía";
            String content = "¡Gracias por adquirir la membresía BabyGold!";
            String pathToPdf = boletaPath;

            Properties properties = new Properties();
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.user", EMAIL_FROM);
            properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
            properties.put("mail.smtp.auth", "true");

            Session sessionSMTP = Session.getDefaultInstance(properties);
            try {
                MimeMessage message = new MimeMessage(sessionSMTP);
                message.setFrom(new InternetAddress(EMAIL_FROM));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
                message.setSubject(subject);

                // Crear el contenido del mensaje como multipart
                MimeMultipart multipart = new MimeMultipart();

                // Parte de texto
                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setText(content, "ISO-8859-1", "html");
                multipart.addBodyPart(textPart);

                // Parte del archivo adjunto
                MimeBodyPart attachmentPart = new MimeBodyPart();
                DataSource source = new FileDataSource(pathToPdf);
                attachmentPart.setDataHandler(new DataHandler(source));
                attachmentPart.setFileName(new File(pathToPdf).getName());
                multipart.addBodyPart(attachmentPart);

                // Establecer el contenido multipart como el contenido del mensaje
                message.setContent(multipart);

                // Enviar el mensaje
                Transport transport = sessionSMTP.getTransport("smtp");
                transport.connect(EMAIL_FROM, PASSWORD_FROM);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
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
