
package Controlador;

import DAO.PedidoDAO;
import Modelo.Usuario;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvCarrito", urlPatterns = {"/srvCarrito"})
public class srvCarrito extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        
        double total = Double.parseDouble(request.getParameter("total"));
        
        System.out.println("Total: " + total);
        
        PedidoDAO dao = new PedidoDAO();

        int idPedido = dao.agregarPedido(usuario.getId(), total);
        
        // Obtener cada item del JSON para registrar los detalles
        List<Object> itemsDelCarrito = (List<Object>) carrito.get("carrito");

        for (Object item : itemsDelCarrito) {
            Map<String, Object> producto = (Map<String, Object>) item;
            int idProducto = (int)(double) producto.get("id");
            int cantidad = (int)(double) producto.get("quantity");
            dao.agregarDetalles(idPedido, idProducto, cantidad);
            System.out.println("idPedido: " + idPedido);
            System.out.println("idProducto: " + idProducto);
            System.out.println("cantidad: " + cantidad);
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
