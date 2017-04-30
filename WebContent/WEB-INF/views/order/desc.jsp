<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单详细</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/order/desc.css">
</head>

<body style="width: 96%">
<div class="divOrder">
		<span>订单号：${order.oid}
				<span id="stattext">
				<c:choose>
                    <c:when test="${order.status eq 1}">(等待付款)</c:when>
                    <c:when test="${order.status eq 2}">(准备发货)</c:when>
                    <c:when test="${order.status eq 3}">(确认收货)</c:when>
                    <c:when test="${order.status eq 4}">(交易成功)</c:when>
                    <c:when test="${order.status eq 5}">(交易关闭)</c:when>
                </c:choose></span>
		　　　下单时间：${order.ordertime }</span>
</div>
<div class="divContent">
    <div class="div2">
        <dl>
            <dt>收货人信息</dt>
            <dd>${order.address }</dd>
        </dl>
    </div>
    <div class="div2">
        <dl>
            <dt>商品清单</dt>
            <dd>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th class="tt">商品名称</th>
                        <th class="tt" align="left">单价</th>
                        <th class="tt" align="left">数量</th>
                        <th class="tt" align="left">小计</th>
                    </tr>
                    <c:forEach items="${order.orderitems}" var="orderitem">
                        <tr style="padding-top: 20px; padding-bottom: 20px;">
                            <td class="td" width="400px">
                                <div class="bookname">
                                    <img title="${orderitem.bname}" align="middle" width="70"
                                         src="${ctx}/${orderitem.imageB}"/>
                                    <a title="${orderitem.bname}"
                                       href="<c:url value='/book/findBookById?bid=${orderitem.bid}'/>">${fn:substring(orderitem.bname,0,25)}</a>
                                </div>
                            </td>
                            <td class="td">
                                <span>&yen;${orderitem.currPrice}</span>
                            </td>
                            <td class="td">
                                <span>${orderitem.quantity}</span>
                            </td>
                            <td class="td">
                                <span>&yen;${orderitem.subtotal }</span>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </dd>
        </dl>
    </div>
    <div style="margin: 10px 10px 10px 550px;">
        <span style="font-weight: 900; font-size: 15px;">合计金额：</span>
        <span class="price_t">&yen;${order.total }</span><br/>
        <c:choose>
            <c:when test="${order.status eq 1}">
                <a href="<c:url value='/order/prepay?oid=${order.oid}'/>" class="pay" ></a><br/><br/>
                <a id="cancel" href="javascript:void(0);" oid="${order.oid}">取消订单</a><br/>
            </c:when>
            <c:when test="${order.status eq 3}">
                <a id="confirm" href="javascript:void(0);" oid="${order.oid}">确认收货</a><br/>
            </c:when>
        </c:choose>
    </div>
</div>
<script type="text/javascript" src="${ctx}/res/bjui/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#cancel").click(function () {
            if (confirm("确认取消订单吗?"))
                updateOrder('cancleOrder', "(交易关闭)", this);
        });
        $("#confirm").click(function () {
            if (confirm("确认收货吗?"))
                updateOrder('confirmOrder', '(交易成功)', this);
        });
    });
    function updateOrder(method, text, elem) {
        $.ajax({
            type: 'POST',
            data: {'oid': $(elem).attr('oid')},
            url: '${ctx}/order/' + method,
            success: function (data) {
                if (data['status'] == 1) {
                    $("#stattext").text(text);
                    $(elem).parent().remove();
                }
                alert(data['msg']);
            },
            error: function () {
                alert("网络错误");
            }
        });
    }
</script>
</body>
</html>

