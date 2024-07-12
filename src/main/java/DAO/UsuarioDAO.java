package DAO;
import Modelo.Usuario;
import Persistencia.Conexion;

public class UsuarioDAO extends Conexion{
    
    public UsuarioDAO(){}
    
    public Usuario VerificarUsuario(String correo, String contra) throws Exception{
        Usuario usuario = null;
        String consulta = "SELECT * FROM usuario WHERE correo = ? AND contraseña = ?";
        try{
            ps = con.prepareStatement(consulta);
            ps.setString(1, correo);
            ps.setString(2, contra);
            rs = ps.executeQuery();
            if(rs.next()){
                usuario = new Usuario();
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setAppat(rs.getString(3));
                usuario.setApmat(rs.getString(4));
                usuario.setDni(rs.getInt(5));
                usuario.setFechaNac(rs.getDate(6));
                usuario.setCorreo(rs.getString(7));
                usuario.setPassword(rs.getString(8));
                usuario.setTelefono(rs.getInt(9));
                usuario.setMembresia(rs.getInt(10));
            }            
        }catch(Exception ex){
            System.out.println("ERROR al recuperar usuario : "+ex);
        }        
        return usuario;
    }
    
    public void adquirirMembresia(int id) {
        String consulta = "UPDATE usuario SET membresia = '2' WHERE idUsuario = ?;";
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public Usuario obtenerUsuario(int id) {
        Usuario usuario = null;
        String consulta = "SELECT * FROM usuario WHERE idUsuario = ?";
        try{
            ps = con.prepareStatement(consulta);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                usuario = new Usuario();
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setAppat(rs.getString(3));
                usuario.setApmat(rs.getString(4));
                usuario.setDni(rs.getInt(5));
                usuario.setFechaNac(rs.getDate(6));
                usuario.setCorreo(rs.getString(7));
                usuario.setPassword(rs.getString(8));
                usuario.setTelefono(rs.getInt(9));
                usuario.setMembresia(rs.getInt(10));
            }            
        }catch(Exception ex){
            System.out.println("ERROR al recuperar usuario : "+ex);
        }        
        return usuario;
    }
}
