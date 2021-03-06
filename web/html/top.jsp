<%@page pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Cache" content="no-cache">

<nav class="navbar navbar-default navbar-fixed-top navbar-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-expand-toggle">
                <i class="fa fa-bars icon"></i>
            </button>
            <ol class="breadcrumb navbar-breadcrumb">
                <li class="active">mishoppingAdmin</li>
                <li class="active time"></li>
            </ol>
            <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                <i class="fa fa-th icon"></i>
            </button>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                <i class="fa fa-times icon"></i>
            </button>

            <li class="dropdown profile">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-expanded="false">${loginAdmin.adminname} <span class="caret"></span></a>
                <ul class="dropdown-menu animated fadeInDown">
                    <li class="profile-img">
                        <img src="${pageContext.request.contextPath}/img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                    </li>
                    <li>
                        <div class="profile-info">
                            <h4 class="username">${loginAdmin.adminname}</h4>
                            <div class="btn-group margin-bottom-2x" role="group">
                                <button type="button" class="btn btn-default logout"><i class="fa fa-sign-out"></i>
                                    Logout
                                </button>
                            </div>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="side-menu sidebar-inverse">
    <nav class="navbar navbar-default" role="navigation">
        <div class="side-menu-container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <div class="icon fa fa-paper-plane"></div>
                    <div class="title">mishoppingAdmin</div>
                </a>
                <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                    <i class="fa fa-times icon"></i>
                </button>
            </div>

            <ul class="nav navbar-nav">
                <li class="li">
                    <a href="${pageContext.request.contextPath}/html/index.jsp">
                        <span class="icon fa fa-tachometer"></span><span class="title">欢迎界面</span>
                    </a>
                </li>
                <li class="li panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-element">
                        <span class="icon glyphicon glyphicon-user"></span><span class="title">用户</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-element" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="${pageContext.request.contextPath}/html/adduser.jsp">添加用户</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/html/usermanage.jsp">用户管理</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="li panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-table">
                        <span class="icon glyphicon glyphicon-shopping-cart"></span><span class="title">商品</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-table" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="${pageContext.request.contextPath}/product?method=productManage">商品管理</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/html/addproduct.jsp">添加商品</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li class="li panel panel-default dropdown">
                    <a data-toggle="collapse" href="#dropdown-form">
                        <span class="icon fa fa-file-text-o"></span><span class="title">订单</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="dropdown-form" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="${pageContext.request.contextPath}/html/ordermanage.jsp">订单管理</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li class="li panel panel-default dropdown">
                    <a data-toggle="collapse" href="#component-example">
                        <span class="icon fa fa-cubes"></span><span class="title">管理员</span>
                    </a>
                    <!-- Dropdown level 1 -->
                    <div id="component-example" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav navbar-nav">
                                <li><a href="${pageContext.request.contextPath}/admin?method=adminList">管理员管理</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/html/addadmin.jsp">添加管理员</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/html/changepass.jsp">修改密码</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/admin?method=logList">查看日志</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>
<script src="${pageContext.request.contextPath}/lib/js/jquery-3.3.1.js"></script>
<script>
    $(function () {
        var hidden = $("[type='hidden']").val();
        $(".li:eq(" + hidden + ")").addClass("active");

        $(".logout").click(function () {
            window.location.href = "${pageContext.request.contextPath}/admin?method=logout";
        });
        date();
    });
    setInterval(function () {
        date();
    }, 500);

    //js 获取当前时间
    function date() {
        var date = new Date();
        var year = date.getFullYear();//当前年份
        var month = date.getMonth();//当前月份
        var data = date.getDate();//天
        var hours = date.getHours();//小时
        var minute = date.getMinutes();//分
        var second = date.getSeconds();//秒
        var time = year + "-" + checkNum((month + 1)) + "-" + checkNum(data) + " " + checkNum(hours) + ":" + checkNum(minute) + ":" + checkNum(second);
        $(".time").text("当前时间：" + time)
    }

    //补位 当某个字段不是两位数时补0
    function checkNum(str) {
        return str >= 10 ? str : "0" + str;
    }
</script>