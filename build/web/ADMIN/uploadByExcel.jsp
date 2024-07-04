<%-- 
    Document   : uploadByExcel
    Created on : Jun 19, 2024, 10:24:43 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="../CSS/ADMIN/admin.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
    </head>
    <style>
        /* Reset CSS */
        body, h1, p {
            margin: 0;
            padding: 0;
        }
        #content
        {
            width: 100%;
        }
        /* CSS tổng quan */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;

            background-color: #f4f4f4;
        }

        /* CSS cho tiêu đề */
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* CSS cho đoạn văn */
        p {
            margin-bottom: 15px;
        }

        /* CSS cho container */
        .container {
            max-height: 600px;
            overflow-y: scroll;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .tutorial, .excel {
            width: 100%;
            height: 100%;
        }
        /* CSS cho các bước */
        .step {
            background: #e9ecef;
            padding: 15px;
            border-left: 5px solid #007bff;
            margin-bottom: 15px;
        }

        .step h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .download-link {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .download-link:hover {
            background-color: #0056b3;
        }
        .upload-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            width: 100%;
            text-align: center;
        }

        /* CSS cho tiêu đề */
        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        /* CSS cho label */
        label {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #555;
        }

        /* CSS cho input file */
        input[type="file"] {
            margin-bottom: 20px;
        }

        /* CSS cho nút submit */
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }

        /* CSS cho nút submit khi hover */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        #back-btn {
            display: inline-block;
            padding: 10px;
            background-color: rgb(76, 175, 80); /* Màu nền */
            color: #fff; /* Màu chữ */
            border: 1px solid #007bff; /* Viền */
            border-radius: 5px; /* Bo góc */
            cursor: pointer; /* Con trỏ chuột thành dấu nhọn khi hover */
            transition: background-color 0.3s, color 0.3s; /* Hiệu ứng chuyển đổi màu nền và màu chữ */
        }
        
        /* CSS cho biểu tượng */
        #back-btn i {
            margin-right: 5px; /* Khoảng cách giữa biểu tượng và chữ */
        }

        /* Hiệu ứng hover */
        #back-btn:hover {
            background-color: #0056b3; /* Màu nền khi hover */
            border-color: #0056b3; /* Viền khi hover */
        }

        /* Tăng cường hiệu ứng cho biểu tượng khi hover */
        #back-btn:hover i {
            transform: translateX(-3px); /* Di chuyển biểu tượng sang trái */
        }
    </style>

    <body>
        <div class="wrapper">

            <nav id="sidebar">
                <div class="sidebar-header">
                    <img src="../IMAGE/HOME/REALFC.png" alt="alt"/>
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

                <div id="back-btn">
                    <i class="fas fa-arrow-left"></i> 
                </div>
                <div class="container">
                    <h1>Hướng dẫn sử dụng</h1>
                    <div class="excel owl-carousel owl-theme">
                        <div class="step">
                            <h2>Nhớ là đặt tên theo form dưới đây</h2>
                            <img src="../IMAGE/HOME/Tutorial.PNG" alt="alt"/>
                        </div>
                        <div class="step">
                            <h2>Tải tệp Excel mẫu xuống</h2>
                            <p>Nhấn vào nút dưới đây để tải tệp Excel mẫu về máy tính của bạn.</p>
                            <a class="download-link" href="../EXCEL/Test.xlsx" download="Format.xlsx">Tải xuống tệp Excel mẫu</a>
                        </div>

                    </div>
                    <div class="tutorial owl-carousel owl-theme">
                        <div class="step">
                            <h2>Bước 1: Chọn tệp Excel</h2>
                            <p>Nhấn vào nút "Select Excel file" để chọn tệp Excel từ máy tính của bạn.</p>
                        </div>
                        <div class="step">
                            <h2>Bước 2: Tải tệp lên</h2>
                            <p>Nhấn vào nút "Upload" để tải tệp lên máy chủ.</p>
                        </div>
                        <div class="step">
                            <h2>Bước 3: Kiểm tra kết quả</h2>
                            <p>Sau khi tải tệp lên thành công, kiểm tra kết quả trên trang hiển thị.</p>
                        </div>
                    </div>
                    <div class="upload-container">
                        <h1>Tải lên tệp Excel</h1>
                        <form action="/SWPClubManegement/UploadExcelServlet" method="post" enctype="multipart/form-data">
                            <label for="file">Chọn tệp Excel:</label>
                            <input type="file" id="file" name="file" accept=".xlsx">
                            <input type="submit" value="Upload">
                        </form>
                    </div>
                </div>


               


            </div>
        </div>


        <!-- Liên kết đến jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Liên kết đến thư viện JS của Owl Carousel -->
        <script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>

        <script>
            $(document).ready(function () {
                var owl = $('.tutorial');
                owl.owlCarousel({
                    items: 1,
                    margin: 0,
                    loop: true,

                    autoplayHoverPause: true
                });
                var owl = $('.excel');
                owl.owlCarousel({
                    items: 1,
                    margin: 0,
                    loop: true,

                    autoplayHoverPause: true
                });
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                    $(this).toggleClass('active');
                });
                $('#back-btn').on('click', function () {
                    window.history.back();
                });
            });
        </script>


</html>
