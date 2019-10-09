<%-- 
    Document   : modificarAlumno
    Created on : 3/11/2015, 03:41:11 PM
    Author     : Diana
--%>

<%@page import="clases.usuario"%>
<%@page import="clases.constructorA"%>
<%@page import="mysql.conexion"%>
<%@page import="clases.alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Modificar</h1>
        
        <%
            int id= 0;
            String nombre="", apellidos="", usu="", password="", correo="", matricula="";
            
            //alumno alumno= new alumno();
            usuario usuario= new usuario();
            
            id= Integer.parseInt(request.getParameter("id"));
            System.out.println("Valor del id: " + id);
            
           
            //manejador bd= new manejador();
            
            //matricula= alumno.getMatricula();
            //alumno= bd.mostrarAlumno(matricula);
            usuario= usuario.mostrarAlumno(id);
            nombre= usuario.getNombre();
            apellidos= usuario.getApellidos();
            usu= usuario.getUsu();
            password= usuario.getPass();
            correo= usuario.getCorreo();
            matricula= usuario.getMatricula();
            
            System.out.println("Datos");
            System.out.println(usuario.getMatricula());
            System.out.println(usuario.getNombre());
            System.out.println(usuario.getApellidos());
        %>
        
        <div id="formulario">
            <h1>Registro de Usuarios</h1>
            <form action="srv" method="post">
                <label>ID:</label>
                <input type="text" id="id" name="id" value="<%=id%>">
                <label>Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%=nombre%>">
                <label>Apellidos:</label> 
                <input type="text" id="apellidos" name="apellidos" value="<%=apellidos%>">
                <label>Usuario:</label>
                <input type="text" id="usuario" name="usuario" value="<%=usu%>">
                <label>Password:</label>
                <input type="password" id="password" name="password" value="<%=password%>">
                <label>Correo:</label>
                <input type="text" id="correo" name="correo" value="<%=correo%>">
                <label>Matricula:</label>
                <input type="text" id="matricula" name="matricula" value="<%=matricula%>">
                
                
                <script type="text/javascript"></script>
                <input type="submit" id="btn" name="btn" value="Modificar">
            </form>
        </div>
        
    </body>
</html>
