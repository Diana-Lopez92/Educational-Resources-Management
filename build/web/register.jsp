
<%@page import="clases.usuario"%>
<%@page import="clases.alumno"%>
<%@page import="mysql.conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    

</head>

<body>

   

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Students
                        </h1>
                         
                    </div>
                </div>
                <!-- /.row -->
          <div id="formulario">
            <h1>New Student</h1>
            <div class="form-group">
                                
            <form action="srv" method="post">
                <label>Enrollment:</label>
                <input class="form-control" type="text" id="matricula" name="matricula" required placeholder="Enter Enrollment">
                <br>
                <label>Name:</label>
                <input class="form-control" type="text" id="nombre" name="nombre" required placeholder="Enter Name">
                <br>
                <label>Last Name:</label> 
                <input class="form-control" type="text" id="apellidos" name="apellidos" required placeholder="Enter Last Name">
                <br>
                <label>User:</label>
                <input class="form-control" type="text" id="usuario" name="usuario" required placeholder="Enter User">
                <br>
                <label>Password:</label>
                <input class="form-control" type="password" id="password" name="password" required placeholder="Enter Password">
                <br>
                <label>E-mail:</label>
                <input class="form-control" type="text" id="correo" name="correo" required placeholder="Enter E-mail">
                <br>
                <label>User Type:</label>              
                    <label class="radio-inline">
                        <input type="radio" name="idUsu"  value="1" >Teacher
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="idUsu" value="0"checked>Student
                    </label>                              
                <br>         
              <script type="text/javascript"></script>            
              <input type="submit" id="btn" name="btn" value="Sign Up">
            
             
            </form>
        </div>
            
        </div>

           
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>