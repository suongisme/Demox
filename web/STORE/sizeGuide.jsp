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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }
        thead {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
    <body>

        <div id="review-form" style="display: none">
            <i id="close" class="review-close fas fa-times"></i>
            <div  class="review" style="position: fixed; z-index: 1000;">
                <h1>Size guide</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Size</th>
                            <th>S</th>
                            <th>M</th>
                            <th>L</th>
                            <th>XL</th>
                            <th>XXL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Chest</td>
                            <td>88 - 96</td>
                            <td>96 - 104</td>
                            <td>104 - 112</td>
                            <td>112 - 124</td>
                            <td>124 - 136</td>
                        </tr>
                        <tr>
                            <td>Waist</td>
                            <td>76 - 84</td>
                            <td>84 - 92</td>
                            <td>92 - 100</td>
                            <td>100 - 112</td>
                            <td>112 - 124</td>
                        </tr>
                        <tr>
                            <td>Hip</td>
                            <td>92 - 100</td>
                            <td>100 - 108</td>
                            <td>108 - 116</td>
                            <td>116 - 128</td>
                            <td>128 - 140</td>
                        </tr>
                        <tr>
                            <td>Height</td>
                            <td>160 - 170</td>
                            <td>170 - 180</td>
                            <td>180 - 190</td>
                            <td>190 - 200</td>
                            <td>200 - 210</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
