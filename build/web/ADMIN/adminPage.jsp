<%-- 
    Document   : adminPage
    Created on : May 24, 2024, 8:06:18 AM
    Author     : Desktop
--%>

<%@page import="Model.Player"%>
<%@page import="DAO.PlayerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <style>
            #content
            {
                width: 100%;

            }
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
                top: 100px;
                right: 0;
                left: 0;
                bottom: 50px;
                height: 400px;
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
                text-align: right; /* Canh chỉnh văn bản sang phải */
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

            .button-choice button.save:hover {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Hiệu ứng shadow khi hover */
                transform: scale(1.1);
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
            .button
            {
                display: flex;
                gap: 10px;
            }
            .success-message {
                display: flex;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 10px;
                border-radius: 5px;
                z-index: 1000;
                align-items: center;
            }
            .success-message i {
                margin-right: 5px;
            }
            .excel-upload {
                display: flex;
                align-items: center;
                padding: 10px;
                background-color: rgb(76,175,80);
                border: 1px solid #ccc;
                border-radius: 5px;
                width: fit-content; /* Chỉ rộng vừa đủ */
                cursor: pointer; /* Thay đổi con trỏ chuột thành dấu nhọn khi di chuột vào */
                transition: transform ease 0.3s;
                font-family: fantasy;
            }

            /* Style cho biểu tượng */
            .excel-upload i {
                margin-left: 10px; /* Khoảng cách giữa văn bản và biểu tượng */
            }

            /* Hiệu ứng hover */
            .excel-upload:hover {
                transform: scale(1.1);
            }
            #successUploadMessage{
                display: flex;
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
            .table-container {
                max-height: 420px;
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
            .error-form
            {

            }
            .fail-on
            {

                background-color: #f0f0f0;
                position: fixed;
                top: 100px;
                /* right: 50%; */
                left: 40%;
                bottom: 50px;
                height: 400px;
                width: 400px;
                z-index: 400;

                text-align: center;
                overflow: scroll;


            }
            .close-fail-on
            {
                position: absolute; /* Đặt vị trí tuyệt đối */
                top: 0; /* Đặt phần tử ở phía trên cùng của thẻ cha */
                left: 0; /* Đặt phần tử ở phía bên trái của thẻ cha */
                padding: 10px; /* Tăng khoảng cách giữa icon và viền của thẻ cha */
                cursor: pointer; /* Biến con trỏ thành dấu nhấp chuột khi di chuột qua */
                z-index: 9999; /* Đảm bảo phần tử nằm trên các phần tử khác */
                font-size: 32px;
            }
            .fail-on .error-message{
                margin: 10px 0;
                padding: 10px;

                border-radius: 3px;
                color: red; /* Text color */
                font-weight: bold; /* Bold text */
                text-align: center; /* Center align text */
            }

            .fail-on .error-message::before {
                content: "\f071"; /* Font Awesome exclamation triangle */
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                margin-right: 10px;
                color: #721c24;
            }
        </style>

    </head>
    <body>
        <%
            UserDAO udao = new UserDAO();
            PlayerDAO pdao = new PlayerDAO();
//            String pid = request.getParameter("pid");
//            if (pid != null) {
//                Player p = pdao.get(Integer.parseInt(pid)).get();
//                request.getSession().setAttribute("player", p);
//                request.getSession().setAttribute("user", udao.get(p.getUserID()).get());
//
//            }

            List<String> positions = new ArrayList<>();

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            request.getSession().setAttribute("listUsers", udao.getListUserUnknow("Player"));

            // Lặp qua tất cả các giá trị enum và thêm chúng vào danh sách
            for (Position position : Position.values()) {
                positions.add(position.toString());
            }
            request.getSession().setAttribute("positions", positions);


        %>
        <!------ Include the above in your HEAD tag ---------->

        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                    <div class="nav-logo" style="cursor: pointer" onclick=" window.location.href='/SWPClubManegement/HomeServlet'"> <img src="../IMAGE/HOME/logo 1.png" alt="alt"/> </div>
                </div>

                <ul class="list-unstyled components">
                    <h3 >ADMIN</h3>

                    <li >
                        <a href="/SWPClubManegement/BanAccountController"> <img src="../IMAGE/HOME/friend.png"  width="28px" height="28px"/> List Accounts</a>
                    </li>

                    <li class="active">
                        <a href="/SWPClubManegement/PlayerController"><img src="../IMAGE/HOME/soccer-player.png" width="32px" height="32px" alt="alt"/> CRUD Player</a>
                    </li>                    
                    <li >
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/MatchScheduleController"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD Match Schedule</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/MatchStatisticController"> <img src="../IMAGE/HOME/user.png"  width="32px" height="32px"/> CRUD Match Stats</a>
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

                        <span class="navbar-text"><h4>List All Player</h4></span>
                    </div>
                </nav>



                <div style="display: flex;
                     justify-content: space-between">
                    <div class="search-container">

                        <input class="search" type="text" placeholder="ID, Name, Role,Email...">

                        <i class="search-icon fas fa-search"></i>

                    </div>
                    <!--                    <div  class="open-button"> Add accounts</div>-->
                    <div class="excel-upload" onclick="window.location.href = '/SWPClubManegement/ADMIN/uploadByExcel.jsp'" title="Add List Player by Excel">
                        Add List Player by Excel
                        <i class="fas fa-file-excel"></i>
                    </div>
                </div>
                <div class="table-container">
                    <table class="table table-dark table-striped">

                        <thead class="thead-form" style="background-color: #0d6efd;">
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Image
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Position
                                </th>
                                <th>
                                    Age
                                </th>
                                <th>
                                    Weight
                                </th>
                                <th>
                                    Height
                                </th>
                                <th>
                                    Action
                                </th>
                            </tr>

                        </thead>
                        <tbody id="playerTableBody">



                        </tbody>
                        <div class="success-message" id="successMessage">

                        </div>
                    </table>    
                </div>           
                <i id="add-button"  class=" fas fa-plus"></i>

                <div class="success-message" id="successMessage">
                    <i class="fas fa-check"></i> ${Message}
                </div>



            </div>
        </div>

        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="../ADMIN/addPlayer.jsp" %>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="editPlayer.jsp" %>

        <c:if test="${emailValid != null and not empty emailValid}">
            <div class="error-form">
                <div class="overlay">

                    <div class="fail-on">
                        <i  class="close-fail-on fas fa-times"></i>
                        <c:forEach var="e" items="${emailValid}">
                            <div class="error-message">
                                ${e}  Already Exist
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.status == '1'}">
            <div class="success-message" id="successUploadMessage" >

                <i class="fas fa-check"></i> Upload Success
            </div>
        </c:if>
    </body>
    <script>
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
                            // Display success message if it exists

                        });
                        setTimeout(function () {
                            uploadStatus(); // Gọi hàm uploadStatus với thông báo thành công
                        }, 2000);
                        function uploadStatus()
                        {
                            var uploadSuccess = status;
                            console.log(uploadSuccess);

                            var success = document.getElementById('successUploadMessage');
                            success.style.display = "none";
                            fetch('/SWPClubManegement/UploadExcelServlet', {method: 'GET'})
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok');
                                        }
                                        return response.text(); // Get response as text
                                    })

                                    .catch(error => console.error('Error:', error));
                        }



                        document.addEventListener('DOMContentLoaded', function () {
                            // Gọi hàm ListMatches ngay khi trang web tải xong
                            ListPlayers();
                        });
                        document.addEventListener('DOMContentLoaded', function () {
                            document.querySelector(".search").addEventListener('input', ListPlayers);
                            console.log("search");

                        });
                        document.querySelector('.close-fail-on').addEventListener('click', function () {
                            document.querySelector('.error-form').style.display = 'none';
                            fetch('/SWPClubManegement/UploadExcelServlet', {method: 'GET'})
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error('Network response was not ok');
                                        }
                                        return response.text(); // Get response as text
                                    })

                                    .catch(error => console.error('Error:', error));
                        });
                        function ListPlayers() {
                            var input = document.querySelector(".search").value;

                            var url = '/SWPClubManegement/PlayerController?command=LOAD&search=' + input;
                            console.log(url);

                            fetch(url, {method: 'GET'})
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
                                            UpdateTableListPlayers(data);

                                        } catch (error) {
                                            console.error('Error parsing JSON', error);
                                            console.log('Response Text:', text);
                                        }
                                    })
                                    .catch(error => console.error('Error:', error));


                        }
                        function UpdateTableListPlayers(players) {
//                               

                            const tableBody = document.querySelector("#playerTableBody");
                            const content = document.querySelector("#content");
                            tableBody.innerHTML = "";
                            var playerList = players.players;
                            var users = players.users;


                            playerList.forEach(p => {
                                const row = document.createElement('tr');
                                const playerIdCell = document.createElement('td');
                                playerIdCell.textContent = p.playerID;
                                row.appendChild(playerIdCell);
                                const ImagePlayerCell = document.createElement('td');
                                const img = document.createElement('img');
                                var email;


                                users.forEach(u =>
                                {
                                    if (u.userId === p.userID)
                                    {
                                        email = u.email;
                                        img.classList.add('avatar');
                                        img.src = u.image;
                                        img.width = 45;
                                        img.height = 45;
                                        img.alt = 'alt';
                                        img.style.borderRadius = '90px';
                                        ImagePlayerCell.appendChild(img);
                                    }



                                });
                                row.appendChild(ImagePlayerCell);
                                const nameCell = document.createElement('td');
                                nameCell.textContent = p.name;
                                row.appendChild(nameCell);
                                const PositionCell = document.createElement('td');
                                PositionCell.textContent = p.position;
                                row.appendChild(PositionCell);
                                const DobCell = document.createElement('td');
                                DobCell.textContent = p.age;
                                row.appendChild(DobCell);
                                const weightCell = document.createElement('td');
                                weightCell.textContent = p.weight;
                                row.appendChild(weightCell);
                                const heightCell = document.createElement('td');
                                heightCell.textContent = p.height;
                                row.appendChild(heightCell);

                                const Button = document.createElement('div');
                                Button.classList.add('button');
                                const iconUpdate = document.createElement('i');
                                iconUpdate.classList.add('update-button');
                                iconUpdate.classList.add('fas');
                                iconUpdate.classList.add('fa-edit', 'update-button');
                                const iconDelete = document.createElement('i');
                                iconDelete.classList.add('fas');
                                iconDelete.classList.add('fa-trash-alt', 'delete-button');
                                Button.appendChild(iconUpdate);
                                Button.appendChild(iconDelete);
                                const actionCell = document.createElement('td');
                                actionCell.appendChild(Button);
                                row.appendChild(actionCell);
                                tableBody.appendChild(row);
                                // update icon
                                iconUpdate.addEventListener('click', function () {
                                    if (playerIdCell && img && nameCell && DobCell && weightCell && heightCell) {
                                        // Update form fields with values from the cells
                                        document.querySelector('input[name="pid"]').value = playerIdCell.textContent;
                                        document.querySelector('input[name="playerimage"]').value = "";
                                        document.querySelector('.old-image').src = img.src;
                                        document.querySelector('input[name="playerName1"]').value = nameCell.textContent;
                                        document.querySelector('input[name="email1"]').value = email;
                                        document.querySelector('input[name="dateOfBirth1"]').value = DobCell.textContent;
                                        document.querySelector('input[name="weight1"]').value = weightCell.textContent;
                                        document.querySelector('input[name="height1"]').value = heightCell.textContent;
                                        document.querySelectorAll('select[name = "position1"] option').forEach(op =>
                                        {
                                            if (op.value === PositionCell.textContent)
                                            {
                                                op.selected = true;
                                            }

                                        });
                                    } else {
                                        console.error('One or more required elements are missing.');
                                    }


                                });
                                // delete 

                                iconDelete.addEventListener('click', function () {
                                    deletePlayer(p.playerID);
                                });
                            }
                            );


                        }

                        function addPlayer(event)
                        {
                            event.preventDefault();
                            const form = document.querySelector('#add');


                            const formData = new FormData(form);

                            // Convert formData to a query string
                            const params = new URLSearchParams();
                            for (const pair of formData.entries()) {
                                params.append(pair[0], pair[1]);
                            }

                            const queryString = params.toString();
                            const url = `/SWPClubManegement/PlayerController?` + queryString;
                            console.log("URL = " + url);
                            fetch(url, {method: 'GET',

                            })
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error("Network response was not ok");

                                        }
                                        return response.json();


                                    }).then(text => {
                                var success = document.getElementById('successMessage');
                                console.log("text" + text);

                                var data = text;

                                const selectElement = document.querySelector('select[name="uid"]');
                                if (data === null || data.length === 0) {
                                    selectElement.innerHTML = '<option value="" disabled required selected>No more accounts for players</option>';
                                } else {
                                    // Clear existing options
                                    selectElement.innerHTML = '';

                                    // Populate the select element with options from the data
                                    data.forEach(user => {
                                        const option = document.createElement('option');
                                        option.value = user.userId;
                                        option.textContent = user.email;
                                        selectElement.appendChild(option);
                                    });
                                }
                                success.style.display = "flex";
                                success.innerHTML = '<i class="fas fa-check-circle"></i> Add operation successful';
                                setTimeout(function () {
                                    success.style.display = "none";
                                }, 1000);
                                var addForm = document.getElementById('add-form');
                                addForm.style.display = 'none';

                                document.querySelector('input[name="playerName"]').value = "";

                                document.querySelector('input[name="dateOfBirth"]').value = "";

                                document.querySelector('input[name="weight"]').value = "";
                                document.querySelector('input[name="height"]').value = "";
                            })
                                    .catch(error => {
                                        console.error('Error', error);
                                        alert("Add fail");
                                    })
                                    .finally(() => {
                                        ListPlayers();
                                    });


                        }

                        function UpdatePlayer(event)
                        {
                            event.preventDefault()
                            const form = document.querySelector('#edit');

                            const formData = new FormData(form);


                            for (const pair of formData.entries()) {
                                console.log(pair[0] + ': ' + pair[1]);
                            }





                            var url = '/SWPClubManegement/PlayerController'
                            console.log("URL = " + url);
                            fetch(url, {method: 'POST',
                                body: formData
                            })
                                    .then(response => {
                                        if (!response.ok) {
                                            throw new Error("Network response was not ok");

                                        }
                                        return response.text();


                                    }).then(text => {
                                console.log(text);
                                var data = JSON.parse(text);
                                if (data.status === 'error')
                                {
                                    var errorMessage = document.getElementById('errorMessage1');
                                    errorMessage.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + data.message;
                                    errorMessage.classList.add('show');

                                    setTimeout(function () {
                                        errorMessage.classList.remove('show');
                                    }, 3000);
                                    return;
                                }

                                var success = document.getElementById('successMessage');
                                success.style.display = "flex";
                                success.innerHTML = '<i class="fas fa-check-circle"></i> Update operation successful';
                                setTimeout(function () {
                                    success.style.display = "none";
                                }, 1000);
                                var editForm = document.getElementById('edit-form');
                                editForm.style.display = 'none';


                            })
                                    .catch(error => {
                                        console.error('Error', error);
                                        alert("Add fail");
                                    })
                                    .finally(() => {
                                        ListPlayers();
                                    });


                        }
                        function deletePlayer(pid)
                        {
                            var url = '/SWPClubManegement/PlayerController?command=DELETE&pid=' + pid;
                            console.log("URL = " + url);
                            fetch(url, {method: 'GET'}).then(response => {
                                if (!response.ok) {
                                    throw new Error("Network response was not ok");
                                }
                                return response.text();
                            }).then(text => {

                                console.log("delete " + text);
                                if (text.trim() !== '"fail"')
                                {
                                    var success = document.getElementById('successMessage');
                                    success.style.display = "flex";
                                    success.innerHTML = '<i class="fas fa-check-circle"></i> Delete operation successful';
                                    setTimeout(function () {
                                        success.style.display = "none";
                                    }, 1000);
                                } else
                                {
                                    alert("delete fail");
                                    return;
                                }

                            })
                                    .catch(error => {
                                        console.error('Error', error);
                                        alert("delete fail");
                                    })
                                    .finally(() => {
                                        ListPlayers();
                                    });


                        }
                        document.addEventListener('click', function (event) {

                            if (event.target.classList.contains('update-button')) {

                                const updateButton = document.getElementById('edit-form');
                                console.log(updateButton);
                                updateButton.style.display = 'block';
                            }
                        });

    </script>

</html>
