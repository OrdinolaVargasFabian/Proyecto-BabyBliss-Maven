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
import com.google.gson.Gson;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvControladorComunidad", urlPatterns = {"/srvControladorComunidad"})
public class srvControladorComunidad extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        System.out.println(accion);
        ForoApoyoDAO dao = new ForoApoyoDAO();
        if (accion.equals("listar")) {
            List<ForoApoyo> lista = dao.listarComunidad();

            try (PrintWriter out = response.getWriter()) {
                Gson gson = new Gson();
                String json = gson.toJson(lista);
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
