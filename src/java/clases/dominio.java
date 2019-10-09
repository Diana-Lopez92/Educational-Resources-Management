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
public abstract class dominio implements interfaz {
    
    private int id;
    private String dominio;
    private Connection con=null;
    private Connection conecta=null;
    private Statement stmt= null;
    private ResultSet rs = null;
    private conexion bd = new conexion();
    
    public boolean insertar(dominio dominio)
    {
        boolean estado= false;
        String sql= "insert into dominios(nombre, id_usu) values ('"+dominio.getDominio()+"',"+dominio.getId()+")";
        System.out.println("Entra a Insertar Dominio");
        
        
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
                System.out.println("Se cierra la conexión");
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
    
      
    /*Constructores*/

    public dominio(int id, String dominio) {
        this.id = id;
        this.dominio = dominio;
    }

    public dominio(String dominio) {
        this.dominio = dominio;
    }

    public dominio() {
        this.id = 0;
        this.dominio = null;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the dominio
     */
    public String getDominio() {
        return dominio;
    }

    /**
     * @param dominio the dominio to set
     */
    public void setDominio(String dominio) {
        this.dominio = dominio;
    }
    
    
    
}
