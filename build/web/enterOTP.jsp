<%-- 
    Document   : enterOTP
    Created on : Jun 14, 2024, 1:39:19 AM
    Author     : ADMIN
--%>

<%-- 
    Document   : verifyOtp
    Created on : Jun 12, 2024, 3:04:39 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify OTP</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }
            .verify-otp-container {
                width: 500px;
                padding: 20px;
                background-color: white;
                margin: 0 auto;
                margin-top: 200px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
                border-radius: 20px;
            }
            .verify-otp-container h1 {
                text-align: center;
                margin-bottom: 20px;
                font-weight: 500;
            }
            .verify-otp-container input[type="text"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                box-sizing: border-box;
                border-radius: 20px;
            }
            .verify-otp-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #202942;
                color: white;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }
            .verify-otp-container input[type="submit"]:hover {
                background-color: rgb(80,80,200);
            }
            .verify-otp-container .links {
                text-align: center;
                margin-top: 20px;
            }
            .verify-otp-container .links a {
                color: #202942;
                text-decoration: none;
            }
            .verify-otp-container .links a:hover {
                color: rgb(80,80,130);
            }

        </style>
    </head>
    <body>
        <div class="verify-otp-container">
            <form action="validateOtp" method="post">
                <h1>Enter OTP</h1>
                <p>${mess}</p>  
                <input type="text" name="otp" placeholder="Enter OTP" required style="background-color: white" >
                <input type="submit" value="Enter">
            </form>
            <div class="links">
                <a href="login">Back to Login</a>
            </div>
        </div>
    </body>
</html>

