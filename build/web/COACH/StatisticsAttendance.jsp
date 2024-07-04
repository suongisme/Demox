<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Player Attendance Statistics</title>
    <style>
        /* Your CSS styles here */
        .player-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }
        .present {
            background-color: #d4edda; /* light green */
            color: #155724; /* dark green */
            text-align: center;
        }
        .absent {
            background-color: #f8d7da; /* light red */
            color: #721c24; /* dark red */
            text-align: center;
        }
        .not-marked {
            background-color: #fef3cd; /* light yellow */
            color: #856404; /* dark yellow */
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Player Attendance Statistics</h1>
    
    <c:if test="${empty attendanceData}">
        <p>No attendance data available.</p>
    </c:if>
    
    <c:if test="${not empty attendanceData}">
        <table>
            <tr>
                <th>Player Image</th>
                <th>Player Name</th>
                <c:forEach var="trainingId" items="${trainingIds}">
                    <th>
                        <fmt:parseDate value="${trainingDates[trainingId]}" pattern="yyyy-MM-dd" var="parsedDate" type="date" />
                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                    </th>
                </c:forEach>
                <th>Total Present</th>
                <th>Attendance Rate</th>
            </tr>
            <c:forEach var="entry" items="${attendanceData}">
                <c:set var="player" value="${players[entry.key]}" />
                <tr>
                    <td>
                        <img src="${userImages[player.userID]}" alt="${player.name}" class="player-image">
                    </td>
                    <td>${player.name}</td>
                    <c:set var="presentCount" value="0" />
                    <c:forEach var="trainingId" items="${trainingIds}">
                        <c:choose>
                            <c:when test="${entry.value[trainingId] == true}">
                                <td class="present">Present</td>
                                <c:set var="presentCount" value="${presentCount + 1}" />
                            </c:when>
                            <c:when test="${entry.value[trainingId] == false}">
                                <td class="absent">Absent</td>
                            </c:when>
                            <c:otherwise>
                                <td class="not-marked">N/A</td>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <td>${presentCount}</td>
                    <td>
                        <fmt:formatNumber type="percent" maxFractionDigits="2" value="${presentCount / trainingIds.size()}" />
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</body>
</html>
