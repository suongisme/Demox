<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
    <!-- Link to Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .forgot-password {
            font-size: 14px;
        }
        .btn-login {
            width: 100%;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <%@include file="../INCLUDES/nav.jsp" %>
    <div class="container">
        <h1 class="my-4 text-center">Login</h1>
        <form action="http://localhost:8080/SWPClubManegement/LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Email:</label>
                <input type="email" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <a href="RePass.jsp" class="forgot-password">Forgot password?</a>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-login">Login</button>
            </div>
            ${error}
            <%session.removeAttribute("error");%>
        </form>
    </div>
    <!-- Link to Bootstrap JS and dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
