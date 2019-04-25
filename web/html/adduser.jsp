<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>


<head>
    <title>添加用户</title>
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
<input type="hidden" value="1">
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
                                    <div class="title">添加用户</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="exampleInputusername">账户</label>
                                        <input type="username" class="form-control" id="exampleInputusername"
                                               placeholder="Enter Username">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputuPassword">密码</label>
                                        <input type="password" class="form-control" id="exampleInputuPassword"
                                               placeholder="Enter password">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputnickname">昵称</label>
                                        <input type="nickname" class="form-control" id="exampleInputnickname"
                                               placeholder="Enter Nickname">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputuphone">电话号码</label>
                                        <input type="uphone" class="form-control" id="exampleInputuphone"
                                               placeholder="Enter phone">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>

                                    <button type="button" class="btn btn-default" id="usersubmit">Submit</button>
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
        <script type="text/javascript" src="../js/adduser.js"></script>
    </div>
</div>
</body>

</html>
