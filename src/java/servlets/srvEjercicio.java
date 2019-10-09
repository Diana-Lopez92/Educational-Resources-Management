/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import clases.ejercicio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Diana
 */
@WebServlet(name = "srvEjercicio", urlPatterns = {"/srvEjercicio"})
public class srvEjercicio extends HttpServlet {

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
        
        
        //System.out.println("Método Get, valor del ID:");
        //System.out.println(id);
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
            
            
            
            if (request.getParameter("btn").equals("Send")) 
            {
                                
                ejercicio ejercicio;
                
                int id;
                String texto;
                
                texto= request.getParameter("caja");
                id= Integer.parseInt(request.getParameter("id"));
                
                System.out.println("Info Servelet\n");
                System.out.println(texto);
                System.out.println(id);
                
                ejercicio= new ejercicio(id, texto);
                                             
                                                  
                if(ejercicio.evaluar(texto, id))
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('You answered correctly the exercise');");
                    out.println("window.location='consultaRecursos.jsp';");
                    out.println("</script>");
                }
                
                else
                {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('You failed, try again');");
                    out.println("window.location='consultaRecursos.jsp';");
                    out.println("</script>");
                    
                }
                      
                
            }      
        } catch(Exception e){}
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     *
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>*/

}
