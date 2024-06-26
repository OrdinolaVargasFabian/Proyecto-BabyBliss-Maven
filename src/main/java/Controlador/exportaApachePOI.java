package Controlador;

import Persistencia.Conexion;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Fabrizzio
 */
@WebServlet(name = "exportaApachePOI", urlPatterns = {"/exportaApachePOI"})
public class exportaApachePOI extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"usuarios.xlsx\"");

        Conexion conexion = new Conexion();
        if (conexion.con != null) {
            try (OutputStream out = response.getOutputStream(); Workbook workbook = new XSSFWorkbook()) {
                exportarUsuariosAExcel(conexion.con, workbook);
                workbook.write(out);
                System.out.println("Archivo Excel generado exitosamente!");
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Error al generar el archivo Excel: " + e.getMessage());
            } finally {
                try {
                    conexion.con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error al conectar a la base de datos: " + conexion.mensaje);
        }
    }

    public static void exportarUsuariosAExcel(Connection con, Workbook workbook) throws SQLException {
        try (PreparedStatement statement = con.prepareStatement("SELECT * FROM usuario"); ResultSet resultSet = statement.executeQuery()) {

            Sheet sheet = workbook.createSheet("Usuarios");
            writeHeaderRow(sheet);
            writeDataRows(resultSet, sheet);

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    private static void writeHeaderRow(Sheet sheet) {
        Row headerRow = sheet.createRow(0);
        String[] columns = {"idUsuario", "nombre", "appat", "apmat", "dni", "fecha_nacimiento", "correo", "contraseña", "telefono", "membresia"};
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
        }
    }

    private static void writeDataRows(ResultSet resultSet, Sheet sheet) throws SQLException {
        int rowNum = 1;
        while (resultSet.next()) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(resultSet.getInt("idUsuario"));
            row.createCell(1).setCellValue(resultSet.getString("nombre"));
            row.createCell(2).setCellValue(resultSet.getString("appat"));
            row.createCell(3).setCellValue(resultSet.getString("apmat"));
            row.createCell(4).setCellValue(resultSet.getInt("dni"));
            row.createCell(5).setCellValue(resultSet.getDate("fecha_nacimiento").toString());
            row.createCell(6).setCellValue(resultSet.getString("correo"));
            row.createCell(7).setCellValue(resultSet.getString("contraseña"));
            row.createCell(8).setCellValue(resultSet.getString("telefono"));
            row.createCell(9).setCellValue(resultSet.getInt("membresia"));
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet que exporta datos de usuarios a Excel";
    }
}
