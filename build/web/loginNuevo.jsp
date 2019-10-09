<%@ page import ="java.sql.*" %>
<%
    String usuario = request.getParameter("uname");    
    String password= request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rec_edu",
            "root", "1234");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from usuarios where usuario='" + usuario + "' and password='" + password+ "'");
    if (rs.next()) {
        session.setAttribute("usuario", usuario);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("home.jsp");
    } else {
         response.sendRedirect("index.jsp");
    }
%>