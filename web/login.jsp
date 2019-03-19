<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Form</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/loginstyle.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>

<div class="login">
    <h1>Login</h1>
    <form method="post" action="html/index.jsp">
        <input type="text" name="username" placeholder="Username" required="required"/>
        <input type="password" name="password" placeholder="Password" required="required"/>
        <button type="submit" class="btn btn-primary btn-block btn-large">登录</button>
    </form>
</div>

<script src="js/loginindex.js"></script>
</body>

</html>
