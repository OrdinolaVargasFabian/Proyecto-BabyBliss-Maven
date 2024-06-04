package Modelo;

import java.util.Date;

public class Especialista {
    private int idEspecialista;
    private String nombre;
    private String appat;
    private String apmat;
    private int dni;
    private Date fechaNac;
    private String correo;
    private String password;
    private String telefono;
    private int especialidad;
    private String foto;
    private String estado;

    public Especialista() {}

    public int getIdEspecialista() {
        return idEspecialista;
    }

    public void setIdEspecialista(int idEspecialista) {
        this.idEspecialista = idEspecialista;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getApmat() {
        return apmat;
    }

    public void setApmat(String apmat) {
        this.apmat = apmat;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }
    
    public Date getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(int especialidad) {
        this.especialidad = especialidad;
    }
    
    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
