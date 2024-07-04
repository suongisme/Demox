<%-- 
    Document   : listJersey
    Created on : Jul 1, 2024, 9:47:12 AM
    Author     : Zanis
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
    </head>
    <body>
        <table class="table-course" border="1">
            <thead class="thead-form" style="background-color: #0d6efd;">
                <tr>
                    <th>
                        JerseyName
                    </th>
                    <th>
                        JerseyDescription
                    </th>
                    <th>
                        JerseyPrice
                    </th>
                    <th>
                        JerseyImage
                    </th>
                    <th>
                        JerseySize
                    </th>
                    <th>
                        JerseyQuantity
                    </th>
                    <th>
                        Action
                    </th>
                </tr>

            </thead>
            <tbody>
                <c:forEach var="jersey" items="${jerseys}">
                    <c:forEach var="size" items="${jerseySizes}">
                        <tr>
                            <c:if test="${jersey.getJerseyID()==size.getJerseyID()}">
                                <c:url var="deleteLink" value="../JerseyServlet">
                                    <c:param name="command" value="DELETE"></c:param>
                                    <c:param name="cid" value="${size.getSizeID()}"></c:param>
                                </c:url>
                                <td>${jersey.getJerseyName()}</td>
                                <td>${jersey.getJerseyDescription()}</td>
                                <td>${jersey.getJerseyPrice()}</td>
                                <td>${jersey.getJerseyImage()}</td>
                                <td>${size.getJerseySize()}</td>
                                <td>${size.getJerseyQuantity()}</td>
                                <td>
                                    <a class="update-course-button" href="listJersey.jsp?jid=${size.getSizeID()}" onclick="event.handleLinkClick(event);">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <c:if test="${not empty jerseys}">
                                        <a href="${deleteLink}" onclick="if (!(confirm('Sure?')))
                                                    return false">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </c:if>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
            <tr>
                <td>
                    <i id="add-course-button"  class=" fas fa-plus"></i>
                </td>
            </tr>

        </table>
        <%@include file="addJersey.jsp" %>
        <%@include file="updateJersey.jsp" %>



        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                // Ẩn left-bar mặc định khi trang được tải
                                                $("#leftBar").hide();
                                                //       
                                                if (localStorage.getItem('updateCourseFormVisible') === 'true') {
                                                    $("#update-course-form").show();
                                                } else {
                                                    $("#update-course-form").hide();
                                                }

                                                // Function to toggle update course form visibility
                                                function toggleUpdateCourseForm() {
                                                    $("#update-course-form").toggle();
                                                    localStorage.setItem('updateCourseFormVisible', $("#update-course-form").is(":visible"));
                                                }


                                                // Xử lý sự kiện click trên nút cập nhật khóa học

                                                // Function to toggle left bar visibility
                                                function toggleLeftBar() {
                                                    $("#leftBar").toggle();
                                                }
                                                //
                                                // Function to toggle login form visibility
                                                function toggleLoginForm() {
                                                    $("#logInForm").toggle();
                                                }
                                                //
                                                //        // Function to toggle add course form visibility
                                                function toggleAddCourseForm() {
                                                    $("#add-course-form").toggle();
                                                }
                                                //
                                                //
                                                //        // Xử lý sự kiện click trên nút tắt/bật left-bar
                                                $("#toggleLeftBarBtn").click(function () {
                                                    toggleLeftBar();
                                                });
                                                //
                                                //        // Xử lý sự kiện click trên nút tắt/bật login form
                                                $(".toggleCloseLoginForm").click(function () {
                                                    toggleLoginForm();
                                                });
                                                //
                                                //        // Xử lý sự kiện click trên nút thêm khóa học
                                                $("#add-course-button").click(function () {
                                                    toggleAddCourseForm();
                                                });
                                                $("#add-course-close").click(function () {
                                                    toggleAddCourseForm();
                                                });
                                                //
                                                $(".update-course-button").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                $("#update-course-close").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                $("#done-course-update").click(function () {
                                                    toggleUpdateCourseForm();
                                                });
                                                //
                                            });
        </script>

    </body>
</html>
