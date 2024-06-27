package DAO;

import Persistencia.Conexion;
import Modelo.Pedido;
import java.sql.Statement;
import Modelo.DetallePedido;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PedidoDAO extends Conexion {

    public int GenerarPedido(Pedido obj) {
        int result = 0;
        try {
            con.setAutoCommit(false);//desabilitar 
            String sql = "INSERT INTO Pedido(id_usu, fecha_ped, total, estado) VALUES(?, NOW(), ?,?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, obj.getCliente().getId());
            ps.setDouble(2, obj.getTotal());
            ps.setString(3, obj.getEstado());
            result = ps.executeUpdate();

            if (result > 0) {
                rs = ps.getGeneratedKeys();

                if (rs.next()) {
                    int idPed = rs.getInt(1);

                    ps = con.prepareStatement("INSERT INTO Detalle_Pedido"
                            + "(id_ped, id_prod, precio, cantidad) VALUES(?,?,?,?)");
                    for (DetallePedido carrito : obj.getDetalles()) {
                        ps.setInt(1, idPed);
                        ps.setInt(2, carrito.getProducto().getId());
                        ps.setDouble(3, carrito.getProducto().getPrecio());
                        ps.setInt(4, carrito.getCantidad());
                        ps.executeUpdate();
                    }
                    con.commit();//guardar cambios
                }

            }
        } catch (Exception e) {
            try {
                if (con != null) {
                    con.rollback();
                    result = 0;
                }
            } catch (SQLException exl) {

            }

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

            }

        }
        return result;
    }

    public int agregarPedido(int idUsuario, double total) {
        int idPedido = 0;
        String sql = "INSERT INTO `boletacompra`(`idUsuario`, `fechaCompra`, `total`) VALUES (?, NOW(), ?)";
        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, idUsuario);
            ps.setDouble(2, total);
            ps.executeUpdate();

            // Obtener el id AutoIncrementado
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    idPedido = generatedKeys.getInt(1); // Obtiene el id generado
                } else {
                    throw new SQLException("La inserción falló, no se obtuvo el ID generado.");
                }
            }
        } catch (Exception ex) {
            System.out.println("Error agregar pedido: " + ex);
        }
        return idPedido;
    }

    public void agregarDetalles(int idCompra, int idProducto, int cantidad) {
        String sql = "INSERT INTO `compradetalles`(`idCompra`, `idProducto`, `cantidad`) VALUES (?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, idCompra);
            ps.setInt(2, idProducto);
            ps.setInt(3, cantidad);
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error agregar detalles: " + ex);
        }
    }
}
