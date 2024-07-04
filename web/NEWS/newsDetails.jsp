<%-- 
    Document   : newsDetails
    Created on : May 28, 2024, 2:46:20 PM
    Author     : Desktop
--%>

<%@page import="Model.News"%>
<%@page import="DAO.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* styles.css */
            p {
                font-family: 'Times New Roman', Times, serif;
                line-height: 1.6;
                color: #333;
               
                margin: 0 auto;
                max-width: 800px;
                text-align: justify;
            }

            

            

            img {
                max-width: 100%;
                height: auto;
                display: block;
                width: 100vw;
            }

            
            .container{
                display: flex;
                justify-content: center;
                
            }
            .card-body
            { text-align: center;
              border-radius: 45px;
              background-color: #FCF3EE;
            }
            .img-title
            {
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                background-image: url("https://www.fcbarcelona.com/photo-resources/2024/05/27/747c5c37-e68a-4688-a41f-ccbe9ae121e3/_GP20022.jpg?width=1200&height=750");
                background-size: cover;
                background-position: center;
                
            }
            h1
            {
                color: #672C5D;
            }
        </style>
    </head>
    <%
        NewsDAO ndao = new NewsDAO();

        News n = ndao.get(13).get();
        request.setAttribute("news", n);
    %>
    <body>
        <%@include file="../INCLUDES/head.jsp" %>
        <div class="container " style="margin-top: 500px">
            <div class="row img-title">ád </div>
            <div class="row" style="width: 100vw;">
                <div class="col-12">
                    <div class="card" style="width: 100vw;">
                        <div class="card-content card-body">
                            <h1>${news.newsTitle}</h1>
                            <!-- Hiển thị nội dung bài báo -->
                            ${news.newsContent}
                        </div>
                    </div>
                </div>
                
            </div>
                        <div></div>
        </div>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
