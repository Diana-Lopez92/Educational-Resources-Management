<%-- 
    Document   : registroRecurso
    Created on : 19/11/2015, 12:06:27 PM
    Author     : Diana
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="mysql.conexion"%>
<%@page import="java.sql.Statement"%>
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
       
        <!--<script src="https://code.jquery.com/jquery-1.10.2.js"></script>-->
        <script src="js/jquery-1.10.2.js"></script>
        <script>
            function f()
            {
                $(document).ready(function(){
                        $("#selectDom").change(function(){
                           var value = $(this).val();
                           $.get("datos.jsp",{q:value},function(data){
                                $("#selectSub").html(data);
                           });
                        });
                });
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
                         
                    </div>
                </div>
                <!-- /.row -->
          <div id="formulario">
            <h1>New Resources</h1>
            <div class="form-group">

            <form action="srv" method="post" name="recursos">
                <label>Name:</label>
                <input class="form-control" type="text" id="nombreSub" name="nombreSub" required placeholder="Enter Resource's Name">
                <br>
                <label>Domain:</label>
                <select name="selectDom" id="selectDom" class="form-control" onchange="f()">
                <!--<select name="selectDom" id="selectDom" onchange="f()">-->
                    
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
                <label>Subdomain:</label>
                <select name="selectSub" id="selectSub" class="form-control">
                    <option value="0">Seleccione...</option>                   
                      
                </select>
                
                <br>
                <label>Teacher ID:</label> 
                <input type="text" id="id" name="id" required class="form-control" placeholder="Enter Teacher's ID">
                <br>
                <label>Text:</label> 
                <input type="text" id="texto" name="texto" required class="form-control" placeholder="Enter the Text">
                <br>
                <input type="submit" id="btn" name="btn" value="Registrar Recurso">
            </form>
        </div>
           
        </div>

           
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
        
    </body>
</html>