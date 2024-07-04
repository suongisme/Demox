<%-- 
    Document   : profilePage
    Created on : May 19, 2024, 9:15:24 PM
    Author     : Desktop
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>/* Định dạng các div chứa thông tin */
            div {
                margin-bottom: 20px; /* Khoảng cách giữa các div */
            }

            /* Định dạng ảnh đại diện */
            div img {
                width: 150px; /* Kích thước ảnh */
                height: 150px; /* Kích thước ảnh */
                border-radius: 50%; /* Bo tròn góc ảnh để tạo hình ảnh đại diện tròn */
                margin-bottom: 10px; /* Khoảng cách giữa ảnh và văn bản */
            }

            /* Định dạng tên người dùng và email */
            div p {
                /* Khoảng cách giữa các dòng */
            }

            /* Định dạng các nút chỉnh sửa */
            button {
                background-color: #007bff; /* Màu nền */
                color: white; /* Màu chữ */
                border: none; /* Không viền */
                padding: 8px 16px; /* Kích thước padding */
                border-radius: 5px; /* Bo tròn góc */
                cursor: pointer; /* Con trỏ chuột khi rê vào */
                margin-right: 10px; /* Khoảng cách giữa các nút */
            }

            button:hover {
                background-color: #0056b3; /* Màu nền khi rê vào */
            }

            /* Định dạng phần chứa thông tin chỉnh sửa */

            p{
                width: 100px;
            }
            form input[type="submit"] {
                background-color: #007bff; /* Màu nền nút OK */
            }

            form input[type="submit"]:hover {
                background-color: #218838; /* Màu nền nút OK khi rê vào */
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            .profile-info {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                text-align: center;
                margin-top: 20px;
            }
            #avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 20px;
            }


            form{
                display: flex;
                align-items: center;
            }
        </style>
        <%@include file="../INCLUDES/head.jsp" %> 
    </head>
    <body>
        <%

            String errorMessage = (String) request.getAttribute("errorMessage");

        %>



        <div class="container">
            <h1>User Profile</h1>
            <!-- Thông tin người dùng -->
            <div class="row">
                <div class="col-md-3 ">
                    <div class="card d-flex justify-content-center">
                        <!-- Avatar -->
                        <img id="avatar" src="${user.image}" alt="" class="card-img-top"/>
                        <div class="card-body">
                            <form action="SWPWedRealClubManagement/EditProfileServlet" enctype="multipart/form-data" method="POST">
                                <input type="hidden" name="command" value="EDITIMAGE" />
                                <input type="hidden" name="uid" value="${user.userId}" />
                                <input type="file" name="file2" />
                                <input type="submit" value="Upload" class="btn btn-primary mt-2"/>
                                <c:if test="<%= errorMessage != null%>">
                                    <p class="text-danger">
                                        <%= errorMessage%>
                                    </p>
                                </c:if>
                            </form>
                            <p id="successMessage" class="mt-2"></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <!-- Thông tin người dùng -->
                    <div class="user-info">
                        <strong>Name:</strong>
                        <c:choose>
                            <c:when test="${c == 'editname'}">
                                <form action="./SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                    <input type="hidden" name="command" value="EDITNAME" />
                                    <input type="hidden" name="uid" value="${user.userId}" />
                                    <input type="hidden" name="c" value="0" />
                                    <input type="text" name="name" value="${user.name}" class="form-control"/>
                                    <input type="submit" value="OK" class="btn btn-primary mt-2"/>
                                </form>
                            </c:when>
                            <c:when test="${c != 'editname'}">
                                <c:if test="${user.name == null}">
                                    <%-- Gán giá trị mới cho thuộc tính name của đối tượng u --%>
                                    ${user.setName("Chua co")} 
                                </c:if>
                                <p>${user.name}</p>
                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editname"/>'" class="btn btn-secondary mt-2">Edit</button>
                            </c:when>
                        </c:choose>
                    </div>

                    <!-- Email -->
                    <div class="user-info">
                        <strong>User Name:</strong> 
                        <c:choose>
                            <c:when test="${c == 'editusername'}">
                                <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                    <input type="hidden" name="command" value="EDITUSERNAME" />
                                    <input type="hidden" name="uid" value="${user.userId}" />
                                    <input type="hidden" name="c" value="0" />
                                    <input type="text" name="username" value="${user.userName}" class="form-control"/>
                                    <input id="" type="submit" value="OK" class="btn btn-primary mt-2"/>
                                </form>
                            </c:when>
                            <c:when test="${c != 'editusername'}">
                                <p>${user.userName}</p>
                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editusername"/>'" class="btn btn-secondary mt-2">Edit</button>
                            </c:when>
                        </c:choose>
                    </div>

                    <!-- Ngày sinh -->
                    <div class="user-info">
                        <strong>Date of Birth:</strong> 
                        <c:choose>
                            <c:when test="${c == 'editdate'}">
                                <form action="http://localhost:8080/SWPWedRealClubManagement/EditProfileServlet" method="GET">
                                    <input type="hidden" name="command" value="EDITDATE" />
                                    <input type="hidden" name="uid" value="${user.userId}" />
                                    <input type="hidden" name="c" value="0" />
                                    <input type="date" name="date" value="${user.dateOfBirth}" class="form-control"/>
                                    <input type="submit" value="OK" class="btn btn-primary mt-2"/>
                                </form>
                            </c:when>
                            <c:when test="${c != 'editdate'}">
                                <c:if test="${user.dateOfBirth == null}">

                                    <p>...</p>
                                </c:if>
                                <p>${user.dateOfBirth}</p>

                                <button onclick="window.location.href = '<c:url value="/EditProfileServlet?c=editdate"/>'" class="btn btn-secondary mt-2">Edit</button>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
                <a href="http://localhost:8080/SWPWedRealClubManagement/HomeServlet"> go gome</a>
            </div>

        </div>
        <script>
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
                var avatarImage = document.getElementById("avatar");




                if (isImageUpdated == false)
                {
                    
                    avatarImage.src = "${u.image}?timestamp=" + timestamp;

                    avatarImage.src = "${user.image}?timestamp=" + timestamp;

                    isFirstLoad = true;
                } else
                {
                    isFirstLoad = false;
                }





                //            avatarImage.onload = function () {
                //                if (isFirstLoad $$ count > 1) { // Nếu không phải là lần đầu tiên ảnh được load thành công
                //                    successMessage.innerText = "Cập nhật thành công";
                //                }
                //                // Đánh dấu rằng ảnh đã được load ít nhất một lần
                //                isImageUpdated = true;
                //
                //            };
                count++;
                setTimeout(reloadImage, 500);
            }
            function checkAllImagesLoaded() {


                document.getElementById("successMessage").setAttribute();

            }
            reloadImage();

        </script>

    </body>
</html>
