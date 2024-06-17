/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author Frank
 */
public class emailSender {

    private final String host = "smtp.gmail.com"; // host 
    private final int puerto = 587; // Puerto del servidor SMTP
    private final String usuario = "angellopezcardenas82@gmail.com"; // Correo electrónico de origen
    private final String contraseña = "Angel191202!"; // Contraseña del correo electrónico de origen

    public void enviarCorreo(String metodoPago, String correoDestino) throws MessagingException {
        // Propiedades de la sesión
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", puerto);

        // Creación de la sesión
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(usuario, contraseña);
            }
        });
        try {
            // Creación del mensaje de correo
            Message mensaje = new MimeMessage(session);
            mensaje.setFrom(new InternetAddress(usuario));
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correoDestino));
            mensaje.setSubject("Confirmación de compra de membresía en BabyBliss");

            // Contenido del mensaje
            String contenidoMensaje = "¡Gracias por adquirir la membresía en BabyBliss!\n\n";
            contenidoMensaje += "Método de pago seleccionado: " + metodoPago + "\n";
            contenidoMensaje += "Fecha y hora de compra: " + new java.util.Date() + "\n";
            contenidoMensaje += "Para más detalles, visita nuestro sitio web.";

            mensaje.setText(contenidoMensaje);

            // Envío del mensaje
            Transport.send(mensaje);

            System.out.println("Correo electrónico enviado correctamente a " + correoDestino);

        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al enviar el correo electrónico: " + e.getMessage());
        }
    }
}
