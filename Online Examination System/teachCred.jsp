<%-- 
    Document   : teachCred
    Created on : 02-Apr-2024, 2:43:13 am
    Author     : lenovo
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Validation</title>
    </head>
    <body>
        <%
            String uid = request.getParameter("uname");
            String psw = request.getParameter("psw");
            
            // Database details:
            String dbUrl = "jdbc:mysql://localhost:3306/mysql"; // Replace with your database name
            String dbUser = "root";
            String dbPass = "Haritha@19";
            
            String sql = "SELECT * FROM teacher123 WHERE uid = ? AND pass = ?"; // Ensure column names match your table
            boolean isAuthenticated = false;
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                // Load the driver:
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, uid);
                pstmt.setString(2, psw);
                
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
                    e.printStackTrace();
                }
            }
            
            // Redirect user based on authentication status
            if (isAuthenticated) {
                // Save registration number
                session.setAttribute("uid", uid);
                response.sendRedirect("teacherPortal.jsp");
            } else {
                response.sendRedirect("Teacher.jsp");
            }
        %>
    </body>
</html>
teachCred.jsp