$(function () {
    /**
     * 发货
     */
    $(document).on("click", ".sendgoods", function () {
        var sid = event.srcElement.parentElement.parentElement.rowIndex;
        var oid = $("input[type='hidden']:eq(" + sid + ")").val();
        var nocount = parseInt($(".nobadge").text()) - 1;
        var hascount = parseInt($(".hasbadge").text()) + 1;

        $.ajax({
            url: "Order?method=sendgood",
            cache: false,
            type: "get",
            dataType: "json",
            data: {
                "oid": oid
            },
            success: function (data) {
                if (data) {
                    $("input[type='hidden']:eq(" + sid + ")").parent().remove();
                    $(".nobadge").html(nocount);
                    $(".hasbadge").html(hascount);
                } else {
                    alert("异常");
                }
            }
        })
    })


})
