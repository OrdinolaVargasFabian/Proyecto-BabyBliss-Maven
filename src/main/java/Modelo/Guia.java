package Modelo;

import java.util.Date;

public class Guia {
    private int idGuia;
    private String titulo;
    private String especialista;
    private Date fechaCreacion;
    private String contenido;
    private String imagen;

    public Guia() {}

    public int getIdGuia() {
        return idGuia;
    }

    public void setIdGuia(int idGuia) {
        this.idGuia = idGuia;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEspecialista() {
        return especialista;
    }

    public void setEspecialista(String especialista) {
        this.especialista = especialista;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
