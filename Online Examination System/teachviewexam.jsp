<%-- 
    Document   : storeData.jsp
    Created on : 03-Apr-2024, 9:27:02 pm
    Author     : lenovo
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Exams created</title>
</head>
<body>
<%
    Connection con = null;
    PreparedStatement pstmtExam = null;
    PreparedStatement pstmtQuestion = null;

    try {
        // Retrieve parameters
        String examName = request.getParameter("exname");
        String courseCode = request.getParameter("ccode");
        String examId = request.getParameter("exid");
        String uid = request.getParameter("uid");

        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "Haritha@19");

        // Insert into exam123 table
        String sqlExam = "INSERT INTO exam123 (exname, ccode, exid, uid) VALUES (?, ?, ?, ?)";
        pstmtExam = con.prepareStatement(sqlExam);
        pstmtExam.setString(1, examName);
        pstmtExam.setString(2, courseCode);
        pstmtExam.setString(3, examId);
        pstmtExam.setString(4, uid);
        pstmtExam.executeUpdate();

        // Retrieve the number of MCQ questions from the form
        // This should be the count of MCQ questions added dynamically
        int questionCounter = Integer.parseInt(request.getParameter("questionCounter"));

        // Check if questionCounter is greater than 0
        if (questionCounter > 0) {
            // Insert into ques123 table
            String sqlQuestion = "INSERT INTO ques123 (exid, quest, op1, op2, op3, op4) VALUES (?, ?, ?, ?, ?, ?)";
            pstmtQuestion = con.prepareStatement(sqlQuestion);

            for (int i = 1; i <= questionCounter; i++) {
                pstmtQuestion.setString(1, examId);
                pstmtQuestion.setString(2, request.getParameter("mcq_question_" + i));
                pstmtQuestion.setString(3, request.getParameter("mcq_option_" + i + "_A"));
                pstmtQuestion.setString(4, request.getParameter("mcq_option_" + i + "_B"));
                pstmtQuestion.setString(5, request.getParameter("mcq_option_" + i + "_C"));
                pstmtQuestion.setString(6, request.getParameter("mcq_option_" + i + "_D"));
                pstmtQuestion.addBatch(); // Add to batch
            }
            pstmtQuestion.executeBatch(); // Execute batch
        }

        // Output success message
%>
<h1>Exams created by you</h1>
<%
    } catch (ClassNotFoundException | SQLException e) {
        // Print stack trace for debugging
        e.printStackTrace();
        // Output error message
        out.println("Error: " + e.getMessage());
    } finally {
        // Close prepared statements and connection
        try {
            if (pstmtExam != null) pstmtExam.close();
            if (pstmtQuestion != null) pstmtQuestion.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            // Print stack trace for debugging
            e.printStackTrace();
            // Output error message
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>
</body>
</html> teachviewexam.jsp