<%-- 
    Document   : stuCred
    Created on : 02-Apr-2024, 2:42:38 am
    Author     : lenovo
--%>

<%@page import="java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Validation</title>
    </head>
    <body>
        <%
        String name = request.getParameter("uname");
        String password = request.getParameter("psw");
       
        
        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        String dbUser = "root";
        String dbPass = "Haritha@19";
        
        String sql = "SELECT * FROM studData123 WHERE uname = ? AND psw = ?";
        boolean isAuthenticated = false;
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", dbUser, dbPass);
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, password);
        
         rs = pstmt.executeQuery();
         
         // Check if user exists
        isAuthenticated = rs.next();
        }

     
       finally {
        // Close all database resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            
        }
    }

    // Redirect user based on authentication status
    if (isAuthenticated) {
     
    //save reg no.
     session.setAttribute("userid", name);
     response.sendRedirect("stuPor.jsp");
     
    } else {
        response.sendRedirect("student.jsp");
    }
    
    %>
    </body>
</html>
stuCred.jsp