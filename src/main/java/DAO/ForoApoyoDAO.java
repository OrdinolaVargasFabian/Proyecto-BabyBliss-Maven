package DAO;
import Modelo.ForoApoyo;
import Persistencia.Conexion;
import java.util.ArrayList;
import java.util.List;

public class ForoApoyoDAO extends Conexion{
    
    public ForoApoyoDAO(){}
    
    public List listarComunidad() {
        List<ForoApoyo> lista = new ArrayList<>();
        String consulta = "SELECT * FROM foroapoyo WHERE estado = 2";
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                ForoApoyo foro = new ForoApoyo();
                foro.setIdForo(rs.getInt(1));
                foro.setTitulo(rs.getString(2));
                foro.setUsuario(rs.getInt(3));
                //foro.setFechaCreacion(rs.getDate(4));
                foro.setContenido(rs.getString(5));
                foro.setLikes(rs.getInt(6));
                lista.add(foro);
            }
        } catch (Exception ex) {
            System.out.println("Error obtener lista foros: " + ex);
        }
        return lista;
    }
    
    public void agregarForo(ForoApoyo foro) {
        String consulta = "INSERT INTO `foroapoyo`(`titulo`, `idUsuario`, `fechaCreacion`, `contenido`, `likes`, `estado`) "
                + "VALUES (?,?,NOW(),?,0,1)";
        try {
            ps = con.prepareStatement(consulta);
            ps.setString(1, foro.getTitulo());
            ps.setInt(2, foro.getUsuario());
            ps.setString(3, foro.getContenido());
            ps.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Error agregar foro: " + ex);
        }
    }
    
    public void agregarComentario(int id, String comentario) {
        String consulta = "";
    }
}
