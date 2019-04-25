$(function () {
    /**
     * 焦点失去：验证账户名
     */
    $("#exampleInputusername").blur(function () {
        checkUserName();
    })

    /**
     * 焦点失去：验证密码
     */
    $("#exampleInputuPassword").blur(function () {
        checkUpassword();
    })

    /**
     * 焦点失去:验证昵称
     */
    $("#exampleInputnickname").blur(function () {
        checkNickName();
    })

    /**
     * 焦点失去：验证电话号码
     */
    $("#exampleInputuphone").blur(function () {
        checkUphone();
    })


    /**
     * 使用ajax向后台发送数据
     */
    $("#usersubmit").click(function () {
        console.log("开始提交")
        var spanText = $(".span:first").text();
        var uname = $("#exampleInputusername").val();
        var upassword = $("#exampleInputuPassword").val();
        var nickname = $("#exampleInputnickname").val();
        var uphone = $("#exampleInputuphone").val();

        if (spanText !== "账号可以注册" || !checkUpassword() || !checkNickName() || !checkUphone()) {
            return;
        }

        $.ajax({
            url: "../User?method=addUsers",
            cache: false,
            type: "post",
            dataType: "json",
            data: {
                "uname": uname,
                "upassword": upassword,
                "nickname": nickname,
                "uphone": uphone
            },
            success: function (data) {
                if (data) {
                    alert("用户添加成功！");
                    $("#exampleInputusername").val("");
                    $("#exampleInputuPassword").val("");
                    $("#exampleInputnickname").val("");
                    $("#exampleInputuphone").val("");
                    $(".span").html("");

                } else {
                    alert("用户添加失败！");
                }
            }
        })
    })

    /**
     * 验证电话号码是否正确
     */
    function checkUphone() {
        var uphone = $("#exampleInputuphone").val();
        var check = /^1[34578]\d{9}$/;

        if (uphone.length === 0 || uphone === null) {
            $(".span:eq(3)").html("<img src='../img/error.png'>号码不能为空").css("color", "red");
            return false;
        } else if (!check.test(uphone)) {
            $(".span:eq(3)").html("<img src='../img/error.png'>号码必须以13，14，15，17，18开头").css("color", "red");
            return false;
        } else {
            $(".span:eq(3)").html("<img src='../img/green.png'>电话号码可以注册").css("color", "green");
            return true;
        }
    }

    /**
     * 验证昵称是否填写
     */
    function checkNickName() {
        var nickname = $("#exampleInputnickname").val();

        if (nickname.length === 0 || nickname === null) {
            $(".span:eq(2)").html("<img src='../img/error.png'>昵称不能为空").css("color", "red");
            return false;
        } else {
            $(".span:eq(2)").html("<img src='../img/green.png'>昵称可以注册").css("color", "green");
            return true;
        }

    }

    /**
     * 验证密码（长度为6-18位字符）
     */
    function checkUpassword() {
        var upassword = $("#exampleInputuPassword").val();
        var check = /^[\w_-]{6,16}$/;

        if (upassword.length === 0 || upassword === null) {
            $(".span:eq(1)").html("<img src='../img/error.png'>密码不能为空").css("color", "red");
            return false;
        } else if (!check.test(upassword)) {
            $(".span:eq(1)").html("<img src='../img/error.png'>密码长度必须为6-18位字符").css("color", "red");
            return false;
        } else {
            $(".span:eq(1)").html("<img src='../img/green.png'>密码可以注册").css("color", "green");
            return true;
        }
    }

    /**
     * 验证账号（以字母或者下划线开头，长度在5-16之间）
     * 并向后台验证账户是否存在
     */
    function checkUserName() {
        var username = $("#exampleInputusername").val();
        var check = /^[A-z_][A-z0-9_-]{4,15}$/;

        if (username.length === 0 || username === null) {
            $(".span:first").html("<img src='../img/error.png'>账号不能为空").css("color", "red");
            return;
        }
        if (!check.test(username)) {
            $(".span:first").html("<img src='../img/error.png'>账号需以字母或者下划线开头，长度在5-16之间").css("color", "red");
            return;
        }

        $.ajax({
            url: "../User?method=checkUserName",
            cache: false,
            type: "post",
            dataType: "json",
            data: {
                "username": username
            },
            success: function (data) {
                if (data == false) {
                    $(".span:first").html("<img src='../img/error.png'>账号已注册").css("color", "red");
                } else {
                    $(".span:first").html("<img src='../img/green.png'>账号可以注册").css("color", "green");
                }
            }
        })
    }


})