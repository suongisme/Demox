<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Sider Menu Bar CSS</title>
        <link rel="stylesheet" href="../CSS/COACH/navbar.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <style>
            body {
                background-image: url('../IMAGE/HOME/stock-photo-modern-football-stadium-with-green-lawn-and-blue-spotlight-soccer-background-football-champions-2410554333.jpg');
                background-size: cover; /* Ensures the image covers the entire background */
                background-position: center; /* Centers the image */
                background-repeat: no-repeat; /* Prevents image from repeating */
                background-attachment: fixed; /* Fixes the image in place while scrolling */
                color: #fff; /* Adjusts text color for better readability */
                font-family: Arial, sans-serif; /* Sets a clean, readable font */
            }

            .sidebar {
                background-color: rgba(0, 0, 0, 0.7); /* Adds a semi-transparent background to the sidebar */
                padding: 15px;
                width: 250px;
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                overflow-y: auto;
            }

            .sidebar header {
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
                color: #fff; /* White color for the header text */
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
            }

            .sidebar ul li {
                margin: 10px 0;
            }

            .sidebar ul li a {
                text-decoration: none;
                color: #fff; /* White color for the links */
                font-size: 18px;
                display: block;
                padding: 10px;
                transition: background 0.3s;
            }

            .sidebar ul li a:hover {
                background-color: rgba(255, 255, 255, 0.1); /* Lightens the background on hover */
            }

            .sidebar ul li a i {
                margin-right: 10px;
            }

            section {
                margin-left: 270px; /* Space for the sidebar */
                padding: 20px;
            }

        </style>
    </head>
    <body>
        <div class="sidebar">

            <header><a href="/SWPClubManegement/HOME/home.jsp">Player</a></header>
            <ul>
                <li><a href="/SWPClubManegement/PLAYER/PlayerDashboard"><i class="fas fa-tachometer-alt"></i>Dashboard</a></li>
                <li><a href="/SWPClubManegement/PLAYER/PhysicalConditions"><i class="fas fa-heartbeat"></i>Phys Condition</a></li>
                <li><a href="/SWPClubManegement/MeetingSchedulePlayer"><i class="fas fa-calendar-alt"></i>Meeting Schedule</a></li>
                <li><a href="/SWPClubManegement/MatchSchedulePlayer"><i class="fas fa-futbol"></i>Match Schedule</a></li>
                <li><a href="/SWPClubManegement/PLAYER/PlayerStatus"><i class="fas fa-chart-line"></i>Player Stats</a></li>
                <li><a href="/SWPClubManegement/TrainingSchedulePlayer"><i class="fas fa-dumbbell"></i>Training Schedule</a></li>
                <li><a href="/SWPClubManegement/PLAYER/DietPlan"><i class="fas fa-utensils"></i>Diet Plan</a></li>
                <li><a href="/SWPClubManegement/PLAYER/TreatmentChedule"><i class="fas fa-notes-medical"></i>Treatment</a></li>
<!--                <li><a href="/SWPClubManegement/HOME/home.jsp"><i class="fas fa-home"></i>Back Home</a></li>-->
                <!--<li><a href="/SWPClubManegement/HOME/home.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>-->

            </ul>
        </div>
        <section>
            <!-- Main content goes here -->
        </section>
    </body>
</html>
