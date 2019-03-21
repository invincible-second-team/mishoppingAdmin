<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>添加管理员</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/themes/flat-blue.css">
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
                                    <div class="title">添加管理员</div>
                                </div>
                            </div>
                            <div class="card-body form-div">
                                <form>
                                    <div class="form-group">
                                        <label for="adminname">账号</label>
                                        <input type="text" class="form-control" id="adminname" name="adminname"
                                               placeholder="Account">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminpassword">密码</label>
                                        <input type="password" class="form-control" id="adminpassword"
                                               name="adminpassword"
                                               placeholder="Password">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="adminpassword2">重复密码</label>
                                        <input type="password" class="form-control" id="adminpassword2"
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
        <script type="text/javascript" src="/lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="/lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="/lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="/lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="/lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="/lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="/lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="/lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="/lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="/lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="/js/app.js"></script>
        <script type="text/javascript" src="/js/active.js"></script>

        <script>
            $("#adminname").blur(function () {
               checkAccount();
            });

            $("#adminpassword").blur(function () {
                checkPassword();
            });

            $("#adminpassword2").blur(function () {
                checkPassword2();
            });

            $(".submit").click(function () {
                var spanText = $(".span:first").text();

                if (spanText !== "该账号可以注册" || !checkPassword() || !checkPassword2()){
                    return;
                }
                var adminname = $("#adminname").val();
                var adminpassword = $("#adminpassword").val();
                $.ajax({
                    url: "/admin?method=addAdmin",
                    cache: false,
                    type: "post",
                    dataType: "json",
                    data: {
                        "adminname": adminname,
                        "adminpassword": adminpassword
                    },
                    success: function (data) {
                        if (data === true) {
                            $(".form-div").html("<span style='font-size: 20px; font-weight: bold;'>添加成功</span>");
                        } else {
                            $(".form-div").html("<span style='font-size: 20px; font-weight: bold;'>添加失败</span>");
                        }
                    }
                })
            });

            function checkAccount() {
                var adminname = $("#adminname").val();
                var reg = /^[A-z_][\w_-]{4,15}$/;

                if (adminname.length === 0 || adminname === null) {
                    $(".span:first").html("<img src='/img/error.png'>账号不能为空").css("color", "red");
                    return;
                }
                if (!reg.test(adminname)){
                    $(".span:first").html("<img src='/img/error.png'>账号必须以字母下划线开头，5-16为字符").css("color", "red");
                    return;
                }
                $.ajax({
                    url: "/admin?method=checkAdminName",
                    cache: false,
                    type: "post",
                    dataType: "json",
                    data: {
                        "adminname": adminname
                    },
                    success: function (data) {
                        if (data === false) {
                            $(".span:first").html("<img src='/img/error.png'>该账号已注册").css("color", "red");
                        } else {
                            $(".span:first").html("<img src='/img/green.png'>该账号可以注册").css("color", "green");
                        }
                    }
                });
            }
            function checkPassword() {
                var adminpassword = $("#adminpassword").val();

                var reg = /^[\w_-]{6,16}$/;
                if (adminpassword.length === 0 || adminpassword === null) {
                    $(".span:eq(1)").html("<img src='/img/error.png'>密码不能为空").css("color", "red");
                    return false;
                } else if (!reg.test(adminpassword)) {
                    $(".span:eq(1)").html("<img src='/img/error.png'>密码长度必须为6-18位字符").css("color", "red");
                    return false;
                } else {
                    $(".span:eq(1)").html("<img src='/img/green.png'>密码长度为6-18位字符").css("color", "green");
                    return true;
                }
            }
            function checkPassword2() {
                var adminpassword = $("#adminpassword").val();
                var adminpassword2 = $("#adminpassword2").val();

                if (adminpassword2.length === 0 || adminpassword === null) {
                    $(".span:eq(2)").html("<img src='/img/error.png'>请再次填写密码").css("color", "red");
                    return false;
                } else if (adminpassword !== adminpassword2) {
                    $(".span:eq(2)").html("<img src='/img/error.png'>两次密码不一致").css("color", "red");
                    return false;
                } else {
                    $(".span:eq(2)").html("<img src='/img/green.png'>").css("color", "green");
                    return true;
                }
            }
        </script>
    </div>
</div>
</body>

</html>
