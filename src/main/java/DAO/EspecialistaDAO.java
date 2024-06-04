package DAO;
import Modelo.Especialista;
import Persistencia.Conexion;

public class EspecialistaDAO extends Conexion{

    public EspecialistaDAO() {}
    
    public Especialista VerificarEspecialista(String correo, String contra) throws Exception{
        Especialista especialista = null;
        String consulta = "SELECT * FROM especialista WHERE correo = ? AND contraseña = ?";
        try{
            ps = con.prepareStatement(consulta);
            ps.setString(1, correo);
            ps.setString(2, contra);
            rs = ps.executeQuery();
            if(rs.next()){
                especialista = new Especialista();
                especialista.setIdEspecialista(rs.getInt(1));
                especialista.setNombre(rs.getString(2));
                especialista.setAppat(rs.getString(3));
                especialista.setApmat(rs.getString(4));
                especialista.setDni(rs.getInt(5));
                especialista.setFechaNac(rs.getDate(6));
                especialista.setCorreo(rs.getString(7));
                especialista.setPassword(rs.getString(8));
                especialista.setTelefono(rs.getString(9));
                especialista.setEspecialidad(rs.getInt(10));
            }            
        }catch(Exception ex){
            System.out.println("ERROR al recuperar especialista : "+ex);
        }        
        return especialista;
    }
}
