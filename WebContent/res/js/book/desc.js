$(function () {
    $("#cnt").blur(function () {
        var quantity = $("#cnt").val();
        if (!/^[1-9]\d*$/.test(quantity)) {
            alert("数量必须是合法整数！");
            $("#cnt").val("1");
        }
    });
    var input = $("#cnt");
    ;
    // 给jia、jian添加事件
    $(".jian").click(function () {
        var quantity = parseInt($(input).val());
        if (quantity > 1)
            $(input).val(quantity - 1);
    });
    $(".jia").click(function () {
        $(input).val(parseInt($(input).val()) + 1);
    });
});