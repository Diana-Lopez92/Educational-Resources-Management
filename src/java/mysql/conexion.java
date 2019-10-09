/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Diana
 */
public class conexion {
    
    private String ip="localhost";
    private String url="jdbc:mysql://"+ip+"/rec_edu?autoreconnect=true";
    Connection con=null; //sirve para realizar la conexion a mysql
    Statement stmt=null;//sirve para realizar las sentencias sql
    ResultSet rs=null;//sirve para guardar los resultados de una consulta
    final String user="root";
    final String pass="1234";
    
    public conexion() {
        try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection(url,user,pass);
         
            System.out.println("Conexion Exitosa");
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("no se pudo :(");
        } 
    }
    
    public Connection obtenerConec(){
        return con;
    }
    
    public void cerrarConStmt(){
        try
        {
            con.close();
            stmt.close();

        } catch (SQLException ex) {
            System.out.println("ERROR");
        }
    }
}
