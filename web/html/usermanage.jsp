<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <c:if test="${empty requestScope.users}">
        <c:redirect url="/User?method=usersList"></c:redirect>
    </c:if>
    <title>用户管理</title>
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
<input type="hidden" value="1">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="page-title">
                    <span class="title">用户管理</span>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <table id="data-table"   class="datatable table table-striped" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th >用户账号</th>
                                        <th >昵称</th>
                                        <th >电话号码</th>
                                        <th >状态</th>
                                        <th width="25%">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${requestScope.users}" varStatus="s">
                                        <tr >
                                            <input type="hidden" value="${user.uid}">
                                        <td>${user.uname}</td>
                                        <td>${user.nickname}</td>
                                        <td>${user.uphone}</td>
                                            <c:if test="${user.ustate eq 1}">
                                                <td class="blockstate" style="color: black">正常</td>
                                            </c:if>
                                            <c:if test="${user.ustate eq 0}">
                                                <td class="blockstate" style="color: red">锁定</td>
                                            </c:if>

                                        <td>
                                            <button type="button" class="btn btn-info modificition" data-toggle="modal"  data-target="#modificition">修改资料</button>
                                            <button type="button" class="btn btn-success unblock">修改状态</button>
                                            <button type="button" class="btn btn-danger delete">删除账号</button>
                                        </td>
                                        </tr>
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
    <!-- Modal -->
    <div class="modal fade" id="modificition" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改资料</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="mnickename" class="col-sm-2 control-label" >昵称</label>
                            <div class="col-sm-9">
                                <input type="text" id="mnickename" class="form-control well" value="" placeholder="昵称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="muphone" class="col-sm-2 control-label">电话号码</label>
                            <div class="col-sm-9">
                                <input type="text" id="muphone" class="form-control well" placeholder="电话号码"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mupassword" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-9">
                                <input type="password" id="mupassword" class="form-control well" placeholder="密码"/>
                            </div>
                        </div>
                        <span class="information col-sm-offset-2"></span>
                    </form>
                    <div class="col-sm-offset-2 modalButton">
                        <button class="btn btn-success add">确定</button>
                        <button class="btn btn-info" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
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
        <script type="text/javascript" src="js/usermanage.js"></script>
    </div>
</div>
</body>

</html>
