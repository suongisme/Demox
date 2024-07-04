<%-- 
    Document   : NewPass
    Created on : May 23, 2024, 8:12:18 PM
    Author     : Zanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/signUp.css"/>
    </head>
    <body>
        <h1>Reset Your Password</h1>
        <form action="http://localhost:8080/SWPClubManegement/VerifyPass" method="POST">
            <label for="name">OTP:</label>
            <input type="text" id="otp" name="otp" required>
            ${error}
            <% session.removeAttribute("error"); %>
            
            <label for="password">New Password:</label>
            <input type="password" id="password" name="pass" required>
            
            <label for="password">Conform Password:</label>
            <input type="password" id="Cpass" name="Cpass" required>
            ${error2}
            <% session.removeAttribute("error2"); %>

            <button type="submit" value="Submit">Submit</button>
        </form>
    </body>
</html>
