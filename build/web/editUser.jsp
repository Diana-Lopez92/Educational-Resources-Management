
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

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Educational Resources Manager Systems</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Itzel <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        
                        <li>
                            <a href="index.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="home.jsp"><i class="fa fa-fw fa-dashboard"></i> Home</a>
                    </li>
                    <li>
                        <a href="Alumnos.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Students</a>
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
                    <li>
                        <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a>
                    </li>
                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>
                    <li>
                        <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

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
            <h1>Edit Student</h1>
            
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
        
            <div class="form-group">
            
            <form action="srv" method="post">
                 <label>ID:</label>
                <input class="form-control" type="text" id="id" name="id" value="<%=id%>">
                <label>Enrollment:</label>
                <input class="form-control" type="text" id="matricula" name="matricula" value="<%=matricula%>" required placeholder="Enter Enrollment">
                <br>
                <label>Name:</label>
                <input class="form-control" type="text" id="nombre" name="nombre" value="<%=nombre%>" required placeholder="Enter Name">
                <br>
                <label>Last Name:</label> 
                <input class="form-control" type="text" id="apellidos" name="apellidos" value="<%=apellidos%>" required placeholder="Enter Last Name">
                <br>
                <label>User:</label>
                <input class="form-control" type="text" id="usuario" name="usuario" value="<%=usu%>" required placeholder="Enter User">
                <br>
                <label>Password:</label>
                <input class="form-control" type="password" id="password" name="password" value="<%=password%>" required placeholder="Enter Password">
                <br>
                <label>E-mail:</label>
                <input class="form-control" type="text" id="correo" name="correo" value="<%=correo%>" required placeholder="Enter E-mail">                       
                <br>         
              <script type="text/javascript"></script>            
              <input type="submit" id="btn" name="btn" value="Modificar">
            
             
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