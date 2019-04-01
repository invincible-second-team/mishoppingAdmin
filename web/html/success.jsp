<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>${notice}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<input type="hidden" value="2">
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
                                    <div class="title">添加商品</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <span style="font-size: 20px; font-weight: bold;">${notice}</span>
                                <div>
                                    <button type="button" class="btn btn-info returnBefore">返回上一页</button>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/Chart.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/bootstrap-switch.min.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/active.js"></script>
        <script type="text/javascript">
            /**
             * 点击返回上一页时返回添加商品界面
             */
            $(document).on("click", ".returnBefore", function () {
                window.location.href = "${pageContext.request.contextPath}/html/addproduct.jsp";
            });
        </script>
    </div>
</div>
</body>

</html>
