<%-- 
    Document   : createAccountCandidate
    Created on : Jun 7, 2024, 2:05:08 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <div class="signup-container">
            <h2>Create an account for candidate</h2>
            <form action="createAccountCandidate" method="post">
                <input type="text" id="user_id" name="user_id" placeholder="User ID" required>

                <input type="text" id="username" name="username" placeholder="Username" required>

                <select name="role_id" required>
                    <option value="6">Candidate</option>
                </select>

                <input type="submit" value="Create account">

                
          <!-- Hiển thị thông báo lỗi -->
                <c:if test="${not empty messErrorUsername}">
                    <p class="error">${messErrorUsername}</p>
                </c:if>

                <!-- Hiển thị thông báo thành công -->
                <c:if test="${not empty successMessage}">
                    <p class="success">${successMessage}</p>
                </c:if>

                <!-- Hiển thị thông báo lỗi chung -->
                <c:if test="${not empty errorMessage}">
                    <p class="error">${errorMessage}</p>
                </c:if>
                <div class="links">
                    <a href="home.jsp">Back to Home</a>
                </div>
            </form>

        </div>

    </body>
</html>
