<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>查看日志</title>
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
                    <div class="col-xs-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">
                                    <div class="title">日志</div>
                                </div>
                                <div class="card-title">
                                    <button class="btn btn-info export" data-target="#exportModal" data-toggle="modal"
                                            style="position:absolute; right: 20px; top: 5px;">导出日志
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="datatable table table-striped" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>时间</th>
                                        <th>操作</th>
                                        <th>结果</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>时间</th>
                                        <th>操作</th>
                                        <th>结果</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="mlog" items="${mlogs}">
                                        <tr>
                                            <td>${mlog.mdate}</td>
                                            <td>${mlog.message}</td>
                                            <td>${mlog.success==1 ? "成功": "失败"}</td>
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
    <%@include file="footer.jsp" %>
    <form method="post" action="#" class="form-horizontal modalImg" role="form" id="myForm" onsubmit="return ">
        <div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
            <div class="modal-dialog">
                <!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
                <div class="modal-content">
                    <!--  显示模态框白色背景，所有内容都写在这个div里面  -->

                    <div class="btn-info modal-header">
                        <!--  模态框标题  -->
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <!--  关闭按钮  -->
                        <h4>日志导出</h4>
                        <!--  标题内容  -->
                    </div>

                    <div class="modal-body">
                        <!--  模态框内容，我在此处添加一个表单 -->
                        <form class="form-horizontal" role="form">
                            <div class="form-group col-sm-12">
                                <div class="radio3 radio-check radio-success radio-inline1">
                                    <input type="radio" id="radio1" name="export" value="1" checked>
                                    <label for="radio1">
                                        导出所有日志
                                    </label>
                                </div>
                            </div>
                            <div class="form-group col-sm-12">
                                <div class="radio3 radio-check radio-success radio-inline1">
                                    <input type="radio" id="radio2" name="export" value="0">
                                    <label for="radio2">
                                        选择导出
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="startTime" class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-9">
                                    <input type="date" id="startTime" name="startTime" class="form-control well"
                                           disabled/>
                                </div>
                                <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                            </div>
                            <div class="form-group">
                                <label for="endTime" class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-9">
                                    <input type="date" id="endTime" name="endTime" class="form-control well" disabled/>
                                </div>
                                <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer">
                        <!--  模态框底部样式，一般是提交或者确定按钮 -->
                        <button type="button" class="btn btn-info submit">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>

                </div><!-- /.modal-content -->
            </div>
        </div> <!-- /.modal -->
    </form>
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
                $('input[name="export"]').click(function () {
                    var exportLog = $(this).val();
                    if (exportLog === '0') {
                        $("#endTime").removeAttr("disabled");
                        $("#startTime").removeAttr("disabled");
                    }else {
                        $("#endTime").attr("disabled", true);
                        $("#startTime").attr("disabled", true);
                    }
                });

                $(".submit").click(function () {
                    var $input = $('input[name="export"]:checked').val();
                    var startTime;
                    var endTime;
                    if ($input === '0') {
                        startTime = $("#startTime").val();
                        endTime = $("#endTime").val();

                        if (startTime > endTime || startTime === "" || endTime === "") {
                            alert("时间填写错误");
                            return;
                        }
                    } else {
                        startTime = "";
                        endTime = "";
                    }

                    console.log(startTime);
                    console.log(endTime);

                    $.ajax({
                        url: "admin?method=exportFile",
                        type: 'post',
                        data: {
                            "startTime": startTime,
                            "endTime": endTime
                        },
                        success: function (data, status, xhr) {
                            if (data !== null && data !== '' ){
                                window.location.href = 'admin?method=download&filename=' + data;
                            }else {
                                alert("导出失败！！！");
                            }
                            $("#exportModal").modal('hide');
                            $("#startTime").val("");
                            $("#endTime").val("");
                        }
                    });
                });

            });
        </script>
    </div>
</div>

</body>

</html>
