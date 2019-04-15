<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>管理员管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/themes/flat-blue.css">
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
                    <div>
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title">管理员管理</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="datatable table table-striped" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th width="80%">管理员账号</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>管理员账号</th>
                                        <th>操作</th>
                                    </tr>
                                    </tfoot>
                                    <tbody class="tbody">
                                    <c:forEach var="admin" items="${admins}">
                                        <c:if test="${admin.adminname != sessionScope.loginAdmin.adminname}">
                                            <tr>
                                                <td>${admin.adminname}</td>
                                                <td>
                                                    <button type="button" class="btn btn-info reset">重置密码</button>
                                                    <button type="button" class="btn btn-danger delete">删除账号</button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
        <script type="text/javascript" src="lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="js/app.js"></script>
        <script>
            $(function () {
                /**
                 * 重置密码为666666
                 */
                $(document).on("click", ".reset", function () {
                    var val = $(this).parent().prev().text();

                    $.ajax({
                        url: "admin?method=reset",
                        cache: false,
                        type: "post",
                        dataType: "json",
                        data: {
                            "adminname": val
                        },

                        success: function (data) {
                            var span;
                            if (data === true) {
                                span = "<span style='font-size: 20px; font-weight: bold;'>密码重置成功，重置密码为666666</span>";
                            } else {
                                span = "<span style='font-size: 20px; font-weight: bold;'>密码重置失败</span>";
                            }
                            span += '<div><button type="button" class="btn btn-info returnBefore">返回上一页</button></div>';
                            $(".card-body").html(span);
                        },
                        error: function () {
                            alert("test");
                        }
                    });
                });

                /**
                 * 返回上一页时重新加载本页面
                 */
                $(document).on("click", ".returnBefore", function () {
                    window.location.reload();
                });

                /**
                 * 删除管理员
                 */
                $(document).on("click", ".delete", function () {
                    var val = $(this).parent().prev().text();

                    $.ajax({
                        url: "admin?method=delete",
                        cache: false,
                        type: "get",
                        dataType: "json",
                        data: {
                            "adminname": val
                        },

                        success: function (data) {
                            if (data === true) {
                                $(".card-body").html("<div><span style='font-size: 20px; font-weight: bold;'>删除成功</span></div>" +
                                    "<button class='btn btn-info reParent'>返回上一级</button>");
                            } else {
                                $(".card-body").html("<div><span style='font-size: 20px; font-weight: bold;'>删除失败</span></div>" +
                                    "<button class='btn btn-info reParent'>返回上一级</button>");
                            }
                        },
                        error: function () {
                            alert("服务器异常！");
                        }
                    });
                });

                $(document).on("click", ".reParent", function () {
                    window.location.href = "admin?method=adminList";
                })
            });
        </script>
    </div>
</div>
</body>

</html>
