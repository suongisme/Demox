<%-- 
    Document   : home
    Created on : May 18, 2024, 12:13:40 AM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%@include file="/INCLUDES/head.jsp" %>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/HOMECSS/home.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/NAV/nav.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/HOMECSS/slide.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/FOOTER/footer.css"/>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/OwlCarousel2-2.3.4/dist/assets/owl.carousel.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Jura:wght@400;700&display=swap"
        rel="stylesheet">
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script
        src="${pageContext.request.contextPath}/CSS/TOAST/toast.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/CSS/TOAST/toast.css"/>
    <style>

        input[name=seatNumber] + label {
            background: var(--bs-dark);
            color: white;
            font-weight: bold;
        }

        input[name=seatNumber]:checked + label {
            color: var(--bs-primary);
        }

        input[name=seatNumber]:disabled + label {
            background: var(--bs-dark);
            color: var(--bs-danger);
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</head>
<body>
<%@include file="../INCLUDES/nav.jsp" %>
<jsp:include page="../INCLUDES/notifier.jsp"/>
<div
    style="background-color: #f3f6f9; padding-top: 100px; padding-bottom: 10px;">
    <div class="container">
        <c:if test="${param.error ne null}">
            <h1 class="text-danger">${param.error}</h1>
        </c:if>
        <div
            class="d-flex flex-column text-white justify-content-center align-items-center"
            style="
                background: url('${pageContext.request.contextPath}/IMAGE/mancity.jpg');
                background-size: 100% 100%;
                height: 364px;
                ">
            <p class="fw-bolder" style="font-size: 57px;">TICKETS</p>
            <p class="fw-bolder" style="font-size: 16px;">To purchase tickets
                you will need a Matchday or Junior
                Membership</p>
        </div>

        <div class="card my-4 p-3 d-flex flex-column gap-3">
            <c:forEach items="${matchSchedules}" var="map">
                <div>
                    <h4 class="pb-3 border-bottom"
                        style="
                            font-weight: 700;
                            font-size: 31px;
                            line-height: 32px;
                            letter-spacing: .31px;
                            color: #6caddf;
                            text-transform: uppercase;
                        "
                    >
                        ${map.key}
                    </h4>
                    <div class="d-flex flex-column gap-3">
                        <c:forEach var="match" items="${map.value}" varStatus="status">
                            <div
                                class="d-flex justify-content-between align-items-center mx-3 border-bottom">
                                <div class="col-md-3">
                                    <div class="d-flex flex-column">
                                        <p class="fw-bold mb-0">
                                            <fmt:setLocale value="en_US"
                                                           scope="page"/>
                                            <fmt:formatDate
                                                value="${match.getMatchDate()}"
                                                pattern="EEE dd MMM"
                                            />
                                        </p>
                                        <p>${match.tournament.getValue()}</p>
                                    </div>
                                </div>
                                <div class="d-flex flex-column gap-2 col-md-8">
                                    <div class="d-flex align-items-center row">
                                        <div class="d-flex justify-content-end col-md-5">
                                            <p class="mb-0"
                                               style="font-size: 20px; line-height: 21px;font-weight: 700;color: #001838;">
                                                    ${match.homeTeamName}
                                            </p>
                                        </div>
                                        <div
                                            class="d-flex align-items-center gap-2 col-md-2">
                                            <img
                                                src="${match.homeTeamLogo}"
                                                alt="Logo ${match.homeTeamName}"
                                                width="36px"
                                                height="36px"
                                            />
                                            <h6 class="mb-0 border" style="background: #dde6ed;">
                                                <fmt:formatDate
                                                    value="${match.getMatchDate()}"
                                                    pattern="HH:mm"
                                                />
                                            </h6>
                                            <img
                                                src="${match.awayTeamLogo}"
                                                alt="Logo ${match.awayTeamName}"
                                                width="36px"
                                                height="36px"
                                            />
                                        </div>
                                        <div class="d-flex justify-content-start col-md-5">
                                            <p class="mb-0"
                                               style="font-size: 20px; line-height: 21px;font-weight: 700;color: #001838;">
                                                    ${match.awayTeamName}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <p style="font-size: 17px; line-height: 21px;color: #001838;">
                                                ${ match.location }
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <c:choose >
                                        <c:when test="${match.tickets eq null or
                                        match.tickets.isEmpty()}">
                                            <p>Not Available</p>
                                        </c:when>
                                        <c:otherwise>
                                            <button data-bs-toggle="modal"
                                                    data-bs-target="#QR-${status.index}"
                                                    class="btn btn-warning">Buy Ticket
                                            </button>

                                            <div class="modal fade" id="QR-${status.index}"
                                                 tabindex="-1">
                                                <div
                                                    class="modal-dialog modal-dialog-centered modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title"
                                                                id="exampleModalLabel">Seat
                                                                number</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div
                                                            class="modal-body d-flex justify-content-center">
                                                            <div class="col-md-8" style="
                                                                background: url('${pageContext.request.contextPath}/IMAGE/svd.png');
                                                                height: 400px;
                                                                background-size: 98% 100%;
                                                                background-repeat: no-repeat;
                                                                padding: 10px;
                                                                ">
                                                                <div class="d-flex flex-wrap gap-2">
                                                                    <c:forEach
                                                                        items="${match.tickets}"
                                                                        var="ticket">
                                                                        <input hidden type="radio"
                                                                               id="ticket-${ticket.ticketId}"
                                                                               name="seatNumber"
                                                                               value="${ticket.ticketId}" ${match.ticketPurchaseMap.containsKey(ticket.ticketId) ? 'disabled' : ''}/>
                                                                        <label
                                                                            for="ticket-${ticket.ticketId}"
                                                                            class="border p-1 border-2"
                                                                            style="cursor: pointer"
                                                                            onclick="choseSeatNumber('QR-${status.index}', ${ticket.price}, ${ticket.ticketId})">${ticket.seatNumber}</label>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <div
                                                                class="col-md-4 d-flex flex-column justify-content-between">
                                                                <div
                                                                    class="d-flex justify-content-between">
                                                                    <h4>Price: </h4>
                                                                    <h4 id="price"></h4>
                                                                </div>
                                                                <form
                                                                    action="${pageContext.request.contextPath}/ticket/purchase"
                                                                    method="post">
                                                                    <input hidden name="itemId"
                                                                           id="ticketId" required/>
                                                                    <input hidden name="matchId"
                                                                           value="${match.matchID}"
                                                                           required/>
                                                                    <div class="d-flex gap-3">
                                                                        <div class="d-flex gap-2">
                                                                            <input id="vnpay"
                                                                                   type="radio"
                                                                                   name="paymentMethod"
                                                                                   value="vnpay"
                                                                                   checked/>
                                                                            <label for="vnpay"
                                                                                   class="border p-2">
                                                                                <img class="w-50"
                                                                                     src="${pageContext.request.contextPath}/IMAGE/logo-primary.svg"
                                                                                     alt="vnpay logo"/>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <input hidden="hidden"
                                                                           name="type"
                                                                           value="TICKET"
                                                                    >
                                                                    <input
                                                                        hidden="hidden"
                                                                        name="returnUrl"
                                                                        value="${pageContext.request.contextPath}/ticket"
                                                                    />
                                                                    <button disabled
                                                                            id="btn-thanh-toan"
                                                                            class="btn btn-primary w-100 mt-2">
                                                                        Pay
                                                                    </button>
                                                                    <button disabled
                                                                            id="btn-add-to-cart"
                                                                            class="btn btn-primary w-100 mt-2"
                                                                            formmethod="post"
                                                                            formaction="${pageContext.request.contextPath}/cart"
                                                                    >
                                                                        Add to cart
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
        </c:forEach>
    </div>
</div>

<%@include file="../INCLUDES/footer.jsp" %>
<script src="${pageContext.request.contextPath}/CSS/TOAST/notifier.js"></script>
<script>
    function choseSeatNumber(modalId, price, id) {
        const modal = document.getElementById(modalId);
        const btnThanhToan = modal.querySelector('#btn-thanh-toan');
        const btnAddToCart = modal.querySelector('#btn-add-to-cart');

        const ticketId = modal.querySelector('#ticketId');
        const priceDom = modal.querySelector('#price');
        btnThanhToan.disabled = false;
        btnAddToCart.disabled = false;
        ticketId.value = id;
        priceDom.textContent = price.toLocaleString('it-IT', {
            style: 'currency',
            currency: 'VND'
        });
    }
</script>
</body>
</html>
