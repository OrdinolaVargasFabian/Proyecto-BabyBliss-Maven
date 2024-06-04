/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Persistencia.Conexion;
import Modelo.Pedido;
import java.sql.Statement;
import Modelo.DetallePedido;
import java.sql.SQLException;


public class PedidoDAO extends Conexion{
    
    public int GenerarPedido(Pedido obj){
        int result = 0;
        try {
            con.setAutoCommit(false);//desabilitar 
            String sql = "INSERT INTO Pedido(id_usu, fecha_ped, total, estado) VALUES(?, NOW(), ?,?)";
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, obj.getCliente().getId());
            ps.setDouble(2, obj.getTotal());
            ps.setString(3, obj.getEstado());
            result = ps.executeUpdate();
            
            if(result > 0){
                rs= ps.getGeneratedKeys();
                
                if(rs.next()){
                    int idPed = rs.getInt(1);
                    
                    ps = con.prepareStatement("INSERT INTO Detalle_Pedido"
                    + "(id_ped, id_prod, precio, cantidad) VALUES(?,?,?,?)");
                    for(DetallePedido carrito: obj.getDetalles()){
                        ps.setInt(1, idPed);
                        ps.setInt(2, carrito.getProducto().getId());
                        ps.setDouble(3, carrito.getProducto().getPrecio());
                        ps.setInt(4, carrito.getCantidad());
                        ps.executeUpdate();
                    }
                    con.commit();//guardar cambios
                }
                
            }
        }catch(Exception e){
            try {
                if(con != null){
                    con.rollback();
                    result =0;
                }
            }catch (SQLException exl){
                
            }
            
            e.printStackTrace();
            
        }finally{
            try{
                if(con != null){
                    con.close();
                }
                if(ps != null){
                    ps.close();
                }
                if(rs != null){
                    rs.close();
                }
                
            }catch(Exception e){
                
            }
            
        }
        return result;
    }
}
