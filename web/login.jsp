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
        <input type="text" name="phone" placeholder="phone" required="required" style="width: 58%"/>
        <button type="button" class="btn btn-primary getValidation" name="getValidation"
                style="width: 40%; height: 34px">获取验证码
        </button>
        <input type="text" name="verificationcode" placeholder="Verification code" required="required"/>
        <button type="button" class="btn btn-primary btn-block btn-large loginBtn">登录</button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/js/loginindex.js"></script>
<script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        // var flag = false;

        $("input").focus(function () {
            $(".notice").text("");
        });


        $(".getValidation").click(function () {
            var reg = /^1[34578]\d{9}$/;
            var phone = $('input[name="phone"]').val();
            if (!reg.test(phone)) {
                $(".notice").text("手机号格式错误！");
                return
            }

            var data = {
                "phone": phone
            };
            $.get("login?method=validation", data, function () {
                console.log("发送成功");
            });


            var i = 10;
            $(".getValidation").attr('disabled', true);
            var timer = setInterval(function () {
                $(".getValidation").text(i + "s后重发");
                if (i === 0) {
                    clearInterval(timer);
                    $(".getValidation").attr('disabled', false).text("获取验证码");
                }
                i--;
            }, 1000);

        });

        $(".loginBtn").click(function () {
            var adminname = $("input:first").val();
            var adminpassword = $("input:eq(1)").val();
            var code = $('input[name="verificationcode"]').val();

            if (adminname.length === 0 || adminpassword.length === 0) {
                $(".notice").text("账号或密码不能为空");
                return;
            }

            // if (flag) {
            //     return;
            // }
            // flag = true;
            $.ajax({
                url: "login",
                type: "post",
                data: {
                    "method": "login",
                    "adminname": adminname,
                    "adminpassword": adminpassword,
                    "verificationcode": code
                },
                dataType: "json",
                cache: false,
                success: function (data) {
                    // flag = false;
                    if (data === 2) {
                        location.href = "html/index.jsp";
                    } else if (data === 1) {
                        $(".notice").text("验证码错误");
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
