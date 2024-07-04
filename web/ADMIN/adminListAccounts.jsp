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
            .button-choice button.save:hover {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Hiệu ứng shadow khi hover */
                transform: scale(1.1);
            }

            .open-button {
                /*                width: 10%;*/
                background-color: #4CAF50; /* Màu xanh lá cây */
                color: white; /* Màu chữ trắng */
                border: none;
                padding: 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                border-radius: 45px; /* Bo tròn góc */
                transition: transform ease 0.3s; /* Hiệu ứng shadow */
            }
            .open-button:hover {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Hiệu ứng shadow khi hover */
                transform: scale(1.1);
            }
            #sidebar
            {

            }

            #content
            {
                width: 100%;
                overflow: hidden;
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
                max-height: 430px;
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
            #generateBtn {
                display: inline-block; /* Đảm bảo phần tử chỉ chiếm không gian cần thiết */
                cursor: pointer;
            }

            #generateBtn label {
                font-size: 10px; /* Thiết lập kích thước nhỏ hơn cho nhãn */
                vertical-align: middle; /* Để căn giữa theo chiều dọc với biểu tượng */
                margin: 0;
            }

            /* Hiệu ứng hover */
            #generateBtn i:hover {
                transform: scale(1.2); /* Phóng to lên 120% */
                transition: transform 0.3s ease; /* Hiệu ứng chuyển đổi mềm mại */
            }
            /*            #generateBtn label:hover {
                            transform: scale(1.2);  Phóng to lên 120% 
                            transition: transform 0.3s ease;  Hiệu ứng chuyển đổi mềm mại 
                        }*/
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
            .loading-spinner {


                display: none;
                top: 40%;
                position: fixed;
                /* width: 50px; */
                width: 200px;
                height: 200px;
                border: 8px solid rgba(0, 0, 0, 0.1);
                border-top: 8px solid #000;
                border-radius: 50%;
                animation: spin 1s linear infinite;
                margin: 0 auto;
            }
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }

            }
            #message-form
            {
                display: none;

            }
            .input-container {

                position: fixed;
                z-index: 9999; /* Đảm bảo nổi lên trên các thẻ khác */
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                text-align: center;
                top: 30%;
                left: 30%;
                width: 45vw;
                height: 45vh;
                vertical-align: middle;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }


            .input-container h2 {
                margin-bottom: 20px;
                font-size: 24px;
            }

            /* Style for the input field */
            .input-container input[type="text"] {
                width: 80%;
                padding: 10px;
               
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            /* Style for the buttons */
            .input-container button {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                margin: 5px;
                width: 90px;
            }

            .input-container button.send {
                background-color: #4CAF50; /* Green */
                color: white;
            }

            .input-container button.cancel {
                background-color: #f44336; /* Red */
                color: white;
            }

            /* Hover effects for buttons */
            .input-container button.send:hover {
                background-color: #45a049;
            }

            .input-container button.cancel:hover {
                background-color: #da190b;
            }
            .error-message {
                display: none;
                position: fixed;
                top: 20px;
                right: 20px;
                background-color: #f8d7da;
                color: #721c24;
                padding: 10px;
                border: 1px solid #f5c6cb;
                border-radius: 5px;
                z-index: 2000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .error-message.show {
                display: block;
                animation: fadeOut 2s forwards;
            }

            @keyframes fadeOut {
                0% {
                    opacity: 1;
                }
                80% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body onload="search()">
        <%@include file="../INCLUDES/head.jsp" %>
        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                                      <div class="nav-logo" style="cursor: pointer" onclick=" window.location.href='/SWPClubManegement/HomeServlet'"> <img src="../IMAGE/HOME/logo 1.png" alt="alt"/> </div>
                </div>

                <ul class="list-unstyled components">
                    <h3 >ADMIN</h3>
                    <li class="active">
                        <a href="/SWPClubManegement/BanAccountController"> <img src="../IMAGE/HOME/friend.png"  width="28px" height="28px"/> List Accounts</a>
                    </li>

                    <li >
                        <a href="/SWPClubManegement/PlayerController"><img src="../IMAGE/HOME/soccer-player.png" width="32px" height="32px" alt="alt"/> CRUD Player</a>
                    </li>                    
                    <li >
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li >
                        <a href="/SWPClubManegement/MatchStatisticController"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD Match Schedule</a>
                    </li>

                    <li  >
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


                <div style="display: flex;
                     justify-content: space-between">
                    <div class="search-container">

                        <input class="search" type="text" placeholder="ID, Name, Role,Email...">

                        <i class="search-icon fas fa-search"></i>

                    </div>
                    <!--                    <div  class="open-button"> Add accounts</div>-->
                    <i id="register-open" class="open-button fas fa-user-plus"></i> 
                </div>


                <div class="table-container">
                    <table class="table table-dark table-striped">

                        <thead class="thead-form" style="background-color: #0d6efd;">
                            <tr>
                                <th>
                                    ID
                                </th>
                                <th>
                                    UserName
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Role
                                </th>
                                <th>
                                    Status
                                </th>

                            </tr>

                        </thead>
                        <tbody id="accountTableBody">
                        </tbody>
                    </table>
                </div>
                <div class="error-message" id="errorMessage">

                </div>
                <div class="success-message" id="successMessage">
                    <i class="fas fa-check"></i> 
                </div>
                <%@include file="createAccount.jsp" %>
                <div class="overlay" id="message-form">
                    <div class="input-container">
                        <h2>Send the reason </h2>
                        <input type="text" name="message" placeholder="Enter your message here...">
                        <br>
                        <div>
                            <button class="send">Send</button>
                            <button class="cancel">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>

            function SubmitForm(event, method)
            {
                event.preventDefault();
                method();
            }

            document.getElementById("generateBtn").addEventListener("click", function () {
                var passwordField = document.getElementById("password");
                var generatedPassword = generatePassword(8); // Độ dài mật khẩu muốn tạo

                // Gán mật khẩu được tạo vào trường input
                passwordField.value = generatedPassword;
            });
            function generatePassword(length) {
                var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                var password = "";
                for (var i = 0; i < length; i++) {
                    var randomIndex = Math.floor(Math.random() * charset.length);
                    password += charset[randomIndex];
                }

                return password;
            }

            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $(this).toggleClass('active');
                });
            });
            function avatarOnload()
            {
                var avatarImages = document.getElementsByClassName('avatar');
                var check = false
                // Loop through each avatar image element
                for (var i = 0; i < avatarImages.length; i++) {
                    var avatarImage = avatarImages[i];
                    // Attach an onload event handler if it's not already attached



                    avatarImage.onload = function () {
                        console.log(this.src);
                        check = true;
                        //                        console.log("onLoad" + check);
                    }
                    avatarImage.onerror = function () {

                        this.src = "https://tse4.mm.bing.net/th?id=OIP.65QkEmpKBM_c-VSeqJfgdQAAAA&pid=Api&P=0&h=220";
                    };



                }
            }
            avatarOnload();
            function search() {
                var input = document.querySelector(".search").value;
                console.log(input);
                // Save the input value to localStorage
                localStorage.setItem('searchInput', input);
                var url = '/SWPClubManegement/BanAccountController?search=' + input + '&command=SEARCH';
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
                                updateAccountTable(data);
                            } catch (error) {
                                console.error('Error parsing JSON', error);
                                console.log('Response Text:', text);
                            }
                        })
                        .catch(error => console.error('Error:', error));
            }

            function restoreInput() {
                var savedInput = localStorage.getItem('searchInput');
                if (savedInput) {
                    document.querySelector(".search").value = savedInput;
                }
            }

            function updateAccountTable(accounts) {
                if (!Array.isArray(accounts)) {
                    console.error('Expected array but got:', accounts);
                    return;
                }

                const tableBody = document.querySelector("#accountTableBody"); // Assuming you have an ID for tbody
                tableBody.innerHTML = ""; // Clear the existing table body

                accounts.forEach(u => {
                    if (u.role !== "Admin")
                    {
                        const row = document.createElement('tr');
                        const userIdCell = document.createElement('td');
                        userIdCell.textContent = u.userId;
                        row.appendChild(userIdCell);
                        const userImageCell = document.createElement('td');
                        const img = document.createElement('img');
                        img.classList.add('avatar');
                        img.src = u.image;
                        img.width = 45;
                        img.height = 45;
                        img.alt = 'alt';
                        img.style.borderRadius = '90px';
                        userImageCell.appendChild(img);
                        userImageCell.appendChild(document.createTextNode(" " + u.userName));
                        row.appendChild(userImageCell);
                        const emailCell = document.createElement('td');
                        emailCell.textContent = u.email;
                        row.appendChild(emailCell);
                        const roleCell = document.createElement('td');
                        roleCell.textContent = u.role;
                        row.appendChild(roleCell);


                        const statusCell = document.createElement('td');
                        const toggleDiv = document.createElement('div');
                        toggleDiv.classList.add('toggle-button');
                        const checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.id = `statusToggle` + u.userId;
                        checkbox.classList.add('toggle-input');
                        if (u.status === true) {
                            checkbox.checked = true;
                        }
                        toggleDiv.appendChild(checkbox);
                        const label = document.createElement('label');
                        label.setAttribute('for', `statusToggle` + u.userId);
                        label.classList.add('toggle-label');
                        toggleDiv.appendChild(label);
                        const handleDiv = document.createElement('div');
                        handleDiv.classList.add('toggle-handle');

                        toggleDiv.appendChild(handleDiv);
                        statusCell.appendChild(toggleDiv);
                        row.appendChild(statusCell);



                        tableBody.appendChild(row);
                        const statusToggle = document.querySelector('#statusToggle' + u.userId);
                        statusToggle.addEventListener('click', function () {
                            console.log("this: " + document.getElementById('statusToggle' + u.userId).id);
                            console.log("status" + u.userId);
                            const blockSendMessage = document.querySelector('#message-form');
                            blockSendMessage.style.display = 'block';
                            document.querySelector('input[name="message"]').value = "";

                            if (this.checked === true)
                            {
                                blockSendMessage.style.display = 'none';
                                toggleStatus(this, u.userId, "");
                                return;

                            }

                            const sendButton = document.querySelector('.send');
                            const newSendButton = sendButton.cloneNode(true);
                            sendButton.parentNode.replaceChild(newSendButton, sendButton);

                            const cancelButton = document.querySelector('.cancel');
                            const newCancelButton = cancelButton.cloneNode(true);
                            cancelButton.parentNode.replaceChild(newCancelButton, cancelButton);

                            // Event listener for sending a message
                            newSendButton.addEventListener('click', function () {
                                console.log("click sent");
                                const mess = document.querySelector('input[name="message"]').value;
                                if (mess !== null && mess !== "") {
                                    console.log("click sent");
                                    toggleStatus(statusToggle, u.userId, mess);
                                    blockSendMessage.style.display = 'none';
                                } else {
                                    alert("Message empty");
                                }
                            });

                            // Event listener for cancel action
                            newCancelButton.addEventListener('click', function () {
                                statusToggle.checked = true;
                                console.log("this.checked: " + statusToggle.checked);

                                const errorMessage = document.getElementById('errorMessage');
                                errorMessage.innerHTML = '<i class="fas fa-exclamation-triangle"></i> Cancel';
                                errorMessage.classList.add('show');

                                setTimeout(function () {
                                    errorMessage.classList.remove('show');
                                }, 3000);

                                blockSendMessage.style.display = 'none';
                                return;
                            });




                        });

                        avatarOnload();
                    }
                });
            }



            document.querySelector('#create-button').addEventListener('click', function () {
                const load = document.getElementById('loadingSpinner');
                load.style.display = 'block';
            });


            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector(".search").addEventListener('input', search);
                restoreInput();
            });
            function Register() {
                var url = "/SWPClubManegement/AdminCreateAccountServlet";
                const form = document.getElementById('myForm');
                const formData = new FormData(form);
                const fileInput = document.getElementById('fileUpload');
                if (fileInput.files.length !== 0) {
                    console.log("ima" + fileInput);
                }
                for (let pair of formData.entries()) {
                    console.log(pair[0] + ': ' + pair[1]);
                }
                console.log("re " + formData);
                // Thêm dữ liệu vào formData nếu cần
                console.log("re " + url);
                fetch(url, {
                    method: 'POST',
                    body: formData

                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Network not okay");
                            }
                            return response.text();
                        })
                        .then(text => {
                            const load = document.getElementById('loadingSpinner');
                            load.style.display = 'none';
                            console.log(text);
                            var data = JSON.parse(text);
                            if (data.status === "error")
                            {
                                alert(data.message);
                                return;
                            }
                            var success = document.getElementById('successMessage');
                            success.style.display = "flex";
                            successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Create Account Success';
                            setTimeout(function () {
                                success.style.display = "none";
                            }, 1000);
                            var addForm = document.getElementById('register-form');
                            addForm.style.display = 'none';
                            document.querySelector('input[name="email"]').value = "";
                            document.querySelector('input[name="password"]').value = "";
                            document.querySelector('input[name="name"]').value = "";
                        })
                        .catch(error => {
                            throw new Error("Error: " + error);
                        })
                        .finally(() => {
                            search();
                        });
            }










            // Định nghĩa một hàm JavaScript để xử lý sự kiện thay đổi trạng thái của checkbox
            function toggleStatus(statusCheckbox, userId, mess) {
                // Lấy giá trị trạng thái mới
                const newStatus = statusCheckbox.checked;
                const userid = userId;
                console.log(" status" + newStatus);
                console.log(" userid" + userId);
                // Xây dựng URL với trạng thái mới
                const url = '/SWPClubManegement/BanAccountController?status=' + newStatus + '&command=UPDATE&uid=' + userId;
                console.log(url);
                // Gửi yêu cầu GET tới URL
                fetch(url, {method: 'GET'})
                        .then(response => response.text())
                        .then(data => {
                            //                            console.log(data);
                            var statusMessage;
                            if (newStatus)
                            {
                                statusMessage = "Unban Account Success";
                            } else
                            {
                                statusMessage = "Ban Account Success";

                            }
                            var success = document.getElementById('successMessage');
                            success.style.display = "flex";
                            successMessage.innerHTML = '<i class="fas fa-check-circle"></i>' + statusMessage;
                            setTimeout(function () {
                                success.style.display = "none";
                            }, 2000);
                        })
                        .catch(error => {
                            alert(error);
                            console.error('Error:', error);
                        }).
                        finally(() => {
                            sendEmail(userId, mess);
                        }
                        );
            }
            function sendEmail(id, mess)
            {
                console.log("mes" + mess);
                const url = '/SWPClubManegement/BanAccountController?&command=SEND&uid=' + id + '&message=' + mess;
                console.log(url);

                fetch(url, {method: 'GET'})
                        .then(response => JSON.parse(response))
                        .then(data => {

                            console.log(data);
                            if (data.status === "error")
                            {
                                console.log(data.message);
                                return;
                            }
                        })
                        .catch(error => console.error('Error:', error));

            }
            $(document).ready(function () {

                function toggleCloseRegisterform() {
                    $("#register-form").toggle();
                }

                function toggleOpenRegisterForm() {
                    $("#register-form").toggle();
                }





                $("#register-close").click(function () {
                    toggleCloseRegisterform();
                });
                $("#register-open").click(function () {
                    toggleOpenRegisterForm();
                });
            }
            );
        </script>               


        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="../ADMIN/addNews.jsp" %>

        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="../ADMIN/editNews.jsp" %>

    </body>
