<%-- 
    Document   : addPlayer
    Created on : May 24, 2024, 10:45:46 AM
    Author     : Desktop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Position"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="../INCLUDES/head.jsp" %>
        <div id="add-form" style="display: none" >
            <div class="overlay">
                <form id="add"class="card card-on card-add-form mx-auto" onsubmit="addPlayer(event)" style="transition: ease-in 0.5s">
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add New Player</h3>
                    <input type="hidden" name="command" value="ADD" />


                    <div class="form-group">
                        <label for="playerName">Player Name</label>
                        <input type="text" name="playerName" id="playerName" placeholder="Player Name" value="" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="position">Position</label>

                        <select name="position" id="position" required="">
                            <c:forEach var="po" items="${positions}">
                                <option value="${po}">  ${po}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="uid">Player Accounts</label>                       
                        <select name="uid" id="uid" required="" title="No more accounts for players">
                            <c:choose>
                                <c:when test="${not empty listUsers}">
                                    <c:forEach var="u" items="${listUsers}">
                                        <option value="${u.userId}">${u.email}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="" disabled selected>No more accounts for players</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="course_price">DateOfBirth</label>
                        <input type="date" name="dateOfBirth" id="course_price" placeholder="DOB" value="" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="course_describe">Weight</label>
                        <input type="number" name="weight" id="" placeholder="Weight" min="0" title="Please enter a positive number" step="1" required="">
                    </div>
                    <div class="form-group">
                        <label for="course_describe">Height</label>
                        <!--                        <input type="number" name="height" id="course_describe" placeholder="Height" pattern="[0-9]+" title="Please enter numeric characters only">-->
                        <input type="number" name="height" id="" placeholder="Height" min="0" title="Please enter a positive number" step="1" required="">
                    </div>

                    <!--                    <div class="form-upload">
                                            <input type="file" name="course_picture" id="course_picture" class="upload-input" placeholder="Choose file">
                                        </div>-->

                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
