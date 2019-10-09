<%-- 
    Document   : consultaRecursos
    Created on : 4/12/2015, 08:59:25 AM
    Author     : Diana
--%>

<%@page import="clases.ejercicio"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                    <li>
                        <a href="Alumnos.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Students</a>
                    </li>
                    <li>
                        <a href="consultaDominios.jsp"><i class="fa fa-fw fa-table"></i> Domains</a>
                    </li>
                    
                    <li>
                        <a href="consultaSubdominios.jsp"><i class="fa fa-fw fa-table"></i> Subdomains</a>
                    </li>
                    <li class="active">
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
                            Resources
                        </h1>
                         <div class="text-left">
                                   <a href="registroRecurso.jsp" class="btn btn-primary btn-lg" role="button">Insert</a>
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
                                                 <th>Domain</th>
                                                 <th>Subdomain</th>
                                                 <th>Options</th>
                                            </tr>
                                        </thead>
        
        
        <%
            ResultSet rs;
            ejercicio ejercicio= new ejercicio();
            int id=0;
            /*
            out.println("<table border='1px'>");
            out.println("<tr><td colspan=2>LISTADO DE RECURSOS </td></tr> ");
            out.println("<tr><td>Nombre</td></tr>");*/

            rs= ejercicio.seleccionarRecursos();
            //rs= bd.seleccionarAlumnos();


            while (rs.next()) 
            {   
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id_rec") + "</td>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
                out.println("<td>" + rs.getInt("id_dom") + "</td>");
                out.println("<td>" + rs.getInt("id_sub") + "</td>");
             
                //out.println("<td><a href=srv?id=" + rs.getInt("id_alumno")+ ">Modificar</a>&nbsp&nbsp&nbsp");
                out.println("<td><a href=ejercicio.jsp?id=" + rs.getInt("id_rec")+ ">Do</a>&nbsp&nbsp&nbsp");
                //out.println("<a href=srv?id=" + rs.getInt("id_alumno") + " onclick='confirmar()'>Eliminar</a></td></tr>");
                id= rs.getInt("id_rec");            
                System.out.println(id);;
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td><td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
                //out.println("<tr class='consulta'><td>" + rs.getInt("id_alumno") + "</td><td>" + rs.getString("alum_nombre") + "</td><td>" + rs.getString("alum_apellidos") + "</td><td>" + rs.getString("alum_usu") + "</td><td>" + rs.getString("alum_pass") + "</td><td>" + rs.getString("alum_correo") + "</td><td>" + rs.getInt("id_usuario") + "</td>");
                //out.println("<td><a href=modificarAlumnos.jsp?id="+rs.getInt("id_alumno")+">"+"Modificar</a>&nbsp;&nbsp;<td><a href='consultaAlumnos.jsp?id="+rs.getInt("id_alumno")+">Eliminar</a></td></tr>");
            }

                out.println("</table>");
        
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
