<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <c:if test="${empty requestScope.ordersList}">
        <c:redirect url="/Order?method=ordersList&state=0"></c:redirect>
    </c:if>
    <title>订单管理</title>
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
<input type="hidden" value="3">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container-fluid">
            <div class="side-body">
                <div class="page-title">
                    <span class="title">订单管理</span>
                </div>
                <table>
                    <tr>
                        <td width="1100px">
                            <ul id="myTab" class="nav nav-pills">
                                <li id="no_li"><a href="#home" role="tab" data-toggle="pill" >未发货<span
                                        class="badge nobadge">${requestScope.ordersList["nosendcount"]}</span></a></li>
                                <li id="has_li"><a href="#profile" role="tab" data-toggle="pill">已发货<span
                                        class="badge hasbadge">${requestScope.ordersList["hassendcount"]}</span></a></li>
                                <li id="sign_li"><a href="#messages" role="tab" data-toggle="pill">已签收<span
                                        class="badge signbadge">${requestScope.ordersList["signsendcount"]}</span></a></li>
                                <li id="error_li"><a href="#settings" role="tab" data-toggle="pill">异常订单<span
                                        class="badge errorbadge">${requestScope.ordersList["errorsendcount"]}</span></a></li>
                            </ul>
                        </td>
                        <td >
                            <div><button  type="button" class="btn btn-block"><a href="html/chart.jsp">生成报表</a></button></div>
                        </td>
                    </tr>
                </table>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="datatable table table-striped nosend_table" cellspacing="0"
                                               width="100%">
                                            <thead>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th width="20%">收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th  width="35%">收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach var="n" items="${ordersList.nosendList}">
                                                <tr>
                                                    <input type="hidden" value="${n.oid}">
                                                        <td>${n.onum}</td>
                                                        <td>${n.ocreatetime}</td>
                                                        <td>${n.oupdatetime}</td>
                                                        <td>${n.nickname}</td>
                                                        <td>${n.aphone}</td>
                                                        <td>${n.addr}</td>
                                                        <td>${n.ostate eq 0?"未发货":"异常"}</td>
                                                        <td>
                                                            <button type="button" class="btn btn-info sendgoods">发货</button>
                                                            <button type="button" class="btn btn-success goodsdetails"><a href="Order?method=showdetails&oid=${n.oid}">查看详情</a></button>
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
                    <div class="tab-pane  fade" id="profile">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="datatable table table-striped send_table" cellspacing="0"
                                               width="100%">
                                            <thead>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach var="h" items="${ordersList.hassendList}">
                                                <tr>
                                                    <input type="hidden" value="${h.oid}">
                                                    <td>${h.onum}</td>
                                                    <td>${h.ocreatetime}</td>
                                                    <td>${h.oupdatetime}</td>
                                                    <td>${h.nickname}</td>
                                                    <td>${h.aphone}</td>
                                                    <td>${h.addr}</td>
                                                    <td>${h.ostate eq 1?"已发货":"异常"}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-success goodsdetails"><a href="Order?method=showdetails&oid=${h.oid}">查看详情</a></button>
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
                    <div class="tab-pane  fade" id="messages">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="datatable table table-striped sign_table" cellspacing="0"
                                               width="100%">
                                            <thead>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach var="s" items="${ordersList.signrList}">
                                                <tr>
                                                    <input type="hidden" value="${s.oid}">
                                                    <td>${s.onum}</td>
                                                    <td>${s.ocreatetime}</td>
                                                    <td>${s.oupdatetime}</td>
                                                    <td>${s.nickname}</td>
                                                    <td>${s.aphone}</td>
                                                    <td>${s.addr}</td>
                                                    <td>${s.ostate eq 2?"已签收":"异常"}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-success goodsdetails"><a href="Order?method=showdetails&oid=${s.oid}">查看详情</a></button>
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
                    <div class="tab-pane  fade" id="settings">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="datatable table table-striped error_table" cellspacing="0"
                                               width="100%">
                                            <thead>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>订单编号</th>
                                                <th>创建时间</th>
                                                <th>更新时间</th>
                                                <th>收货人</th>
                                                <th>联系方式</th>
                                                <th>收货地址</th>
                                                <th>订单状态</th>
                                                <th>操作</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach var="e" items="${ordersList.errorList}">
                                                <tr>
                                                    <input type="hidden" value="${e.oid}">
                                                    <td>${e.onum}</td>
                                                    <td>${e.ocreatetime}</td>
                                                    <td>${e.oupdatetime}</td>
                                                    <td>${e.nickname}</td>
                                                    <td>${e.aphone}</td>
                                                    <td>${e.addr}</td>
                                                    <td>${e.ostate eq 5?"异常":"错误异常"}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-info goodsdetails">处理异常</button>
                                                        <button type="button" class="btn btn-success goodsdetails"><a href="Order?method=showdetails&oid=${e.oid}">查看详情</a></button>
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
        <script type="text/javascript" src="js/ordermanage.js"></script>
    </div>
</div>
</body>

</html>
