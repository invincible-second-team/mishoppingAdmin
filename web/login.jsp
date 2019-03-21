<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginstyle.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>

<body>

<div class="login">
    <h1>Login</h1>
    <div class="notice" style="color: red; text-align: center; margin-bottom: 15px">${msg}</div>
    <form method="post" action="">
        <input type="text" name="adminname" placeholder="Username" required="required"/>
        <input type="password" name="adminpassword" placeholder="Password" required="required"/>
        <button type="button" class="btn btn-primary btn-block btn-large">登录</button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/js/loginindex.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        var flag = false;

        $("input:lt(2)").focus(function () {
            $(".notice").text("");
        });

        $("button").click(function () {
            var adminname = $("input:first").val();
            var adminpassword = $("input:eq(1)").val();

            if (adminname.length === 0 || adminpassword.length === 0) {
                $(".notice").text("账号或不能为空");
                return;
            }

            if (flag) {
                return;
            }
            flag = true;
            $.ajax({
                url: "/admin?method=login",
                type: "post",
                data: {
                    "adminname": adminname,
                    "adminpassword": adminpassword
                },
                dataType: "json",
                cache: false,
                success: function (data) {
                    flag = false;
                    if (data === true) {
                        location.href = "/html/index.jsp";
                    } else {
                        $(".notice").text("账号或密码错误");
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
