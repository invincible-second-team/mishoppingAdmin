$(function () {
    var hidden = $("[type='hidden']").val();
    $(".li:eq(" + hidden + ")").addClass("active");
    //$(".li:eq(" + hidden + ")").sibling().removeClass("active");
});