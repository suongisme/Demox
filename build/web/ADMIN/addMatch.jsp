<%-- 
    Document   : editListMatches
    Created on : Jun 2, 2024, 12:11:09 AM
    Author     : Desktop
--%>

<%@page import="Model.Tournament"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.TeamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            TeamDAO tdao = new TeamDAO();
            request.getSession().setAttribute("teams", tdao.getAll());
            request.getSession().setAttribute("hometeam", tdao.get(7).get());
            List<Tournament> tournamentList = new ArrayList<>();

            // Thêm tất cả các giá trị của enum Tournament vào danh sách
            for (Tournament tournament : Tournament.values()) {
                tournamentList.add(tournament);
            }
            request.getSession().setAttribute("tournaments", tournamentList);

            java.util.Calendar calendar = java.util.Calendar.getInstance();
            calendar.add(java.util.Calendar.YEAR, 10); // Thêm 10 năm vào ngày hiện tại
            java.util.Date maxDate = calendar.getTime();

            java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
            String maxDateString = dateFormat.format(maxDate);
            java.util.Date currentDate = new java.util.Date();

            String today = dateFormat.format(currentDate);

            request.getSession().setAttribute("today", today);
            request.getSession().setAttribute("maxDateString", maxDateString);

        %>
        <%@include file="../INCLUDES/head.jsp" %>
        <div id="add-form" style="display: none" >

            <div class="overlay">
                <form class="card card-on card-add-form mx-auto" onsubmit="SubmitForm(event, addMatch())"  style="transition: ease-in 0.5s" >
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add Match Schedule</h3>
                    <input type="hidden" name="command" value="ADD" />

                    <div class="form-group">
                        <label for="playerName">Away Team</label>
                        <select name="awayteam" required="">
                            <c:forEach var="t" items="${teams}" >
                                <option value="${t.teamID}">
                                    ${t.teamName}
                                </option>                                                                  
                            </c:forEach>
                        </select>

                    </div>

                    <div class="form-group">
                        <label for="hometeam">Home Team</label>
                        <select name="hometeam" required="">

                            <option value="${hometeam.teamID}" selected="">
                                ${hometeam.teamName}
                            </option>                                                                  

                        </select>


                    </div>

                    <div class="form-group">
                        <label for="location"> Location</label>
                        <input type="text" name="location"  placeholder="Location" class="location" value="" required="You are not fill"/>

                    </div>
                    <div class="form-group">
                        <label for="matchdate"> Match Date</label>
                        <input type="date"   name="matchdate" class="matchdate" min="${today}" max="${maxDateString}"    />
                    </div>

                    <div class="form-group">
                        <label for="hometeam">Tournament</label>
                        <select name="tour">
                            <c:forEach var="t" items="${tournaments}" >
                                <option value="${t}">
                                    ${t}
                                </option>                                                                  
                            </c:forEach>
                        </select>

                    </div>



                    <div class="button-choice add-button" style="text-align: center;">
                        <button id="add-save" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
