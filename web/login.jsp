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
    <form method="post" action="">
        <input type="text" name="adminname" placeholder="Username" required="required"/>
        <input type="password" name="adminpassword" placeholder="Password" required="required"/>
        <button type="button" class="btn btn-primary btn-block btn-large">登录</button>
    </form>
</div>

<script src="js/loginindex.js"></script>
<script src="lib/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        var flag = false;
        $("input:lt(2)").focus(function () {
           $(".notice").remove();
        });

        $("button").click(function () {
            if (flag) {
                return;
            }
            flag = true;
            var adminname = $("input:first").val();
            var adminpassword = $("input:eq(1)").val();
            $.ajax({
                url: "/admin?method=login",
                type: "post",
                data: {
                    "adminname": adminname,
                    "adminpassword": adminpassword
                },
                dataType: "json",
                success: function (data) {
                    flag = false;
                    if (data === true) {
                        location.href = "html/index.jsp";
                    } else {
                        if ($(".notice").length === 0) {
                            $("input:eq(0)").before("<div class='notice' style='color:red'>账号或密码错误</div>");
                        }
                    }
                },
                error: function () {
                    alert("请求出错");
                }
            });
        })
    })
</script>
</body>

</html>
