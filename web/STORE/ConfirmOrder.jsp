<%-- 
    Document   : ConfirmOrder
    Created on : Jun 10, 2024, 3:50:15 PM
    Author     : Desktop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="apple-touch-icon" href="../css/STORE/apple-touch-icon.png">
        <link rel="stylesheet" href="../CSS/STORE/bootstrap.min.css">
        <link rel="stylesheet" href="../CSS/STORE/normalize.css">
        <link rel="stylesheet" href="../CSS/STORE/font-awesome.min.css">
        <link rel="stylesheet" href="../CSS/STORE/icomoon.css">
        <link rel="stylesheet" href="../CSS/STORE/jquery-ui.css">
        <link rel="stylesheet" href="../CSS/STORE/owl.carousel.css">
        <link rel="stylesheet" href="../CSS/STORE/transitions.css">
        <link rel="stylesheet" href="../CSS/STORE/main.css">
        <link rel="stylesheet" href="../CSS/STORE/color.css">
        <link rel="stylesheet" href="../CSS/STORE/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <%
            String status = request.getParameter("status");
            if (status != null) {
                request.getSession().setAttribute("status", status);
            } else {
                request.getSession().setAttribute("status", "none");
            }
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            if (address == null) {
                address = (String) session.getAttribute("address");
            } else {
                session.setAttribute("address", address);
            }
            if (phone == null) {
                phone = (String) session.getAttribute("phone");
            } else {
                session.setAttribute("phone", phone);
            }

        %>
        <style>
            .container-Confirm {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                font-family: Arial, sans-serif;
            }


            label {
                font-weight: bold;
                margin-bottom: 5px;
                color: #333;
            }



            input[type="text"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                width: 100%;
                margin-bottom: 10px;
            }

            input[type="text"][readonly] {
                background-color: #f0f0f0; /* Readonly input background color */
                color: #666; /* Readonly input text color */
            }

            /* Order Summary Styles */


            #cart-items {
                display: flex;
                flex-direction: column;

                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
                overflow-y: scroll;
                max-height: 400px;
            }
            .products-section
            {
                width: 60%;
            }
            #cart-total {
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }
            .cart-item-details {
                width: 100%;
                /* Take remaining space */
                border: 1px solid #ddd; /* Border */
                border-radius: 5px; /* Rounded corners */
                padding: 15px; /* Padding */
                background-color: #f9f9f9; /* Background color */
            }

            .cart-item-details h5 {
                margin-bottom: 10px; /* Adjust margin as needed */
                font-size: 18px; /* Example font size */
                color: #333; /* Text color */
            }

            .cart-item-details p {
                margin: 5px 0; /* Adjust margin as needed */
                font-size: 16px; /* Example font size */
                color: #666; /* Text color */
            }
            #cart-items {
                display: flex;
                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
            }

            #cart-total {
                font-size: 20px;
                font-weight: bold;
            }
            #cart-item:last-child {
                border-bottom: none;
            }
            .pay-button {
                text-align: center; /* Center align content */
                margin-top: 20px; /* Add margin at the top */
            }

            /* Status Styles */
            .status {
                font-weight: bold;
                font-size: 18px;
                color: #333;
            }

            /* Link Styles */
            .pay-button a {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 30px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .pay-button a:hover {
                background-color: #0056b3;
            }
            .sub-item
            {

                width: 100%;
                display: flex;
                border: black solid 1px;
            }
            .status {
                color: #761c19;
                animation: shake 0.5s infinite alternate; /* Sử dụng animation shake */
            }
            .go-stote-btn
            {
                animation: shake 0.5s ease-in-out infinite alternate;
            }

            #rightBar
            {

                position: fixed;
                top: -300px;
                right: 10px; /* Ban đầu đặt thanh bên phải ngoài tầm nhìn */
                bottom: 0;
                z-index: 900; /* Đảm bảo thanh bên phải nằm trên các phần tử khác */
                width: 250px; /* Điều chỉnh độ rộng của thanh bên phải */
                height: 250px;
                background-color: #FFFFFF; /* Màu nền của thanh bên phải */
                padding: 20px; /* Khoảng cách giữa các phần tử trong thanh bên phải */
                overflow-y: auto;
                border-radius: 20px;
                align-items: center;
                transition: top 0.3s ease;
            }

            #rightBar.showlog
            {
                top: 30px;

            }
            .tg-userlogin {
                cursor: pointer; /* Thêm con trỏ trỏ tay khi hover vào phần tử */
            }
            .avatar
            {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                object-fit: cover;

            }
            .login-block
            {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .edit , .changepass, .logout
            {
                transition: transform 0.3s ease;

                border-radius: 45px;
            }
            .changepass:hover
            {
                color: orangered;
                transform: scale(1.1);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                ;
            }
            .logout:hover
            {
                color: orangered;
                transform: scale(1.1);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                ;
            }
            .edit:hover
            {
                color: orangered;
                transform: scale(1.1);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                ;
            }
           

            @keyframes shake {
                0% {
                    transform: translateY(-2px); /* Di chuyển lên */
                }
                50% {
                    transform: translateY(2px); /* Di chuyển xuống */
                }
                100% {
                    transform: translateY(-2px); /* Di chuyển lên */
                }
            }


        </style>
        <div id="tg-wrapper" class="tg-wrapper tg-haslayout">
            <!--************************************
                            Header Start
            *************************************-->
            <header id="tg-header" class="tg-header tg-haslayout">
                <div class="tg-topbar">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <ul class="tg-addnav">
                                    <li>
                                        <a href="javascript:void(0);">
                                            <i class="fas fa-address-book"></i>
                                            <em>Contact</em>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <i class="fas fa-question-circle"></i>
                                            <em>Help</em>
                                        </a>
                                    </li>
                                </ul>


                                <div class="tg-userlogin" onclick="toggleRightBar()">

                                    <figure><a  href="javascript:void(0);"><img src="${user.image}" alt="image description"></a></figure>
                                    <span>${user.userName}</span>
                                </div>
                                <div id="rightBar">
                                    <div class="login-block">
                                        <c:choose >
                                            <c:when test="${user.image==null}">
                                                <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="alt"/>
                                            </c:when>
                                            <c:otherwise>


                                                <img id="image-bar" class="avatar" src="${user.image}" alt="alt"/>

                                            </c:otherwise>
                                        </c:choose> 
                                        <h5> ${user.name}</h5>
                                        <div class="edit" >
                                            <a href="../EditProfileServlet" style=" color: Black; text-decoration:none ;font-size: 12px;text-height: 500">Edit Profile</a>
                                        </div>
                                        <div  class="changepass">
                                            <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="http://localhost:8080/SWPClubManegement/ChangePasswordServlet" > Change Password</a>
                                        </div>
                                        <div  class="logout">
                                            <a style="color: black; text-decoration:none; font-size: 12px;text-height: 500" href="http://localhost:8080/SWPClubManegement/LogoutServlet" > Logout</a>
                                        </div>
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tg-navigationarea">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <nav id="tg-nav" class="tg-nav">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#tg-navigation" aria-expanded="false">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                    <div id="tg-navigation" class="collapse navbar-collapse tg-navigation">
                                        <ul>

                                            <li class="menu-item-has-children">
                                                <a href="/SWPClubManegement/STORE/product.jsp">Home </a>

                                            </li>

                                            <li><a href="products.html">Best Selling</a></li>
                                            <li><a href="products.html">Weekly Sale</a></li>
                                            <li class="menu-item-has-children">
                                                <a href="/SWPClubManegement/NewsServlet">Latest News</a>

                                            </li>
                                            <li><a href="contactus.html">Contact</a></li>


                                            <li><a href="/SWPClubManegement/STORE/cartProduct.jsp"> Cart</a></li>


                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!--************************************
                            Header End
            *************************************-->
            <!--************************************
                            Inner Banner Start
            *************************************-->

            <!--************************************
                            Inner Banner End
            *************************************-->
            <!--************************************
                            Main Start
            *************************************-->



            <main id="tg-main" class="tg-main tg-haslayout">
                <!--************************************
                                News Grid Start
                *************************************-->
                <div class="tg-sectionspac tg-haslayout">
                    <div class="container-Confirm">
                        <div style="width: 30%">
                            <

                            <label for="address">Address:</label>
                            <input type="text" name="address" id="address" value="<%= address%>" readonly="">


                            <label for="city">Phone:</label>
                            <input type="text" name="phone" id="phone" value="<%= phone%>"readonly="">
                        </div>





                        <div class="products-section">
                            <h2>Order Summary</h2>
                            <div id="cart-items">
                                <!-- Gi? hàng s? ???c ?i?n vào ?ây -->
                            </div>
                            <h3>Total: <span id="cart-total">$0.00</span></h3>
                        </div>
                    </div>
                    <div class="pay-button">
                        <c:choose>
                            <c:when test="${status== 'success'}">
                                <p  class="status">Success</p>
                                <a class="go-stote-btn" href="/SWPClubManegement/STORE/product.jsp">Go back to store</a>
                            </c:when>
                            <c:otherwise>
                                <p style="color: red" class="status">Unpaid</p>
                                <div style="display: flex; gap: 40px; justify-content: center;">
                                    <a style="background-color: #000000; color: white" href="/SWPClubManegement/STORE/product.jsp">Go back </a>
                                    <a href="/SWPClubManegement/VNPAY/vnpay_pay.jsp">Payment </a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
        </div>



    </body>
<
        <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>


    <script>
        const user = ${user.userId};
        console.log(user);


        function toggleRightBar() {
            var rightBar = document.getElementById("rightBar");
            rightBar.classList.toggle("showlog"); // Thêm hoặc loại bỏ lớp "show"
        }

        function encryptData(data, key) {
            const encryptedData = CryptoJS.AES.encrypt(JSON.stringify(data), key).toString();
            return encryptedData;
        }
        // lấy lại khi cần thiết
        function decryptData(encryptedData, key) {
            const decryptedBytes = CryptoJS.AES.decrypt(encryptedData, key);
            const decryptedData = JSON.parse(decryptedBytes.toString(CryptoJS.enc.Utf8));
            return decryptedData;
        }
        function renderCart() {
            const cartItems = document.getElementById('cart-items');
            cartItems.innerHTML = '';
            let total = 0;

            cart.forEach(item => {

                const itemTotal = parseFloat(item.price) * item.quantity;
                total += itemTotal;

                const row = document.createElement("div");
                row.classList.add('sub-item');
                row.innerHTML =
                        '<img src="' + item.image + '">' +
                        '<div class="cart-item-details">' +
                        '<h5>' + item.name + '</h5>' +
                        '<p>Size: ' + item.size + '</p>' +
                        '<p>Price: ' + item.price + '</p>' +
                        '<p>Quantity: ' + item.quantity + '</p>' +
                        '<p>Total: $' + itemTotal.toFixed(2) + '</p>' +
                        '</div>';

                cartItems.appendChild(row);
            });

            document.getElementById('cart-total').textContent = '$' + total.toFixed(2);
        }

        function completePurchase() {
            alert('Purchase Complete!');
            // Implement further purchase logic here
        }
        function loadCart() {
            const storedCart = sessionStorage.getItem('orderItem' + user);
            if (storedCart) {
                cart = JSON.parse(storedCart);
                renderCart();
            } else
            {
                alert('empty');
            }
            console.log(cart);
        }

        window.onload = function () {

            loadCart();
            // Thêm s? ki?n input ?? ki?m tra ??u vào
            const phoneInput = document.getElementById('phone');
            phoneInput.addEventListener('input', function (e) {
                const value = e.target.value;
                e.target.value = value.replace(/[^0-9]/g, '').slice(0, 10); // Ch? cho phép s? và gi?i h?n ?? dài 10 ký t?
            });
            // Lấy giá trị của tổng từ phần tử <span>
            const totalElement = document.getElementById('cart-total');
            if (totalElement) {
                const totalValue = totalElement.textContent.slice(1).trim();
                console.log("Total Value: " + parseFloat(totalValue * 22000).toFixed(0)); // Debugging: Kiểm tra giá trị của totalValue

                // Tìm phần tử <a> cần gán giá trị
                const payLink = document.querySelector('a[href="/SWPClubManegement/VNPAY/vnpay_pay.jsp"]');
                var payValue = parseFloat(totalValue * 22000).toFixed(0);
                // Gán giá trị vào thuộc tính href của thẻ <a>
                if (payLink) {
                    payLink.href += '?total=' + payValue;
                    console.log("Updated href: " + payLink.href); // Debugging: Kiểm tra giá trị của href mới
                }

            } else {
                console.error("Không tìm thấy phần tử có id 'cart-total'");
            }

            const pElement = document.querySelector('.status');
            if (pElement && pElement.textContent.trim() === 'Success') {
                paySubmit();
            }


        };

        function removeAfterFinish()
        {
            sessionStorage.removeItem('itemTrue');


            let cartRemove = decryptData(localStorage.getItem('usercart_' + user), "swp"+user);


            console.log("before" + cartRemove);
            cartRemove.forEach((item, index) => {
                if (item.selected === true)
                {
                    cartRemove.splice(index, 1);
                }
            });


            const encryptedCart = encryptData(cartRemove, "swp"+user);

            localStorage.setItem('usercart_' + user, encryptedCart);

//            let cart = JSON.parse(sessionStorage.getItem('usercart' + user));
//            console.log("after" + sessionStorage.getItem('usercart' + user));

        }

        function paySubmit()
        {


            const total = document.querySelector('#cart-total').textContent.slice(1);
            const address = encodeURIComponent(document.getElementById('address').value);
            const phone = encodeURIComponent(document.getElementById('phone').value);
            console.log(total);
            const url = '/SWPClubManegement/JerseyPaymentServlet?address=' + address + '&phone=' + phone + '&money=' + total;


            {
                fetch(url, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(cart)
                })
                        .then(response => {
                            if (!response.ok) {
                                alert("Network not okay");
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log(data);
                            removeAfterFinish();
                            loadCart();
                        })
                        .catch(error => {
                            alert(error);
                            throw new Error(error);
                        });
            }
        }



    </script>
</html>
