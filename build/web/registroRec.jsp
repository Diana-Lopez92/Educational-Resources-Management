<%-- 
    Document   : registroRec
    Created on : 4/12/2015, 11:39:32 AM
    Author     : Diana
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="mysql.conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <!--<script src="https://code.jquery.com/jquery-1.10.2.js"></script>-->
        <script src="js/jquery-1.10.2.js"></script>
        <script>
            function f()
            {
                $(document).ready(function(){
                        $("#selectDom").change(function(){
                           var value = $(this).val();
                           $.get("datos.jsp",{q:value},function(data){
                                $("#selectSub").html(data);
                           });
                        });
                });
            }
        </script>

    </head>
    <body>
        <h1>Hello World!</h1>
        
        <div id="formulario">
            <h1>Registro de Recursos</h1>
            <form action="srv" method="post" name="recursos">
                <label>Nombre del Recurso:</label>
                <input type="text" id="nombreSub" name="nombreSub" required>
                <label>Dominio:</label>
                
                <select name="selectDom" id="selectDom" onchange="f()">
                    <option value="0">Seleccione...</option>
                    
                    <%
                        ResultSet rs;
                        Statement stmt;
                        conexion bd=new conexion();
                        String sql= "select * from dominios";
                        
                        try
                        {
                            System.out.println("Entra al TRY de Seleccionar Dominio");
                            //stmt=con.createStatement();
                            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                            rs=stmt.executeQuery(sql);
                            stmt.closeOnCompletion();
                            
                            
                             while (rs.next()) 
                            {   
                                out.println("<option value='"+rs.getInt("id_dom")+"'>" + rs.getString("nombre") + "</option>");          
                                                                
                            }                           
                            
                            
                        }catch(SQLException e){
                            System.out.println("Algo salio mal :(");
                        }
        
                    %>  
                    
                </select>
                
                <label>Subdominio:</label>
                <select name="selectSub" id="selectSub">
                    <option value="0">Seleccione...</option>
                   
                      
                </select>
                
                <label>Id Maestro:</label> 
                <input type="text" id="id" name="id" required>
                
                <label>Texto:</label> 
                <input type="text" id="texto" name="texto" required>
                
                <input type="submit" id="btn" name="btn" value="Registrar Recurso">
            </form>
        </div>
        
    </body>
</html>
