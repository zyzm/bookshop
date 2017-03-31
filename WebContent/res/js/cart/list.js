$(function () {
    showTotal();//显示合计
    // 给全选按钮添加点击事件
    $("#selectAll").click(function () {
        var flag = $(this).prop("checked");//获取全选的状态
        setAll(flag);//让所有条目复选框与全选同步
        setJieSuanStyle(flag);//让结算按钮与全选同步
    });

    // 给条目复选框添加事件
    $(":checkbox[name=cartItemId]").click(function () {
        var selectedCount = $("input[name=cartItemId]:checked").length;//被勾选复选框个数
        var allCount = $(":checkbox[name=cartItemId]").length;//所有条目复选框个数
        if (selectedCount == allCount) {//全选了
            $("#selectAll").prop("checked", true);//勾选全选复选框
            setJieSuanStyle(true);//使结算按钮可用
        } else if (selectedCount == 0) {//全撤消了
            $("#selectAll").prop("checked", false);//撤消全选复选框
            setJieSuanStyle(false);//使结算按钮不可用
        } else {//未全选
            $("#selectAll").prop("checked", false);//撤消全选复选框
            setJieSuanStyle(true);//使结算按钮可用
        }
        showTotal();//重新计算合计
    });

    // 给jia、jian添加事件
    $(".jian").click(function () {
        var quantityelem = $(this).siblings(".quantity");
        var quantity = Number(quantityelem.val());
        if (quantity == 1) {
            if (confirm("您是否真要删除该条目？")) {
                deleteOneCart(quantityelem);
            }
        } else {
            sendUpdate(quantityelem, quantity - 1);
        }
    });
    $(".jia").click(function () {
        var quantityelem = $(this).siblings(".quantity");
        var quantity = Number(quantityelem.val());
        sendUpdate(quantityelem, quantity + 1);
    });
});

// 异步请求，修改数量
function sendUpdate(quantityelem, quantity) {
    /*
     1. 通过cartItemId找到输入框元素
     2. 通过cartItemId找到小计元素
     */
    var trelem = $(quantityelem).parent().parent();
    var subtotal = trelem.find(".subTotal");
    var currPrice = trelem.find(".currPrice");
    $.ajax({
        type: 'POST',
        data: {'quantity': quantity, 'cartItemId': trelem.find(":checkbox").val()},
        url: ctx + '/cart/updateQuantity',
        error: function () {
            alert('更改数量未知错误');
        },
        success: function (data) {
            if (data['status'] == 'success') {
                quantityelem.val(quantity);
                subtotal.text(round(currPrice.text() * quantity, 2));
                showTotal();
            }
            else
                alert('更改错误');
        }

    });

}

// 设置所有条目复选框
function setAll(flag) {
    $(":checkbox[name=cartItemId]").prop("checked", flag);//让所有条目的复选框与参数flag同步
    showTotal();//重新设置合计
}

// 设置结算按钮的样式
function setJieSuanStyle(flag) {
    if (flag) {// 有效状态
        $("#jiesuan").removeClass("kill").addClass("jiesuan");//切换样式
        $("#jiesuan").unbind("click");//撤消“点击无效”
    } else {// 无效状态
        $("#jiesuan").removeClass("jiesuan").addClass("kill");//切换样式
        $("#jiesuan").click(function () {//使其“点击无效”
            return false;
        });
    }
}

// 显示合计
function showTotal() {
    var total = 0;//创建total，准备累加
    /*
     1. 获取所有被勾选的复选框，遍历之
     */
    $("input[name='cartItemId']:checked").each(function () {
        /*
         2. 通过复选框找到小计
         */
        var subtotalelem = $(this).parent().parent().find(".subTotal");
        var subtotal = Number($(subtotalelem).text());
        total += subtotal;
    });
    /*
     3. 设置合计
     */
    $("#total").text(round(total, 2));
}

function deleteCart(opts) {
    $.ajax({
        url: ctx + '/cart/deleteCart',
        type: 'POST',
        data: opts['params'],
        error: opts['errorfunc'],
        success: opts['successfunc']
    });
}
//根据id删除某一个条目
function deleteOneCart(elem) {

    var trelem = $(elem).parent().parent();//要删除的行tr
    var params = {'cartItemId': trelem.find("input:checkbox").val()};
    deleteCart({
        params: params,
        errorfunc: function () {
            alert("服务器响应错误");
        },
        successfunc: function (data) {
            if (data['status'] == 1) {
                $(trelem).remove();
                if ($("table tr").length == 3)
                    deletebody();
                else
                    showTotal();
            }

        }
    });
}
//批量删除
function deleteAll() {
    var checkedelem = $("input[name=cartItemId]:checked");
    var params = checkedelem.serialize();
    if (params.length != 0)
        deleteCart({
            params: params,
            errorfunc: function () {
                alert("服务器响应错误");
            },
            successfunc: function (data) {
                if (data['status'] == 1) {
                    $(checkedelem).each(function () {
                        $(this).parent().parent().remove();
                    });
                    showTotal();
                    if ($("table tr").length == 3)
                        deletebody();
                }
            }
        });
}
//没有购物信息时，给出提示
function deletebody() {
    var h = '<table width="95%" align="center" cellpadding="0" cellspacing="0"><tr><td align="right">' +
        "<img align='top' src='" + ctx + "/res/images/icon_empty.png'/></td><td>" +
        '<span class="spanEmpty">您的购物车中暂时没有商品</span></td></tr></table>';
    $("body").html(h);
}

function jiesuan() {
    var checkedelem = $("input[name=cartItemId]:checked");
    var ids = [];
    $(checkedelem).each(function () {
        ids.push($(this).val());
    });
    if (ids.length == 0) {
        alert('请选择要结算得商品');
        return;
    }
    $("#cartItemIds").val(ids.toString());
    $("#jiesuanform").submit();
}