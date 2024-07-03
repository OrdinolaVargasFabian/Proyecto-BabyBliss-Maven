/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ChatbotServlet", urlPatterns = {"/ChatbotServlet"})
public class ChatbotServlet extends HttpServlet {

    private Map<String, String> qaMap = new HashMap<>();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {    
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
    @Override
    public void init() throws ServletException {
        super.init();
        String filePath = getServletContext().getRealPath("/BabyBliss.txt");
        try ( BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] qa = line.split("::");
                if (qa.length == 2) {
                    qaMap.put(qa[0].trim().toLowerCase(), qa[1].trim());
                }
            }
        } catch (IOException e) {
            throw new ServletException("Error reading BabyBliss.txt", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userMessage = request.getParameter("message").toLowerCase();
        String botResponse = qaMap.getOrDefault(userMessage, "Lo siento, no encontré la información a tu pregunta, realiza otra.");
        response.setContentType("text/plain");
        try ( PrintWriter out = response.getWriter()) {
            out.print(botResponse);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
