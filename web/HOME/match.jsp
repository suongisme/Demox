<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Match Schedule</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f2f2f2;
                background-image: url('https://images.baodantoc.vn/uploads/2021/Th%C3%A1ng_10/ng%C3%A0y%206/Thanh/UEFA_EURO_2024_Germany-1633518379601.jpg');
                background-position: center; /* Center the image */
                background-repeat: no-repeat;
                background-size: cover;
            }

            h1, h2 {
                text-align: center;
                color: #333;
            }

            /*            table {
                            width: 100%;
                            border-collapse: collapse;
                            margin-bottom: 20px;
                            background-color: #fff;
                            border: 1px solid #ddd;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                        }
                        th, td {
                            padding: 10px;
                            text-align: left;
                            border: 1px solid #ddd;
                        }
                        th {
                            background-color: #4CAF50;
                            color: white;
                        }
                        tr:nth-child(even) {
                            background-color: #f2f2f2;
                        }
                        tr:hover {
                            background-color: #ddd;
                        }
                        .match-type {
                            margin-bottom: 10px;
                            font-size: 18px;
                            font-weight: bold;
                            color: #333;
                        }
                        .upcoming-match {
                            background-color: #e0f7fa;
                        }
                        .completed-match {
                            background-color: #cfe2f3;
                        }
                        .home-button {
                            display: block;
                            width: 100px;
                            margin: 20px auto;
                            padding: 10px;
                            text-align: center;
                            background-color: #4CAF50;
                            color: white;
                            text-decoration: none;
                            border-radius: 5px;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        }
                        .home-button:hover {
                            background-color: #45a049;
                        }*/
       

        </style>
    </head>
    <body>
        <!-- Enhanced Navigation bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="HOME/home.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Match Schedule</a>
                        </li>
                        <!-- Add more nav items as needed -->
                    </ul>
                </div>
            </div>
        </nav>

        <h1>Match Schedule</h1>

        <h2 class="match-type">Matches</h2>
        <div style="background-color: #f2f2f2; padding: 10px; border-radius: 10px;">
            <table id="example" class="table table-bordered table-hover">
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
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="now" value="${currentDate}" />
                    <c:forEach items="${matches}" var="match">
                        <tr>
                            <td>${match.matchID}</td>
                            <td>${match.matchDate}</td>
                            <td>${match.homeTeam.teamName} <img src="${match.homeTeam.flag}" width="30px" height="15px" alt="alt"/></td>
                            <td>${match.matchHomeTeam.score}-${match.matchAwayTeam.score}</td>
                            <td>${match.awayTeam.teamName} <img src="${match.awayTeam.flag}" width="30px" height="15px" alt="alt"/></td>
                            <td>${match.matchLocation}</td>
                            <td>${match.tournament}</td>
                            <td>
                                <c:choose>
                                    <c:when
                                        test="${match.matchDate.before(now)}">
                                        Completed
                                    </c:when>
                                    <c:otherwise>
                                        Upcoming
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><a href="./HOME/DetailMatch?mid=${match.matchID}">Detail</a></td>

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
