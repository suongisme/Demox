<%-- 
    Document   : signUp
    Created on : May 19, 2024, 6:31:59 PM
    Author     : Zanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/signUp.css"/>
    </head>
    <body>
        <h1>Sign Up</h1>

        <form action="/SWPClubManegement/SendEmail" method="POST">

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            ${error}
            <% session.removeAttribute("error"); %>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit" value="Submit">Submit</button>
        </form>
    </body>
</html>
