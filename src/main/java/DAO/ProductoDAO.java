package DAO;

import Modelo.Producto;
import java.util.ArrayList;
import Persistencia.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO extends Conexion {

    public ArrayList<Producto> ListarTodos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            String sql = "select * from producto";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Producto obj = new Producto();
                obj.setId(rs.getInt("idProducto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setStock(rs.getInt("stock"));
                obj.setImagen(rs.getString("imagen"));

                lista.add(obj);
            }
        } catch (Exception e) {
            //cerrar la cadena de conexion
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    public Producto BuscarPorId(int id) {
        Producto obj = null;

        try {
            String sql = "*select * from Producto";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj = new Producto();
                obj.setId(rs.getInt("idProducto"));
                obj.setNombre(rs.getString("nombre"));
                obj.setDescripcion(rs.getString("descripcion"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setStock(rs.getInt("stock"));
                obj.setImagen(rs.getString("imagen"));

            }
        } catch (Exception e) {
            //cerrar la cadena de conexion
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return obj;
    }

    int r = 0;

    public List listar() {
        List<Producto> lista = new ArrayList<>();
        String SQL = "SELECT imagen, nombre, descripcion, precio, idProducto FROM producto order by nombre asc";
        try {
            ps = con.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setImagen(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setPrecio(rs.getInt(4));
                p.setId(rs.getInt(5));
                lista.add(p);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
}
