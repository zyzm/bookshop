<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>showitem.jsp</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="This is my page">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/cart/showitem.css">
    <style type="text/css">
        #addr {
            width: 500px;
            height: 32px;
            border: 1px solid #7f9db9;
            padding-left: 10px;
            line-height: 32px;
        }
    </style>
</head>

<body>
<form id="form1" action="${ctx}/order/createOrder" method="post">
    <input type="hidden" name="cartItemIds" value="${cartItemIds}"/>
    <table width="95%" align="center" cellpadding="0" cellspacing="0">
        <tr bgcolor="#efeae5">
            <td width="400px" colspan="5"><span style="font-weight: 900;">生成订单</span></td>
        </tr>
        <tr align="center">
            <td width="10%">&nbsp;</td>
            <td width="50%">图书名称</td>
            <td>单价</td>
            <td>数量</td>
            <td>小计</td>
        </tr>
        <c:forEach items="${cartItemList}" var="buyitem">

            <tr align="center">
                <td align="right">
                    <a class="linkImage" href="${ctx}/findBookById?bid=${buyitem.book.bid}">
                        <img border="0" width="54" align="top" src="${ctx}/${buyitem.book.imageB}"/>
                    </a>
                </td>
                <td align="left">
                    <a href="${ctx}/findBookById?bid=${buyitem.book.bid}"><span>${buyitem.book.bname}</span></a>
                </td>
                <td>&yen;${buyitem.book.currPrice}</td>
                <td>${buyitem.quantity}</td>
                <td>
                    <span class="price_n">&yen;<span class="subtotal">${buyitem.subTotal}</span></span>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="6" align="right">
                <span>总计：</span><span class="price_t">&yen;<span id="total"></span></span>
            </td>
        </tr>
        <tr>
            <td colspan="5" bgcolor="#efeae5"><span style="font-weight: 900">收货地址</span></td>
        </tr>
        <tr>
            <td colspan="6">
                <input id="addr" type="text" name="address" value=""/>
            </td>
        </tr>
        <tr>
            <td style="border-top-width: 4px;" colspan="5" align="right">
                <a id="linkSubmit" href="javascript:void(0)">提交订单</a>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${ctx}/res/js/round.js"></script>
<script type="text/javascript">
    //计算合计
    $(function () {
        var total = 0;
        $(".subtotal").each(function () {
            total += Number($(this).text());
        });
        $("#total").text(round(total, 2));
        $("#linkSubmit").click(function () {
            if ($.trim($("#addr").val()) == '') {
                alert("请填写收货地址!");
            }
            else
                $("form").submit();
        });
    });
</script>
</body>
</html>
