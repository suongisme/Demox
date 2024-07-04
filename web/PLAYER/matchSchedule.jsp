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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

    </head>
    <body>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div>  

         <div class="coach-fun-content" style="padding: 20px; background-color: white; box-shadow: 0 0 12px 12px lightblue;">

            <div style="width: 100%; height: 100px"></div>
            <h1 style="text-align: center; color: black;">Match Schedule</h1>
            <table id="example" class="table table-bordered"  style="color: black">
                 <thead>
                    <tr>
                        <th>Match ID</th>

                        <th>Match Date</th>
                        <th>Home Team</th>
                        <th>Score</th>
                        <th>Away Team</th>
                        <th>Match Location</th>
                        <th>Tournament</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="now" value="${currentDate}" />
                    <c:forEach items="${matchesssses}" var="match">

                    <td>${match.matchID}</td>

                    <td>${match.matchDate}</td>
                    <td>${match.homeTeam.teamName} &#127884</td>
                    <td>${match.matchHomeTeam.score}-${match.matchAwayTeam.score}</td>
                    <td>${match.awayTeam.teamName} &#127884</td>
                    <td>${match.matchLocation}</td>
                    <td>${match.tournament}</td>
                    <td>
                        <c:choose>
                            <c:when test="${match.matchDate.isBefore(now)}">
                                Completed
                            </c:when>
                            <c:otherwise>
                                Upcoming
                            </c:otherwise>
                        </c:choose>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

    </body>

</html>
