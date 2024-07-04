<%-- 
    Document   : verify
    Created on : May 21, 2024, 9:01:06 AM
    Author     : Zanis
--%>

<%@page import="Model.User"%>
<%@page import="Model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/signUp.css"/>
        <%
            User u = (User) request.getSession().getAttribute("user");
            %>
    </head>
    <body>
        <h1>Hello <%= u.getUserName() %></h1>
        

        <form action="/SWPClubManegement/VerifyEmail" method="POST">

            
            <label for="name">OTP: </label>
            <input type="text" id="name" name="name" required>
            ${error}
            <%session.removeAttribute("username");%>
            

            <button type="submit" value="Submit">Submit</button>
        </form>
    </body>
</html>
