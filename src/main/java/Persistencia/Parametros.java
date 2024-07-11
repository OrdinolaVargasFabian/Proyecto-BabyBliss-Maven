package Persistencia;

public interface Parametros {
    String nombreBD = "babybliss";
    String servidor = "localhost";
    int puerto = 3306; //Cambiar el puerto segun el XAMPP
    
    String URL="jdbc:mysql://"+servidor+":"+puerto+"/"+nombreBD;
    String DRIVER="com.mysql.jdbc.Driver";
    String USER="root";
    String CLAVE="";
}