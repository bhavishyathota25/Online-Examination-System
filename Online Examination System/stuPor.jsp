<%-- 
    Document   : stuPor
    Created on : 02-Apr-2024, 7:31:58 pm
    Author     : lenovo
--%>
<%@page import="java.sql.*"%>
<%@page import = "java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Portal</title>
        <style>
            h1{
                text-align: center;
                margin-top: 50px;
            }
            .box1{
                width: 300px; /* Adjust the width as needed */
                height: 100px; /* Adjust the height as needed */
                background-color: #f2f2f2; /* Background color of the box */
                border-radius: 10px; /* Rounded corners */
                margin-left: 20px; 
                padding: 20px;
                margin-bottom: 40px;
            }
            .container {
             display: flex;
             justify-content: space-evenly;
             /* This will align the child divs side by side */
             }
                     
             .button:hover {
              background-color: #ebc0b8; /* pink background on hover */
              }
              .button {
                width: 300px;
                height: 300px;
                background-color:#f2f2f2;
                border-radius: 10px;
                text-align: center; /* Centered text */
                align-content: center;
                border: none; /* Removes the border */
                font-size: 40px;
                /* Increases the font size */
               }
               
            
        </style>
    </head>
    <body style="background-color:#c7d0d7">
        <%
    // Retrieve the username from the session
    String userid = (String) session.getAttribute("userid");
    String userName = null;
    
    // Database connection details
    String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
    String dbUser = "root";
    String dbPass = "Haritha@19";
    
    String sql = "SELECT fname FROM studData123 WHERE uname = ?";
    
    try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        
        pstmt.setString(1, userid);
        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                userName = rs.getString("fname");
            }
        }
    } catch (SQLException e) {
        // Handle SQL exceptions
    }
    
    %>
    
    <h1>E Tantra - Student</h1>
    <div class ="box1">
        <h3>Hello <%= userName %></h3>
        <p>You have no exams scheduled...</p>
    </div>
       
        <div class="container">
            <form action="stuexam.jsp" method="get">
            <button class="button">Exams</button> <!-- First button -->
            </form>
            <form action="stuexam.jsp" method="get">
            <button class="button">Results</button> <!-- Second button -->
            </form>
            <form action="stuexam.jsp" method="get">
            <button class="button">Calculator</button> <!-- Third button -->
            </form>
         </div>
        
    </body>
</html>
