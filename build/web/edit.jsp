<%-- 
    Document   : edit
    Created on : May 21, 2024, 12:41:43 AM
    Author     : Desktop
--%>

<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <% UserDAO udao = new UserDAO();
            User u = udao.get(1).get();
            request.setAttribute("u", u);

            String errorMessage = (String) request.getAttribute("errorMessage");
            String randomParam = String.valueOf(Math.random());
        %>
    </head>
    <body>
        <img src="${u.image}" srcset="">
    </body>
</html>
