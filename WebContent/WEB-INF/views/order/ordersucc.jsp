<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>生成订单成功</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/order/ordersucc.css">
</head>

<body>
<div class="div1">
    <span class="span1">订单已生成</span>
</div>
<div class="div2">
    <img src="${ctx}/res/images/duihao.jpg" class="img"/>
    <dl>
        <dt>订单编号</dt>
        <dd>${order.oid}</dd>
        <dt>合计金额</dt>
        <dd><span class="price_t">&yen;${order.total}</span></dd>
        <dt>收货地址</dt>
        <dd>${order.address}</dd>
    </dl>
    <span>感谢您的支持，祝您购物愉快！</span>
    <a href="${ctx}/order/prepay?oid=${order.oid}" id="linkPay">支付</a>
</div>
</body>
</html>
