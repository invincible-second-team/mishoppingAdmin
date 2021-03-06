<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
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

<body class="flat-blue" onload="Load('${pageContext.request.contextPath}/html/index.jsp')">

<input type="hidden" value="0">
<div class="app-container">
    <div class="row content-container">
        <%@include file="top.jsp" %>
        <!-- Main Content -->
        <div class="container">
            <div class="side-body padding-top">
                <div class="col-lg-2"></div>
                <p>当前网站访问人数过多，请稍后再试噢！</p><br>
                <img src="${pageContext.request.contextPath}/img/errors.jpg" width="600">
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
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/jquery.matchHeight-min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/ace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/mode-html.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/ace/theme-github.js"></script>
        <!-- Javascript -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
    </div>
</div>

</body>
</html>
