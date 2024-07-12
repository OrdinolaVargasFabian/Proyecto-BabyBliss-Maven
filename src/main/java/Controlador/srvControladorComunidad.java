package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ForoApoyoDAO;
import Modelo.ForoApoyo;
import Modelo.Usuario;
import DAO.UsuarioDAO;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvControladorComunidad", urlPatterns = {"/srvControladorComunidad"})
public class srvControladorComunidad extends HttpServlet {

    private static final String EMAIL_FROM = "equiposoportebabybliss@gmail.com";
    private static final String PASSWORD_FROM = "mjdm mbvg hjnl qich";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        System.out.println(accion);
        ForoApoyoDAO dao = new ForoApoyoDAO();
        if (accion.equals("listar")) {
            List<ForoApoyo> lista = dao.listarComunidad();
            UsuarioDAO dao_usuario = new UsuarioDAO();
            List<Map> listaData = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                int idUsuario = lista.get(i).getUsuario();
                Usuario usuario = dao_usuario.obtenerUsuario(idUsuario);
                Map<String, Object> data = new HashMap<>();
                data.put("idForo", lista.get(i).getIdForo());
                data.put("titulo", lista.get(i).getTitulo());
                data.put("contenido", lista.get(i).getContenido());
                data.put("fechaCreacion", lista.get(i).getFechaCreacion());
                data.put("usuario", usuario.getAppat() + " " + usuario.getApmat()+ " " + usuario.getNombre());
                
                listaData.add(data);
            }
            try (PrintWriter out = response.getWriter()) {
                Gson gson = new Gson();
                String json = gson.toJson(listaData);
                out.print(json);
                out.flush();
            }
        } else if (accion.equals("listarDT")) {
            List<ForoApoyo> lista = dao.listarForosPendientes();
            UsuarioDAO dao_usuario = new UsuarioDAO();
            List<Map> listaData = new ArrayList();
            for (int i = 0; i < lista.size(); i++) {
                int idUsuario = lista.get(i).getUsuario();
                Usuario usuario = dao_usuario.obtenerUsuario(idUsuario);
                Map<String, Object> data = new HashMap<>();
                data.put("idForo", lista.get(i).getIdForo());
                data.put("titulo", lista.get(i).getTitulo());
                data.put("contenido", lista.get(i).getContenido());
                data.put("fechaCreacion", lista.get(i).getFechaCreacion());
                data.put("usuario", usuario.getAppat() + " " + usuario.getApmat()+ " " + usuario.getNombre());
                data.put("correo", usuario.getCorreo());
                
                listaData.add(data);
            }
            
            int totalRegistros = lista.size();

            Map<String, Object> jsonMap = new HashMap<>();
            jsonMap.put("data", listaData);
            jsonMap.put("recordsTotal", totalRegistros);
            jsonMap.put("recordsFiltered", totalRegistros);

            System.out.println(jsonMap);

            try (PrintWriter out = response.getWriter()) {
                Gson gson = new Gson();
                String json = gson.toJson(jsonMap);
                out.print(json);
                out.flush();
            }
        } else if (accion.equals("agregar")) {
            String titulo = request.getParameter("titulo");
            String mensaje = request.getParameter("mensaje");

            ForoApoyo foro = new ForoApoyo();
            foro.setTitulo(titulo);
            foro.setContenido(mensaje);
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("user");
            foro.setUsuario(usuario.getId());

            dao.agregarForo(foro);
            System.out.println("Agregar foro completado");
        } else if (accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("idForo"));
            dao.aceptarForo(id);

            //Proceso para notificar la aprobacion de la publicacion al cliente via correo
            String emailTo = request.getParameter("correo"); //Obtiene el correo del usuario autor de la publicación
            String subject = "Su publicación en nuestro foro de apoyo ha sido aceptada";
            String content = "<html><body>"
                    + "<p style='line-height: 150%;'>Hola,</p>"
                    + "<p style='line-height: 150%;'>Su publicación en nuestro foro de apoyo ha sido <b>aceptada</b> por parte de nuestros especialistas y ahora es visible para todos nuestros usuarios.</p>"
                    + "<p style='line-height: 150%;'>Recibirás notificaciones cuando tu publicación sea comentada.</p>"
                    + "</body></html>";

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
                message.setText(content, "ISO-8859-1", "html");

                // Enviar el mensaje
                Transport transport = sessionSMTP.getTransport("smtp");
                transport.connect(EMAIL_FROM, PASSWORD_FROM);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("idForo"));
            dao.rechazarForo(id);
            // Se optiene el motivo del rechazo de la publicacion
            String motivo = request.getParameter("motivo");

            //Proceso para notificar el rechazo de la publicacion al cliente via correo
            String emailTo = request.getParameter("correo"); //Obtiene el correo del usuario autor de la publicación
            String subject = "Su publicación en nuestro foro de apoyo ha sido rechazada";
            String content = "<html><body>"
                    + "<p style='line-height: 150%;'>Hola,</p>"
                    + "<p style='line-height: 150%;'>Su publicación en nuestro foro de apoyo ha sido <b>rechazada</b> por parte de nuestros especialistas.</p><br>"
                    + "<p style='line-height: 150%;'>El motivo del rechazo: " + motivo + ".</p><br>"
                    + "<p style='line-height: 150%;'>Por favor considere tener en cuenta este motivo al redactar otra publicación.</p>"
                    + "</body></html>";

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
                message.setText(content, "ISO-8859-1", "html");

                // Enviar el mensaje
                Transport transport = sessionSMTP.getTransport("smtp");
                transport.connect(EMAIL_FROM, PASSWORD_FROM);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
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
        processRequest(request, response);
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
