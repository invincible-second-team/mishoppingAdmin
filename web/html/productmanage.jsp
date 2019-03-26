<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>商品管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
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
                                    <div class="title">商品管理</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="datatable table table-striped" cellspacing="0" width="100%">
                                    <thead>
                                    <tr class="tabTr">
                                        <th>商品图像</th>
                                        <th>商品名称</th>
                                        <th>商品价格</th>
                                        <th>商品折扣</th>
                                        <th>商品库存</th>
                                        <th>商品类别</th>
                                        <th>商品描述</th>
                                        <th>商品状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tfoot>
                                    <tr>
                                        <th>商品图像</th>
                                        <th>商品名称</th>
                                        <th>商品价格</th>
                                        <th>商品折扣</th>
                                        <th>商品库存</th>
                                        <th>商品类别</th>
                                        <th>商品描述</th>
                                        <th>商品状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${productInfo}" var="product">
                                        <tr class="infoId">
                                            <input type="hidden" value="${product.pid}">
                                            <td><img src="/upload/${product.pimg}" class="proImg"
                                                     height="100" width="80"></td>
                                            <td>${product.pname}</td>
                                            <td>${product.pprice}</td>
                                            <td>${product.ppricediscount}</td>
                                            <td>${product.pstock}</td>
                                            <td class="cname">${product.categoryname}</td>
                                            <td>${product.pdes}</td>
                                            <td>
                                                <c:if test="${product.pstate==1}">
                                                    <button class="btn btn-info btn-sm on" disabled>上架</button>
                                                    <button class="btn btn-danger btn-sm un">下架</button>
                                                </c:if>
                                                <c:if test="${product.pstate==0}">
                                                    <button class="btn btn-info btn-sm on">上架</button>
                                                    <button class="btn btn-danger btn-sm un" disabled>下架</button>
                                                </c:if>
                                            </td>
                                            <td>
                                                <button class="btn btn-info btn-sm edit" data-toggle="modal"
                                                        data-target="#myModal">编辑
                                                </button>
                                                <button class="btn btn-danger btn-sm delete">删除</button>
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
<form method="post" action="#" class="form-horizontal modalform" role="form" id="myForm" onsubmit="return ">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    <h4>修改商品</h4>
                    <!--  标题内容  -->
                </div>

                <div class="modal-body">
                    <!--  模态框内容，我在此处添加一个表单 -->
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="pname" class="col-sm-2 control-label">商品名称</label>
                            <div class="col-sm-9">
                                <input type="text" id="pname" name="pname" class="form-control well"/>
                            </div>
                            <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                        </div>
                        <div class="form-group">
                            <label for="pprice" class="col-sm-2 control-label">商品价格</label>
                            <div class="col-sm-9">
                                <input type="text" id="pprice" name="pprice" class="form-control well"/>
                            </div>
                            <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                        </div>
                        <div class="form-group">
                            <label for="pdiscount" class="col-sm-2 control-label">商品折扣</label>
                            <div class="col-sm-9">
                                <input type="text" id="pdiscount" name="pdiscount" class="form-control well"/>
                            </div>
                            <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                        </div>
                        <div class="form-group">
                            <label for="pstock" class="col-sm-2 control-label">商品库存</label>
                            <div class="col-sm-9">
                                <input type="text" id="pstock" name="pstock" class="form-control well"/>
                            </div>
                            <span class="span col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                        </div>
                        <div class="form-group">
                            <label for="pdesc" class="col-sm-2 control-label">商品描述</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" rows="3" id="pdesc" name="pdesc"></textarea>
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

<form method="post" action="#" class="form-horizontal modalImg" role="form" id="myForm" onsubmit="return ">
    <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                    <h4>更新图片</h4>
                    <!--  标题内容  -->
                </div>

                <div class="modal-body">
                    <!--  模态框内容，我在此处添加一个表单 -->
                    <form class="form-horizontal formImg" enctype="multipart/form-data" role="form">
                        <div class="form-group">
                            <input type="hidden" name="imgPid" id="pid">
                            <label for="pimg" class="col-sm-2 control-label">商品图片</label><br/>
                            <img src="" alt="商品图片" id="img" hidden height="200" width="160">
                            <input class="col-sm-offset-2" type="file" id="pimg" name="pimg"
                                   accept="image/jpeg, image/jpg, image/bmp, image/png">
                            <span class="spanImg col-sm-9 col-sm-offset-2" style="font-size: 16px"></span>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <!--  模态框底部样式，一般是提交或者确定按钮 -->
                    <button type="button" class="btn btn-info submit2">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>

            </div><!-- /.modal-content -->
        </div>
    </div> <!-- /.modal -->
</form>


<%@include file="footer.jsp" %>
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
<script type="text/javascript" src="/js/check1.js"></script>

