<%-- 
    Document   : home
    Created on : May 18, 2024, 12:13:40 AM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/INCLUDES/head.jsp" %>

        <link rel="stylesheet" href="../CSS/HOMECSS/home.css"/>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <link rel="stylesheet" href="../CSS/HOMECSS/slide.css"/>
        <link rel="stylesheet" href="../CSS/FOOTER/footer.css"/>

        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
        <link rel="stylesheet" href="../OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap" rel="stylesheet">




    </head>
    <body>
        <%session.removeAttribute("error");%>

        <%@include file="../INCLUDES/nav.jsp" %>
        <div id="owl-demo" class="slide owl-carousel owl-theme">
            <div class="slider-item slider-item-one">
                <div class="slide-card">
                    <p class="slide-title">TITLE NEWS</p>
                    <div class="slide-detail">
                        <a href="">More Details</a>
                    </div>
                </div>
            </div>
            <div class="slider-item slider-item-two">
                <div class="slide-card">
                    <p class="slide-title">TITLE NEWS</p>
                    <div class="slide-detail">
                        <a href="">More Details</a>
                    </div>
                </div>

            </div> 
            <div class="slider-item slider-item-three">
                <div class="slide-card">
                    <p class="slide-title">TITLE NEWS</p>
                    <div class="slide-detail">
                        <a href="">More Details</a>
                    </div>
                </div>

            </div> 


        </div>

        <div class="matchSchedule">
            <div class="match-title">
                <h3 class="matchSchedule-title"> Match schedule</h3>
            </div>
            <div class="typeMatchSchedule">
                <div class="MatchSchedule-card match-card-1">
                    <p class="card-name"> <img src="https://img.uefa.com/imgml/uefacom/elements/logos/competitions/dark/uel.svg" alt="alt"/>Europe</p>
                    <p class="card-date">DDD/MMM/YYY</p>
                    <div class="card-button">
                        <a href="#">All matches</a>
                    </div>
                </div>
                <div class="MatchSchedule-card match-card-2">
                    <p class="card-name"><img src="https://img.uefa.com/imgml/uefacom/elements/logos/competitions/dark/wucl.svg" alt="alt"/> UEFA Champions league</p>
                    <p class="card-date">DDD/MMM/YYY</p>
                    <div class="card-button">
                        <a href="#">All matches</a>
                    </div>
                </div>
                <div class="MatchSchedule-card match-card-3">
                    <p class="card-name"><img style="width: 20px;height: 20px; border-radius: 90px; " src="https://tse2.mm.bing.net/th?id=OIP.F9mp4IIzSi9-EpjDaSiuEgHaGD&pid=Api&P=0&h=220" alt="alt"/> Laliga</p>
                    <p class="card-date">DDD/MMM/YYY</p>
                    <div class="card-button">
                        <a href="#">All matches</a>
                    </div>
                </div>


            </div>
        </div>
        <div class="player owl-carousel owl-theme">
            <div class="player-card" style="background-image: url('../IMAGE/HOME/Player 1.png');">
                <p class="player-name">Name</p>
                <p class="player-position">Wing</p>
            </div>
            <div class="player-card" style="background-image: url('../IMAGE/HOME/5-bellingham-0410085953.jpg');">
                <p class="player-name">Name</p>
                <p class="player-position">Wing</p>
            </div>
            <div class="player-card" style="background-image: url('../IMAGE/HOME/25-arrizabalaga-0410085957.jpg');">
                <p class="player-name">Name</p>
                <p class="player-position">Wing</p>
            </div>
            <div class="player-card" style="background-image: url('../IMAGE/HOME/messi4.jpg');">
                <p class="player-name">Name</p>
                <p class="player-position">Wing</p>
            </div>
        </div>





    </div>
    <div class="news owl-carousel owl-theme">
        <div class="news-title">
            <h2 class="sub-news-title">NEWS</h2>

            <p class="sub-news-description">Keep up to date with all the latest news about our club.let Stay up to date with the latest information</p>
        </div>
        <div class="news-card news-card-1" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-2" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-3" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-4" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-5" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-6" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
        <div class="news-card news-card-7" style="background-image: url('../IMAGE/HOME/Player 1.png');">
            <h3 class="news-card-title"> Title</h3>
        </div>
    </div>
    <%@include file="../INCLUDES/footer.jsp" %>

    <script src="../OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
    <script>
        $(document).ready(function () {

            $("#owl-demo").owlCarousel({
                loop: true,
                navigation: true, // Show next and prev buttons
                nav: false,
                slideSpeed: 300,
                paginationSpeed: 300,
                items: 1,
                itemsDesktop: false,
                itemsDesktopSmall: false,
                itemsTablet: false,
                itemsMobile: false,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: false

            });
            var owl = $('.player');
            owl.owlCarousel({
                items: 4,
                margin: 0,
                loop: true,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true
            });
            var owl = $('.news');
            owl.owlCarousel({
                items: 4,
                margin: 0,
                loop: false,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true
            });
        });


    </script>
</body>
</html>
