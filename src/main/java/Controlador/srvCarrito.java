
package Controlador;

import DAO.PedidoDAO;
import Modelo.Usuario;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ibm.icu.text.RuleBasedNumberFormat;
import com.ibm.icu.util.ULocale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
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

@WebServlet(name = "srvCarrito", urlPatterns = {"/srvCarrito"})
public class srvCarrito extends HttpServlet {

    private static final String EMAIL_FROM = "equiposoportebabybliss@gmail.com";
    private static final String PASSWORD_FROM = "mjdm mbvg hjnl qich";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        String requestBody = sb.toString();
        
        // Usando Gson para convertir el JSON a un objeto Java
        Gson gson = new Gson();
        Type type = new TypeToken<Map<String, List<Object>>>(){}.getType();
        Map<String, List<Object>> carrito = gson.fromJson(requestBody, type);
        
        //Recupera los datos del usuario actual
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user");
        String nombreCompleto = usuario.getNombre() + " " + usuario.getAppat() + " " + usuario.getApmat();
        
        DecimalFormat df = new DecimalFormat("#.##"); //Formato de 2 decimales
        
        double totalCarrito = Double.parseDouble(request.getParameter("total"));
        double IGV = Double.parseDouble(df.format(totalCarrito * 18/100));
        double total = totalCarrito + IGV;
        
        System.out.println("Total: " + total);
        
        PedidoDAO dao = new PedidoDAO();

        int idPedido = dao.agregarPedido(usuario.getId(), total);
        
        // Obtener cada item del JSON para registrar los detalles
        List<Object> itemsDelCarrito = (List<Object>) carrito.get("carrito");
        
        //Se crea una lista de mapas para llenar los datos de la tabla
        List<Map<String, Object>> listaFields = new ArrayList<>();
        
        for (Object item : itemsDelCarrito) {
            Map<String, Object> producto = (Map<String, Object>) item;
            int idProducto = (int)(double) producto.get("id");
            String nombre = (String)producto.get("nombre");
            double precio = (double)producto.get("precio");
            int cantidad = (int)(double) producto.get("quantity");
            dao.agregarDetalles(idPedido, idProducto, cantidad);
            System.out.println("idPedido: " + idPedido);
            System.out.println("idProducto: " + idProducto);
            System.out.println("cantidad: " + cantidad);

            //Cada Map dentro de List equivale a una fila
            Map<String, Object> fields = new HashMap<String, Object>();
            fields.put("cantidad", cantidad);
            fields.put("codigo", idProducto);
            fields.put("descripcion", nombre);
            fields.put("precio", precio);
            listaFields.add(fields);
        }
        
        //Proceso generar Boleta de pago con JasperReport
        try {
            JRDataSource dataSource = new JRBeanCollectionDataSource(listaFields);
            JasperReport jasperReport = JasperCompileManager.compileReport(getServletContext().getRealPath("\\JasperReports\\ComprobantePago.jrxml"));
            
            //Se obtiene la fecha actual
            DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("ddMMyyyyHHmm");
            String fechaActual = LocalDateTime.now().format(formatoFecha);

            //Se obtiene la direccion del logo
            String imagePath = getServletContext().getRealPath("/") + "babybliss_logo.png";

            //Se insertan los parametros que posee el jrxml
            Map<String, Object> parameters = new HashMap<String, Object>();
            parameters.put("LogoBabyBliss", imagePath);
            parameters.put("IdBoleta", "EB01-" + idPedido);
            parameters.put("NombreCompleto", nombreCompleto);
            parameters.put("DNI", usuario.getDni());
            parameters.put("Moneda", "Dolares");
            parameters.put("ds", dataSource);
            
            parameters.put("Subtotal", "$ " + totalCarrito);
            parameters.put("IGV", "$ " + IGV);
            
            parameters.put("Total", "$ " + total);
            
            //Obtener el nombre del total
            ULocale locale = new ULocale("es_ES");
            
            int parteEntera = (int) total;
            double parteDecimal = total - parteEntera;
            
            RuleBasedNumberFormat formatter = new RuleBasedNumberFormat(locale, RuleBasedNumberFormat.SPELLOUT);
            String nombreParteEntera = formatter.format(parteEntera);
            
            String TotalTexto = nombreParteEntera.toUpperCase() + " Y " + (parteDecimal*100) + "/100 DOLARES";
            
            parameters.put("NombreTotal", TotalTexto);
            
            //Completa la plantilla jrxml con los datos 
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());

            //Se le da un nombre al pdf
            String nombreBoleta = "Boleta_Compra_" + usuario.getAppat() + usuario.getApmat() + usuario.getNombre() + "_" + fechaActual + ".pdf";

            //Se obtiene la ruta absoluta del directorio raíz de la aplicación
            String rootPath = getServletContext().getRealPath("/");
            String boletaPath = rootPath + "\\" + nombreBoleta;

            //Se exporta el pdf en el servidor
            JasperExportManager.exportReportToPdfFile(jasperPrint, boletaPath);
            System.out.println("Boleta de Compra de Productos generada en al dirección: " + boletaPath);
            
            //Proceso para que la boleta pdf se envie por correo
            String emailTo = usuario.getCorreo(); //Obtiene el correo con el que se registro el cliente
            String subject = "Confirmación de Pago de Compra";
            String content = "Tu pago de compra ha sido exitoso en nuestra plataforma BabyStore.";
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
        } catch (JRException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al generar el reporte de compra de productos.");
        }
        
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

}
