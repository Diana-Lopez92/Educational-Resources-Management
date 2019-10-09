<%-- 
    Document   : consultaAlumnos
    Created on : 3/11/2015, 03:12:41 PM
    Author     : Diana
--%>

<%@page import="clases.usuario"%>
<%@page import="mysql.conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript" language="javascript">
            function Borrar(id)
            {
		var resul = confirm('¿Desea realmente eliminar el alumno seleccionado?');
		if (resul)
		{
                    window.location='srv?id='+id;
		}
                else
                {
                    window.location='consultaAlumnos.jsp';
                }
            }
        </script> 
              
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            ResultSet rs;
            //conexion bd=new conexion();
            //alumno alumno= new alumno();
            usuario usuario= new usuario();
            int id=0;
            
            out.println("<table border='1px'>");
            out.println("<tr><td colspan=2>LISTADO DE ALUMNOS </td></tr> ");
            out.println("<tr><td>ID</td><td>Nombre</td><td>Apellidos</td><td>Usuario</td><td>Password</td><td>Correo</td><td>Matricula</td><td>Opciones</td></tr>");

            rs= usuario.seleccionarAlumnos();
            //rs= bd.seleccionarAlumnos();


            while (rs.next()) 
            {   
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id_usu") + "</td>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
                out.println("<td>" + rs.getString("apellidos") + "</td>");
                out.println("<td>" + rs.getString("usuario") + "</td>");
                out.println("<td>" + rs.getString("password") + "</td>");
                out.println("<td>" + rs.getString("correo") + "</td>");
                out.println("<td>" + rs.getString("matricula") + "</td>");
                //out.println("<td><a href=srv?id=" + rs.getInt("id_alumno")+ ">Modificar</a>&nbsp&nbsp&nbsp");
                out.println("<td><a href=modificarAlumno.jsp?id=" + rs.getInt("id_usu")+ ">Modificar</a>&nbsp&nbsp&nbsp");
                //out.println("<a href=srv?id=" + rs.getInt("id_alumno") + " onclick='confirmar()'>Eliminar</a></td></tr>");
                id= rs.getInt("id_usu");
                out.println("<a href='#' onclick='Borrar(" + id+")'>Eliminar</a></td></tr>");
                
                System.out.println(id);
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td><td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td>");
                //out.println("<td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
            }

                out.println("</table>");
        
        %>
    </body>
</html>
