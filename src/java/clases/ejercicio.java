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
import java.util.ArrayList;
import java.util.StringTokenizer;
import mysql.conexion;

/**
 *
 * @author Diana
 */
public class ejercicio {
    
    private int idRec;
    private String nombre;
    private String texto;
    Connection con=null, conecta=null; //sirve para realizar la conexion a mysql
    private Statement stmt=null;//sirve para realizar las sentencias sql
    private ResultSet rs=null;
    private conexion bd= new conexion(); 
    ArrayList lista2= new ArrayList();
    
    public ResultSet seleccionarRecursos(){
        String sql="select * from recursos";
        //conexion bd= new conexion();
        //conecta= bd.obtenerConec();
        try{
            System.out.println("Entra al TRY de Seleccionar Recursos");
            //stmt=con.createStatement();
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rs=stmt.executeQuery(sql);
            stmt.closeOnCompletion();
            //bd.cerrarConStmt();
        }catch(SQLException e){
            System.out.println("Algo salio mal :(");
        }
        return rs;   
    } 
    
    public ejercicio mostrarRecurso(int id)
    {
        ejercicio ejercicio= new ejercicio();
        System.out.println("Valor del id: " + id);
        String sql= "select * from recursos where id_rec="+ id + ";";
        try
        {
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            //stmt= con.createStatement();
            rs= stmt.executeQuery(sql);
            
            while(rs.next())
            {
                ejercicio.setTexto(rs.getString("texto"));
            }
        }catch(SQLException e){
            System.out.println("Algo salió mal");
        }
        return ejercicio;
    }
    
    public boolean evaluar(String texto, int id)
    {
        boolean estado= false;
        String sql= "select texto from recursos where id_rec="+ id;
        String frase="";
        
        try
        {
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            //stmt= con.createStatement();
            rs= stmt.executeQuery(sql);
            
            while(rs.next())
            {
                frase= rs.getString("texto");
            }
            
            frase= " " + frase;
            System.out.println("La frase de la bd es: " + frase);
            System.out.println("La frase recibida es: " + texto);
            
            if(frase.equals(texto))
            {
                estado= true;
                System.out.println("Coincide");
            }
            
            else
            {
                estado= false;
                System.out.println("Entra al else");
            }
            
            
        }catch(SQLException e){
            System.out.println("Algo salió mal en el java");
        }
        
        
        
        return estado;
    }
    

    public ejercicio(int idRec, String nombre, String texto) {
        this.idRec = idRec;
        this.nombre = nombre;
        this.texto = texto;
    }

    public ejercicio() {
        this.idRec = 0;
        this.nombre = null;
        this.texto = null;
    }
    
    public ejercicio(ArrayList lista2)
    {
        this.lista2= lista2;
    }
    
    public ejercicio(String texto)
    {
        this.texto= texto;
    }
    
    public ejercicio(int idRec, String texto)
    {
        this.texto= texto;
        this.idRec= idRec;
    }

    
    /**
     * @return the idRec
     */
    public int getIdRec() {
        return idRec;
    }

    /**
     * @param idRec the idRec to set
     */
    public void setIdRec(int idRec) {
        this.idRec = idRec;
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
     * @return the lista2
     */
    public ArrayList getLista2() {
        return lista2;
    }

    /**
     * @param lista2 the lista2 to set
     */
    public void setLista2(ArrayList lista2) {
        this.lista2 = lista2;
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
