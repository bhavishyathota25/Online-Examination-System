<%-- 
    Document   : Teacher
    Created on : 02-Apr-2024, 1:51:12 am
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher login</title>
         
         <style>
            h1{
                text-align: center;
                margin-top: 50px;
            }
            .loginBox{
                width: 400px;
                padding: 20px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #C6C09C;
                border: 1px solid #d3d3d3;
            }
            input[type=text], input[type=password], input[type=submit] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
             display: inline-block;
             border: 1px solid #ccc;
              box-sizing: border-box;
               background: #f1f1f1;
            }
            .button {
             background-color: #E79796; /* Green background */
             border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            }
            .button:hover {
            background-color: #3c1361;
             }   
             
             .container {
          padding: 16px;
          background-color: white;
          }
          
          
        </style>
    </head>
    <body style="background-color:#bca0dc">
       <h1>E Tantra</h1>
        <div class = "loginBox">
            <h2 style="text-align: center">Teacher Login</h2>
            
            <form action="teachCred.jsp" method="get">
                 
           <div class="container">
           <label for="uname"><b>UID</b></label>
           <input type="text" placeholder="Enter UID" name="uname" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

           <button type="submit">Login</button>
           </div>
           </form>
            
             
            
        </div>
    </body>
</html>
teacher.jsp