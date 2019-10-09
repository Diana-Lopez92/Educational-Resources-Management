<%-- 
    Document   : ejercicio
    Created on : 28/11/2015, 10:41:06 PM
    Author     : Diana
--%>

<%@page import="clases.ejercicio"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <%
            ResultSet rs;
            ejercicio ejercicio= new ejercicio();
            int id=0;
            
            out.println("<table border='1px'>");
            out.println("<tr><td colspan=2>LISTADO DE RECURSOS </td></tr> ");
            out.println("<tr><td>Nombre</td></tr>");

            rs= ejercicio.seleccionarRecursos();
            //rs= bd.seleccionarAlumnos();


            while (rs.next()) 
            {   
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id_rec") + "</td>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
             
                //out.println("<td><a href=srv?id=" + rs.getInt("id_alumno")+ ">Modificar</a>&nbsp&nbsp&nbsp");
                out.println("<td><a href=srvEjercicio?id=" + rs.getInt("id_rec")+ ">Realizar</a>&nbsp&nbsp&nbsp");
                //out.println("<a href=srv?id=" + rs.getInt("id_alumno") + " onclick='confirmar()'>Eliminar</a></td></tr>");
                id= rs.getInt("id_rec");            
                System.out.println(id);;
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td><td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td>");
                //out.println("<td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
            }

                out.println("</table>");
        
        %>
        
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
