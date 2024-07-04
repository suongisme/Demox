<%-- 
    Document   : changePass
    Created on : May 21, 2024, 6:04:21 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/HOMECSS/changePass.css"/>
        <link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>


        <style>
            .nav-borders {
                background-color: white;
                border-bottom: 1px solid #dee2e6;
                padding: 10px;
            }
            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;

            }
            footer a
            {


                text-decoration: none;
                color: white;

            }
            
        </style>
        <%@include file="../INCLUDES/head.jsp" %> 
    </head>
    <body>
        <div class="container">
            <nav class="nav nav-borders">
                <a class="nav-link " href="http://localhost:8080/SWPClubManegement/EditProfileServlet" target="__blank">Profile</a>
                <a class="nav-link active ms-0" href="http://localhost:8080/SWPClubManegement/ChangePasswordServlet" target="__blank">Change Password</a>
               
            </nav>
        </div>
        <div class="mainDiv">

            <div class="cardStyle">
                <form action="http://localhost:8080/SWPClubManegement/ChangePasswordServlet?uid=${user.userId}" method="post" name="signupForm" id="signupForm">

                    <img src="" id="signupLogo"/>

                    <h2 class="formTitle">
                        Change your password
                    </h2>

                    <div class="inputDiv">
                        <label class="inputLabel" for="password">New Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                    </div>

                    <div class="buttonWrapper">
                        <button type="submit" id="submitButton" onclick="validateSignupForm()" class="submitButton pure-button pure-button-primary">
                            <span>Continue</span>

                        </button>
                        <p>${notFit}</p>
                    </div>

                </form>
            </div>

        </div>
        <%@include file="../INCLUDES/footer.jsp" %>

    </body>
</html>
