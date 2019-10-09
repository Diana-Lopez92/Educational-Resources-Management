<%-- 
    Document   : datos
    Created on : 3/12/2015, 03:17:54 PM
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
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            String name = "";
            String q = request.getParameter("q");
            
            ResultSet rs;
            Statement stmt;
            conexion bd=new conexion();
            
            String sql2= "select * from subdominios where id_dom="+q;
            
            try
            {
                System.out.println("Entra al TRY de Seleccionar SubDominio");
                //stmt=con.createStatement();
                stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                rs=stmt.executeQuery(sql2);
                //stmt.closeOnCompletion();
                //System.out.println("ID:" + id);
                            
                while (rs.next()) 
                {   
                    out.println("<option value='"+rs.getInt("id_sub")+"'>" + rs.getString("nombre") + "</option>");          
                                
                }                           
                            
                            
                }catch(SQLException e){
                    System.out.println("Algo salio mal :(");
            }

        %>
        
        
        
        
    </body>
</html>
