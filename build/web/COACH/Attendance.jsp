<%-- 
    Document   : Training
    Created on : Jun 1, 2024, 7:41:32 AM
    Author     : Zanis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
    </head>
    <body>
        <div>
            <%@include file="../COACH/CoachFun.jsp" %>
        </div>  
        <div class="coach-fun-content">
            <table class="table-course" border="1">
                <thead class="thead-form" style="background-color: #0d6efd;">
                    <tr>
                        <th>
                            TrainingID
                        </th>
                        <th>
                            TrainingDate
                        </th>
                        <th>
                            TrainingTime
                        </th>
                        <th>
                            Location
                        </th>
                        <th>
                            Description
                        </th>
                        <th>
                            Action
                        </th>
                    </tr>

                </thead>
                <tbody>
                    <c:forEach var="c" items="${sessionlist}">
                        <tr>
                            <td>${c.getTrainingID()}</td>
                            <td>${c.getTrainingDate()}</td>
                            <td>${c.getTrainingTime()}</td>
                            <td>${c.getLocation()}</td>
                            <td>${c.getDescription()}</td>
                            <td>
                                <a class="update-course-button" href="Attendance.jsp?cid=${c.getTrainingID()}" onclick="event.handleLinkClick(event);">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
            <%@include file="CheckAttendance.jsp" %>

        </div>
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
