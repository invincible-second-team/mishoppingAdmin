<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <title>订单详情</title>
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
                    <span class="title">订单详情</span>
                </div>

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
                                                <th>商品编号</th>
                                                <th>商品名称</th>
                                                <th>商品单价</th>
                                                <th>商品折扣</th>
                                                <th>商品数量</th>
                                                <th>商品总价</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th>商品编号</th>
                                                <th>商品名称</th>
                                                <th>商品单价</th>
                                                <th>商品折扣</th>
                                                <th>商品数量</th>
                                                <th>商品总价</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:set value="0" var="sum" />
                                            <c:forEach var="d" items="${requestScope.details}">
                                                <tr>
                                                        <td>${d.pid}</td>
                                                        <td>${d.pname}</td>
                                                        <td><fmt:formatNumber value="${d.pprice}" pattern="0.00#" /></td>
                                                        <td><fmt:formatNumber value="${d.ppricediscount}" pattern="0.00#" /></td>
                                                        <td>${d.pnum}</td>
                                                        <td><fmt:formatNumber value="${d.pprice*d.pnum*d.ppricediscount}" pattern="0.00#" /></td>
                                                    <c:set value="${sum+d.pprice*d.pnum*d.ppricediscount}" var="sum" />
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <hr>
                                            <tr>
                                            <td colspan="5"></td>
                                            <td>订单总价：<fmt:formatNumber value="${sum}" pattern="00.00#" />元</td>
                                            </tr>
                                        </table>
                                        <button class="btn btn-info"><a href="#" onClick="javascript :history.back(-1);">返回上一页</a></button>
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
    </div>
</div>
</body>

</html>