<script>
    $(function () {
        var pid;
        var typeHtml;
        var typeVal;

        $.ajax({
            url: "/product?method=loadType",
            cache: false,
            type: "get",
            success: function (data) {
                if (data !== null) {
                    var json = JSON.parse(data);
                    typeHtml = "";

                    for (var i = 0; i < json.length; i++) {
                        typeHtml += "<option value='" + json[i].categoryid + "'>" + json[i].categoryname + "</option>";
                    }
                }
            },
            error: function () {
                alert("请求失败")
            }
        });


        $("#pname").blur(function () {
            check.checkName();
        });

        $("#pprice").blur(function () {
            check.checkPrice();
        });

        $("#pdiscount").blur(function () {
            check.checkDiscount();
        });

        $("#pstock").blur(function () {
            check.checkStock();
        });

        $("#pdesc").blur(function () {
            check.checkDesc();
        });

        var $info;
        $(".edit").click(function () {
            var editIndex = $(".edit").index($(this));
            $info = $(".infoId:eq(" + editIndex + ") td");
            pid = $(".infoId:eq(" + editIndex + ")").find("input").first().val();

            $("#pname").val($info.eq(1).text());
            $("#pprice").val($info.eq(2).text());
            $("#pdiscount").val($info.eq(3).text());
            $("#pstock").val($info.eq(4).text());
            $("#pdesc").val($info.eq(6).text());
        });

        $(".submit").click(function () {
            if (!check.checkName() | !check.checkPrice() | check.checkDiscount() |
                !check.checkStock() | !check.checkDesc()) {
                event.preventDefault();
            }

            var pname = $("#pname").val();
            var pprice = $("#pprice").val();
            var pdiscount = $("#pdiscount").val();
            var pstock = $("#pstock").val();
            var pdesc = $("#pdesc").val();

            var data = {
                'pid': pid,
                "pname": pname,
                "pprice": pprice,
                "pdiscount": pdiscount,
                "pstock": pstock,
                "pdesc": pdesc
            };

            $.ajax({
                url: "/product?method=updateProduct",
                type: "post",
                cache: false,
                dataType: "json",
                data: data,
                success: function (data) {
                    if (data === true) {
                        $info.eq(1).html(pname);
                        $info.eq(2).html(pprice);
                        $info.eq(3).html(pdiscount);
                        $info.eq(4).html(pstock);
                        $info.eq(6).html(pdesc);

                        $("#myModal").modal('hide');
                    }
                }
            });
        });

        $(".delete").click(function () {
            var index = $(".delete").index($(this));
            pid = $(".infoId:eq(" + index + ")").find("input").first().val();

            $.ajax({
                url: "/product?method=deleteProduct",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    "pid": pid
                },
                success: function (data) {
                    if (data === true) {
                        window.location.reload();
                    }
                }
            });
        });

        var index;
        $(".proImg").dblclick(function () {
            index = $(".proImg").index($(this));
            pid = $(".infoId:eq(" + index + ")").find("input").first().val();
            $("#imgModal").modal('show');

            $("#pid").val(pid);
        });

        $(".submit2").click(function () {
            if (!check.checkImg()) {
                event.preventDefault();
            }

            var formDate = new FormData();
            formDate.append("pimg", $("#pimg")[0].files[0]);
            formDate.append("pid", $("#pid").val());
            $.ajax({
                url: "/product?method=updateProductImg",
                type: "post",
                cache: false,
                data: formDate,
                processData: false,
                contentType: false,

                success: function (data) {
                    alert(data);
                    $(".proImg:eq(" + index + ")").attr("src", "/upload/" + data);
                    $("#imgModal").modal('hide');
                }
            });
        });

        $("#pimg").change(function () {
            var checkImg = check.checkImg();

            if (checkImg) {
                var objUrl = check.getObjectURL(this.files[0]);
                $("#img").attr("src", objUrl);
                $("#img").removeAttr("hidden");
            } else {
                $("#img").attr("src", "");
                $("#img").attr("hidden", "hidden");
            }
        });


        $(".on").click(function () {
            var $this = $(this);
            var index = $(".on").index($this);
            pid = $(".infoId:eq(" + index + ")").find("input").first().val();

            $.ajax({
                url: "/product?method=updateProductState",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    "pid": pid,
                    "pstate": 1
                },
                success: function (data) {
                    if (data === true) {
                        $this.attr("disabled", true);
                        $(".un:eq(" + index + ")").attr("disabled", false);
                    }
                }
            });
        });

        $(".cname").dblclick(function () {
            $(this).html("<select class='cselect' style='width: 100%; height: 100%'></select>");
            $(".cselect").html(typeHtml);
        });

        $(document).on("change", ".cselect", function () {
            typeVal = $(this).val();
        });

        $(document).on("blur", ".cselect", function () {
            var $this = $(this);
            var index = $(".cselect").index($this);
            pid = $(".infoId:eq(" + index + ")").find("input").first().val();
            var text = $(this).find("option:selected").text();
            var val = $(this).find("option:selected").val();

            $.ajax({
                url: "/product?method=updateProductCategory",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    "pid": pid,
                    "ptype": val
                },
                success: function (data) {
                    if (data === true) {
                        $this.parent().html(text);
                    }
                }
            });
        });

        $(".un").click(function () {
            var $this = $(this);
            var index = $(".un").index($this);
            pid = $(".infoId:eq(" + index + ")").find("input").first().val();

            $.ajax({
                url: "/product?method=updateProductState",
                type: "post",
                cache: false,
                dataType: "json",
                data: {
                    "pid": pid,
                    "pstate": 0
                },
                success: function (data) {
                    if (data === true) {
                        $this.attr("disabled", true);
                        $(".on:eq(" + index + ")").attr("disabled", false);
                    }
                }
            });
        });
    })
</script>
</body>

</html>
