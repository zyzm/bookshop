<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>top</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <style type="text/css">
        body {
            background: #15B69A;
            margin: 0px;
            color: #ffffff;
        }

        a {
            text-transform: none;
            text-decoration: none;
            color: #ffffff;
            font-weight: 900;
        }

        a:hover {
            text-decoration: underline;
            color: #cad9ea;
        }

        input {
            width: 300px;
            height: 30px;
            border-style: solid;
            margin: 0px;
            border-color: #15B69A;
        }

        span {
            margin: 0px;
        }
    </style>
</head>
<body>
<div style="margin-top: 5px;margin-left: 20px;" class="trTop">
    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            会员：${sessionScope.user.loginName}&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${ctx}/cart/mycart" target="body">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${ctx}/order/myorder" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${ctx}/changePwd" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="${ctx}/user/logout" target="_parent" id="logout">退出</a>
        </c:when>
        <c:otherwise>
            <a href="${ctx}/login" target="_parent">会员登录</a>
            |&nbsp; <a href="${ctx}/regist"
                       target="_parent">注册会员</a>
        </c:otherwise>
    </c:choose>
    <div align="center">
        <br>
        <form action="${ctx}/book/searchBook" method="get" target="body" id="form1">
            <input type="text" name="key"/>
            <span>
                <a href="javascript:document.getElementById('form1').submit();">
                    <img align="top" border="0" src='${ctx}/res/images/btn.bmp'/>
                </a>
            </span>
        </form>
    </div>
</div>
</body>
</html>
