$(function () {

    var uid;
    var id;
    var uname;
    /**
     * 将值加载到模态框
     */
    $(document).on("click",".modificition",function () {
        id = event.srcElement.parentElement.parentElement.rowIndex;
        var nickename = document.getElementById("data-table").rows[id].cells[1].innerText;
        var uphone = document.getElementById("data-table").rows[id].cells[2].innerText;
        uname=document.getElementById("data-table").rows[id].cells[0].innerText;
        uid=$("input[type='hidden']:eq(" + id + ")").val();

        $("#mnickename").val(nickename);
        $('#muphone').val(uphone);
    })


    /**
     * 修改资料
     */
    $(document).on("click",".add",function () {
        var nickename=$("#mnickename").val();
        var upassword=$("#mupassword").val();
        var uphone=$("#muphone").val();

        if(nickename.length===0||upassword.length===0||uphone.length===0){
            $(".information").html("昵称，电话号码，密码不能为空")
        }

        $.ajax({
            url:"User?method=modificition",
            cache:false,
            type:"post",
            dataType:"json",
            data:{
                "uid":uid,
                "uname":uname,
                "nickname":nickename,
                "upassword":upassword,
                "uphone":uphone
            },
            success:function (data) {
                if(data){
                    alert("修改成功！")
                    window.location.href="User?method=usersList";
                }else {
                    alert("修改失败！")
                    window.location.href="User?method=usersList";
                }
            }
        })
    })


    /**
     * 修改状态
     */
    $(document).on("click",".unblock",function () {
        var unid=event.srcElement.parentElement.parentElement.rowIndex;
        var ustate=document.getElementById("data-table").rows[unid].cells[3].innerText=="正常"?0:1;
        var unuid=$("input[type='hidden']:eq(" + unid + ")").val();
        var unid1=unid-1;

        $.ajax({
            url: "User?method=unblock",
            cache: false,
            type: "post",
            dataType: "json",
            data: {
                "ustate": ustate,
                "uid": unuid
            },
            success: function (data) {
                if (data) {
                    if (ustate==0){
                        $(".blockstate:eq("+unid1+")").html("锁定").css("color","red");
                    }else {
                        $(".blockstate:eq("+unid1+")").html("正常").css("color","black");
                    }
                }else {
                    alert("状态修改异常");
                }
            }
        })
    })

    /**
     * 删除账号
     */
    $(".delete").click(function () {
        var did=event.srcElement.parentElement.parentElement.rowIndex;
        var duid=$("input[type='hidden']:eq(" + did + ")").val();

        if (!confirm("是否确定删除该用户？")) {
            return;
        }
        $.ajax({
            url: "User?method=deleteuser",
            cache: false,
            type: "get",
            dataType: "json",
            data: {
                "uid": duid
            },
            success: function (data) {
                if (data) {
                    $("input[type='hidden']:eq(" + did + ")").parent().remove();
                }else {
                    alert("删除失败！");
                }
            }
        })
    })
})