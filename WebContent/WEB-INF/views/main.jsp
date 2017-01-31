<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE>
<html>
<head>
    <title>main</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="This is my page">
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/res/css/main.css">
    <style type="text/css">
        a {
            text-transform: none;
            text-decoration: none;
            color: #ffffff;
            font-weight: 900;
        }

        a:hover {
            text-decoration: underline;
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
<frameset rows="100,*,25" framespacing="0" border="0" frameborder="0" style="margin-right:70px;">
    <frame src="${ctx}/top" name="top" scrolling="no" noresize/>
    <frameset cols="180,*" id="resize">
        <frame noresize name="left" src="${ctx}/left"/>
        <frame noresize name="body" src="${ctx}/body" scrolling="yes"/>
    </frameset>
</frameset>
</html>
