<%-- 
    Document   : viewProfile
    Created on : May 26, 2024, 5:40:15 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>

        <style>
            .container {
                display: flex;
                justify-content: space-around;
                align-items: center;
                background-color: #ffffff;
                padding: 20px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                border-radius: 10px;
                margin: 100px auto;
                width: 80%;
            }

            .avatar-section {
                width: 30%;
                text-align: center;
            }

            .avatar-section img {
                width: 50%;
                border-radius: 20px;
            }

            .info-section {
                width: 60%;
            }

            .info-section h2 {
                margin-bottom: 20px;
            }

            .info-item {
                margin-bottom: 20px;
                padding: 10px;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
            }

            button {
                width: 50%;
                padding: 10px 20px;
                background-color: #202942;
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
                margin-top: 10px;
            }

            button:hover {
                background-color: #1b1e34;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="container">
            <div class="info-section">
                <h2>User Information</h2>
                <div class="info-list">
                    <div class="info-item">
                        <span><strong>User_ID:</strong> ${account.user_id}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Username/Email:</strong> ${account.username}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Full Name:</strong> ${account.full_name}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Date of Birth:</strong> ${account.dob}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Gender:</strong> ${account.gender}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Phone Number:</strong> ${account.phone_number}</span>
                    </div>
                    <div class="info-item">
                        <span><strong>Specialization:</strong> ${account.specialization}</span>
                    </div>
                </div>
            </div>
            <div class="avatar-section">
                <img src="img/${account.avatar}" alt="Avatar">
                <p><strong>Avatar</strong></p>
            </div>
        </div>

    </body>
</html>
