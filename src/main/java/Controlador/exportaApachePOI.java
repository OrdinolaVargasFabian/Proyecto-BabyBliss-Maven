package Controlador;

import Persistencia.Conexion;

import java.io.FileInputStream;
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
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.util.IOUtils;
import java.io.InputStream;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;

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
                // ACA

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

    public void exportarUsuariosAExcel(Connection con, Workbook workbook) throws SQLException {
        try (PreparedStatement statement = con.prepareStatement("SELECT * FROM usuario"); ResultSet resultSet = statement.executeQuery()) {

            Sheet sheet = workbook.createSheet("Usuarios");
            String logoPath = getServletContext().getRealPath("/") + "babybliss_logo.png";

            try (InputStream inputStream = new FileInputStream(logoPath)) {
                // Cargar la imagen como un byte array
                byte[] bytes = IOUtils.toByteArray(inputStream);
                int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);

                // Crear el dibujo en la hoja
                XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();

                // Crear un ancla que señala la esquina superior izquierda de la imagen
                // Los parámetros son: (dx1, dy1, dx2, dy2, col1, row1, col2, row2)
                // dx1, dy1, dx2, dy2 definen el espacio dentro de la celda para la imagen
                // col1, row1 definen la celda superior izquierda donde se coloca la imagen
                // col2, row2 definen la celda inferior derecha donde se coloca la imagen
                XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 100, 100, 0, 0, 0, 0);
                anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);

                // Adjuntar la imagen al dibujo
                drawing.createPicture(anchor, pictureIdx);
            } catch (IOException e) {
                e.printStackTrace();
            }

//            CellStyle fondo = workbook.createCellStyle();
//            XSSFColor colorFondo = new XSSFColor(new java.awt.Color(255,0,0), null);
//            ((XSSFCellStyle) fondo).setFillForegroundColor(colorFondo);
//            fondo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
//
//            // Recorre las filas
//            for (int i = 0; i < 4; i++) {
//                Row row = sheet.createRow(i);
//                // Recorre las columnas
//                for (int j = 0; j < 10; j++) {
//                    Cell celda = row.createCell(j);
//                    celda.setCellStyle(fondo);
//                }
//            }
            writeHeaderRow(sheet);
            writeDataRows(resultSet, sheet);
            agregarTexto(sheet);

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    private static void writeHeaderRow(Sheet sheet) {
        Row headerRow = sheet.createRow(5);
        String[] columns = {"ID", "NOMBRE", "APELLIDO PATERNO", "APELLIDO MATERNO", "DNI", "FECHA NACIMIENTO",
            "CORREO", "CONTRASEÑA", "TELEFONO", "MEMBRESIA"};
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
        }
    }

    private static void writeDataRows(ResultSet resultSet, Sheet sheet) throws SQLException {
        int rowNum = 6;
        while (resultSet.next()) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(resultSet.getInt("idUsuario"));
            sheet.autoSizeColumn(0);
            row.createCell(1).setCellValue(resultSet.getString("nombre"));
            sheet.autoSizeColumn(1);
            row.createCell(2).setCellValue(resultSet.getString("appat"));
            sheet.autoSizeColumn(2);
            row.createCell(3).setCellValue(resultSet.getString("apmat"));
            sheet.autoSizeColumn(3);
            row.createCell(4).setCellValue(resultSet.getInt("dni"));
            sheet.autoSizeColumn(4);
            row.createCell(5).setCellValue(resultSet.getDate("fecha_nacimiento").toString());
            sheet.autoSizeColumn(5);
            row.createCell(6).setCellValue(resultSet.getString("correo"));
            sheet.autoSizeColumn(6);
            row.createCell(7).setCellValue(resultSet.getString("contraseña"));
            sheet.autoSizeColumn(7);
            row.createCell(8).setCellValue(resultSet.getString("telefono"));
            sheet.autoSizeColumn(8);
            String membresia = resultSet.getInt("membresia") == 1 ? "No Premium" : "Baby Gold";
            row.createCell(9).setCellValue(membresia);
            sheet.autoSizeColumn(9);
        }
    }

    private static void agregarTexto(Sheet sheet) throws SQLException {
        Row filaBabyBliss = sheet.createRow(2);
        // Crea una celda en la primera columna de esa fila
        Cell celdaBabybliss = filaBabyBliss.createCell(3);
        Cell celdaTitulo = sheet.createRow(3).createCell(3);

        // Define el texto
        String babybliss = "BABYBLISS";
        String tituloReporte = "Reporte de Usuarios";

        // Establece el texto en la celda
        celdaBabybliss.setCellValue(babybliss);
        celdaTitulo.setCellValue(tituloReporte);

        // un toque mano. ve probando el excel
        CellStyle style = sheet.getWorkbook().createCellStyle();
        Font font = sheet.getWorkbook().createFont();

        // Ajusta el tamaño de la fuente
        font.setFontHeightInPoints((short) 28);
        style.setFont(font);

        celdaBabybliss.setCellStyle(style);

        // Ajusta el alto de la fila para acomodar el texto grande. 
        // Puedes ajustar el valor '60' para mejor ajuste según tu contenido.
        filaBabyBliss.setHeightInPoints((2 * sheet.getDefaultRowHeightInPoints()));

        // Asegúrate de que la columna sea lo suficientemente ancha para mostrar el texto
        // sheet.autoSizeColumn(0);
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
