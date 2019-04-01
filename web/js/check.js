var check = {
    /**
     * 图片信息验证
     * @param selector 选择器
     * @param span 提示框选择器
     * @returns {boolean} 是否满足条件
     */
    checkImg: function (selector, span) {
        var pimg = $(selector).val();
        var pimgSuf = pimg.substr(pimg.lastIndexOf(".") + 1);
        var reg = /^(jpg|jpeg|png|bmp)$/i;

        if (pimg === null || pimg === "") {
            $(span).html("<img src='img/green.png'>请选择图片").css("color", "red");
            return false;
        }
        if (!reg.test(pimgSuf)) {
            $(span).html("<img src='img/error.png'>图片格式错误").css("color", "red");
            return false;
        } else {
            $(span).html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 图片选中显示
     * @param file 图片文件
     * @returns {*} 返回图片虚拟路径
     */
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

    /**
     * 名称验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 名称是否满足条件
     */
    checkName: function (selector, index) {
        var nameText = $(selector).val();

        if (nameText === null || nameText === "") {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请填写商品名称").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 价格验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 价格是否满足条件
     */
    checkPrice: function (selector, index) {
        var priceText = $(selector).val();
        var price = parseFloat(priceText);

        if (priceText === null || priceText === "") {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请填写商品价格").css("color", "red");
            return false;
        }
        if (price <= 0 || isNaN(price)) {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>商品价格错误，请输入大于0的数字").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 折扣验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 折扣是否满足条件
     */
    checkDiscount: function (selector, index) {
        var discountText = $(selector).val();
        var discount = parseFloat(discountText);

        if (discountText === null || discountText === "") {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请填写折扣").css("color", "red");
            return false;
        }
        if (discount <= 0 || discount > 1 || isNaN(discount)) {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>商品折扣范围在0~1").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 库存验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 库存是否满足条件
     */
    checkStock: function (selector, index) {
        var stockText = $(selector).val();
        var stock = parseFloat(stockText);

        if (stockText === null || stockText === "") {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请填写商品库存").css("color", "red");
            return false;
        }
        if (stock < 0) {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请输入不小于0的数字").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 描述验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 描述是否满足条件
     */
    checkDesc: function (selector, index) {
        var pdscText = $(selector).val();

        if (pdscText === null || pdscText === "") {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请填写商品描述").css("color", "red");
            return false;
        } else {
            $(".span:eq(" + index + ")").html("<img src='img/green.png'>").css("color", "green");
            return true;
        }
    },

    /**
     * 类型验证
     * @param selector 选择器
     * @param index 提示框下标
     * @returns {boolean} 类型是否满足条件
     */
    checkType: function (selector, index) {
        var ptype = parseInt($(selector).val());

        if (ptype < 1) {
            $(".span:eq(" + index + ")").html("<img src='img/error.png'>请选择商品类型").css("color", "red");
            return false;
        } else {
            return true;
        }
    }
};