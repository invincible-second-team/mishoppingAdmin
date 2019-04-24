<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>添加商品</title>
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
                                <form enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="pimg">商品图片</label><br/>
                                        <img src="" alt="商品图片" hidden="hidden" id="img" height="200" width="160">
                                        <input type="file" id="pimg" name="pimg"
                                               accept="image/jpeg, image/jpg, image/bmp, image/png">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pname">商品名称</label>
                                        <input type="text" class="form-control" id="pname" name="pname"
                                               placeholder="Product Name">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pprice">商品价格</label>
                                        <input type="text" class="form-control" id="pprice" name="pprice"
                                               placeholder="Product Price">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pdiscount">商品折扣</label>
                                        <input type="text" class="form-control" id="pdiscount" name="pdiscount"
                                               placeholder="Product Discount">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="pprice">商品库存</label>
                                        <input type="number" class="form-control" id="pstock" name="pstock"
                                               placeholder="Product Stock">
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="pdesc">商品描述</label>
                                        <div>
                                            <textarea class="form-control" rows="3" id="pdesc" name="pdesc"
                                                      placeholder="Product Desc"></textarea>
                                        </div>
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="ptype">商品类型</label>
                                        <div>
                                            <select name="ptype" id="ptype" class="form-control" style="width: 15%">
                                                <option value="0">请选择...</option>
                                            </select>
                                        </div>
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>

                                    <div class="form-group">
                                        <label>商品状态</label><br/>
                                        <div class="radio3 radio-check radio-success radio-inline">
                                            <input type="radio" id="radio1" name="pstate" value="1" checked>
                                            <label for="radio1">
                                                上架
                                            </label>
                                        </div>
                                        <div class="radio3 radio-check radio-success radio-inline">
                                            <input type="radio" id="radio2" name="pstate" value="0">
                                            <label for="radio2">
                                                下架
                                            </label>
                                        </div>
                                        <span class="span" style="font-size: 16px"></span>
                                    </div>

                                </form>
                                <button type="button" class="btn btn-default submit">Submit</button>
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
        <script type="text/javascript" src="../js/check.js"></script>

        <script>
            $(function () {
                /**
                 * 使用ajax向后台获取类型数据
                 */
                $.ajax({
                    url: "../product?method=loadType",
                    cache: false,
                    type: "get",
                    success: function (data) {
                        if (data !== null) {
                            var json = JSON.parse(data);
                            var text = "<option value='0'>请选择...</option>";

                            for (var i = 0; i < json.length; i++) {
                                text += "<option value='" + json[i].categoryid + "'>" + json[i].categoryname + "</option>";
                            }

                            $("#ptype").html(text);
                        }
                    },
                    error: function () {
                        alert("请求失败")
                    }
                });

                /**
                 * 添加商品
                 */
                $(document).on("click", ".submit", function () {
                    if (!check.checkImg("#pimg", ".spanImg")) {
                        event.preventDefault();
                    }

                    var formDate = new FormData();
                    formDate.append("pimg", $("#pimg")[0].files[0]);
                    formDate.append("pname", $("#pname").val());
                    formDate.append("pprice", $("#pprice").val());
                    formDate.append("pstock", $("#pstock").val());
                    formDate.append("pdiscount", $("#pdiscount").val());
                    formDate.append("pdesc", $("#pdesc").val());
                    formDate.append("ptype", $("#ptype").val());
                    formDate.append("pstate", $("input[name='pstate']").val());


                    $.ajax({
                        url: "../product?method=addProduct",
                        type: "post",
                        cache: false,
                        data: formDate,
                        processData: false,
                        contentType: false,

                        success: function (data) {
                            var span;
                            if (data) {
                                span = "<span style='font-size: 20px; font-weight: bold;'>添加成功</span>";
                            } else {
                                span = "<span style='font-size: 20px; font-weight: bold;'>添加失败</span>";
                            }
                            span += '<div><button type="button" class="btn btn-info returnBefore">返回上一页</button></div>';
                            $(".form-div").html(span);
                        }
                    });
                });

                $('.returnBefore').click(function () {
                    window.location.reload();
                });

                /**
                 * 图片修改时验证
                 */
                $("#pimg").change(function () {
                    var checkImg = check.checkImg(this, ".span:first");

                    if (checkImg) {
                        var objUrl = check.getObjectURL(this.files[0]);
                        $("#img").attr("src", objUrl).removeAttr("hidden");
                    } else {
                        $("#img").attr({"src": "", "hidden": "hidden"});
                    }
                });

                /**
                 * 焦点失去时验证名称
                 */
                $("#pname").blur(function () {
                    check.checkName(this, 1);
                });

                /**
                 * 焦点失去时验证价格
                 */
                $("#pprice").blur(function () {
                    check.checkPrice(this, 2);
                });

                /**
                 * 焦点失去时验证折扣
                 */
                $("#pdiscount").blur(function () {
                    check.checkDiscount(this, 3);
                });

                /**
                 * 焦点失去时验证库存
                 */
                $("#pstock").blur(function () {
                    check.checkStock(this, 4);
                });

                /**
                 * 焦点失去时验证描述
                 */
                $("#pdesc").blur(function () {
                    check.checkDesc(this, 5);
                });

                /**
                 * 添加商品提交数据时验证
                 */
                $(".submit").click(function (event) {
                    if (!check.checkImg("#pimg", ".span:first") | !check.checkName("#pname", 1) | !check.checkPrice("#pprice", 2) |
                        !check.checkDiscount("#pdiscount", 3) | !check.checkStock("#pstock", 4) | !check.checkType("#ptype", 6) |
                        !check.checkDesc("#pdesc", 5)) {
                        event.preventDefault();
                    }
                })
            });
        </script>
    </div>
</div>
</body>
</html>
