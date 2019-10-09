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
public abstract class subdominio implements interfaz {
    
    private int idDom;
    private int idM;
    private String subdominio;
    Connection con=null, conecta=null; //sirve para realizar la conexion a mysql
    Statement stmt=null;//sirve para realizar las sentencias sql
    ResultSet rs=null;
    conexion bd= new conexion();
    
    public boolean insertar(subdominio subdominio)
    {
        boolean estado= false;
        String sql= "insert into subdominios(nombre, id_dom, id_usu) values ('"+subdominio.getSubdominio()+"',"+subdominio.getIdDom()+","+subdominio.getIdM()+")";
        
        System.out.println("Entra a Insertar Subdominio");
        
        
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

    public subdominio(int idDom, int idM, String subdominio) {
        this.idDom = idDom;
        this.idM = idM;
        this.subdominio = subdominio;
    }

    public subdominio() {
        this.idDom = 0;
        this.idM = 0;
        this.subdominio = null;
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
     * @return the idM
     */
    public int getIdM() {
        return idM;
    }

    /**
     * @param idM the idM to set
     */
    public void setIdM(int idM) {
        this.idM = idM;
    }

    /**
     * @return the subdominio
     */
    public String getSubdominio() {
        return subdominio;
    }

    /**
     * @param subdominio the subdominio to set
     */
    public void setSubdominio(String subdominio) {
        this.subdominio = subdominio;
    }
    
    
    
    
}
