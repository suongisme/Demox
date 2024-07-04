<%-- 
    Document   : listMatchStatistics
    Created on : Jun 3, 2024, 9:40:01 AM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="../CSS/ADMIN/admin.css"/>
        <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
        <script src="https://cdn.jsdelivr.net/places.js/1/places.min.js"></script>
        <style>
            .overlay{
                background-color: rgba(0,0,0,0.5);
                position: fixed;
                top:0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 500;
            }

            .card-on
            {

                background-color: #f0f0f0;
                position: fixed;
                top: 50px;
                right: 0;
                left: 0;
                bottom: 100px;
                height: 500px;
                width: 800px;
                z-index: 400;
                padding: 40px 100px 40px 100px;
                text-align: center;
                overflow: scroll;
                /*    text-align: center;*/
            }
            .card-add-form::-webkit-scrollbar {
                width: 10px; /* Chiều rộng của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-track {
                background: #f1f1f1; /* Màu nền của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-thumb {
                background: #888; /* Màu của thanh cuộn */
                border-radius: 5px; /* Bo tròn góc của thanh cuộn */
            }

            .card-add-form::-webkit-scrollbar-thumb:hover {
                background: #555; /* Màu của thanh cuộn khi hover */
            }
            .card-add-form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .form-group {
                width: 100%;
                margin-bottom: 15px;
                text-align: left;
            }

            .form-group input,
            .form-group select,
            .form-group textarea,
            .form-group .upload-input {
                width: calc(100% - 20px); /* Độ rộng của input là 100% trừ đi khoảng cách margin ở cả hai phía */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .form-upload {
                width: 100%;
                margin-bottom: 15px;
            }

            .form-upload input {
                width: calc(100% - 20px); /* Độ rộng của input là 100% trừ đi khoảng cách margin ở cả hai phía */
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .button-choice {
                width: 100%;
                text-align: center;
            }

            .button-choice button {
                width: 20%;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .form-group input,
            .form-group select,
            .form-group textarea,
            .form-group .upload-input {
                width: 95%; /* hoặc 100% */
                /* Thiết lập các thuộc tính khác */
            }
            .form-group label {
                /* Độ rộng của label */
                text-align: left; /* Canh chỉnh văn bản sang phải */
                margin-right: 15px; /* Khoảng cách giữa label và input */
                font-weight: 700;
            }
            .add-player-close {
                position: absolute; /* Đặt vị trí tuyệt đối */
                top: 0; /* Đặt phần tử ở phía trên cùng của thẻ cha */
                left: 0; /* Đặt phần tử ở phía bên trái của thẻ cha */
                padding: 10px; /* Tăng khoảng cách giữa icon và viền của thẻ cha */
                cursor: pointer; /* Biến con trỏ thành dấu nhấp chuột khi di chuột qua */
                z-index: 9999; /* Đảm bảo phần tử nằm trên các phần tử khác */
                font-size: 32px;
            }
            .button-choice button.save {
                width: 20%;
                background-color: #4CAF50; /* Màu xanh lá cây */
                color: white; /* Màu chữ trắng */
                border: none;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 5px; /* Bo tròn góc */
                transition: transform ease 0.3s; /* Hiệu ứng shadow */
            }

            #sidebar
            {

            }

            #content
            {
                width: 100%;
                padding: 0 10px;
            }


            .scrollable-content::-webkit-scrollbar {
                width: 12px; /* Width of the scrollbar */
            }

            .scrollable-content::-webkit-scrollbar-track {
                background: #f1f1f1; /* Background of the scrollbar track */
            }

            .scrollable-content::-webkit-scrollbar-thumb {
                background: #888; /* Color of the scrollbar thumb */
                border-radius: 6px; /* Rounded corners for the scrollbar thumb */
            }

            .scrollable-content::-webkit-scrollbar-thumb:hover {
                background: #555; /* Color of the scrollbar thumb on hover */
            }

            .table-container {
                max-height: 450px;
                overflow-y: auto;

            }

            /* Custom scrollbar styles */
            .table-container::-webkit-scrollbar {
                width: 12px; /* Width of the scrollbar */
            }

            .table-container::-webkit-scrollbar-track {
                background: #f1f1f1; /* Background of the scrollbar track */
            }

            .table-container::-webkit-scrollbar-thumb {
                background: #888; /* Color of the scrollbar thumb */
                border-radius: 6px; /* Rounded corners for the scrollbar thumb */
            }

            .table-container::-webkit-scrollbar-thumb:hover {
                background: #555; /* Color of the scrollbar thumb on hover */
            }
            .col-md-4
            {
                margin-bottom: 1.5rem ;

            }
            .card {
                height: 100%; /* Đảm bảo tất cả các cột có chiều cao bằng nhau */
                transition: box-shadow 0.3s ease; /* Hiệu ứng khi di chuột vào card */
                text-align: left; /* Căn giữa nội dung trong card */
                border-radius: 45px;
            }
            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Hiển thị bóng đổ lớn hơn khi di chuột vào */
            }
            label {
                width: 100px; /* Độ rộng của nhãn */
                font-weight: bold; /* Chữ in đậm */
            }
            .user-info
            {
                margin-left: 1rem;
            }
            .toggle-button {
                position: relative;
                display: inline-block;
                width: 40px;
                height: 20px;
            }

            .toggle-input {
                display: none;
            }

            .toggle-label {
                position: absolute;
                top: 0;
                left: 0;
                width: 40px;
                height: 20px;
                border-radius: 20px;
                background-color: #ccc;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .toggle-handle {
                position: absolute;
                top: 2px;
                left: 2px;
                width: 16px;
                height: 16px;
                border-radius: 50%;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                transition: left 0.3s ease;
            }

            .toggle-input:checked + .toggle-label {
                background-color: #66bb6a;
            }

            .toggle-input:checked + .toggle-label + .toggle-handle {
                left: 22px;
            }
            .search-container {
                position: relative;
                width: 300px; /* Chiều rộng */
            }
            .search {
                width: 100%;
                padding: 10px;
                border: 2px solid #ccc;
                border-radius: 25px; /* Đường viền cong */
                font-size: 16px;
                font-family: Arial, sans-serif;
                outline: none;
                transition: border-color 0.3s;
                box-sizing: border-box; /* Đảm bảo padding không làm thay đổi kích thước của trường nhập */
            }

            /* Style the search icon */
            .search-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
            }

            /* Style the input field when it is focused */
            .search:focus {
                border-color: dodgerblue;
            }
            #add-button
            {
                transition: transform ease 0.2s;
                border-radius: 45px;
                cursor: pointer;
            }
            #add-button:hover
            {
                background-color: #009926;
                transform: scale(1.1);
            }
            .button
            {
                display: flex;
                gap: 10px;
            }
            .update-button
            {
                transition: transform ease 0.2s;
                border-radius: 45px;
                color: #0061f2;
                cursor: pointer;

            }
            .update-button:hover
            {
                transform: scale(1.1);
            }
            .delete-button
            {
                transition: transform ease 0.2s;
                border-radius: 45px;
                color: #0061f2;
                cursor: pointer;

            }
            .delete-button:hover
            {
                transform: scale(1.1);
            }
            .success-message {
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border-radius: 5px;
                z-index: 1000;
                align-items: center;
                justify-content: center;
            }
            .success-message i {
                margin-right: 5px;
            }
            .success-message p
            {
                color: snow;
                font-size: 12px;
            }
        </style>
    </head>
    <body >
        <%@include file="../INCLUDES/head.jsp" %>
        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                    <div class="nav-logo" style="cursor: pointer" onclick=" window.location.href = '/SWPClubManegement/HomeServlet'"> <img src="../IMAGE/HOME/logo 1.png" alt="alt"/> </div>

                </div>

                <ul class="list-unstyled components">
                    <h3 >ADMIN</h3>
                    <li >
                        <a href="/SWPClubManegement/BanAccountController"> <img src="../IMAGE/HOME/friend.png"  width="28px" height="28px"/> List Accounts</a>
                    </li>

                    <li >
                        <a href="/SWPClubManegement/PlayerController"><img src="../IMAGE/HOME/soccer-player.png" width="32px" height="32px" alt="alt"/> CRUD Player</a>
                    </li>                    
                    <li >
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/MatchScheduleController"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD Match Schedule</a>
                    </li>

                    <li  class="active">
                        <a href="/SWPClubManegement/MatchStatisticController"> <img src="../IMAGE/HOME/user.png"  width="32px" height="32px"/> List Match stats</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/LogoutServlet"> <img src="../IMAGE/HOME/logout.png"  width="28px" height="28px"/> Log Out</a>
                    </li>

                </ul>
            </nav>

            <div id="content">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" id="sidebarCollapse" class="navbar-toggler">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                        </div>

                        <span class="navbar-text"><h4>List All News</h4></span>
                    </div>
                </nav>


                <div class="search-container">

                    <input class="search" type="text" placeholder="ID, Name, Role,Email...">

                    <i class="search-icon fas fa-search"></i>

                </div>
                <div class="table-container">
                    <table class="table table-dark table-striped">

                        <thead class="thead-form" style="background-color: #0d6efd;">
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Match
                                </th>
                                <th>
                                    Tournament
                                </th>
                                <th>
                                    Date
                                </th>
                                <th>
                                    Team
                                </th>
                                <th>
                                    Score
                                </th>

                                <th>
                                    Yellow Card
                                </th>
                                <th>
                                    Red Card
                                </th>
                                <th>
                                    Total Shots
                                </th>
                                <th>
                                    Corner Kicks
                                </th>

                                <th>
                                    Passes
                                </th>
                                <th>
                                    Action
                                </th>

                            </tr>

                        </thead>
                        <tbody id="matchTableBody">

                        </tbody>


                    </table>
                    <div id="loading" style="display: none;">
                        Loading...
                    </div>
                    <div class="success-message" id="successMessage">
                        <i class="fas fa-check"></i> 
                    </div>


                </div>


                <i onclick="InputTeam()" id="add-button"  class=" fas fa-plus"></i>
            </div>
        </div>

        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="../ADMIN/addMatchStatistic.jsp" %>
        <%@include file="../ADMIN/editMatchStatistic.jsp" %>



        <%@include file="../INCLUDES/head.jsp" %>


    </body>
    <script>

                    document.addEventListener('DOMContentLoaded', function () {
                        // Gọi hàm ListMatches ngay khi trang web tải xong
                        ListMatchStatistic();
                    });

                    function submitForm(event, method) {
                        event.preventDefault(); // Prevent the default form submission

                        // Your form handling logic here
                        method();
                    }


                    function showLoading() {
                        const loadingElement = document.getElementById('loading');
                        console.log(loadingElement);

                        if (loadingElement) {
                            loadingElement.style.display = 'block';
                        }
                    }


                    function hideLoading() {
                        const loadingElement = document.getElementById('loading');
                        console.log(loadingElement);
                        if (loadingElement) {
                            loadingElement.style.display = 'none';
                        }
                    }
                    function ListMatchStatistic() {
                        var input = document.querySelector(".search").value;
                        console.log(input);




                        var url = '/SWPClubManegement/MatchStatisticController?search=' + input;
                        console.log(url);

                        fetch(url, {method: 'POST'})
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Network response was not ok');
                                    }
                                    return response.text(); // Get response as text
                                })
                                .then(text => {
                                    try {
                                        var data = JSON.parse(text); // Convert text to JSON
                                        console.log(data);
                                        if (data.error) {
                                            console.error('Server Error:', data.error);
                                            return;
                                        }
                                        // Call the function to update the table
                                        UpdateTbodyMatchStatistic(data);
                                        hideLoading();
                                    } catch (error) {
                                        console.error('Error parsing JSON', error);
                                        console.log('Response Text:', text);
                                    }
                                })
                                .catch(error => console.error('Error:', error));


                    }
                    document.addEventListener('DOMContentLoaded', function () {
                        document.querySelector(".search").addEventListener('input', ListMatchStatistic);

                    });

                    function deleteMatch(mtid)
                    {
                        var url = '/SWPClubManegement/MatchStatisticController?command=DELETE&mtid=' + mtid;
                        console.log("URL = " + url);
                        fetch(url, {methob: 'get'}).then(response => {
                            if (!response.ok) {
                                throw new Error("Network response was not ok");
                            }
                        }).then(data => {




                            var success = document.getElementById('successMessage');
                            success.style.display = "flex";
                            successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Delete operation successful';
                            setTimeout(function () {
                                success.style.display = "none";
                            }, 1000);
                        })
                                .catch(error => console.error('Error', error))
                                .finally(() => {
                                    ListMatchStatistic();
                                });


                    }
                    function addMatch()
                    {
                        var matchId = document.querySelector('select[name="match"]').value;
                        var teamId = document.querySelector('select[name="team"]').value;
                        var score = document.querySelector('input[name="score"]').value;
                        var yellow = document.querySelector('input[name="yellow"]').value;
                        var red = document.querySelector('input[name="red"]').value;
                        var shot = document.querySelector('input[name="shot"]').value;
                        var corner = document.querySelector('input[name="corner"]').value;
                        var passes = document.querySelector('input[name="pass"]').value;
                        if (!matchId || !teamId || !score || !yellow || !red || !shot || !corner || !passes) {
                            console.error('Missing required input value');
                            return;
                        }

                        var url = '/SWPClubManegement/MatchStatisticController?command=ADD' +
                                '&matchId=' + matchId +
                                '&teamId=' + teamId +
                                '&score=' + score +
                                '&yellow=' + yellow +
                                '&red=' + red +
                                '&shot=' + shot +
                                '&corner=' + corner +
                                '&passes=' + passes;

                        console.log("URL = " + url);
                        fetch(url, {method: 'GET'})
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error("Network response was not ok");
                                    }
                                    return response.json(); // Phân tích cú pháp dữ liệu JSON
                                })
                                .then(data => {
                                    if (data.error) {
                                        alert("Add fail");
                                    } else {
                                        var success = document.getElementById('successMessage');
                                        success.style.display = "flex";
                                        successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Add operation successful';
                                        setTimeout(function () {
                                            success.style.display = "none";
                                        }, 1000);
                                    }
                                })
                                .catch(error => {
                                    console.error('Error', error);
                                    // Hiển thị một thông báo lỗi nếu có lỗi xảy ra
                                    alert("ADD fail: Try again: ");
                                })
                                .finally(() => {
                                    ListMatchStatistic(); // Gọi hàm ListMatchStatistic() sau khi hoàn thành
                                });
                        var addForm = document.getElementById('add-form');
                        addForm.style.display = 'none';
                        document.querySelector('select[name="match"]').value = "";
                        document.querySelector('select[name="team"]').value = "";
                        document.querySelector('input[name="score"]').value = "";
                        document.querySelector('input[name="yellow"]').value = "";
                        document.querySelector('input[name="red"]').value = "";
                        document.querySelector('input[name="shot"]').value = "";
                        document.querySelector('input[name="corner"]').value = "";
                        document.querySelector('input[name="pass"]').value = "";

                    }





                    function UpdateMatch()
                    {
                        var mtId = document.querySelector('input[name="mtid"]').value;

                        var matchId = document.querySelector('select[name="match1"]').value;
                        var teamId = document.querySelector('select[name="team1"]').value;
                        var score = document.querySelector('input[name="score1"]').value;
                        var yellow = document.querySelector('input[name="yellow1"]').value;
                        var red = document.querySelector('input[name="red1"]').value;
                        var shot = document.querySelector('input[name="shot1"]').value;
                        var corner = document.querySelector('input[name="corner1"]').value;
                        var passes = document.querySelector('input[name="pass1"]').value;
                        if (!matchId || !teamId || !score || !yellow || !red || !shot || !corner || !passes) {
                            console.error('Missing required input value');
                            return;
                        }


                        var url = '/SWPClubManegement/MatchStatisticController?command=UPDATE' +
                                '&matchId=' + matchId +
                                '&teamId=' + teamId +
                                '&score=' + score +
                                '&yellow=' + yellow +
                                '&red=' + red +
                                '&shot=' + shot +
                                '&corner=' + corner +
                                '&passes=' + passes +
                                '&mtid=' + mtId;

                        console.log("URL = " + url);
                        fetch(url, {method: 'GET'})
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error("Network response was not ok");
                                    }

                                    var success = document.getElementById('successMessage');
                                    success.style.display = "flex";
                                    successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Update operation successful';
                                    setTimeout(function () {
                                        success.style.display = "none";
                                    }, 1000);
                                })
                                .catch(error => {
                                    console.error('Error', error);
                                    alert("Edit Fail: Try again");
                                })
                                .finally(() => {
                                    ListMatchStatistic();
                                });
                        var addForm = document.getElementById('edit-form');
                        addForm.style.display = 'none';

                    }

                    function UpdateTbodyMatchStatistic(matchStatistic) {
                        const tableBody = document.querySelector("#matchTableBody");
                        const content = document.querySelector("#content");
                        tableBody.innerHTML = "";
                        var matchStatistics = matchStatistic.matchStatistics;
                        console.log(matchStatistics);
                        var matches = matchStatistic.matches;
                        var homeTeam = matchStatistic.homeTeam;
                        var awayTeam = matchStatistic.awayTeam;
                        var teams = matchStatistic.teams;
                        var matchUn = matchStatistic.matchun;
                        matchStatistics.forEach(m => {
                            const row = document.createElement('tr');
                            const matchStaIdCell = document.createElement('td');
                            matchStaIdCell.textContent = m.matchStatisticID;
                            row.appendChild(matchStaIdCell);

                            var homeTeamCell = null;
                            var awayTeamCell = null;

                            const match = document.createElement('td');
//                const locationCell = document.createElement('td');
                            const tournamentCell = document.createElement('td');
                            const matchDateCell = document.createElement('td');
                            var matchID;
                            matches.forEach(mc => {
                                if (mc.matchID === m.matchID) {
//                        locationCell.textContent = mc.location;
                                    matchID = mc.matchID;
                                    tournamentCell.textContent = mc.tournament;
                                    matchDateCell.textContent = mc.matchDate;

                                    awayTeam.forEach(aw => {
                                        if (aw.teamID === mc.awayTeamID) {
                                            awayTeamCell = aw.teamName;
                                        }
                                    });

                                    homeTeam.forEach(ho => {
                                        if (ho.teamID === mc.homeTeamID) {
                                            homeTeamCell = ho.teamName;
                                        }
                                    });
                                }
                            });

                            match.textContent = homeTeamCell + " vs " + awayTeamCell;
                            row.appendChild(match);
                            row.appendChild(tournamentCell);
                            row.appendChild(matchDateCell);




                            const teamCell = document.createElement('td');
                            var teamID;
                            teams.forEach(t => {
                                if (t.teamID === m.teamID) {
                                    teamID = t.teamID;
                                    teamCell.textContent = t.teamName;
                                }
                            });
                            row.appendChild(teamCell);

                            const score = document.createElement('td');
                            score.textContent = m.score;
                            row.appendChild(score);

                            const yellowCardCell = document.createElement('td');
                            yellowCardCell.textContent = m.yellowCards;
                            row.appendChild(yellowCardCell);

                            const redCardCell = document.createElement('td');
                            redCardCell.textContent = m.redCards;
                            row.appendChild(redCardCell);

                            const totalShotsCell = document.createElement('td');
                            totalShotsCell.textContent = m.totalShots;
                            row.appendChild(totalShotsCell);

                            const cornerKicksCell = document.createElement('td');
                            cornerKicksCell.textContent = m.cornerKicks;
                            row.appendChild(cornerKicksCell);

//                            const ballPossessionCell = document.createElement('td');
//                            ballPossessionCell.textContent = m.ballPossession;
//                            row.appendChild(ballPossessionCell);

                            const passesCell = document.createElement('td');
                            passesCell.textContent = m.passes;
                            row.appendChild(passesCell);

                            const buttonDiv = document.createElement('div');
                            buttonDiv.classList.add('button');
                            const iconUpdate = document.createElement('i');
                            iconUpdate.classList.add('update-button', 'fas', 'fa-edit');
                            const iconDelete = document.createElement('i');
                            iconDelete.classList.add('fas', 'fa-trash-alt', 'delete-button');
                            buttonDiv.appendChild(iconUpdate);
                            buttonDiv.appendChild(iconDelete);
                            const actionCell = document.createElement('td');
                            actionCell.appendChild(buttonDiv);
                            row.appendChild(actionCell);
                            tableBody.appendChild(row);

                            // Update icon
                            iconUpdate.addEventListener('click', function () {
                                const matchOptions = document.querySelectorAll('select[name="match1"]');
                                matchOptions.forEach(select => {
                                    select.disabled = true;
                                    select.value = matchID; // Assuming matchID is defined somewhere
                                    const option = document.createElement('option');
                                    option.value = matchID; // Assuming m is defined somewhere and has matchID property
                                    option.textContent = match.textContent + "(" + matchDateCell.textContent + ")"; // Assuming match is defined somewhere
                                    option.selected = true;
                                    select.appendChild(option);
                                });


                                const teamOptions = document.querySelectorAll('select[name="team1"]');
                                teamOptions.forEach(select => {
                                    select.disabled = true;
                                    select.value = teamID;
                                    const option = document.createElement('option');
                                    option.value = teamID;
                                    option.textContent = teamCell.textContent;
                                    select.appendChild(option);
                                });


                                document.querySelector('input[name="score1"]').value = score.textContent;
                                document.querySelector('input[name="yellow1"]').value = yellowCardCell.textContent;
                                document.querySelector('input[name="red1"]').value = redCardCell.textContent;
                                document.querySelector('input[name="shot1"]').value = totalShotsCell.textContent;
                                document.querySelector('input[name="corner1"]').value = cornerKicksCell.textContent;
                                document.querySelector('input[name="pass1"]').value = passesCell.textContent;
                                document.querySelector('input[name="mtid"]').value = m.matchStatisticID;



                            });



                            // Delete
                            iconDelete.addEventListener('click', function () {
                                deleteMatch(m.matchStatisticID);
                            });
                        });


                        // xử lý select match chỉ hiện ra những trận đang có và chưa có thống kê cho trận đó
                        const matchOptions = document.querySelector('select[name="match"]')
                        var hometeam;
                        var awayteam;
                        while (matchOptions.firstChild) {
                            matchOptions.removeChild(matchOptions.firstChild);
                        }
                        if (matchUn.length !== 0)
                        {
                            matchUn.forEach(m => {

                                teams.forEach(t => {
                                    if (m.awayTeamID === t.teamID)
                                    {
                                        hometeam = t.teamName;
                                    }
                                    if (m.homeTeamID === t.teamID)
                                    {
                                        awayteam = t.teamName;
                                    }
                                });

                                const option = document.createElement('option');
                                option.value = m.matchID;
                                option.textContent = hometeam + " vs " + awayteam + "(" + m.matchDate + ")";
                                matchOptions.appendChild(option);
                            });
                        } else {
                            const option = document.createElement('option');
                            option.value = "";
                            option.textContent = "There are no match without stat";
                            matchOptions.appendChild(option);

                        }

                    }


                    // mở edit form
                    document.addEventListener('click', function (event) {

                        if (event.target.classList.contains('update-button')) {

                            const updateButton = document.getElementById('edit-form');
                            console.log(updateButton);
                            updateButton.style.display = 'block';
                        }
                    });


                    // goi hàm input khi select match chagne
                    document.addEventListener('DOMContentLoaded', (event) => {
                        const matchSelect = document.querySelector('select[name="match"]');

                        matchSelect.addEventListener('change', function () {
                            InputTeam();
                        });
                    });


                    // hiển thị team liên quan đến trận đấu được chọn
                    function InputTeam()
                    {
                        const matchOptions = document.querySelector('select[name="match"]').value;
                        const teamSelect = document.querySelector('select[name="team"]');
                        var url = '/SWPClubManegement/MatchStatisticController?command=LOAD&mid=' + matchOptions;
                        console.log("url data :" + url);

                        fetch(url, {method: 'GET'})
                                .then(response => response.text())
                                .then(text => {
                                    var data = JSON.parse(text);
                                    console.log("team data :" + data);

                                    if (data.error) {
                                        throw new Error("error:" + data.error);
                                    }

                                    var teams = data;
                                    while (teamSelect.firstChild) {
                                        teamSelect.removeChild(teamSelect.firstChild);
                                    }

                                    teams.forEach(t => {
                                        const option = document.createElement('option');
                                        option.value = t.teamID;
                                        option.textContent = t.teamName;
                                        teamSelect.appendChild(option);
                                    });
                                })
                                .catch(error => console.error('Error:', error));


                    }




                    $(document).ready(function () {
                        $('#sidebarCollapse').on('click', function () {
                            $('#sidebar').toggleClass('active');
                            $(this).toggleClass('active');
                        });
                        function toggleCloseAddform() {
                            $("#add-form").toggle();
                        }

                        function toggleOpenAdd() {
                            $("#add-form").toggle();
                        }



                        function toggleOpenEdit() {
                            $("#edit-form").toggle();
                        }
                        function toggleCloseEdit() {
                            $("#edit-form").toggle();
                        }

                        $("#add-close").click(function () {
                            toggleCloseAddform();
                        });
                        $("#add-button").click(function () {
                            toggleOpenAdd();
                        });
                        $(".update-button").click(function () {
                            toggleOpenEdit();
                        });
                        $("#close-edit").click(function () {
                            toggleCloseEdit();
                        });
                    }
                    );

    </script>    
</html>
