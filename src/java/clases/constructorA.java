/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Diana
 */
public class constructorA {
    
    private int matricula;
    private int idUsu;
    private String nombre;
    private String apellidos;
    private String usu;
    private String pass;
    private String correo;

    public constructorA(int matricula, int idUsu, String nombre, String apellidos, String usu, String pass, String correo) {
        this.matricula = matricula;
        this.idUsu = idUsu;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.usu = usu;
        this.pass = pass;
        this.correo = correo;
    }

    public constructorA(int matricula, String nombre, String apellidos, String usu, String pass, String correo) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.usu = usu;
        this.pass = pass;
        this.correo = correo;
    }

    public constructorA() {
        this.matricula = 0;
        this.idUsu = 0;
        this.nombre = null;
        this.apellidos = null;
        this.usu = null;
        this.pass = null;
        this.correo = null;
    }

    /**
     * @return the matricula
     */
    public int getMatricula() {
        return matricula;
    }

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    /**
     * @return the idUsu
     */
    public int getIdUsu() {
        return idUsu;
    }

    /**
     * @param idUsu the idUsu to set
     */
    public void setIdUsu(int idUsu) {
        this.idUsu = idUsu;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the usu
     */
    public String getUsu() {
        return usu;
    }

    /**
     * @param usu the usu to set
     */
    public void setUsu(String usu) {
        this.usu = usu;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
    
    
    
    
}
