<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/signup.css">
        <script src="js/script.js"></script>
        
        <style>
            .eye-icon {
                cursor: pointer;
                position: absolute;
                right: 10px;
                top: 35px;
                transform: translateY(-50%);
            }

            .input-container {
                position: relative;
                margin-bottom: 15px;
            }
        </style>
        <script>
            function togglePasswordVisibility(id) {
                var passwordField = document.getElementById(id);
                var eyeIcon = document.getElementById(id + '-eye-icon');
                if (passwordField.type === "password") {
                    passwordField.type = "text";
                    eyeIcon.textContent = "🙈"; // You can use a different icon if you prefer
                } else {
                    passwordField.type = "password";
                    eyeIcon.textContent = "👁"; // You can use a different icon if you prefer
                }
            }
        </script>
    </head>
    <body>
        <div class="signup-container">
            <h2>Create an account</h2>
            <form action="createAccount" method="post">
                <div class="input-container">
                    <input type="text" id="user_id" name="user_id" placeholder="User ID" required>
                </div>
                <div class="input-container">
                    <input type="text" id="username" name="username" placeholder="Username" required>
                </div>
                <div class="input-container">
                    <select name="role_id" required>
                        <option value="1">Admin</option>
                        <option value="2">Lab manage</option>
                        <option value="3">HR</option>
                        <option value="4">Mentor</option>
                    </select>
                </div>
                
                <div class="input-container">
                    <input type="text" id="full_name" name="full_name" placeholder="Full Name" required>
                </div>
                
                <div class="input-container">
                    <input type="date" id="dob" name="dob" placeholder="Date of Birth">
                
                <div class="input-container gender">
                    <input type="radio" id="male" name="gender" value="Male" ${param.gender == 'Male' ? 'checked' : ''} required>
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female" ${param.gender == 'Female' ? 'checked' : ''} required>
                    <label for="female">Female</label>
                </div>
                    
                <div class="input-container">
                    <input type="text" id="phone_number" name="phone_number" placeholder="Phone Number" required>
                </div>
                    
                <div class="input-container">
                    <label for="avatar">Avatar</label>
                    <input type="file" id="avatar" name="avatar" required>
                </div>
                    
                <div class="input-container">
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <span id="password-eye-icon" class="eye-icon" onclick="togglePasswordVisibility('password')">👁</span>
                </div>
                    
                <div class="input-container">
                    <input type="password" id="repeatPassword" name="repeatPassword" placeholder="Repeat Password" required>
                    <span id="repeatPassword-eye-icon" class="eye-icon" onclick="togglePasswordVisibility('repeatPassword')">👁</span>
                </div>
                    
                <input type="submit" value="Create account">
                <p>${messErrorUsername}</p>
                <c:if test="${not empty successMessage}">
                    <p class="success">${successMessage}</p>
                </c:if>
                <p>${messErrorPass}</p>
                <p>${messErrorUsername}</p>
                <p>${messErrorFullName}</p>
                <p>${messErrorDob}</p>
                <p>${messErrorAvatar}</p>
                <div class="links">
                    <a href="home.jsp">Back to Home</a>
                </div>
            </form>
        </div>
    </body>
</html>
