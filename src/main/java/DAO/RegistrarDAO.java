
package DAO;
import Modelo.Usuario;
import Persistencia.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class RegistrarDAO extends Conexion {
    
    public RegistrarDAO(){}
    
 public boolean registrarUsuario(Usuario nuevoUsuario) {
    boolean registrado = false;
    String consulta = "INSERT INTO Usuario (nombre, appat, apmat, dni, fecha_nacimiento, telefono, correo, contraseña, membresia) " +
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)";
    
    try {
        // Obtener conexión desde la clase base `Conexion`
        
        
            // Preparar la declaración SQL
            PreparedStatement ps = con.prepareStatement(consulta);

            // Establecer los parámetros de la consulta
            ps.setString(1, nuevoUsuario.getNombre());
            ps.setString(2, nuevoUsuario.getAppat());
            ps.setString(3, nuevoUsuario.getApmat());
            ps.setInt(4, nuevoUsuario.getDni());
            
            // Convertir java.util.Date a java.sql.Date si es necesario
            java.sql.Date fechaNacimiento = new java.sql.Date(nuevoUsuario.getFechaNac().getTime());
            ps.setDate(5, fechaNacimiento);
            
            ps.setInt(6, nuevoUsuario.getTelefono());
            ps.setString(7, nuevoUsuario.getCorreo());
            ps.setString(8, nuevoUsuario.getPassword());

            // Ejecutar la consulta de inserción
            int filasAfectadas = ps.executeUpdate();

            // Verificar si se registró correctamente
            registrado = filasAfectadas > 0;

            // Cerrar recursos
            ps.close();
       
    } catch (SQLException ex) {
    ex.printStackTrace();
    return false;
}

return registrado;
 }
    }

