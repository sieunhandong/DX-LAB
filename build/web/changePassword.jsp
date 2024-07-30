<%-- 
    Document   : changePassword
    Created on : Jun 19, 2024, 10:18:07 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <style>
            .changein4 {
                width: 60%;
                margin:0 auto;
                margin-top: 50px;
                background-color: #ffffff;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                border-radius: 10px;
            }

            .changein4 h1 {
                text-align: center;
            }

            .changein4 input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .changein4 button {
                width: 100%;
                padding: 10px 20px;
                background-color: #202942;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
            }

            .changein4 button:hover {
                background-color: #1b1e34;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="changein4">
            <form action="changePassword" method="post">
                <h1>Change Password</h1>
                <hr>
                <label for="accPass"><Strong>Old Password</Strong></label>
                <input type="password" placeholder="Enter Old Password" name="accPass" required>
                <label for="accNewPass"><Strong>New Password</Strong></label>
                <input type="password" placeholder="Enter New Password" name="accNewPass" required>
                <label for="accReNewPass"><Strong>Re-New Password</Strong></label>
                <input type="password" placeholder="Enter Re-New Password" name="accReNewPass" required>
                <hr>
                <strong>${requestScope.mess2}</strong>
                <button type="submit" class="registerbtn">Done</button>
            </form>
        </div>
    </body>
</html>
