<%-- 
    Document   : ejercicio
    Created on : 28/11/2015, 11:14:28 PM
    Author     : Diana
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.ejercicio"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        
        <script>
            function funcion(value) {
            //alert(value);
            document.getElementById("caja").value = document.getElementById("caja").value + " " + value;
            }
            
            function limpiar()
            {
                document.getElementById("caja").value= "";
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
                            Exercise
                        </h1>
                         
                    </div>
                </div>
                <!-- /.row -->
        
        <%
            ResultSet rs;
            //conexion bd=new conexion();
            ejercicio ejercicio= new ejercicio();
            ArrayList lista = new ArrayList();
            ArrayList lista2 = new ArrayList();
            
            int id=0;
            id= Integer.parseInt(request.getParameter("id"));
            System.out.println("Id: " + id);
            
            ejercicio= ejercicio.mostrarRecurso(id);
            String texto;
            
            texto= ejercicio.getTexto();
            System.out.println("El texto es: " + texto);
            
            System.out.println("Entra a fragmentar");
                   
            ArrayList numeros= new ArrayList();
            int numero;

            /*Comienza a Fragmentar la frase*/
            StringTokenizer tokens = new StringTokenizer(texto);
            System.out.println("Tokens: \n");
            while(tokens.hasMoreTokens())
            {
                //System.out.println("\n" + tokens.nextToken());        
                lista.add(tokens.nextToken());
                System.out.println(lista);
            }
            System.out.println("La frase es: " + lista);
            
            for (int i = 0; i < lista.size(); i++) 
            {
                numero = (int) (Math.random() * lista.size());
                if (numeros.contains(numero)) {
                    i--;
                } else {
                    numeros.add(numero);
                }
            }
        
            System.out.println("Los numeros aleatorios son: \n"+ numeros);
            
            for(int i=0; i < lista.size(); i++)
            {
                //getLista2().add(lista.get((int)numeros.get(i)));
                //lista2.add(lista.get((Integer)numeros.get(i)));                
                lista2.add(lista.get((Integer)numeros.get(i)));
            }
            
            
            System.out.println("Valor lista2: " + lista2);
            //out.println("<input type='submit' name='boton' value='Click'>");
                      
            /*for(int i=0; i < lista2.size(); i++)
            {
                out.println("<p>" + lista2.get(i) + "</p>");
            }*/
            
            String var= "Hola";
            for(int i=0; i < lista2.size(); i++)
            {
                //out.println("<input type='submit' name='boton' id='boton' value='"+ lista2.get(i) + "' onclick='valores()'>");
                out.println("<input type='submit' name='boton' value='"+ lista2.get(i) + "' onclick='funcion(this.value)' class='btn btn-primary btn-lg'>");
            }

        %>
        
        <div class="form-group">
        <form action="srvEjercicio" method="post">
            <br><br>
            <input type="text" name="caja" id="caja" class="form-control">

            <br><br><br><br>
            <input type="submit" name="btn" value="Send">
            <input type="text" name="id" value="<%=id%>" hidden="true">
        </form>
        <br><br>
        
        <input type="submit" name="limpiar" onclick="limpiar()" value="Clean">
        </div>
            </div>
        </div>
        <br><br>
        
        
        
    </body>
</html>
