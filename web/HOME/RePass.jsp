<%-- 
    Document   : RePass
    Created on : May 23, 2024, 4:47:01 PM
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
        <h1>Enter email to reset password</h1>
        <form action="http://localhost:8080/SWPClubManegement/ResetPass" method="POST">
            
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            ${error}
            <% session.removeAttribute("error"); %>
            

            <button type="submit" value="Submit">Submit</button>
        </form>
    </body>
</html>
