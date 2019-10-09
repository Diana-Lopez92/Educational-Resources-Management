<%-- 
    Document   : registroSubdominio
    Created on : 18/11/2015, 06:19:14 PM
    Author     : Diana
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
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
                <a class="navbar-brand" href="index.html">SB Admin</a>
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
                    
                    <li class="active">
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
                            Subdomains
                        </h1>
                         
                    </div>
                </div>
                <!-- /.row -->
          <div id="formulario">
            <h1>New Subdomain</h1>
            <div class="form-group">
            
            <form action="srv" method="post">
                <label>Name:</label>
                <input class="form-control" type="text" id="nombreSub" name="nombreSub" required placeholder="Enter Subdomain's Name">
                <br>
                <label>Domain:</label>
                <select name="selectDom" id="selectDom" class="form-control">
                    <%
                        ResultSet rs;
                        Statement stmt;
                        conexion bd=new conexion();
                        String sql= "select * from dominios";
                        
                        try
                        {
                            System.out.println("Entra al TRY de Seleccionar Dominio");
                            //stmt=con.createStatement();
                            stmt= bd.obtenerConec().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
                            rs=stmt.executeQuery(sql);
                            stmt.closeOnCompletion();
                            
                            
                             while (rs.next()) 
                            {   
                                out.println("<option value='"+rs.getInt("id_dom")+"'>" + rs.getString("nombre") + "</option>");          
                                
                            }                           
                            
                            
                        }catch(SQLException e){
                            System.out.println("Algo salio mal :(");
                        }
        
                    %>
                   
                
                                  
                </select>    
                <br>
                <label>Teacher ID:</label>
                <input class="form-control" type="text" id="id" name="id" required placeholder="Enter ID">
                <br>
                                           
                <br><br><br>         
              <script type="text/javascript"></script>            
              <input type="submit" id="btn" name="btn" value="Sign Up Subdomain">
            
             
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








