<%-- 
    Document   : examDetails.jsp
    Created on : 05-Apr-2024, 3:03:10 pm
    Author     : lenovo
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Exam Details</title>
    <style>
        .options-container {
    display: inline-grid;
    
    }

.option-box {
    width: 100%; /* Take full width of the container */
    background: #ffffff;
    border-radius: 10px;
    padding: 10px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    display: flex;
    align-items: center;
    margin-bottom: 10px; /* Add space between options */
}

.option-input {
    margin-right: 10px;
}

.box2 {
            width: 700px;
            margin-top: 20px;
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            margin-left: 25%;
        }


    </style>
</head>
<body style="background: #f7fbfd">
    <h1>Exam Questions</h1>
    <%
        String exid = request.getParameter("exid");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int questionNumber = 0; // Initialize question number counter
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "Haritha@19");
            String sql = "SELECT quest, op1, op2, op3, op4 FROM ques123 WHERE exid = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, exid);
            rs = pstmt.executeQuery();

            while(rs.next()) {
            questionNumber++; // Increment question number
                String question = rs.getString("quest");
                String option1 = rs.getString("op1");
                String option2 = rs.getString("op2");
                String option3 = rs.getString("op3");
                String option4 = rs.getString("op4");
    %>
   <div class="box2">
    <div class="question-container">
        <div class="question"><%= question %></div>
        <div class="options-container">
            <label class="option-box">
                <input type="radio" name="question<%= questionNumber %>" value="op1" class="option-input">
                A) <%= option1 %>
            </label>
            <label class="option-box">
                <input type="radio" name="question<%= questionNumber %>" value="op2" class="option-input">
                B) <%= option2 %>
            </label>
            <label class="option-box">
                <input type="radio" name="question<%= questionNumber %>" value="op3" class="option-input">
                C) <%= option3 %>
            </label>
            <label class="option-box">
                <input type="radio" name="question<%= questionNumber %>" value="op4" class="option-input">
                D) <%= option4 %>
            </label>
        </div>
    </div>
   </div>
            
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if(con != null) try { con.close(); } catch(Exception e) {}
        }
    %>
    
    <div>
               <form action="student.jsp" method="get" onsubmit="return submitForm()">
    <button type="submit">Submit</button>
</form>

<script>
    function submitForm() {
        alert('Test is submitted.');
        // The form will be submitted and the page will navigate to student.jsp after the alert is closed
        return true;
    }
</script>
            </div>
</body>
</html>

examdetails.jsp