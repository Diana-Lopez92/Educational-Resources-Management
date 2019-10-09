<%-- 
    Document   : login
    Created on : 26/11/2015, 08:37:16 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <form action="login" method="POST">
            <label>Usuario:</label>
            <input type="text" name="usu" required>
            <label>Password:</label>
            <input type="passsword" name="pass" required>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
