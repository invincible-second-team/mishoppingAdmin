<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<input type="hidden" value="4">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title">修改密码</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="password1">原始密码</label>
                                        <input type="password" class="form-control" id="password1"
                                               placeholder="Original Password">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="password2">新密码</label>
                                        <input type="password" class="form-control" id="password2"
                                               placeholder="New Password">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="password3">重复密码</label>
                                        <input type="password" class="form-control" id="password3"
                                               placeholder="Password Again">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <button type="button" class="btn btn-default submit">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <div>
        <!-- Javascript Libs -->
        <script type="text/javascript" src="../lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="../lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="../lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="../lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="../lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="../lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="../lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="../lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="../js/app.js"></script>
        <script>
            $(function () {
                /**
                 * 焦点失去时验证原始密码
                 */
                $("#password1").blur(function () {
                    checkOldPassword();
                });

                /**
                 * 焦点失去时验证新密码
                 */
                $("#password2").blur(function () {
                    checkNewPassword();
                });

                /**
                 * 焦点失去时验证重复密码
                 */
                $("#password3").blur(function () {
                    checkNewPassword2();
                });

                /**
                 * 提交时验证并向后台发送请求
                 */
                $(".submit").click(function () {
                    if ($(".span:first").text() !== "密码正确" || !checkNewPassword() || !checkNewPassword2()) {
                        return;
                    }

                    var newPassword = $("#password2").val();
                    $.ajax({
                        url: "../admin?method=updatePassword",
                        cache: false,
                        type: "post",
                        dataType: "json",
                        data: {
                            "newPassword": newPassword
                        },
                        success: function (data) {
                            if (data === true) {
                                <%
                                    session.setAttribute("msg", "密码已修改，请重新登录！");
                                %>
                                window.location.href = "../login.jsp";
                            } else {
                                $(".card-body").html("<span style='font-size: 20px; font-weight: bold;'>修改失败</span>");
                            }
                        }
                    })
                })
            });

            /**
             * 验证原始密码
             */
            function checkOldPassword() {
                var password = $("#password1").val();

                if (password === "" || password === null) {
                    $(".span:first").html("<img src='img/error.png'>密码不能为空").css("color", "red");
                    return;
                }

                $.ajax({
                    url: "../admin?method=checkPassword",
                    cache: false,
                    type: "post",
                    dataType: "json",
                    data: {
                        "password": password
                    },
                    success: function (data) {
                        if (data === false) {
                            $(".span:first").html("<img src='img/error.png'>密码错误").css("color", "red");
                        } else {
                            $(".span:first").html("<img src='img/green.png'>密码正确").css("color", "green");
                        }
                    },
                    error: function () {
                        alert("请求出错");
                    }
                });
            }

            /**
             * 验证新密码
             */
            function checkNewPassword() {
                var adminpassword = $("#password2").val();

                var reg = /^[\w_-]{6,16}$/;
                if (adminpassword.length === 0 || adminpassword === null) {
                    $(".span:eq(1)").html("<img src='img/error.png'>新密码不能为空").css("color", "red");
                    return false;
                } else if (!reg.test(adminpassword)) {
                    $(".span:eq(1)").html("<img src='img/error.png'>新密码长度必须为6-18位字符").css("color", "red");
                    return false;
                } else {
                    $(".span:eq(1)").html("<img src='img/green.png'>新密码长度为6-18位字符").css("color", "green");
                    return true;
                }
            }

            /**
             * 验证重复密码
             */
            function checkNewPassword2() {
                var adminpassword = $("#password2").val();
                var adminpassword2 = $("#password3").val();

                if (adminpassword2.length === 0 || adminpassword === null) {
                    $(".span:eq(2)").html("<img src='img/error.png'>请再次填写新密码").css("color", "red");
                    return false;
                } else if (adminpassword !== adminpassword2) {
                    $(".span:eq(2)").html("<img src='img/error.png'>两次密码不一致").css("color", "red");
                    return false;
                } else {
                    $(".span:eq(2)").html("<img src='img/green.png'>").css("color", "green");
                    return true;
                }
            }
        </script>
    </div>
</div>
</body>

</html>
