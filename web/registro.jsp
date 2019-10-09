<%-- 
    Document   : registro
    Created on : 2/11/2015, 03:10:10 PM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <div id="formulario">
            <h1>Registro de Usuarios</h1>
            <form action="srv" method="post">
                <label>Matrícula:</label>
                <input type="text" id="matricula" name="matricula" placeholder="Matrícula" required>
                <label>Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
                <label>Apellidos:</label> 
                <input type="text" id="apellidos" name="apellidos" required>
                <label>Usuario:</label>
                <input type="text" id="usuario" name="usuario" required>
                <label>Password:</label>
                <input type="password" id="password" name="password" required>
                <label>Correo:</label>
                <input type="text" id="correo" name="correo" required>
                <label>Tipo de Usuario:</label>
                <input type="radio" name="idUsu" value="1">
                <label>Maestro</label>
                <input type="radio" name="idUsu" value="0">
                <label>Alumno</label>
                
                <script type="text/javascript"></script>
                <input type="submit" id="btn" name="btn" value="Registrar">
            </form>
        </div>
    </body>
</html>
