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
            #team {
                padding: 60px 0;
                text-align: center;
                background-color: #d1d1d1;
                color: #145889;
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
                bottom: 0px;
                left: -200px;
                transition: 0.4s;
                padding: 15px 0;
                background: rgba(0, 0, 0, 0.4);
            }
            #team .member:hover .member-info {
                left: 0px;
                right: 0px;
            }
            #team .member h4 {
                font-weight: 700;
                margin-bottom: 2px;
                font-size: 18px;
                color: #fff;
            }
            #team .member span {
                font-style: italic;
                display: block;
                font-size: 13px;
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
                background-color: #145889;
                color: white;
                text-align: center;
                padding: 20px 0;
                padding-top: 100px;
                min-height:70px;
            }

            .banner h1 {
                font-size: 36px;
                margin: 0;
            }

        </style>
        <div class="banner">
            <h1>REAL - FC</h1>
        </div>
        <section id="team">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Central Attacking Midfielder</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'CAM'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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



                <!-- Example for displaying Defenders -->
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Central Defensive Midfielder</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'CDM'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>                      
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Centre Forward</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'CF'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
                                        <span>Defender</span>
                                        <div class="member-info">
                                            <h4>${player.name}</h4>
                                            <span>${player.position}</span>
                                            <span>Date of Birth: ${player.age}</span>
                                            <span>Weight: ${player.weight} kg</span>
                                            <span>Height: ${player.height} cm</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Central Midfielder</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'CM'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
                                        <span>Defender</span>
                                        <div class="member-info">
                                            <h4>${player.name}</h4>
                                            <span>${player.position}</span>
                                            <span>Date of Birth: ${player.age}</span>
                                            <span>Weight: ${player.weight} kg</span>
                                            <span>Height: ${player.height} cm</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Goalkeeper</h2>
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
                                        <h4>${player.name}</h4>
                                        <span>Defender</span>
                                        <div class="member-info">
                                            <h4>${player.name}</h4>
                                            <span>${player.position}</span>
                                            <span>Date of Birth: ${player.age}</span>
                                            <span>Weight: ${player.weight} kg</span>
                                            <span>Height: ${player.height} cm</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Left Center Back</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'LCB'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Left Back </h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'LB'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Left Midfielder</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'LM'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Left Winger</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'LW'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Right Center Back</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'RCB'}">
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Right Central Midfielder</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'RCM'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Right Winger</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'RW'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h2>Striker</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="player" items="${listPlayer}">
                        <c:if test="${player.position == 'ST'}">
                            <div class="col-lg-3 col-md-6">
                                <div class="member">
                                    <div class="member-img">
                                        <img src="${player.image}" class="img-fluid" alt="${player.name}">
                                    </div>
                                    <h4>${player.name}</h4>
                                    <div class="member-info">
                                        <h4>${player.name}</h4>
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
        </div>
    </div>
</section>

</body>
</html>
