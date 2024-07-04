<%-- 
    Document   : adminNewsList
    Created on : May 29, 2024, 4:12:59 PM
    Author     : Desktop
--%>

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
            #sidebar
            {

            }
            .card-on
            {

                background-color: #f0f0f0;
                position: fixed;
                top: 50px;
                right: 0;
                left: 0;
                bottom: 50px;
                height: 600px;
                width: 1000px;
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
            }
            #add-button:hover
            {
                background-color: #009926;
                transform: scale(1.1);
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
            .news-content {
                max-width: 300px;
                max-height:  300px;
                overflow-y: auto;
                overflow-x: clip;
            }

            .news-content p {
                max-width: 100%;
                font-size: 10px;
            }

            .news-content h1 {
                font-size: 1.5em;
                font-weight: bold;
                max-width: 100%;
            }

            .news-content img {
                max-width: 100%;
                height: auto;
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
            .review-button
            {
                transition: transform ease-in-out 0.2s;
                cursor: pointer;
            }
            .review-button:hover
            {
                transform: scale(1.1);
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
    <body>
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
                    <li class="active">
                        <a href="/SWPClubManegement/NewsController"> <img src="../IMAGE/HOME/news.png"  width="28px" height="28px"/> CRUD News</a>
                    </li>
                    <li>
                        <a href="/SWPClubManegement/MatchScheduleController"> <img src="../IMAGE/HOME/soccer.png"  width="28px" height="28px"/> CRUD Match Schedule</a>
                    </li>

                    <li>
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

                    <input class="search" type="text" placeholder="ID, Title">

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
                                    Title
                                </th>
                                <th>
                                    Subtitle
                                </th>
                                <th>
                                    News image
                                </th>
                                <th>
                                    Content
                                </th>
                                <th>
                                    Date of publish
                                </th>


                                <th>
                                    Action
                                </th>
                            </tr>

                        </thead>
                        <tbody id="matchTableBody">



                        </tbody>


                    </table>
                    <div class="success-message" id="successMessage">
                        <i class="fas fa-check"></i> 
                    </div>

                </div>
                <i id="add-button"  class=" fas fa-plus"></i>





            </div>
        </div>

        <!-- Import bootstrap 4 scripts -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <%@include file="../ADMIN/addNews.jsp" %>
        <%@include file="../ADMIN/reviewNews.jsp" %>




        <%@include file="../INCLUDES/head.jsp" %>
        <%@include file="../ADMIN/editNews.jsp" %>

    </body>
    <script>


                                            function Submit(event, method) {
                                                event.preventDefault(); // Prevent the default form submission

                                                // Your form handling logic here
                                                method();
                                            }

                                            document.addEventListener('DOMContentLoaded', function () {
                                                document.querySelector(".search").addEventListener('input', ListNews);
                                                console.log("search");

                                            });

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
                                            function ListNews() {
                                                var input = document.querySelector(".search").value;
                                                console.log(input);
                                                var url = '/SWPClubManegement/NewsController?search=' + input;
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
                                                                console.log(text);
                                                                var data = JSON.parse(text); // Convert text to JSON
                                                                console.log(data);
                                                                if (data.error) {
                                                                    console.error('Server Error:', data.error);
                                                                    return;
                                                                }
                                                                // Call the function to update the table
                                                                UpdateTtableListNews(data);

                                                            } catch (error) {
                                                                console.error('Error parsing JSON', error);
                                                                console.log('Response Text:', text);
                                                            }
                                                        })
                                                        .catch(error => console.error('Error:', error));


                                            }


                                            function deleteNews(nid)
                                            {
                                                var url = '/SWPClubManegement/NewsController?command=DELETE&nid=' + nid;
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
                    successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Delete operation successful';
                    setTimeout(function () {
                        success.style.display = "none";
                    }, 1000);
                }


                                                })
                                                        .catch(error => {
                                                            console.error('Error', error);
                                                            alert("delete fail");
                                                        })
                                                        .finally(() => {
                                                            ListNews();
                                                        });


                                            }

                                            function addNews()
                                            {
                                                var newsTitle = document.querySelector('input[name="newstitle"]').value;
                                                var description = document.querySelector('input[name="description"]').value;
                                                var newsimage = document.querySelector('input[name="newsimage"]').value;
                                                var contentNews = document.querySelector('textarea#contentNews').value;

                                                var editor = CKEDITOR.instances['contentNews'];
                                                if (editor) {

                                                    var content = editor.getData();
                                                    if (content.trim() === '')
                                                    {

                                                        alert(" Please fill the news content");

                                                        return;
                                                    }
                                                    // Use the content as needed
                                                    console.log(" editor " + content);
                                                } else {
                                                    console.error('CKEditor instance not found');
                                                }
                                                const form = document.querySelector('#add-news');
//            form.set('content1', content);
// Khởi tạo một FormData object
                                                const formData = new FormData(form);
                                                formData.set('content', content);

                                                for (const pair of formData.entries()) {
                                                    console.log(pair[0] + ': ' + pair[1]);
                                                }





                                                if (!newsTitle || !description || !editor) {
                                                    console.error('Missing required input value');
                                                    return;
                                                }
                                                var url = '/SWPClubManegement/AddNewsServlet'
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
                                                    var success = document.getElementById('successMessage');
                                                    console.log(text);

                                                    var data = JSON.parse(text);

                                                    if (data.status === 'error')
                                                    {
                                                        var errorMessage = document.getElementById('errorMessage');
                                                        errorMessage.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + data.message;
                                                        errorMessage.classList.add('show');

                                                        setTimeout(function () {
                                                            errorMessage.classList.remove('show');
                                                        }, 3000);
                                                        return;
                                                    }
                                                    success.style.display = "flex";
                                                    successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Add operation successful';
                                                    setTimeout(function () {
                                                        success.style.display = "none";
                                                    }, 1000);
                                                    var addForm = document.getElementById('add-form');
                                                    addForm.style.display = 'none';

                                                    document.querySelector('input[name="newstitle"]').value = "";

                                                    document.querySelector('input[name="description"]').value = "";

                                                    document.querySelector('input[name="newsimage"]').value = "";
                                                    document.querySelector('textarea[name="content"]').value = "";
                                                })
                                                        .catch(error => {
                                                            console.error('Error', error);
                                                            alert("Add fail");
                                                        })
                                                        .finally(() => {
                                                            ListNews();
                                                        });


                                            }





                                            function UpdateNews()
                                            {
                                                var nid = document.querySelector('input[name="nid"]').value
                                                var newsTitle = document.querySelector('input[name="newstitle1"]').value;
                                                var description = document.querySelector('input[name="description1"]').value;
                                                var newsimage = document.querySelector('input[name="newsimage1"]').value;
                                                console.log(" Emage" + newsimage);
                                                var editor = CKEDITOR.instances['contentNews1'];
                                                if (editor) {

                                                    var content = editor.getData();
                                                    if (content.trim() === '')
                                                    {
                                                        alert(" Please fill the news content");
                                                        return;
                                                    }

                                                    console.log(" editor " + content);
                                                } else {
                                                    console.error('CKEditor instance not found');
                                                }
                                                const form = document.querySelector('#edit');
//            form.set('content1', content);
// Khởi tạo một FormData object
                                                const formData = new FormData(form);
                                                formData.set('content1', content);

                                                for (const pair of formData.entries()) {
                                                    console.log(pair[0] + ': ' + pair[1]);
                                                }




                                                if (!newsTitle || !description || !editor) {
                                                    console.error('Missing required input value');
                                                    return;
                                                }
                                                var url = '/SWPClubManegement/EditNewsServlet'
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
                                                    successMessage.innerHTML = '<i class="fas fa-check-circle"></i> Add operation successful';
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
                                                            ListNews();
                                                        });


                                            }







                                            function UpdateTtableListNews(ListNews) {
//                                if (!Array.isArray(matches)) {
//                                    console.error('Expected array but got:', matches);
//                                    return;
//                                }

                                                const tableBody = document.querySelector("#matchTableBody");
                                                const content = document.querySelector("#content");
                                                tableBody.innerHTML = "";

                                                ListNews.forEach(m => {
                                                    const row = document.createElement('tr');
                                                    const newsIdCell = document.createElement('td');
                                                    newsIdCell.textContent = m.newsId;
                                                    row.appendChild(newsIdCell);

//                                    




                                                    const newsTitleCell = document.createElement('td');
                                                    newsTitleCell.textContent = m.newsTitle;
                                                    row.appendChild(newsTitleCell);
                                                    const descriptionCell = document.createElement('td');
                                                    descriptionCell.textContent = m.description;
                                                    row.appendChild(descriptionCell);
                                                    const newsImageDescriptionCell = document.createElement('td');
                                                    const imageDes = document.createElement('img');
                                                    imageDes.src = "../IMAGE/NEWS/" + m.newsImageDescription;
                                                    imageDes.style.width = "100px";
                                                    imageDes.style.height = "100px";


                                                    newsImageDescriptionCell.appendChild(imageDes);
                                                    row.appendChild(newsImageDescriptionCell);

                                                    const newsContentCell = document.createElement('td');
                                                    const reviewButton = document.createElement('i');
                                                    reviewButton.classList.add("fas", "fa-search-plus", "review-button");
                                                    const newsBlockDiv = document.createElement('div');
                                                    newsBlockDiv.classList.add("news-content", "scrollable-content");
                                                    newsBlockDiv.innerHTML = m.newsContent;
                                                    newsContentCell.appendChild(reviewButton);
                                                    newsContentCell.appendChild(newsBlockDiv);
                                                    row.appendChild(newsContentCell);
                                                    const datePostedCell = document.createElement('td');
                                                    datePostedCell.textContent = m.datePosted;
                                                    row.appendChild(datePostedCell);







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
//                    

                                                        document.querySelector('input[name="nid"]').value = newsIdCell.textContent;
                                                        document.querySelector('input[name="newstitle1"]').value = newsTitleCell.textContent;
                                                        document.querySelector('input[name="description1"]').value = descriptionCell.textContent;


                                                        var editorInstance = CKEDITOR.instances.contentNews1; // Đảm bảo yourEditorId chính xác
                                                        editorInstance.setData(newsBlockDiv.innerHTML);
                                                        document.querySelector('textarea#contentNews1').value = editorInstance.getData();

                                                        document.querySelector('.old-image').src = "../IMAGE/NEWS/" + m.newsImageDescription;



                                                    });

                                                    reviewButton.addEventListener('click', function () {
                                                        var editorInstance = CKEDITOR.instances.contentNews1; // Đảm bảo yourEditorId chính xác
                                                        editorInstance.setData(newsBlockDiv.innerHTML);
                                                        var cardContent = document.querySelector('.review');
                                                        cardContent.innerHTML = '<h1> ' + m.newsTitle + '<h1>' + newsBlockDiv.innerHTML;


                                                    });

                                                    // delete 

                                                    iconDelete.addEventListener('click', function () {
                                                        deleteNews(m.newsId);
                                                    });
                                                });


                                            }
                                            document.addEventListener('click', function (event) {

                                                if (event.target.classList.contains('review-button')) {

                                                    const reviewButton = document.getElementById('review-form');
                                                    console.log(reviewButton);
                                                    reviewButton.style.display = 'block';
                                                }
                                            });


                                            document.addEventListener('click', function (event) {

                                                if (event.target.classList.contains('update-button')) {

                                                    const updateButton = document.getElementById('edit-form');
                                                    console.log(updateButton);
                                                    updateButton.style.display = 'block';
                                                }
                                            });
                                            document.addEventListener('DOMContentLoaded', function () {
                                                // Gọi hàm ListMatches ngay khi trang web tải xong
                                                ListNews();
                                            });


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

                                                function reviewClose()
                                                {
                                                    $("#review-form").toggle();
                                                }


                                                function toggleOpenEdit() {
                                                    $("#edit-form").toggle();
                                                }
                                                function toggleCloseEdit() {
                                                    $("#edit-form").toggle();
                                                }

                                                $(".review-close").click(function ()
                                                {
                                                    reviewClose();
                                                });


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



    </script>
</html>
