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