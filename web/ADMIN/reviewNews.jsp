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

    </head>

    <style>
        .review
        {
            height: 90vh;
            background-color: white;
            max-height: 95vh;
            position: fixed;
            /* z-index: 1000; */
            top: 20px;
            left: 100px;
            right: 500px;
            overflow-x: clip;
            overflow-y: scroll;
            width: 90vw;
            text-align: center;
            border-radius: 45px;
        }
        .review div, span, li, ul, ol, h1, h2, h3, h4, h5, h6, table, td, th {
            word-wrap: break-word;   /* Break long words */
            white-space: normal;     /* Normal white space handling */
            overflow-wrap: break-word; /* Break long words for older browsers */
        }
        .review p
        {


            line-height: 1.6;
            color: #333;
            font-size: 1rem;
            margin: 0 auto;
            max-width: 800px;
            text-align: justify;
            margin-bottom: 0.7rem;

        }
        .review img {
            max-width: 100%;
            height: auto;
            display: block;
            width: 100vw;
            border-radius: 45px;
        }

        .review h1
        {

            margin-top: 1.5rem;
            font-weight: 800;
            letter-spacing: 1px;
            color: #672C5D;

        }
        .review-close
        {
            font-size: 32px;
            position: fixed;
            top: 6%;
            left: 10%;
            z-index: 10000;
            color: black;
            cursor: pointer;
            transition: transform ease-in-out 0.3s ;

        }
        .review-close:hover
        {
            transform: scale(1.1);
            color: red;
        }
    </style>
    <body>
        <%
            NewsDAO ndao = new NewsDAO();

            News n = ndao.get(34).get();
            request.setAttribute("news", n);
        %>
        <div id="review-form" style="display: none">
            <i id="close" class="review-close fas fa-times"></i>
            <div  class="review" style="position: fixed; z-index: 1000;">
                <h1> ${news.newsTitle}</h1>
                ${news.newsContent}
            </div>
        </div>
    </body>
</html>
