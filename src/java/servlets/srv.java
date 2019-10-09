/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;


import clases.dominio;
import clases.recurso;
import clases.subdominio;
import clases.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mysql.conexion;


/**
 *
 * @author Diana
 */
@WebServlet(name = "srv", urlPatterns = {"/srv"})
public class srv extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        System.out.println("Entra al método GET");
        
        processRequest(request, response);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("alert('Método GET');");
        int id;
        id= Integer.parseInt(request.getParameter("id"));
        //System.out.println("Método Get, valor del ID:");
        //System.out.println(id);
        
        try
        {
            ResultSet rs;
            usuario usuario= new usuario();
            
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            
            
            out.println("<p>El id es " + id + "</p>");
            
            if(usuario.eliminar(id))
            {
                out.println("<script type='text/javascript'>");
                out.println("window.location='Alumnos.jsp';");
                out.println("</script>");
            }
            
            
        }catch(Exception e){}
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try
        {
            ResultSet rs;
            //conexion bd= new conexion();
            
            
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            
          
            
            
            if (request.getParameter("btn").equals("Sign Up")) 
            {
                
                
                usuario usuario;
                
                int id_usu;
                String nombre, apellidos, usu, pass, correo, matricula;
                
                matricula= request.getParameter("matricula");
                nombre= request.getParameter("nombre");
                apellidos= request.getParameter("apellidos");
                usu= request.getParameter("usuario");
                pass= request.getParameter("password");
                correo= request.getParameter("correo");
                id_usu= Integer.parseInt(request.getParameter("idUsu"));
                
                System.out.println("Info Servelet\n");
                System.out.println(matricula);
                System.out.println(nombre);
                System.out.println(apellidos);
                System.out.println(usu);
                System.out.println(pass);
                System.out.println(correo);
                System.out.println(id_usu);
                
                usuario= new usuario(matricula, id_usu, nombre, apellidos, usu, pass, correo);
                                
                
                                                  
                if(usuario.insertar(usuario))
                {
                    out.println("<script type='text/javascript'>");                    
                    out.println("window.location='index.jsp';");
                    out.println("</script>");
                }
                
                else
                {
                    out.println("<script type='text/javascript'>");                   
                    out.println("window.location='index.jsp';");
                    out.println("</script>");
                    
                }
                /*if(id_usu == 0)
                {
                    if (alumno.insertar(alumno)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Agregado Correctamente');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    } 
                    else 
                    {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Error D:');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                }
                else
                {
                    if(maestro.insertar(maestro)){
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Agregado Correctamente');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                    
                    else 
                    {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Error D:');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                }*/              
                
            }      
            
            if (request.getParameter("btn").equals("Create")) 
            {
             
                usuario usuario;
                
                int id_usu;
                String nombre, apellidos, usu, pass, correo, matricula;
                
                matricula= request.getParameter("matricula");
                nombre= request.getParameter("nombre");
                apellidos= request.getParameter("apellidos");
                usu= request.getParameter("usuario");
                pass= request.getParameter("password");
                correo= request.getParameter("correo");
                id_usu= Integer.parseInt(request.getParameter("idUsu"));
                
                System.out.println("Info Servelet\n");
                System.out.println(matricula);
                System.out.println(nombre);
                System.out.println(apellidos);
                System.out.println(usu);
                System.out.println(pass);
                System.out.println(correo);
                System.out.println(id_usu);
                
                usuario= new usuario(matricula, id_usu, nombre, apellidos, usu, pass, correo);
                                
                
                                                  
                if(usuario.insertar(usuario))
                {
                    out.println("<script type='text/javascript'>");                    
                    out.println("window.location='Alumnos.jsp';");
                    out.println("</script>");
                }
                
                else
                {
                    out.println("<script type='text/javascript'>");                   
                    out.println("window.location='Alumnos.jsp';");
                    out.println("</script>");
                    
                }
                /*if(id_usu == 0)
                {
                    if (alumno.insertar(alumno)) {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Agregado Correctamente');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    } 
                    else 
                    {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Error D:');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                }
                else
                {
                    if(maestro.insertar(maestro)){
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Agregado Correctamente');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                    
                    else 
                    {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Error D:');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                }*/              
                
            }      
        
        
            
            else if (request.getParameter("btn").equals("Modificar")) 
            {
                System.out.println("Entra a modificar");
                usuario usuario;
                String nombre, apellidos, usu, pass, correo, matricula;
                int idUsu;
                System.out.println("Pasa declaracion de var");
                
                
                nombre=request.getParameter("nombre");
                apellidos=request.getParameter("apellidos");
                usu=request.getParameter("usuario");
                pass=request.getParameter("password");
                correo= request.getParameter("correo");
                matricula= request.getParameter("matricula");
                idUsu= Integer.parseInt(request.getParameter("id"));
                System.out.println("Obtiene parametros");
                
                
                System.out.println(idUsu);
                System.out.println(nombre);
                System.out.println(apellidos);
                System.out.println(usu);
                System.out.println(pass);
                System.out.println(correo);
                System.out.println(matricula);
                
                usuario= new usuario(matricula, idUsu, nombre, apellidos, usu, pass, correo);
                
                System.out.println(nombre);                                
                if (usuario.modificar(usuario)) {
                    out.println("<script type='text/javascript'>");
                    out.println("window.location='Alumnos.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='Alumnos.jsp';");
                    out.println("</script>");
                }
            }
            
            else if(request.getParameter("btn").equals("Sign Up Domain"))
            {
                String nombreDom;
                int id;
                dominio dominio;
                
                id= Integer.parseInt(request.getParameter("id"));
                nombreDom= request.getParameter("nombreDom");
                
                
                dominio= new dominio(id, nombreDom) {
                    
                    @Override
                    public boolean insertar(usuario usuario) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                    
                    @Override
                    public boolean modificar(usuario usuario) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                    
                    @Override
                    public boolean eliminar(int id) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                };
                
                if(dominio.insertar(dominio))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Agregado Correctamente');");
                    out.println("window.location='registroDominio.jsp';");
                    out.println("</script>");
                }
                    
                else 
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='registroDominio.jsp';");
                    out.println("</script>");
                }                 
                
            }
            
            else if(request.getParameter("btn").equals("Sign Up Subdomain"))
            {
                String nSubdominio;
                int id, dominio;
                subdominio subdominio;
                
                nSubdominio= request.getParameter("nombreSub");
                dominio= Integer.parseInt(request.getParameter("selectDom"));
                id= Integer.parseInt(request.getParameter("id"));
                
                subdominio= new subdominio(dominio, id, nSubdominio) {
                    
                    @Override
                    public boolean insertar(usuario usuario) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                    
                    @Override
                    public boolean modificar(usuario usuario) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                    
                    @Override
                    public boolean eliminar(int id) {
                        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                };
                
                if(subdominio.insertar(subdominio))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Agregado Correctamente');");
                    out.println("window.location='registroSubdominio.jsp';");
                    out.println("</script>");
                }
                    
                else 
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='registroSubDominio.jsp';");
                    out.println("</script>");
                } 
            }
            
            else if(request.getParameter("btn").equals("Registrar Recurso"))
            {
                String nombre, texto;
                int idDom, idSub, idUsu;
                recurso recurso;
                
                
                nombre= request.getParameter("nombreSub");
                texto= request.getParameter("texto");
                idDom= Integer.parseInt(request.getParameter("selectDom"));
                idSub= Integer.parseInt(request.getParameter("selectSub"));
                idUsu= Integer.parseInt(request.getParameter("id"));
                
                recurso= new recurso(idDom, idSub, idUsu, nombre, texto);
                                
                if(recurso.insertar(recurso))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Agregado Correctamente');");
                    out.println("window.location='registroRecurso.jsp';");
                    out.println("</script>");
                }
                    
                else 
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='registroRecurso.jsp';");
                    out.println("</script>");
                } 
            }
            
            /*else if(request.getParameter("btn").equals("Modificar"))
            {
                
                int matricula;
                alumno alumno;
                
                String nombre, apellidos, usu, pass, correo;
                
                out.println("<script type='text/javascript'>");
                    out.println("alert('Entra a la opción modificar');");
                    //out.println("window.location='consultaAlumnos.jsp';");
                    out.println("</script>");
                
                matricula= Integer.parseInt(request.getParameter("matricula"));
                nombre= request.getParameter("nombre");
                apellidos= request.getParameter("apellidos");
                usu= request.getParameter("usuario");
                pass= request.getParameter("password");
                correo= request.getParameter("correo");
                
                
                
                alumno= new alumno(matricula, nombre, apellidos, usu, pass, correo);
                
                if(bd.modificarAlumno(alumno))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Se han actualizado los datos');");
                    out.println("window.location='consultaAlumnos.jsp';");
                    out.println("</script>");
                }
                
                else
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Se ha producido un error');");
                    out.println("window.location='consultaAlumnos.jsp';");
                    out.println("</script>");
                    
                }
               
                
                
            }*/
            /* else {
        
        if (request.getParameter("btn").equals("Buscar")) {
        out.println("<table border='1px'>");
        out.println("<tr><td colspan=2>LISTADO DE Persona </td></tr> ");
        out.println("<tr><td>ID</td><td>Nombre</td></tr>");
        
        rs=bd.seleccionarPersonas();
        if((request.getParameter("id").equals("")) && (!request.getParameter("nom").equals("")))
            rs=bd.seleccionarPersonas1(request.getParameter("nom"));
         
        if((!request.getParameter("id").equals("")) && (request.getParameter("nom").equals("")))
            rs=bd.seleccionarPersonas2(Integer.parseInt(request.getParameter("id")));
        
         while (rs.next()) {
                
                out.println("<tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("nombre") + "</td></tr>");
            }
            /*out.println("<script type='text/javascript'>");
            out.println("window.location='http://localhost:8080/aplicacionweb/buscarPersona.jsp';");
            out.println("</script>");*/
            /*out.println("</table>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        }*/
            
            /***
            else{
            if (request.getParameter("btn").equals("Modificar")) {
                alumno alumno;                
                String nom,ap,sexo,puesto;
                int id_p;
                float sal;
                
                id_p=Integer.parseInt(request.getParameter("Control"));
                nom=request.getParameter("nombre");
                ap=request.getParameter("ap");
                sexo=request.getParameter("sexo");
                puesto=request.getParameter("puesto");
                
                persona=new persona(id_p,nom, ap, puesto, sexo);
                
                if (bd.modificarPersona(persona)) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Agregado Correctamente');");
                    out.println("window.location='modificar-eliminar.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='modificar-eliminar.jsp';");
                    out.println("</script>");
                }
            }/*else{
                 
                if (request.getParameter("btn").equals("Eliminar")) {
                    int id_p=Integer.parseInt(request.getParameter("Control"));
                    if (bd.eliminarPersona(id_p)) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Agregado Correctamente');");
                    out.println("window.location='modificar-eliminar.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Error D:');");
                    out.println("window.location='modificar-eliminar.jsp';");
                    out.println("</script>");
                }
                }
            }
        }
      }*/
        }catch(Exception e){
            
        }
            
            /*if(request.getParameter("btn").equals("Registrar"))
            {
                out.println("<script type='text/javascript'>");
                    out.println("alert('ENTRA');");
                    //out.println("window.location='registro.jsp';");
                    out.println("</script>");
                    
                alumno alumno;
                int matricula, id_usu;
                String nombre, apellidos, usu, pass, correo;
                
                matricula= Integer.parseInt(request.getParameter("matricula"));
                nombre= request.getParameter("nombre");
                apellidos= request.getParameter("apellidos");
                usu= request.getParameter("usuario");
                pass= request.getParameter("password");
                correo= request.getParameter("correo");
                id_usu= Integer.parseInt(request.getParameter("idUsu"));
                
                
                
                if(id_usu == 0)
                {
                    alumno= new alumno(matricula, id_usu, nombre, apellidos, usu, pass, correo);
                    out.println("<script type='text/javascript'>");
                    out.println("alert('"+nombre+apellidos+usu+pass+correo+id_usu+"');");
                    //out.println("window.location='registro.jsp';");
                    out.println("</script>");
                    
                    if(bd.insertarAlumno(alumno))
                    {
                        out.println("<script type='text/javascript>'");
                        out.println("alert('ERROR');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>"); 
                    }
                    else
                    {
                        out.println("<script type='text/javascript>'");
                        out.println("alert('Error');");
                        out.println("window.location='registro.jsp';");
                        out.println("</script>");
                    }
                }
                    /*out.println("<script type='text/javascript'>");
                    out.println("alert('Lo hace');");
                    out.println("window.location='registro.jsp';");
                    out.println("</script>");*/
                    
                /*if(bd.insertarAlumno(alumno))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Se ha registrado correctamente');");
                    out.println("window.location='registro.jsp';");
                    out.println("</script>");
                }
                
                
            }
        }catch(Exception e){}*/
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    /*@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>*/

}
