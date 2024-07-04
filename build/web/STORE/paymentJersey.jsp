<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Orders</title>
        <!-- Bootstrap core CSS -->
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
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>
        <style>
            .container-PayForm {
                display: flex;
                justify-content: space-between;
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                font-family: Arial, sans-serif;
            }

            /* Headings */
            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            h3 {
                text-align: center;
                color: #333;
            }

            /* Form Styles */
            form {
                display: flex;
                flex-direction: column;
                gap: 15px;
                margin-bottom: 20px;
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
            }

            input[type="submit"] {
                padding: 10px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Order Summary Styles */
            .products-section {
                margin-top: 20px;
            }

            #cart-items {

                display: flex;
                flex-direction: column;

                margin-bottom: 20px;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
                overflow-y: scroll;
                max-height: 500px;
            }

            #cart-total {
                font-size: 20px;
                font-weight: bold;
            }
            #cart-item:last-child {
                border-bottom: none;
            }

            .cart-item-details {

                flex-grow: 1; /* Take remaining space */
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
            .sub-item
            {

                width: 100%;
                display: flex;
                border: black solid 1px;
            }
            #rightBar
            {

                position: fixed;
                top: -300px;
                right: 10px; /* Ban ??u ??t thanh bên ph?i ngoài t?m nhìn */
                bottom: 0;
                z-index: 900; /* ??m b?o thanh bên ph?i n?m trên các ph?n t? khác */
                width: 250px; /* ?i?u ch?nh ?? r?ng c?a thanh bên ph?i */
                height: 250px;
                background-color: #FFFFFF; /* Màu n?n c?a thanh bên ph?i */
                padding: 20px; /* Kho?ng cách gi?a các ph?n t? trong thanh bên ph?i */
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
                cursor: pointer; /* Thêm con tr? tr? tay khi hover vào ph?n t? */
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
            

            /* Responsive Design */
            @media (max-width: 768px) {
                .container {
                    width: 95%;
                }

                form {
                    width: 100%;
                }

                #cart-items {
                    width: 100%;
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
                                    <figure><a href="javascript:void(0);"><img src="${user.image}" alt="image description"></a></figure>
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
                    <div class="container">
                        <div class="row">
                            <div class="container-PayForm">
                                <div class="checkout-section" style="width: 40%">
                                    <h2>Shipping Information</h2>
                                    <form id="shipping-form"  action="/SWPClubManegement/STORE/ConfirmOrder.jsp"">

                                        <label for="address">Address:</label>
                                        <input type="text" id="address" name="address" required>

                                        <label for="city">Phone:</label>
                                        <input type="text" id="phone" name="phone" required>

                                        <input type="submit" value="Pay"/>


                                    </form>
                                </div>

                                <div class="checkout-content" style="width: 50%">
                                    <div class="products-section" >
                                        <h2>Order Summary</h2>
                                        <div id="cart-items">
                                            <!-- Gi? hàng s? ???c ?i?n vào ?ây -->
                                        </div>
                                        <h3>Total: <span id="cart-total">$0.00</span></h3>
                                    </div>


                                </div>
                            </div>

                        </div>




                    </div>
                </div>
        </div>



    </body>
    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script>
        let cart = [];
        const user = ${user.userId};
        console.log(user);
        function saveCart()
        {
            sessionStorage.setItem('usercart' + user, JSON.stringify(cart));
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
        function toggleRightBar() {
            var rightBar = document.getElementById("rightBar");
            rightBar.classList.toggle("showlog"); // Thêm ho?c lo?i b? l?p "show"
        }
        function completePurchase() {
            alert('Purchase Complete!');
            // Implement further purchase logic here
        }
        function loadCart() {
            const storedCart = sessionStorage.getItem('itemTrue' + user);
            if (storedCart) {
                cart = JSON.parse(storedCart);
                renderCart();
            } else
            {
                alert('empty');
            }
            sessionStorage.setItem('orderItem' + user, JSON.stringify(cart));
            console.log(cart);
            console.log(sessionStorage.getItem('orderItem' + user));
        }

        window.onload = function () {

            loadCart();
            // Thêm s? ki?n input ?? ki?m tra ??u vào
            const phoneInput = document.getElementById('phone');
            phoneInput.addEventListener('input', function (e) {
                const value = e.target.value;
                e.target.value = value.replace(/[^0-9]/g, '').slice(0, 10); // Ch? cho phép s? và gi?i h?n ?? dài 10 ký t?
            });
        };
        function removeAfterFinish()
        {
            sessionStorage.removeItem('itemTrue');

            let cartRemove = JSON.parse(sessionStorage.getItem('usercart' + user));
            cartRemove.forEach((item, index) => {
                if (item.selected === true) {
                    removeItem(index);
                }
            });
        }
        function removeItem(index) {
            cart.splice(index, 1);
            renderCart();
            saveCart();
        }
        function paySubmit(event)
        {
            event.preventDefault();
            const moneyInput = document.querySelector('input[name="money"]').value;
            const total = document.querySelector('#cart-total').textContent.slice(1);
            const address = encodeURIComponent(document.getElementById('address').value);
            const phone = encodeURIComponent(document.getElementById('phone').value);
            console.log(total);
            const url = '/SWPClubManegement/JerseyPaymentServlet?address=' + address + '&phone=' + phone + '&money=' + moneyInput;

            if (parseFloat(moneyInput) !== parseFloat(total))
            {
                alert('please pay enough money');
                return;
            } else
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
                            if (data.status === 'error')
                            {


                                alert(data.message);
                                return;
                            }
                            removeAfterFinish();
                        })
                        .catch(error => {
                            alert(error);
                            throw new Error(error);
                        });
            }
        }

    </script>
</html>
