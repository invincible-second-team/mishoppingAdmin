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
                                    <div class="title">添加商品</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <form action="/product?method=addProduct" enctype="multipart/form-data" method="post">
                                    <div class="form-group">
                                        <label for="pimg">商品图片</label><br/>
                                        <img src="" alt="商品图片" hidden="hidden" id="img" height="100" width="200">
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
                                        <label for="pprice">商品描述</label>
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
                                        <label for="pprice">商品状态</label><br/>
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

                                    <button type="submit" class="btn btn-default submit">Submit</button>
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

        <script>
            $(function () {
                $.ajax({
                    url: "/product?method=loadType",
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


                $("#pname").blur(function () {
                    check.checkName()
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

                $(".submit").click(function (event) {
                    check.checkType();
                    if (!check.checkImg() | !check.checkName() | !check.checkPrice() |
                        !check.checkDiscount() | !check.checkStock() | !check.checkType() |
                        !check.checkDesc()) {
                        event.preventDefault();
                    }
                })
            });


        </script>
        <script>
            var check = {
                checkImg: function () {
                    var pimg = $("#pimg").val();
                    var pimgSuf = pimg.substr(pimg.lastIndexOf(".") + 1);
                    var reg = /^(jpg|jpeg|png|bmp)$/i;

                    if (pimg === null || pimg === "") {
                        $(".span:first").html("<img src='/img/error.png'>请选择图片").css("color", "red");
                        return false;
                    }
                    if (!reg.test(pimgSuf)) {
                        $(".span:first").html("<img src='/img/error.png'>图片格式错误").css("color", "red");
                        return false;
                    } else {
                        $(".span:first").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                getObjectURL: function (file) {
                    var url = null;
                    if (window.createObjectURL !== undefined) { // basic
                        url = window.createObjectURL(file);
                    } else if (window.URL !== undefined) {
                        url = window.URL.createObjectURL(file);
                    } else if (window.webkitURL !== undefined) {
                        url = window.webkitURL.createObjectURL(file);
                    }
                    return url;
                },
                checkName: function () {
                    var nameText = $("#pname").val();

                    if (nameText === null || nameText === "") {
                        $(".span:eq(1)").html("<img src='/img/error.png'>请填写商品名称").css("color", "red");
                        return false;
                    } else {
                        $(".span:eq(1)").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                checkPrice: function () {
                    var priceText = $("#pprice").val();
                    var price = parseFloat(priceText);

                    if (priceText === null || priceText === "") {
                        $(".span:eq(2)").html("<img src='/img/error.png'>请填写商品价格").css("color", "red");
                        return false;
                    }
                    if (price <= 0 || isNaN(price)) {
                        $(".span:eq(2)").html("<img src='/img/error.png'>商品价格错误，请输入大于0的数字").css("color", "red");
                        return false;
                    } else {
                        $(".span:eq(2)").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                checkDiscount: function () {
                    var discountText = $("#pdiscount").val();
                    var discount = parseFloat(discountText);

                    if (discountText === null || discountText === "") {
                        $(".span:eq(3)").html("<img src='/img/error.png'>请填写折扣").css("color", "red");
                        return false;
                    }
                    if (discount <= 0 || discount > 1 || isNaN(discount)) {
                        $(".span:eq(3)").html("<img src='/img/error.png'>商品折扣范围在0~1").css("color", "red");
                        return false;
                    } else {
                        $(".span:eq(3)").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                checkStock: function () {
                    var stockText = $("#pstock").val();
                    var stock = parseFloat(stockText);

                    if (stockText === null || stockText === "") {
                        $(".span:eq(4)").html("<img src='/img/error.png'>请填写商品库存").css("color", "red");
                        return false;
                    }
                    if (stock < 0) {
                        $(".span:eq(4)").html("<img src='/img/error.png'>请输入不小于0的数字").css("color", "red");
                        return false;
                    } else {
                        $(".span:eq(4)").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                checkDesc: function () {
                    var pdscText = $("#pdesc").val();

                    if (pdscText === null || pdscText === "") {
                        $(".span:eq(5)").html("<img src='/img/error.png'>请填写商品描述").css("color", "red");
                        return false;
                    } else {
                        $(".span:eq(5)").html("<img src='/img/green.png'>").css("color", "green");
                        return true;
                    }
                },
                checkType: function () {
                    var ptype = parseInt($("#ptype").val());

                    if (ptype < 1) {
                        $(".span:eq(6)").html("<img src='/img/error.png'>请选择商品类型").css("color", "red");
                        return false;
                    } else {
                        return true;
                    }
                }
            };
        </script>
    </div>
</div>
</body>

</html>
