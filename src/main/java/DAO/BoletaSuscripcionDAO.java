package DAO;

import Modelo.BoletaSuscripcion;
import Persistencia.Conexion;

public class BoletaSuscripcionDAO extends Conexion{
    BoletaSuscripcion boleta;

    public BoletaSuscripcionDAO() {} 
    
    public void registrarPagoMembresia(int idUsuario) {
        String consulta= "INSERT INTO `boletasuscripcion`(`idSuscripcion`, "
                + "`idUsuario`, `fechaCreacion`, `fechaInicio`, `fechaFinalizacion`) "
                + "VALUES (2,?,now(),curdate(),DATE_ADD(CURDATE(), INTERVAL 1 MONTH))";
        try {
            ps = con.prepareStatement(consulta);
            System.out.println("idUsuario: "+idUsuario);
            ps.setInt(1, idUsuario);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public BoletaSuscripcion obtenerDetallesPagoMembresia(int id) {
        String consulta = "SELECT MAX(idCompraSuscripcion) AS id, idSuscripcion, idUsuario, fechaCreacion, fechaInicio, fechaFinalizacion  FROM boletasuscripcion WHERE idUsuario = ?";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                boleta = new BoletaSuscripcion();
                boleta.setId(rs.getInt(1));
                boleta.setIdSuscripcion(rs.getInt(2));
                boleta.setIdUsuario(rs.getInt(3));
                boleta.setFechaCreacion(rs.getDate(4));
                boleta.setFechaInicio(rs.getDate(5));
                boleta.setFechaFinalizacion(rs.getDate(6));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return boleta;
    }
}
