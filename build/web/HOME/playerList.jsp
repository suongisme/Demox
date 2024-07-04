<%-- 
    Document   : playerList
    Created on : May 25, 2024, 2:04:07 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../CSS/HOMECSS/home.css"/>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/HOMECSS/slide.css"/>
        <link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>

        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">
        <title>REAL - FC</title>
        <%@include file="/INCLUDES/head.jsp" %>
    </head>
    <body>
        <%@include file="../INCLUDES/nav.jsp" %>
        <style>
            body{
                background-color: rgb(24,23,51);
            }
            #team {
                margin: 2rem;
                padding: 60px 0;
                text-align: center;
                background-color: white;
                color: #145889;
                border-radius : 45px;
            }
            #team h2 {
                position: relative;
                padding: 0px 0px 15px;
            }
            #team p {
                font-size: 15px;
                font-style: italic;
                padding: 0px;
                margin: 25px 0px 40px;
            }
            #team h2::after {
                content: '';
                border-bottom: 2px solid #fff;
                position: absolute;
                bottom: 0px;
                right: 0px;
                left: 0px;
                width: 90px;
                margin: 0 auto;
                display: block;
            }
            #team .member {
                background-image: url(https://www.fcbarcelona.com/resources/v.2.85.2-5919/i/bg-elements/honours-pattern.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                min-height: 30vh;
                max-height: 50vh;
                height: 50vh;
                margin-bottom: 20px;
                position: relative;
                overflow: hidden;
                background-color: #808080;
                padding: 10px;
                padding-top: 10px;
                border-radius: 15px 0px 15px 0px;
                box-shadow: 0px 1px 6px 0px rgba(0, 0, 0, 0.4);
            }
            #team .member .member-info {
                display: block;
                position: absolute;
                bottom: -500px;
                left: 0px;
                right: 0px;
                transition: 0.4s;
                padding: 15px 0;
                background: rgba(0, 0, 0, 0.4);
            }
            #team .member:hover .member-info {
                bottom: 0px;

            }
            #team .member h4 {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 700;
                margin-bottom: 2px;
                font-size: 18px;
                color: #fff;
            }
            #team .member span {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;

                font-style: italic;
                display: block;
                font-size: 13px;
                color: white;
            }
            #team .member .social-links {
                margin-top: 15px;
            }
            #team .member .social-links a {
                transition: none;
                color: #fff;
            }
            #team .member .social-links a:hover {
                color: #ffc107;
            }
            #team .member .social-links i {
                font-size: 18px;
                margin: 0 2px;
            }
            .banner {
                max-height: 48rem;
                overflow: hidden;
                position: absolute;
                top: 0;
                width: 100%;
                transition: top .3s;
                max-width: 100vw;
                height: 100%;
            }
            .static-hero
            {
                height: 200px;
                position: relative;
                color: #fff;
                overflow: hidden;
                padding: 4rem 0;
                width: 100%;
                top: 0;
                z-index: 10;
            }
            .banner h1 {
                font-family: fcb-extra-bold, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
                font-size: 5.6rem;
                line-height: 5.6rem;
                margin-bottom: 1rem;
                display: inline-block;
                color: #fdc52c;
                text-shadow: 0 .1rem .2rem rgba(0, 0, 0, .5);
            }
            .banner-photo
            {
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
            }
            .banner-photo picture
            {
                opacity: .3;
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
            }
            .banner-photo picture img
            {
                width: 100%;

            }
            .banner-title
            {
                position: relative;
                z-index: 10;
                max-width: 89rem;
                text-align: center;
                margin: 0 auto;
                padding: 0 2rem;
            }
            .banner-title p
            {
                font-family: fcb-light, Arial, Helvetica Neue, Helvetica, sans-serif;
                font-weight: 400;
                font-size: 1.8rem;
                line-height: 2.4rem;
                max-width: 64rem;
                margin: 0 auto;
                display: block;
                color: #fff;
            }
            .img-fluid{
                height: 50vh;
            }

        </style>
        
        
            <%
            int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
            int nextYear = currentYear + 1;
        %>
        <section class="static-hero" style="margin-top: 5rem;">
            <div class="banner">
                <div class="banner-photo">
                    <picture>
                        <img src="https://www.fcbarcelona.com/fcbarcelona/photo/2018/11/14/556cbe5c-ad94-43c6-ac7b-3dcba97230c3/foto_aficio.jpg" alt="alt"/>
                    </picture></div>
                <div class="banner-title"> 
                    <h1>REAL - FC</h1>
                    <p>
                        The squad for the <%= currentYear%>/<%= nextYear%> season is not yet definitive
                    </p>
                </div>
            </div>
        </section>
           
        
     <section id="team" style="background-color: #fff">
    <div class="container">
        
        <!-- Goalkeepers -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2>Goalkeepers</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="player" items="${listPlayer}">
                <c:if test="${player.position == 'GK'}">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="${player.image}" class="img-fluid" alt="${player.name}">
                            </div>
                            <h4>${player.name}</h4>
                            <div class="member-info">
                                <span>${player.position}</span>
                                <span>Date of Birth: ${player.age}</span>
                                <span>Weight: ${player.weight} kg</span>
                                <span>Height: ${player.height} cm</span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- Defenders -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2>Defenders</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="player" items="${listPlayer}">
                <c:if test="${player.position == 'LB' || player.position == 'LCB' || player.position == 'RCB' || player.position == 'RB'}">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="${player.image}" class="img-fluid" alt="${player.name}">
                            </div>
                            <h4>${player.name}</h4>
                            <div class="member-info">
                                <span>${player.position}</span>
                                <span>Date of Birth: ${player.age}</span>
                                <span>Weight: ${player.weight} kg</span>
                                <span>Height: ${player.height} cm</span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- Midfielders -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2>Midfielders</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="player" items="${listPlayer}">
                <c:if test="${player.position == 'CM' || player.position == 'CAM' || player.position == 'CDM' || player.position == 'LM' || player.position == 'RM'}">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="${player.image}" class="img-fluid" alt="${player.name}">
                            </div>
                            <h4>${player.name}</h4>
                            <div class="member-info">
                                <span>${player.position}</span>
                                <span>Date of Birth: ${player.age}</span>
                                <span>Weight: ${player.weight} kg</span>
                                <span>Height: ${player.height} cm</span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- Forwards -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2>Forwards</h2>
            </div>
        </div>
        <div class="row">
            <c:forEach var="player" items="${listPlayer}">
                <c:if test="${player.position == 'CF' || player.position == 'LW' || player.position == 'RW' || player.position == 'ST'}">
                    <div class="col-lg-3 col-md-6">
                        <div class="member">
                            <div class="member-img">
                                <img src="${player.image}" class="img-fluid" alt="${player.name}">
                            </div>
                            <h4>${player.name}</h4>
                            <div class="member-info">
                                <span>${player.position}</span>
                                <span>Date of Birth: ${player.age}</span>
                                <span>Weight: ${player.weight} kg</span>
                                <span>Height: ${player.height} cm</span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
</section>

</body>
</html>
