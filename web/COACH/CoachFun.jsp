<%-- 
    Document   : CoachFun
    Created on : May 29, 2024, 10:09:37 AM
    Author     : Zanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Sider Menu Bar CSS</title>
        <link rel="stylesheet" href="../CSS/COACH/navbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    </head>
    <body>
        <div class="sidebar">
            <header>Coach</header>
            <ul>
                <li><a href="/SWPClubManegement/AttendanceServlet"><i class="fas fa-qrcode"></i>Attendance</a></li>
                <li><a href="coachtest.jsp"><i class="fas fa-link"></i>Expected Lineups</a></li>

                <li><a href="/SWPClubManegement/AttendanceServlet?command=STATIS"><i class="fas fa-stream"></i>Player Stats</a></li>

                <li><a href="/SWPClubManegement/TrainingServlet"><i class="fas fa-calendar-week"></i>Training Schedule</a></li>
                <li><a href="/SWPClubManegement/MeetingServlet"><i class="far fa-question-circle"></i>Meeting Schedule</a></li>
                <li><a href="/SWPClubManegement/LogoutServlet"><i class="fas fa-sliders-h"></i>Logout</a></li>
            </ul>
        </div>
        <section></section>
    </body>
</html>
