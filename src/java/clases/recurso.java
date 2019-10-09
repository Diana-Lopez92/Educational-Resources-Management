/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import mysql.conexion;

/**
 *
 * @author Diana
 */
public class recurso {
    
    private int idDom;
    private int idSub;
    private int idUsu;
    private String nombre, texto;
    Connection con=null, conecta=null; //sirve para realizar la conexion a mysql
    Statement stmt=null;//sirve para realizar las sentencias sql
    ResultSet rs=null;
    conexion bd= new conexion();
    
    public boolean insertar(recurso recurso)
    {
        boolean estado= false;
        //conexion bd= new conexion();
        //String sql="insert into usuarios(nombre, apellidos, usuario, password, correo, matricula, id_tipo) values ('"+usuario.getNombre()+"','"+usuario.getApellidos()+"','"+usuario.getUsu()+"','"+usuario.getPass()+"','"+usuario.getCorreo()+"',"+usuario.getMatricula()+""+")";
        String sql="insert into recursos(nombre, texto, id_dom, id_sub, id_usu) values ('"+ recurso.getNombre() +"','"+ recurso.getTexto() +"',"+ recurso.getIdDom() +","+ recurso.getIdSub() +","+ recurso.getIdUsu() +")";
        System.out.println("Entra a Insertar RECURSO");
        System.out.println(recurso.getNombre());
        System.out.println(recurso.getTexto());
            
        conecta= bd.obtenerConec();
        
        if(conecta!=null)
        {
            try {
                System.out.println("Entra al TRY") ;
                System.out.println("Pasa stmt") ;
                System.out.println(sql);
                //bd.obtenerConec();
                //Statement stmt= con.createStatement();
                //stmt= con.createStatement();
                stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                stmt.executeUpdate(sql); 
                estado = true;
                //bd.cerrarConStmt();            
                return estado;
            } catch (SQLException ex) {
               System.out.println("No se pudo agregar");
            }
        }
        else
        {
            System.out.println("No hay conexión");
        }
        return estado;
    }

    public recurso(int idDom, int idSub, int idUsu, String nombre, String texto) {
        this.idDom = idDom;
        this.idSub = idSub;
        this.idUsu = idUsu;
        this.nombre = nombre;
        this.texto = texto;
    }

    public recurso() {
        this.idDom = 0;
        this.idSub = 0;
        this.idUsu = 0;
        this.nombre = null;
        this.texto = null;
    }

    /**
     * @return the idDom
     */
    public int getIdDom() {
        return idDom;
    }

    /**
     * @param idDom the idDom to set
     */
    public void setIdDom(int idDom) {
        this.idDom = idDom;
    }

    /**
     * @return the idSub
     */
    public int getIdSub() {
        return idSub;
    }

    /**
     * @param idSub the idSub to set
     */
    public void setIdSub(int idSub) {
        this.idSub = idSub;
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
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    
    
    
    
}
