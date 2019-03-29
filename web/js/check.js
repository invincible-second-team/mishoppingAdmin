var check = {
    checkImg: function (selector, span) {
        var pimg = $(selector).val();
        var pimgSuf = pimg.substr(pimg.lastIndexOf(".") + 1);
        var reg = /^(jpg|jpeg|png|bmp)$/i;

        if (pimg === null || pimg === "") {
            $(span).html("<img src='/img/error.png'>请选择图片").css("color", "red");
            return false;
        }
        if (!reg.test(pimgSuf)) {
            $(span).html("<img src='/img/error.png'>图片格式错误").css("color", "red");
            return false;
        } else {
            $(span).html("<img src='/img/green.png'>").css("color", "green");
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
    checkName: function (selector, index) {
        var nameText = $(selector).val();

        if (nameText === null || nameText === "") {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请填写商品名称").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='/img/green.png'>").css("color", "green");
            return true;
        }
    },
    checkPrice: function (selector, index) {
        var priceText = $(selector).val();
        var price = parseFloat(priceText);

        if (priceText === null || priceText === "") {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请填写商品价格").css("color", "red");
            return false;
        }
        if (price <= 0 || isNaN(price)) {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>商品价格错误，请输入大于0的数字").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='/img/green.png'>").css("color", "green");
            return true;
        }
    },
    checkDiscount: function (selector, index) {
        var discountText = $(selector).val();
        var discount = parseFloat(discountText);

        if (discountText === null || discountText === "") {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请填写折扣").css("color", "red");
            return false;
        }
        if (discount <= 0 || discount > 1 || isNaN(discount)) {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>商品折扣范围在0~1").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='/img/green.png'>").css("color", "green");
            return true;
        }
    },
    checkStock: function (selector, index) {
        var stockText = $(selector).val();
        var stock = parseFloat(stockText);

        if (stockText === null || stockText === "") {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请填写商品库存").css("color", "red");
            return false;
        }
        if (stock < 0) {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请输入不小于0的数字").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='/img/green.png'>").css("color", "green");
            return true;
        }
    },
    checkDesc: function (selector, index) {
        var pdscText = $(selector).val();

        if (pdscText === null || pdscText === "") {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请填写商品描述").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='/img/green.png'>").css("color", "green");
            return true;
        }
    },
    checkType: function (selector, index) {
        var ptype = parseInt($(selector).val());

        if (ptype < 1) {
            $(".span:eq(" + index + ")").html("<img src='/img/error.png'>请选择商品类型").css("color", "red");
            return false;
        } else {
            return true;
        }
    }
};