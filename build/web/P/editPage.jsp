<%-- 
    Document   : editPage
    Created on : May 19, 2024, 9:36:50 PM
    Author     : Desktop
--%>

<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../INCLUDES/head.jsp" %> 
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>

    </head>
    <style>
        body{
            margin-top:20px;
            background-color:#f2f6fc;
            color:#69707a;
        }
        .img-account-profile {
            width: 200px;
            height: 200px;
            object-fit: cover;
        }
        .rounded-circle {
            border-radius: 50% !important;
        }
        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
        }
        .card .card-header {
            font-weight: 500;
        }
        .card-header:first-child {
            border-radius: 0.35rem 0.35rem 0 0;
        }
        .card-header {
            padding: 1rem 1.35rem;
            margin-bottom: 0;
            background-color: rgba(33, 40, 50, 0.03);
            border-bottom: 1px solid rgba(33, 40, 50, 0.125);
        }
        .form-control, .dataTable-input {
            display: block;
            width: 100%;
            padding: 0.875rem 1.125rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1;
            color: #69707a;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #c5ccd6;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.35rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
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
        .loading-spinner {


            width: 50px;
            height: 50px;
            border: 8px solid rgba(0, 0, 0, 0.1);
            border-top: 8px solid #000;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto; /* Center the spinner */
        }
        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }

        }
        .con
        {
            margin-top: 3rem;
        }
        footer a
            {
                text-decoration: none;
                color: white;

            }
    </style>
    <body>
        <%

            String errorMessage = (String) request.getSession().getAttribute("errorMessage");

        %>
        <%@include file="../INCLUDES/nav.jsp" %>

        <div class="container-xl px-4  con">
            <!-- Account page navigation-->
            <nav class="nav nav-borders">
                <a class="nav-link active ms-0" href="http://localhost:8080/SWPClubManegement/EditProfileServlet" target="__blank">Profile</a>
                <a class="nav-link" href="http://localhost:8080/SWPClubManegement/ChangePasswordServlet" target="__blank">Change Password</a>
                
            </nav>
            <hr class="mt-0 mb-4">

            <form action="../EditProfileServlet" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-xl-4">
                        <!-- Profile picture card-->
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <!-- Profile picture image-->
                                <c:choose>
                                    <c:when test="${user.image != null}">
                                        <div class="loading-spinner mb-2" id="loadingSpinner">

                                        </div>
                                        <img id="image" class="img-account-profile rounded-circle mb-2" src="${user.image}" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-account-profile rounded-circle mb-2" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="alt"/>
                                    </c:otherwise>
                                </c:choose>

                                <!-- Profile picture help block-->

                                <!-- Profile picture upload button-->
                                <div class="mb-3">

                                    <label for="imageUpload" class="btn btn-primary">Upload new image</label>
                                    <input type="file" name="avatar" class="form-control" id="imageUpload" style="display: none;" onchange="displayFileName()">
                                    <p id="file-selected" class="mt-2"></p> <!-- This will display the selected file name -->
                                    <p id="file-selected" class="mt-2"></p> <!-- This will display the selected file name -->
                                    <c:if test="<%= errorMessage != null%>">
                                        <p class="text-danger mt-2">
                                            <%= errorMessage%>
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <!-- Account details card-->
                        <div class="card mb-4">
                            <div class="card-header">Account Details</div>
                            <div class="card-body">

                                <!-- Form Group (username)-->
                                <input type="hidden" name="uid" value="${user.userId}"/>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                                    <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" name="username" value="${user.userName}">
                                </div>
                                <!-- Form Group (name)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputFirstName">Name</label>
                                    <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your Full name" name="fullname" value="${user.name}">
                                </div>
                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" id="inputEmailAddress" readonly="" type="email" name="email" placeholder="Enter your email address" value="${user.email}">
                                </div>
                                <!-- Form Group (birthday)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputBirthday">Birthday</label>
                                    <input class="form-control" id="inputBirthday" type="date" name="birthday" required="" placeholder="Enter your birthday" value="${user.dateOfBirth}">
                                </div>
                                <!-- Form Group (about)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputAbout">About</label>
                                    <textarea class="form-control" id="inputAbout" name="about" placeholder="Enter something about you">${user.about}</textarea>
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Save changes</button>

                            </div>
                        </div>
                    </div>
                </div>
            </form>

            

        </div>
                                <%@include file="../INCLUDES/footer.jsp" %>
        <script>
            function displayFileName() {
                var input = document.getElementById('imageUpload');
                var fileName = input.files[0].name;
                document.getElementById('file-selected').innerHTML = 'Selected file: ' + fileName;
            }

            var count = 0;
            var isFirstLoad = true;
            var isImageUpdated = false;
            var countSuccess = 0;
            function reloadImage() {
                if (count >= 100) {
                    return;
                }
                var timestamp = new Date().getTime();
                ;
                var avatarImage = document.getElementById("image");
                var avatarBar = document.getElementById("image-bar");



                if (isImageUpdated == false)
                {
                    avatarBar.src = "${user.image}?timestamp=" + timestamp;

                    avatarImage.src = "${user.image}?timestamp=" + timestamp;

                    isFirstLoad = true;
                    image.style.display = "none";
                } else
                {
                    isFirstLoad = false;
                }





                avatarImage.onload = function () {

                    loadingSpinner.style.display = "none";
                    // Đánh dấu rằng ảnh đã được load ít nhất một lần
                    isImageUpdated = true;
                    image.style.display = "inline";


                };
                count++;
                setTimeout(reloadImage, 500);
            }

            reloadImage();



        </script>
    </body>
</html>
