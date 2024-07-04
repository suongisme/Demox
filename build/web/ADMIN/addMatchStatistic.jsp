<%-- 
    Document   : AddMatchStatistic
    Created on : Jun 3, 2024, 11:38:59 AM
    Author     : Desktop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.MatchScheduleDAO"%>
<%@page import="Model.MatchSchedule"%>
<%@page import="Model.Tournament"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
            MatchScheduleDAO msdao = new MatchScheduleDAO();

            List<MatchSchedule> matches = msdao.getMatchHaveNotStatistic();
            List<Tournament> tournamentList = new ArrayList<>();
            request.getSession().setAttribute("matches", matches);

//            for (MatchSchedule m : matches) {
//                    homeTeam.add(tdao.get(m.getHomeTeamID()).get());
//                    awayTeam.add(tdao.get(m.getAwayTeamID()).get());
//
//                }
            // Thêm tất cả các giá trị của enum Tournament vào danh sách
            for (Tournament tournament : Tournament.values()) {
                tournamentList.add(tournament);
            }
            request.getSession().setAttribute("tournaments", tournamentList);
        %>
        <%@include file="../INCLUDES/head.jsp" %>
        <div id="add-form" style="display: none" >

            <div class="overlay">
                <form class="card card-on card-add-form mx-auto" onsubmit="submitForm(event, addMatch())" style="transition: ease-in 0.5s" >
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add Match Statistic</h3>
                    <input type="hidden" name="command" value="ADD" />

                    <div class="form-group">
                        <label for="playerName">Match</label>
                        <select name="match" required="">
                            
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="location"> Team</label>
                       
                        <select name="team">
                            
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="location"> Score</label>
                        <input  name="score" type="number"  min="0"  step="1" required="" value="" required="You are not fill"/>

                    </div>
                    <div class="form-group">
                        <label for="location"> Yellow Cards </label>
                        <input  name="yellow"   type="number"  min="0"  step="1" required="" value="" />

                    </div>
                    <div class="form-group">
                        <label for="location"> Red Cards </label>
                        <input  name="red"    type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="location"> Total Shots </label>
                        <input  name="shot"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="location"> Corner Kicks </label>
                        <input  name="corner"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="location"> Passes </label>
                        <input  name="pass" value="" type="number"  min="0"  step="1" required=""/>

                    </div>
<!--                    <div class="form-group">
                        <label for="location"> Ball Possession </label>
                        <input type="text" name="ball"  placeholder="team"  value="" required="You are not fill"/>

                    </div>-->



                    <div class="button-choice add-button" style="text-align: center;">
                        <button id="add-save" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
