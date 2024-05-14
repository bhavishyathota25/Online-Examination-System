<%-- 
    Document   : stuexam
    Created on : 02-Apr-2024, 11:38:41 pm
    Author     : lenovo
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Exam</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            background: #ffffff;
            align-content: center;
        }
        .box{
            width: 100%;
            border-radius: 20px;
            background-color: #ffffff;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body style="background: #f7fbfd">
    <div class="container">
        <h1 style="margin-left:20px;margin-top: 20px">E Tantra</h1>
        <h2 style="margin-right:20px;margin-top: 20px">Online Exam</h2>
    </div>
    
    <div class="box">
        <h3 style = "padding-left: 20px; padding-top: 20px"> Available Exams</h3>
        <table>
            <tr>
                <th>S.No</th>
                <th>Exam Name</th>
                <th>Course Code</th>
                <th>Exam ID</th>
            </tr>
            
            <% 
                // Database connection details
                String url = "jdbc:mysql://localhost:3306/mysql";
                String user = "root";
                String password = "Haritha@19";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                int serialNumber = 0; // Initialize serial number counter
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.createStatement();
                    // Updated SQL query
                    String sql = "SELECT exname, ccode, exid FROM exam123 ORDER BY exname ASC";
                    rs = stmt.executeQuery(sql);

                    while(rs.next()) {
                        serialNumber++; // Increment serial number
                        String examName = rs.getString("exname");
                        String courseCode = rs.getString("ccode");
                        String examId = rs.getString("exid");
            %>
            <tr>
                <td><%= serialNumber %></td>
                <td><a href="examDetails.jsp?exid=<%= examId %>"><%= examName %></a></td>
                <td><%= courseCode %></td>
                <td><%= examId %></td>
            </tr>
            <% 
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) try { rs.close(); } catch(Exception e) {}
                    if(stmt != null) try { stmt.close(); } catch(Exception e) {}
                    if(con != null) try { con.close(); } catch(Exception e) {}
                }
            %>
        </table>
    </div>
</body>
</html>
stuExam.jsp