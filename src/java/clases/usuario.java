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
import java.util.logging.Level;
import java.util.logging.Logger;
import mysql.conexion;

/**
 *
 * @author Diana
 */
public class usuario implements interfaz {
    
    private String matricula;
    private int idUsu;
    private String nombre;
    private String apellidos;
    private String usu;
    private String pass;
    private String correo;
    Connection con=null, conecta=null; //sirve para realizar la conexion a mysql
    Statement stmt=null;//sirve para realizar las sentencias sql
    ResultSet rs=null;
    conexion bd= new conexion();
    
    public boolean insertar(usuario usuario)
    {
        boolean estado= false;
        //conexion bd= new conexion();
        //String sql="insert into usuarios(nombre, apellidos, usuario, password, correo, matricula, id_tipo) values ('"+usuario.getNombre()+"','"+usuario.getApellidos()+"','"+usuario.getUsu()+"','"+usuario.getPass()+"','"+usuario.getCorreo()+"',"+usuario.getMatricula()+""+")";
        String sql="insert into usuarios(nombre, apellidos, usuario, password, correo, matricula, id_tipo) values ('"+usuario.getNombre()+"','"+usuario.getApellidos()+"','"+usuario.getUsu()+"','"+usuario.getPass()+"','"+usuario.getCorreo()+"','"+usuario.getMatricula()+"', "+ usuario.getIdUsu()+")";
        System.out.println("Entra a Insertar ALUMNO");
        System.out.println(usuario.getMatricula());
        System.out.println(usuario.getNombre());
        System.out.println(usuario.getApellidos());
        System.out.println(usuario.getCorreo());
        System.out.println(usuario.getUsu());
        System.out.println(usuario.getPass());
        
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

    public ResultSet seleccionarAlumnos(){
        System.out.println("Entra al método Seleccionar Alumnos");
        String sql="select * from usuarios where id_tipo=0";
        //conexion bd= new conexion();
        //conecta= bd.obtenerConec();
        try{
            System.out.println("Entra al TRY de Seleccionar Alumnos");
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
    
    
    public usuario mostrarAlumno(int id)
    {
        usuario usuario= new usuario();
        System.out.println("Valor del id: " + id);
        String sql= "select * from usuarios where id_usu="+ id + ";";
        try
        {
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            //stmt= con.createStatement();
            rs= stmt.executeQuery(sql);
            
            while(rs.next())
            {
                usuario.setIdUsu(rs.getInt("id_usu"));
                usuario.setMatricula(rs.getString("matricula"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setUsu(rs.getString("usuario"));
                usuario.setPass(rs.getString("password"));
                usuario.setCorreo(rs.getString("correo"));
            }
        }catch(SQLException e){
            System.out.println("Algo salió mal");
        }
        return usuario;
    }
    
    public boolean modificar(usuario usuario)//*****
    {
        System.out.println("Entra a modificar");
        System.out.println(usuario.getIdUsu());
        System.out.println(usuario.getNombre());
        System.out.println(usuario.getApellidos());
        System.out.println(usuario.getUsu());
        System.out.println(usuario.getPass());
        System.out.println(usuario.getCorreo());
        System.out.println(usuario.getMatricula());
        boolean estado= false;
        
        String sql="update usuarios set nombre='" + usuario.getNombre() + "', apellidos='" + usuario.getApellidos() + "', usuario='" + usuario.getUsu() + "', password='" + usuario.getPass() + "', correo='" + usuario.getCorreo() + "', matricula='" + usuario.getMatricula() + "' where id_usu=" + usuario.getIdUsu() + ";";
        System.out.println(sql);
        
        try
        {
            System.out.println("Entra al TRY");
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            //stmt= con.createStatement();
            stmt.execute(sql);
            System.out.println("Pasa el EXECUTE");  
            estado= true;
            
        } catch (SQLException ex) {
            Logger.getLogger(usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return estado;
    }
    /*public boolean modificar(usuario usuario)//*****
    {
        System.out.println("Entra a modificar");
        System.out.println(usuario.getIdUsu());
        System.out.println(usuario.getNombre());
        System.out.println(usuario.getApellidos());
        System.out.println(usuario.getUsu());
        System.out.println(usuario.getPass());
        System.out.println(usuario.getCorreo());
        System.out.println(usuario.getMatricula());
        boolean estado= false;
        
        //String sql="update usuarios set nombre='" + usuario.getNombre() + "', apellidos='" + usuario.getApellidos() + "', usuario='" + usuario.getUsu() + "', password='" + usuario.getPass() + "', correo='" + usuario.getCorreo() + "', matricula='" + usuario.getMatricula() + "' where id_usu=" + usuario.getIdUsu() + ";";
        String sql= "update usuarios set nombre= '" + usuario.getNombre() + "', apellidos= '" + usuario.getApellidos() + "', usuario= '" + usuario.getUsu() + "', password= '" + usuario.getPass() + "', correo= '" + usuario.getCorreo() + "', matricula= '" + usuario.getMatricula() + "' where id_usu= " + usuario.getIdUsu() + ";";
        
        System.out.println(sql);
        
        try
        {
            System.out.println("Entra al TRY");
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            stmt.execute(sql);
            System.out.println("Pasa el EXECUTE");  
            estado= true;
        }catch(SQLException e){
            System.out.println("Algo salió mal");
            System.out.println(System.err);
        }
        return estado;
    }*/
    
    public boolean eliminar(int id)
    {
        boolean estado= false;
        String sql= "delete from usuarios where id_usu= " + id;
        
        try{
            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            stmt.execute(sql);
            estado=true;
             return estado;
        } catch (SQLException ex) {
            //Logger.getLogger(manejadorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return estado;
    }

   

   
    
    //Constructores

    public usuario(String matricula, int idUsu, String nombre, String apellidos, String usu, String pass, String correo) {
        this.matricula = matricula;
        this.idUsu = idUsu;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.usu = usu;
        this.pass = pass;
        this.correo = correo;
    }

    public usuario() {
        this.matricula = null;
        this.idUsu = 0;
        this.nombre = null;
        this.apellidos = null;
        this.usu = null;
        this.pass = null;
        this.correo = null;
    }

    public usuario(String matricula, String nombre, String apellidos, String usu, String pass, String correo) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.usu = usu;
        this.pass = pass;
        this.correo = correo;
    }
    
    
    
    //Setters y Getters

    /**
     * @return the matricula
     */
    public String getMatricula() {
        return matricula;
    }

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(String matricula) {
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
