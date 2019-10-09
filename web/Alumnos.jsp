<%@page import="clases.usuario"%>
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

    <script type="text/javascript" language="javascript">
            function Borrar(id)
            {
		var resul = confirm('Do you really want to delete the selected student?');
		if (resul)
		{
                    window.location='srv?id='+id;
		}
                else
                {
                    window.location='Alumnos.jsp';
                }
            }
        </script> 

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
                <a class="navbar-brand" href="index.html">Educational Resources Manager Systems</a>
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
                    <li >
                        <a href="home.jsp"><i class="fa fa-fw fa-dashboard"></i> Home</a>
                    </li>
                    <li class="active">
                        <a href="Alumnos.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Students</a>
                    </li>
                    <li>
                        <a href="consultaDominios.jsp"><i class="fa fa-fw fa-table"></i> Domains</a>
                    </li>
                    
                    <li>
                        <a href="consultaSubdominios.jsp"><i class="fa fa-fw fa-table"></i> Subdomains</a>
                    </li>
                    <li>
                        <a href="consultaRecursos.jsp"><i class="fa fa-fw fa-dashboard"></i> Resources</a>
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
                         <div class="text-left">
                                   <a href="addUser.jsp" class="btn btn-primary btn-lg" role="button">Insert</a>
                                </div>
                   <br>
                    </div>
                </div>
                <!-- /.row -->
               <div class="row">
                    
                    
                    <div class="col-lg-12">
                        
                            <div class="panel-body"> 
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                 <th>Name</th>
                                                 <th>Last Name </th>
                                                 <th>User</th>
                                                 <th>Password</th>
                                                 <th>E-mail</th>
                                                 <th>Enrollment</th>
                                                 <th>Options </th>
                                            </tr>
                                        </thead>
                                        <%
            ResultSet rs;
            //conexion bd=new conexion();
            //alumno alumno= new alumno();
            usuario usuario= new usuario();
            int id=0;
            
            

            rs= usuario.seleccionarAlumnos();
            //rs= bd.seleccionarAlumnos();


            while (rs.next()) 
            {   
                %>
                
                <tr>
                    

                     <td><%=rs.getInt("id_usu")%></td>
                     <td><%=rs.getString("nombre")%></td>
                     <td><%=rs.getString("apellidos")%></td>
                     <td><%=rs.getString("usuario")%></td>
                     <td><%=rs.getString("password")%></td>
                     <td><%=rs.getString("correo")%></td>
                     <td><%=rs.getString("matricula")%></td>
                     <td><a href=editUser.jsp?id=<%=rs.getInt("id_usu")%>>Edit</a> &nbsp; &nbsp; 
                     
                         <a href='#' onclick='Borrar(<%=rs.getInt("id_usu")%>)'>Delete</a></td>
                     
             </tr>
    <%

 }

 %>


             
        
       
                                    </table>
                                </div>
                               
                            </div>
                        
                    </div>
                </div>
                <!-- /.row -->

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
