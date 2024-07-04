<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->

        <!-- Custom styles for this template -->
        <link href="../CSS/VNPAY/bootstrap.min.css" rel="stylesheet">
        <link href="../CSS/VNPAY/jumbotron-narrow.css" rel="stylesheet"> 
        <link href="../CSS/VNPAY/jquery-1.11.3.min.js" rel="stylesheet">      


        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>

    <body>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .header {
                margin-bottom: 20px;
            }
            .header .text-muted {
                color: #6c757d;
            }
            h3 {
                color: #007bff;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            h4, h5 {
                margin-top: 20px;
                margin-bottom: 10px;
                font-weight: bold;
                color: #333;
            }
            .form-group input[type="radio"] {
                margin-right: 10px;
            }
            .form-inline {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }
            .form-inline label {
                margin: 0;
                margin-left: 5px;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-align: center;
                text-decoration: none;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            .footer {
                text-align: center;
                margin-top: 20px;
                color: #6c757d;
            }
        </style>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">VNPAY</h3>
            </div>
            <h3>Tạo mới đơn hàng</h3>
            <div class="table-responsive">
                <form action="/SWPClubManegement/ajaxServlet" id="frmCreateOrder" method="post">        
                    <div class="form-group">
                        <label for="amount">Số tiền</label>
                        <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="<%= request.getParameter("total") != null ? request.getParameter("total") : ""%>" readonly="" />
                    </div>
                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <div class="form-inline">
                            <input type="radio" checked="true" id="bankCode1" name="bankCode" value="">
                            <label for="bankCode1">Cổng thanh toán VNPAYQR</label>
                        </div>

                        <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                        <div class="form-inline">
                            <input type="radio" id="bankCode2" name="bankCode" value="VNPAYQR">
                            <label for="bankCode2">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label>
                        </div>

                        <div class="form-inline">
                            <input type="radio" id="bankCode3" name="bankCode" value="VNBANK">
                            <label for="bankCode3">Thanh toán qua thẻ ATM/Tài khoản nội địa</label>
                        </div>

                        <div class="form-inline">
                            <input type="radio" id="bankCode4" name="bankCode" value="INTCARD">
                            <label for="bankCode4">Thanh toán qua thẻ quốc tế</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <div class="form-inline">
                            <input type="radio" id="language1" checked="true" name="language" value="vn">
                            <label for="language1">Tiếng việt</label>
                        </div>
                        <div class="form-inline">
                            <input type="radio" id="language2" name="language" value="en">
                            <label for="language2">Tiếng anh</label>
                        </div>
                    </div>
                    <button type="submit" class="btn">Thanh toán</button>
                </form>
            </div>
            <p>&nbsp;</p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>       
    </body>
</html>