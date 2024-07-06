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
        .ui-w-40 {
            width: 40px !important;
            height: auto;
        }

        .card{
            box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
        }

        .ui-product-color {
            display: inline-block;
            overflow: hidden;
            margin: .144em;
            width: .875rem;
            height: .875rem;
            border-radius: 10rem;
            -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
            box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<%@include file="../INCLUDES/nav.jsp" %>
<jsp:include page="../INCLUDES/notifier.jsp" />
<div class="container px-3 my-5 clearfix">
    <!-- Shopping cartitem table -->
    <div class="card">
        <div class="card-header">
            <h2>Shopping Cart</h2>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered m-0">
                    <thead>
                    <tr>
                        <!-- Set columns width -->
                        <th class="text-center py-3 px-4" style="min-width:
                        300px;">Thông tin</th>
                        <th class="text-right py-3 px-4"
                            style="width: 100px;">Giá</th>
                        <th class="text-center py-3 px-4"
                            style="width: 180px;">Số lượng</th>
                        <th class="text-right py-3 px-4"
                            style="width: 100px;">Tổng</th>
                        <th class="text-center align-middle py-3 px-0"
                            style="width: 80px;">
                            <a href="#" class="shop-tooltip float-none text-light">
                                <i class="ino ion-md-trash"></i>
                            </a>
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <c:forEach var="item" items="${carts}">
                            <td class="p-4">
                                <c:choose>
                                    <c:when test="${item.type.name() eq 'TICKET'}">
                                        <div class="media-body">
                                            <a href="#"
                                               class="d-block text-dark fw-bold">
                                                Vé:
                                                ${item.item.data.homeTeamName}
                                                    VS
                                                ${item.item.data.awayTeamName}
                                            </a>
                                            <small class="d-flex flex-column">
                                                <span class="text-muted">
                                                    Số ghế:
                                                        ${item.item.data.tickets[0].seatNumber}</span>
                                                <span
                                                    class="text-muted">SVĐ:
                                                        ${item.item.data.location}
                                                </span>
                                                <span
                                                    class="text-muted">Thời
                                                    gian: <fmt:formatDate
                                                             value="${item.item.data.matchDate}"
                                                             pattern="EEE, dd-MM-yyyy HH:mm"
                                                         />
                                                </span>
                                            </small>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="media align-items-center">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                            <div class="media-body">
                                                <a href="#" class="d-block text-dark">Product 1</a>
                                                <small>
                                                    <span class="text-muted">Color:</span>
                                                    <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#e81e2c;"></span> &nbsp;
                                                    <span class="text-muted">Size: </span> EU 37 &nbsp;
                                                    <span class="text-muted">Ships from: </span> China
                                                </small>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-right font-weight-semibold align-middle p-4">
                                <fmt:formatNumber
                                    value = "${item.item.price}"
                                    type = "currency"
                                />
                            </td>
                            <td class="align-middle p-4">
                                <div class="d-flex align-items-center">
                                    <a
                                        href="${pageContext.request.contextPath}/cart/decrease?id=${item.id}">
                                        <i class="fas fa-minus"></i>
                                    </a>
                                   <span class="text-center flex-grow-1">
                                       ${item.quantity}
                                   </span>
                                    <a
                                        href="${pageContext.request.contextPath}/cart/increase?id=${item.id}">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </div>
                            </td>
                            <td class="text-right fw-semibold align-middle p-4">
                                <fmt:formatNumber
                                    value = "${item.item.price * item.quantity}"
                                    type = "currency"
                                />
                            </td>
                            <td class="text-center align-middle px-0">
                                <div
                                    class="d-flex justify-content-center align-items-center">
                                    <a href="${pageContext.request.contextPath}/cart/delete?id=${item.id}"
                                       class="text-danger">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/cart/paid">
                                        <input
                                            name="id"
                                            value="${item.id}"
                                            hidden="hidden"
                                        />
                                        <button class="bg-transparent border-0">
                                            <i class="fas fa-shopping-cart icon"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@include file="../INCLUDES/footer.jsp" %>
<script src="${pageContext.request.contextPath}/CSS/TOAST/notifier.js"></script>
</body>
</html>
