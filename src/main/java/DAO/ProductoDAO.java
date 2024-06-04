package DAO;

import Modelo.Producto;
import java.util.ArrayList;
import Persistencia.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO extends Conexion{

    public ArrayList<Producto> ListarTodos() {
        ArrayList<Producto> lista = new ArrayList<Producto>();

        try {
            String sql = "*select * from Producto";
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
                obj.setCategoria(rs.getString("categoria"));
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
                obj.setCategoria(rs.getString("categoria"));               
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

    public List buscar(String nombre) {
        List list = new ArrayList();
        String sql = "select * from producto where Nombres like '%" + nombre + "%'";
        try {

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
//                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Producto listarId(int id) {
        Producto p = new Producto();
        String sql = "select * from producto where IdProducto=" + id;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
//                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public List listar() {
        List lista = new ArrayList();
        String sql = "select * from producto";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setImagen(rs.getString(3));
//                p.setFoto(rs.getBinaryStream(3));
                p.setDescripcion(rs.getString(4));
                p.setPrecio(rs.getDouble(5));
                p.setStock(rs.getInt(6));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from producto where IdProducto=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

    public int AgregarNuevoProducto(Producto p) {
        String sql = "insert into producto(Nombres,Foto,Descripcion,Precio,Stock)values(?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getImagen());
            ps.setString(3, p.getDescripcion());
            ps.setDouble(4, p.getPrecio());
            ps.setInt(5, p.getStock());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

}
